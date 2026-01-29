let express = require('express');
let db = require('../utils/db');
let router = express.Router();

router.get('/preenche-select', function (req, res) {
  let cmd = `
    SELECT 
        s.id_sala,
        CONCAT(s.identificacao, ' - ', u.nome) AS sala_unidade
    FROM sala s
    INNER JOIN unidade u 
        ON s.id_unidade = u.id_unidade
    ORDER BY u.nome, s.identificacao
  `;

  db.query(cmd, [], function (erro, listagem) {
    if (erro) return res.send(erro);
    res.json({ resultado: listagem });
  });
});


router.get('/listar', function (req, res) {
  let cmd = `
    SELECT 
        s.id_sala,
        s.identificacao,
        u.nome AS unidade
    FROM sala s
    INNER JOIN unidade u 
        ON s.id_unidade = u.id_unidade
    ORDER BY s.identificacao
  `;

  db.query(cmd, [], function (erro, listagem) {
    if (erro) return res.send(erro);
    res.render('salas-lista', { resultado: listagem });
  });
});


router.get('/add', function (req, res) {
  res.render('salas-add', { resultado: {} });
});



router.post('/add', function (req, res) {

  const identificacao = req.body.identificacao;
  const id_unidade = req.body.unidade;

  const cmdSala = `
        INSERT INTO sala (identificacao, id_unidade)
        VALUES (?, ?)
    `;

  db.query(cmdSala, [identificacao, id_unidade], function (erro) {
    if (erro) {
      console.log(erro);
      return res.send(erro);
    }

    res.redirect('/salas/listar');
  });
});


module.exports = router;