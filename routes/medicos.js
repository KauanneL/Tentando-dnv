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
  e.nome AS especialidade,

  d.diaSemana,
  d.horaInicio,
  d.horaFim,

  s.identificacao AS sala,
  u.nome AS unidade

FROM medico m
INNER JOIN medico_especialidade me 
  ON m.id_medico = me.id_medico
INNER JOIN especialidade e 
  ON me.id_especialidade = e.id_especialidade

LEFT JOIN diaatende d 
  ON m.id_medico = d.id_medico
LEFT JOIN sala s 
  ON d.id_sala = s.id_sala
LEFT JOIN unidade u 
  ON s.id_unidade = u.id_unidade

ORDER BY m.nome, d.diaSemana;

  `;

    db.query(cmd, [], function (erro, listagem) {
        if (erro) {
            return res.send(erro);
        }
        res.render('medicos-lista', { resultado: listagem });
    });
});


router.get('/add', function (req, res) {
    res.render('medicos-add', { resultado: {} })
});


router.post('/add', function (req, res) {

    let nome = req.body.nome;
    let crm = req.body.crm;
    let telefone = req.body.telefone;
    let email = req.body.email;
    let especialidade = req.body.especialidade;

    let diaSemana = req.body.diaSemana;
    let horaInicio = req.body.horaInicio;
    let horaFim = req.body.horaFim;
    let id_sala = req.body.id_sala;

    
    let cmdMedico = `
    INSERT INTO medico (nome, crm, telefone, email)
    VALUES (?, ?, ?, ?)
  `;

    db.query(cmdMedico, [nome, crm, telefone, email], function (erro, result) {
        if (erro) {
            return res.send(erro);
        }

        let id_medico = result.insertId;

        
        let cmdEspecialidade = `
      INSERT INTO medico_especialidade (id_medico, id_especialidade)
      VALUES (?, ?)
    `;

        db.query(cmdEspecialidade, [id_medico, especialidade], function (erro) {
            if (erro) {
                return res.send(erro);
            }

            
            let cmdDiaAtende = `
        INSERT INTO diaatende
        (id_medico, diaSemana, horaInicio, horaFim, id_sala)
        VALUES (?, ?, ?, ?, ?)
      `;

            db.query(
                cmdDiaAtende,
                [id_medico, diaSemana, horaInicio, horaFim, id_sala],
                function (erro) {
                    if (erro) {
                        return res.send(erro);
                    }

                    
                    res.redirect('/medicos/listar');
                }
            );
        });
    });
});
module.exports = router;

