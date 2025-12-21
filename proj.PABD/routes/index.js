var express = require('express');
var router = express.Router();
var db = require('../utils/db');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});


/* Outras rotas definidas anteriormente... */
router.get('/medicos/listar', function(req, res) {
var cmd = 'SELECT a.id_medico, a.nome AS nome_medico, a.crm, a.telefone, a.email, e.nome AS especialidade FROM medico a INNER JOIN medico_especialidade me ON a.id_medico = me.id_medico INNER JOIN especialidade e ON me.id_especialidade = e.id_especialidade ORDER BY a.nome;';
db.query(cmd, [], function(erro, listagem){
if (erro){
res.send(erro);
}
/* Criaremos a view medicos-lista no próximo slide*/
res.render('medicos-lista', {resultado: listagem});
});
});

module.exports = router;
