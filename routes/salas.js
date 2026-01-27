const express = require('express');
const db = require('../utils/db');
const router = express.Router();


// 🔹 LISTAR SALAS (RETORNA JSON PARA O AJAX)
router.get('/listar', function (req, res) {

    const cmd = `
        SELECT id_sala, identificacao
        FROM sala
        ORDER BY identificacao
    `;

    db.query(cmd, [], function (erro, listagem) {
        if (erro) {
            console.log(erro);
            return res.status(500).json(erro);
        }

        res.json({ resultado: listagem }); // 👈 O AJAX PRECISA DISSO
    });

});


// 🔹 TELA DE CADASTRO DE SALA
router.get('/add', function (req, res) {
    res.render('salas-add', { resultado: {} });
});


// 🔹 INSERIR SALA
router.post('/add', function (req, res) {

    const identificacao = req.body.identificacao;

    const cmdSala = `
        INSERT INTO sala (identificacao)
        VALUES (?)
    `;

    db.query(cmdSala, [identificacao], function (erro, result) {
        if (erro) {
            console.log(erro);
            return res.send(erro);
        }

        res.redirect('/salas/listar');
    });

});

module.exports = router;
