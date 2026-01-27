let express = require('express');
let db = require('../utils/db');
let router = express.Router();


// 🔵 ROTA PARA PÁGINA DE LISTAGEM (EJS)
router.get('/', function(req, res) {
    let cmd = `
        SELECT id_especialidade, nome
        FROM especialidade
        ORDER BY nome
    `;

    db.query(cmd, [], function(erro, listagem){
        if (erro){
            return res.send(erro);
        }

        res.render('especialidade-lista', { resultado: listagem });
    });
});


// 🟢 ROTA PARA AJAX (SELECT DO FORMULÁRIO)
router.get('/listar', function(req, res) {
    let cmd = `
        SELECT id_especialidade, nome
        FROM especialidade
        ORDER BY nome
    `;

    db.query(cmd, [], function(erro, listagem){
        if (erro){
            return res.status(500).json(erro);
        }

        // 👇 ESSA LINHA FAZ O SELECT FUNCIONAR
        res.json({ resultado: listagem });
    });
});

router.get('/add', function (req, res) {
    res.render('especialidades-add', { resultado: {} });
});

router.post('/add', function (req, res) {

    const nome = req.body.nome;

    const cmdEspecialidade = `
        INSERT INTO especialidad (nome)
        VALUES (?)
    `;

    db.query(cmdEspecialidade, [nome], function (erro, result) {
        if (erro) {
            console.log(erro);
            return res.send(erro);
        }

        res.redirect('/especialidades/listar');
    });

});

module.exports = router;
