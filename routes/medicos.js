let express = require('express');
let db = require('../utils/db')
let router = express.Router();
router.get('/listar', function (req, res) {

  let cmd = `
    SELECT 
        m.id_medico,
        m.nome AS nome_medico,
        m.crm,
        m.telefone,
        m.email,
        GROUP_CONCAT(DISTINCT e.nome SEPARATOR ', ') AS especialidade
    FROM medico m
    LEFT JOIN medico_especialidade me
        ON m.id_medico = me.id_medico
    LEFT JOIN especialidade e
        ON me.id_especialidade = e.id_especialidade
    GROUP BY 
        m.id_medico,
        m.nome,
        m.crm,
        m.telefone,
        m.email
    ORDER BY m.nome;
  `;

  db.query(cmd, [], function (erro, listagem) {
    if (erro) {
      console.log(erro);
      return res.send(erro);
    }

    res.render('medicos-lista', { resultado: listagem });
  });
});




router.get('/add', function (req, res) {
  res.render('medicos-add', { resultado: {} })
});


router.post('/add', function (req, res) {

    const {
        nome,
        crm,
        telefone,
        email,
        especialidade
    } = req.body;

    const cmdMedico = `
        INSERT INTO medico (nome, crm, telefone, email)
        VALUES (?, ?, ?, ?)
    `;

    db.query(cmdMedico, [nome, crm, telefone, email], function (erro, result) {
        if (erro) {
            console.log(erro);
            return res.send(erro);
        }

        const id_medico = result.insertId;

        // Relaciona médico com especialidades
        if (especialidade) {

            const especialidades = Array.isArray(especialidade)
                ? especialidade
                : [especialidade];

            const cmdEsp = `
                INSERT INTO medico_especialidade (id_medico, id_especialidade)
                VALUES (?, ?)
            `;

            especialidades.forEach(idEsp => {
                db.query(cmdEsp, [id_medico, idEsp]);
            });
        }

        res.redirect('/medicos/listar');
    });
});


module.exports = router;

