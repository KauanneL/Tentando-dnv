let express = require('express');
let db = require('../utils/db')
let router = express.Router();

router.get('/listar', function(req, res) {
let cmd =  `
SELECT id_sala, identificacao
FROM sala
ORDER BY identificacao
    `;
db.query(cmd, [], function(erro, listagem){
if (erro){
res.send(erro);
}
res.render('salas-lista', { resultado: listagem });

});
});

router.get('/add', function (req, res) {
    res.render('salas-add', { resultado: {} })
});


router.post('/add', function (req, res) {

    let identificacao = req.body.identificacao;
    let id_sala = req.body.id_sala;

    let cmdSala = `
    INSERT INTO sala (identificacao, id_sala)
    VALUES (?, ?)
  `;

    db.query(cmdSala, [identificacao, id_sala], function (erro, result) {
        if (erro) {
            return res.send(erro);
        }
                    res.redirect('/salas/listar');
                }
            );
        });


module.exports = router;