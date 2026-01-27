let express = require('express');
let db = require('../utils/db');
let router = express.Router();


// 🔵 ROTA PARA PÁGINA DE LISTAGEM (EJS)
router.get('/listar', function(req, res) {
    let cmd = `
        SELECT id_unidade, nome, endereco
        FROM unidade
        ORDER BY nome
    `;

    db.query(cmd, [], function(erro, listagem){
        if (erro){
            return res.send(erro);
        }

        res.render('unidades-lista', { resultado: listagem });
    });
});


// 🟢 ROTA PARA AJAX (SELECT DO FORMULÁRIO)
router.get('/listar', function(req, res) {
    let cmd = `
        SELECT id_unidade, nome
        FROM unidade
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


module.exports = router;
