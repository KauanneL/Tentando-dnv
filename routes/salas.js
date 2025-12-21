let express = require('express');
let db = require('../utils/db');
let router = express.Router();

router.get('/listar', function(req, res) {
  let cmd = `
    SELECT id_sala, identificacao
    FROM sala
    ORDER BY identificacao
  `;

  db.query(cmd, [], function(erro, listagem) {
    if (erro) return res.send(erro);
    res.json({ resultado: listagem });
  });
});

module.exports = router;