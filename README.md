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

- **Na versão hospedada no Claude**, o ranking e os votos são compartilhados entre todos que têm acesso ao jogo.
- **No GitHub Pages ou abrindo o arquivo direto**, o ranking e o voto ficam salvos só no navegador de cada pessoa.

## Temas abordados

- Coleta seletiva e as cores das lixeiras
- Tempo de decomposição dos resíduos e impacto nos animais marinhos
- Política Nacional de Resíduos Sólidos (Lei 12.305/2010)
- ODS 14 da ONU: Vida na Água

## Tecnologia

Um único arquivo HTML, com CSS e JavaScript puros, desenhado em Canvas 2D. Não usa bibliotecas, e todos os sprites e a música chiptune são gerados por código. As fontes "Press Start 2P" e "Pixelify Sans" vêm do Google Fonts.
