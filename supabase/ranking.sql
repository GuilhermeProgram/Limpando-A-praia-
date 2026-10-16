-- =====================================================================
-- Ranking online do jogo "Limpando a Praia"
-- Cole tudo isto no Supabase em: SQL Editor > New query > Run
-- =====================================================================

-- Pontuações: qualquer pessoa pode ler e enviar uma pontuação nova,
-- mas ninguém pode alterar nem apagar as dos outros.
create table if not exists public.scores (
  id        bigint generated always as identity primary key,
  nick      text        not null check (char_length(nick) between 2 and 16),
  classe    text        not null check (classe in ('Marina', 'Tiago', 'Cida', 'Léo', 'Robert')),
  pontos    integer     not null check (pontos between 0 and 200000),
  fase      smallint    not null check (fase between 1 and 3),
  venceu    boolean     not null default false,
  separados integer     not null default 0 check (separados between 0 and 5000),
  criado_em timestamptz not null default now()
);

-- DLC: libera o Robert no ranking (para tabelas criadas antes da DLC)
alter table public.scores drop constraint if exists scores_classe_check;
alter table public.scores add constraint scores_classe_check check (classe in ('Marina', 'Tiago', 'Cida', 'Léo', 'Robert'));

alter table public.scores enable row level security;

drop policy if exists "todos leem o ranking" on public.scores;
create policy "todos leem o ranking" on public.scores
  for select to anon, authenticated using (true);

drop policy if exists "todos enviam pontuacao" on public.scores;
create policy "todos enviam pontuacao" on public.scores
  for insert to anon, authenticated with check (true);

grant select, insert on public.scores to anon, authenticated;

create index if not exists scores_pontos_idx on public.scores (pontos);

-- Votos: um por aparelho. A tabela fica fechada; o jogo só vota e lê
-- os totais pelas duas funções abaixo, sem ver o voto de ninguém.
create table if not exists public.votos (
  cliente       uuid        primary key,
  voto          text        not null check (voto in ('like', 'dislike')),
  atualizado_em timestamptz not null default now()
);

alter table public.votos enable row level security;
revoke all on public.votos from anon, authenticated;

create or replace function public.votar(p_cliente uuid, p_voto text)
returns void
language sql
security definer
set search_path = public
as $$
  insert into votos (cliente, voto) values (p_cliente, p_voto)
  on conflict (cliente) do update set voto = excluded.voto, atualizado_em = now();
$$;

create or replace function public.contar_votos()
returns json
language sql
security definer
set search_path = public
as $$
  select json_build_object(
    'like',    count(*) filter (where voto = 'like'),
    'dislike', count(*) filter (where voto = 'dislike')
  ) from votos;
$$;

revoke all on function public.votar(uuid, text) from public;
revoke all on function public.contar_votos() from public;
grant execute on function public.votar(uuid, text) to anon, authenticated;
grant execute on function public.contar_votos() to anon, authenticated;
