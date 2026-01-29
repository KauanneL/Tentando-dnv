-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/01/2026 às 18:42
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `diaatende`
--

CREATE TABLE `diaatende` (
  `id_diaAtende` int(11) NOT NULL,
  `diaSemana` enum('SEG','TER','QUA','QUI','SEX','SAB','DOM') DEFAULT NULL,
  `horaInicio` time DEFAULT NULL,
  `horaFim` time DEFAULT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `diaatende`
--

INSERT INTO `diaatende` (`id_diaAtende`, `diaSemana`, `horaInicio`, `horaFim`, `id_sala`, `id_medico`) VALUES
(1, 'SEG', '07:00:00', '13:00:00', 1, 6),
(2, 'TER', '14:00:00', '21:00:00', 2, 10),
(3, 'QUA', '09:00:00', '15:00:00', 3, 8),
(4, 'QUI', '17:00:00', '00:00:00', 2, 2),
(5, 'SEX', '06:00:00', '18:00:00', 1, 1),
(6, 'SAB', '16:00:00', '00:00:00', 2, 7),
(7, 'DOM', '13:00:00', '22:00:00', 1, 9),
(8, 'SEG', '14:00:00', '23:00:00', 3, 3),
(9, 'TER', '05:00:00', '15:00:00', 1, 11),
(10, 'QUA', '15:00:00', '20:00:00', 3, 4),
(11, 'QUI', '10:00:00', '17:00:00', 2, 5),
(12, '', '05:58:00', '04:58:00', NULL, 12),
(13, '', '23:04:00', '03:02:00', 6, 13),
(14, '', '03:43:00', '13:24:00', 6, 14),
(15, '', '23:24:00', '03:42:00', 3, 15),
(16, '', '04:59:00', '06:05:00', 6, 16),
(17, '', '04:23:00', '04:03:00', 6, 17),
(18, 'QUA', '06:56:00', '05:06:00', 2, 18),
(19, 'TER', '23:02:00', '03:02:00', 6, 19);

-- --------------------------------------------------------

--
-- Estrutura para tabela `especialidade`
--

CREATE TABLE `especialidade` (
  `nome` varchar(100) NOT NULL,
  `id_especialidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `especialidade`
--

INSERT INTO `especialidade` (`nome`, `id_especialidade`) VALUES
('Psiquiatria', 1),
('Cardiologia', 2),
('Pediatria', 3),
('Odontologia', 4),
('Dermatologia', 5),
('Otorrinolaringologia', 6),
('Ginecologia', 7),
('Urologia', 8),
('Endrocnologista', 9);

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

CREATE TABLE `medico` (
  `nome` varchar(100) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `crm` varchar(20) NOT NULL,
  `telefone` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medico`
--

INSERT INTO `medico` (`nome`, `id_medico`, `crm`, `telefone`, `email`) VALUES
('Fábio Procópio', 1, '12345678909', '(84) 9 9999-9999', 'procopio@gmail.com'),
('Dayvyd Lavaniery', 2, '12345678908', '(84) 9 8888-8888', 'lavan@gmail.com'),
('Jurandy Soares', 3, '12345678907', '(84) 9 7777-7777', 'juranga@gmail.com'),
('Marcelo Varela ', 4, '12345678906', '(84) 9 6666-6666', 'marcelin@gmail.com'),
('Rebeka Carozza', 5, '12345678905', '(84) 9 5555-5555', 'carozzinha@gmail.com'),
('Andréa Pereira', 6, '12345678904', '(84) 9 4444-4444', 'perinhas@gmail.com'),
('Givanaldo Rocha', 7, '12345678903', '(84) 9 3333-3333', 'pedrinha@gmail.com'),
('Breno Meire', 8, '12345678902', '(84) 9 2222-2222', 'meiramoura@gmail.com'),
('Gustavo Lima', 9, '12345678901', '(84) 9 1111-1111', 'tcheretchetche@gmail.com'),
('Antônio Douglas', 10, '12345678901', '(84) 9 0000-0000', 'toinhosocrates@gmail.com'),
('Lúcia Alô', 11, '09876543210', '(84) 9 1234-1234', 'alosim@gmail.com'),
('Mariana de Medeiros Silva', 12, '64865485649496860', '45767356735', 'marianademedeirossilva96@gmail.com'),
('Mariana de Medeiros Souza', 13, '648654856494968678', '996908462', 'marianademedeirossilva96@gmail.com'),
('Mariana de Medeiros Silva', 14, '2135245345', '45767356735', 'marianademedeirossilva96@gmail.com'),
('fulano de tal', 15, '24513436613555736', '00000000', 'marianademedeirossilva96@gmail.com'),
('Mariana ', 16, '86569856865767', '45767356735', 'marianademedeirossilva96@gmail.com'),
('hufduhwf', 17, '64865485649496860', '996908462', 'marianademedeirossilva96@gmail.com'),
('Mariana Silva', 18, '648654856494968678', '996908462', 'marianademedeirossilva96@gmail.com'),
('juju', 19, '648654856494968435', '00000000', 'marianademedeirossilva96@gmail.com'),
('hfbehrgf', 20, '648654856494933', '324352535', 'marianademedeirossilva96@gmail.com'),
('Maria Luíza', 21, '648654856494968676', '562653737', 'marianademedeirossilva96@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico_especialidade`
--

CREATE TABLE `medico_especialidade` (
  `id_medEsp` int(11) NOT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `id_especialidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medico_especialidade`
--

INSERT INTO `medico_especialidade` (`id_medEsp`, `id_medico`, `id_especialidade`) VALUES
(1, 6, 7),
(2, 10, 1),
(3, 8, 8),
(4, 2, 1),
(5, 1, 6),
(6, 7, 5),
(7, 9, 4),
(8, 3, 2),
(9, 11, 7),
(10, 4, 3),
(11, 5, 3),
(12, 12, 9),
(13, 13, 9),
(14, 18, 7),
(15, 18, 4),
(16, 19, 7),
(17, 19, 4),
(18, 20, 5),
(19, 20, 9),
(20, 20, 1),
(21, 21, 9),
(22, 21, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sala`
--

CREATE TABLE `sala` (
  `id_sala` int(11) NOT NULL,
  `id_unidade` int(11) DEFAULT NULL,
  `identificacao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sala`
--

INSERT INTO `sala` (`id_sala`, `id_unidade`, `identificacao`) VALUES
(1, 3, 'Sala 1'),
(2, 2, 'Sala 2'),
(3, 1, 'Sala 3'),
(4, 3, 'Sala de triagem'),
(5, 4, 'Sala 1'),
(6, 2, 'Sala de triagem 02'),
(7, 2, 'Sala 01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidade`
--

CREATE TABLE `unidade` (
  `id_unidade` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `unidade`
--

INSERT INTO `unidade` (`id_unidade`, `nome`, `endereco`) VALUES
(1, 'Mais Saúde - Parnamirim', 'R. Bala Vista, Passagem de Areia, Parnamirim/RN'),
(2, 'Mais Saúde - Natal', 'Rua das Alamedas, Cidade Alta, Natal/RN'),
(3, 'Mais Saúde - Alecrim', 'Rua Rio Grande, Alecrim, Natal/RN'),
(4, 'Amor & Saúde - Parnamirim/Bela Vista', 'Rua Dezesseis de Maio, 15, Bela vista'),
(5, 'Mais Saúde - Bom Pastor', 'Rua Dezesseis de Maio, 15, Bela vista');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `diaatende`
--
ALTER TABLE `diaatende`
  ADD PRIMARY KEY (`id_diaAtende`),
  ADD KEY `id_sala` (`id_sala`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Índices de tabela `especialidade`
--
ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`id_especialidade`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`);

--
-- Índices de tabela `medico_especialidade`
--
ALTER TABLE `medico_especialidade`
  ADD PRIMARY KEY (`id_medEsp`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_especialidade` (`id_especialidade`);

--
-- Índices de tabela `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id_sala`),
  ADD KEY `id_unidade` (`id_unidade`);

--
-- Índices de tabela `unidade`
--
ALTER TABLE `unidade`
  ADD PRIMARY KEY (`id_unidade`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `diaatende`
--
ALTER TABLE `diaatende`
  MODIFY `id_diaAtende` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `especialidade`
--
ALTER TABLE `especialidade`
  MODIFY `id_especialidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `medico_especialidade`
--
ALTER TABLE `medico_especialidade`
  MODIFY `id_medEsp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `sala`
--
ALTER TABLE `sala`
  MODIFY `id_sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `unidade`
--
ALTER TABLE `unidade`
  MODIFY `id_unidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `diaatende`
--
ALTER TABLE `diaatende`
  ADD CONSTRAINT `diaatende_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`),
  ADD CONSTRAINT `diaatende_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`);

--
-- Restrições para tabelas `medico_especialidade`
--
ALTER TABLE `medico_especialidade`
  ADD CONSTRAINT `medico_especialidade_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `medico_especialidade_ibfk_2` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`);

--
-- Restrições para tabelas `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`id_unidade`) REFERENCES `unidade` (`id_unidade`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
