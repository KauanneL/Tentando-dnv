let express = require('express');
let db = require('../utils/db');
let router = express.Router();


router.get('/listar', function (req, res) {
    let cmd = `
        SELECT 
            u.id_unidade,
            u.nome,
            u.endereco,
            s.identificacao AS sala
        FROM unidade u
        LEFT JOIN sala s 
            ON s.id_unidade = u.id_unidade
        ORDER BY u.nome, s.identificacao
    `;

    db.query(cmd, [], function (erro, listagem) {
        if (erro) {
            return res.send(erro);
        }

        res.render('unidades-lista', { resultado: listagem });
    });
});




router.get('/preenche-select', function (req, res) {
    let cmd = `
        SELECT id_unidade, nome
        FROM unidade
        ORDER BY nome
    `;

    db.query(cmd, [], function (erro, listagem) {
        if (erro) {
            return res.status(500).json(erro);
        }

        res.json({ resultado: listagem });
    });
});


router.get('/add', function (req, res) {
    res.render('unidades-add', { resultado: {} });
});


router.post('/add', function (req, res) {

    const nome = req.body.nome;
    const endereco = req.body.endereco;


    if (!nome || !endereco) {
        return res.send('Nome e endereço são obrigatórios');
    }

    const cmd = `
        INSERT INTO unidade (nome, endereco)
        VALUES (?, ?)
    `;

    db.query(cmd, [nome, endereco], function (erro) {
        if (erro) {
            console.log(erro);
            return res.send(erro);
        }

        res.redirect('/unidades/listar');
    });
});


module.exports = router;
