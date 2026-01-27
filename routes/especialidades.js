let express = require('express');
let db = require('../utils/db')
let router = express.Router();

router.get('/listar', function(req, res) {
let cmd =  `
    SELECT 
        id_especialidade,
        nome
    FROM especialidade
    ORDER BY nome
    `;
db.query(cmd, [], function(erro, listagem){
if (erro){
res.send(erro);
}
res.render('especialidades-lista', { resultado: listagem });
 
});
});


router.get('/add', function (req, res) {
    res.render('especialidades-add', { resultado: {} })
});


router.post('/add', function (req, res) {

    let nome = req.body.nome;
    let id_especialidade = req.body.id_especialidade;



    let cmdEspecialidade = `
    INSERT INTO especialidade (nome, id_especialidade)
    VALUES (?, ?)
  `;

    db.query(cmdEspecialidade, [nome, id_especialidade], function (erro, result) {
        if (erro) {
            return res.send(erro);
        }
                    res.redirect('/especialidades/listar');
                }
            );
        });

module.exports = router;