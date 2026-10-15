# Limpando a Praia

Jogo educativo de navegador, em pixel art, criado para uma atividade integradora da faculdade. O objetivo é promover a conscientização socioambiental sobre a preservação das praias e o descarte adequado de resíduos.

O projeto tem duas ações:

1. **Ação prática:** um mutirão de limpeza de praia, com registro dos resíduos encontrados.
2. **Jogo "Limpando a Praia":** usa os resíduos registrados no mutirão como inimigos e como base para o conteúdo educativo.

## Como jogar

Abra o `index.html` no navegador ou acesse a página do GitHub Pages do repositório.

| Ação | Teclado | Celular |
|---|---|---|
| Mover | W A S D ou setas | Arrastar o dedo na tela |
| Poder especial (Burst) | Espaço | Botão BURST |
| Pausa | P ou Esc | Botão PAUSA |
| Música | M | Botão MÚSICA |

As armas atacam sozinhas. A cada fase você:

1. Derrota os monstros feitos de lixo.
2. Recolhe o lixo que eles deixam no chão. A mochila tem limite de espaço.
3. Leva cada resíduo até a lixeira certa da coleta seletiva:
   - **Vermelha**: plástico (garrafa PET, sacola, isopor)
   - **Azul**: papel (caixa de papelão)
   - **Verde**: vidro (garrafa de vidro)
   - **Amarela**: metal (latinha)
   - **Cinza**: não reciclável (bituca de cigarro)
4. Ao completar a meta, todo o lixo que sobrou na areia se junta em um **chefe gigante**. Quanto mais sujeira tiver ficado no chão, mais forte ele nasce.

Lixo largado por muito tempo volta a virar monstro.

## História

A **Mestra Caretta**, uma tartaruga-marinha que guarda a praia há mais de cem anos, treina cinco jovens para defender o litoral. O nome vem da *Caretta caretta*, a tartaruga-cabeçuda, espécie ameaçada que desova no Brasil. Um dos aprendizes, **Robert**, cansa de ver a praia suja de novo, vira **Robert, o Descarte**, e desperta o lixo abandonado. Os quatro que ficam formam os **Guardiões da Maré**.

- A abertura aparece na primeira vez que a pessoa joga e pode ser revista pelo botão **HISTÓRIA** do menu.
- Antes de cada chefe, Robert aparece provocando.
- No final, Robert ataca a Marina com uma gosma tóxica. A partir daí, a Marina fica infectada e não pode mais ser escolhida naquele aparelho. A seleção de personagem tem a opção **Reiniciar a história** para ela voltar.
- Cada momento tem uma música própria: alegre, triste, tensa, misteriosa e heroica. Cada fase também tem a sua trilha.

## Personagens

| Personagem | Classe | Arma | Poder especial |
|---|---|---|---|
| Marina | Guerreira | Espada de Brinquedo | Tornado de Espuma |
| Tiago | Atirador | Lança-Esponja | Chuva de Esponjas |
| Cida | Alquimista | Lançador de Limpeza | Maré Limpa |
| Léo | Coletor | Frisbee Reciclado | Ímã Reciclador |

O rosto do personagem muda conforme a partida: alegre, com dor ao levar dano, comemorando ao separar o lixo, surpreso quando o chefe aparece, triste ou exausto com pouca vida, preocupado com a mochila cheia e com sono quando fica parado.

## Dados do mutirão

No começo do `<script>` do `index.html` existe o bloco `MUTIRAO`. Preencha com os números reais da limpeza (local, data, voluntários, quilos e quantidade de cada item). Assim, a tela final do jogo mostra os resultados do mutirão ao lado do total recolhido no jogo.

## Ranking e votos

O jogador digita um nick no início. A pontuação é salva quando ele vence ou encerra a partida, e a tela de ranking mostra as 10 melhores e as 10 piores pontuações, além dos votos "Gostei" e "Não gostei".

Onde o ranking fica salvo depende de onde o jogo está rodando:

| Onde o jogo roda | Onde ficam o ranking e os votos |
|---|---|
| Link do Claude | Banco de dados do artifact, compartilhado entre quem tem acesso |
| GitHub Pages / Netlify, com Supabase configurado | Supabase: ranking online para todo mundo que joga pelo link |
| Sem Supabase configurado | Só no navegador de cada pessoa |

### Como ligar o ranking online (Supabase, grátis)

1. Crie uma conta em [supabase.com](https://supabase.com) e um projeto novo.
2. No projeto, abra **SQL Editor > New query**, cole todo o conteúdo de [`supabase/ranking.sql`](supabase/ranking.sql) e clique em **Run**.
3. Clique no botão **Connect**, no topo do painel do projeto, e copie a **Project URL** e a chave pública: a **publishable key** (`sb_publishable_...`) ou, em projetos antigos, a **anon public** (`eyJ...`). Nunca use a chave secreta (`sb_secret_...` ou `service_role`).
4. No `limpando-a-praia.html`, preencha o bloco `SUPABASE` no começo do `<script>`:
   ```js
   const SUPABASE = {
     url: 'https://SEU-PROJETO.supabase.co',
     chave: 'SUA-CHAVE-ANON',
   };
   ```
5. Gere o site de novo com `node gerar-index.js`, faça o commit e envie para o GitHub.

A chave `anon` foi feita para ficar no site. As regras do `ranking.sql` deixam qualquer pessoa ler o ranking e enviar uma pontuação nova, mas ninguém consegue alterar ou apagar a pontuação dos outros, nem ver o voto de cada pessoa. Como o ranking é aberto, alguém que entenda de programação poderia enviar uma pontuação falsa. Os limites do banco (nick de 2 a 16 caracteres, pontuação máxima e fases de 1 a 3) reduzem isso.

## Arquivos

| Arquivo | Para que serve |
|---|---|
| `index.html` | O site (GitHub Pages / Netlify). É gerado, não edite direto |
| `limpando-a-praia.html` | O jogo em si, também usado na versão publicada no Claude. Edite este |
| `gerar-index.js` | Gera o `index.html` a partir do `limpando-a-praia.html` (`node gerar-index.js`) |
| `supabase/ranking.sql` | Cria as tabelas e as regras do ranking online |

## Temas abordados

- Coleta seletiva e as cores das lixeiras
- Tempo de decomposição dos resíduos e impacto nos animais marinhos
- Política Nacional de Resíduos Sólidos (Lei 12.305/2010)
- ODS 14 da ONU: Vida na Água

## Tecnologia

Um único arquivo HTML, com CSS e JavaScript puros, desenhado em Canvas 2D. Não usa bibliotecas, e todos os sprites e a música chiptune são gerados por código. As fontes "Press Start 2P" e "Pixelify Sans" vêm do Google Fonts.
