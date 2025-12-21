let express = require('express');
let db = require('../utils/db')
let router = express.Router();
router.get('/listar', function(req, res) {
var cmd = 'SELECT a.id_medico, a.nome AS nome_medico, a.crm, a.telefone, a.email, e.nome AS especialidade FROM medico a INNER JOIN medico_especialidade me ON a.id_medico = me.id_medico INNER JOIN especialidade e ON me.id_especialidade = e.id_especialidade ORDER BY a.nome;';
db.query(cmd, [], function(erro, listagem){
if (erro){
res.send(erro);
}
res.render('medicos-lista', {resultado: listagem});
});
});

router.get('/add', function(req, res) {
res.render('medicos-add', {resultado: {}})
});


router.post('/add', function (req, res) {

    let nome = req.body.nome;
    let crm = req.body.crm;
    let telefone = req.body.telefone;
    let email = req.body.email;
    let especialidade = req.body.especialidade;


    // 1️⃣ Inserir médico
    let cmdMedico = `
        INSERT INTO medico (nome, crm, telefone, email)
        VALUES (?, ?, ?, ?)
    `;

    db.query(cmdMedico, [nome, crm, telefone, email], function (erro, result) {
        if (erro) {
            return res.send(erro);
        }

        let id_medico = result.insertId;

        // 2️⃣ Criar relacionamento médico ↔ especialidade
        let cmdRelacao = `
            INSERT INTO medico_especialidade (id_medico, id_especialidade)
            VALUES (?, ?)
        `;

        db.query(cmdRelacao, [id_medico, especialidade], function (erro) {
            if (erro) {
                return res.send(erro);
            }

            res.redirect('/medicos/listar');
        });
    });
});

module.exports = router;

