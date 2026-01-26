let express = require('express');
let db = require('../utils/db')
let router = express.Router();

router.get('/listar', function(req, res) {
let cmd =  `
SELECT id_unidade, nome, endereco
FROM unidade
ORDER BY nome
    `;
db.query(cmd, [], function(erro, listagem){
if (erro){
res.send(erro);
}
res.render('unidades-lista', { resultado: listagem });
});
});

module.exports = router;