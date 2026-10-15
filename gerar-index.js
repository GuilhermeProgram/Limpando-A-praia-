// Gera o index.html (site do GitHub Pages / Netlify) a partir de limpando-a-praia.html,
// que é a versão publicada no Claude. Rode depois de editar o jogo:
//   node gerar-index.js
const fs = require('fs');
const path = require('path');

const src = path.join(__dirname, 'limpando-a-praia.html');
const out = path.join(__dirname, 'index.html');
const s = fs.readFileSync(src, 'utf8');
const cut = s.indexOf('</style>') + '</style>'.length;

const html = `<!doctype html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
<meta name="description" content="Limpando a Praia: jogo educativo em pixel art sobre lixo nas praias e coleta seletiva.">
<style>html,body{margin:0}</style>
${s.slice(0, cut).trim()}
</head>
<body>
${s.slice(cut).trim()}
</body>
</html>
`;
fs.writeFileSync(out, html);
console.log('index.html gerado (' + html.length + ' bytes)');
