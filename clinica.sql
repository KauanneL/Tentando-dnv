-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Dez-2025 às 14:20
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

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
-- Estrutura da tabela `diaatende`
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
-- Extraindo dados da tabela `diaatende`
--

INSERT INTO `diaatende` (`id_diaAtende`, `diaSemana`, `horaInicio`, `horaFim`, `id_sala`, `id_medico`) VALUES
(1, 'SEG', '08:00:00', '12:00:00', 1, 1),
(3, 'TER', '07:00:00', '12:00:00', 2, 3),
(4, 'SEX', '13:00:00', '18:00:00', 3, 4),
(5, 'SAB', '13:00:00', '21:00:00', 2, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `especialidade`
--

CREATE TABLE `especialidade` (
  `nome` varchar(100) NOT NULL,
  `id_especialidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `especialidade`
--

INSERT INTO `especialidade` (`nome`, `id_especialidade`) VALUES
('Urologia', 1),
('Cardiologia', 2),
('Psicologia', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `medico`
--

CREATE TABLE `medico` (
  `nome` varchar(100) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `crm` varchar(20) NOT NULL,
  `telefone` varchar(13) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `medico`
--

INSERT INTO `medico` (`nome`, `id_medico`, `crm`, `telefone`, `email`) VALUES
('Cleibysin David', 1, 'CRM12345', '11999999999', 'clebinho@clinica.com'),
('Pauliandra Nogueira', 3, '0987654321', '84 90028922', 'paulinha@gmail.com'),
('Eberson Guimarães', 4, '7890654321', '84 99998888', 'ebersinho@gmail.com'),
('Galandriel de Arrascaeta', 5, '096543281', '8490028923', 'galandinho@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `medico_especialidade`
--

CREATE TABLE `medico_especialidade` (
  `id_medEsp` int(11) NOT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `id_especialidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `medico_especialidade`
--

INSERT INTO `medico_especialidade` (`id_medEsp`, `id_medico`, `id_especialidade`) VALUES
(1, 1, 1),
(3, 3, 2),
(4, 4, 3),
(5, 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala`
--

CREATE TABLE `sala` (
  `id_sala` int(11) NOT NULL,
  `id_unidade` int(11) DEFAULT NULL,
  `identificacao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `sala`
--

INSERT INTO `sala` (`id_sala`, `id_unidade`, `identificacao`) VALUES
(1, 1, 'Sala 01'),
(2, 2, 'Sala 02'),
(3, 3, 'Sala 03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `unidade`
--

CREATE TABLE `unidade` (
  `id_unidade` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `unidade`
--

INSERT INTO `unidade` (`id_unidade`, `nome`, `endereco`) VALUES
(1, 'Unidade Centro', 'Rua da Cura, 123'),
(2, 'Unidade Natal', 'Natal, Rua Boa Saúde, 501.'),
(3, 'Unidade Parnamirim', 'Parnamirim, Rua Show Doença, 70.');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `diaatende`
--
ALTER TABLE `diaatende`
  ADD PRIMARY KEY (`id_diaAtende`),
  ADD KEY `id_sala` (`id_sala`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Índices para tabela `especialidade`
--
ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`id_especialidade`);

--
-- Índices para tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`);

--
-- Índices para tabela `medico_especialidade`
--
ALTER TABLE `medico_especialidade`
  ADD PRIMARY KEY (`id_medEsp`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_especialidade` (`id_especialidade`);

--
-- Índices para tabela `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id_sala`),
  ADD KEY `id_unidade` (`id_unidade`);

--
-- Índices para tabela `unidade`
--
ALTER TABLE `unidade`
  ADD PRIMARY KEY (`id_unidade`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `diaatende`
--
ALTER TABLE `diaatende`
  MODIFY `id_diaAtende` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `especialidade`
--
ALTER TABLE `especialidade`
  MODIFY `id_especialidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `medico_especialidade`
--
ALTER TABLE `medico_especialidade`
  MODIFY `id_medEsp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `sala`
--
ALTER TABLE `sala`
  MODIFY `id_sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `unidade`
--
ALTER TABLE `unidade`
  MODIFY `id_unidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `diaatende`
--
ALTER TABLE `diaatende`
  ADD CONSTRAINT `diaatende_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`),
  ADD CONSTRAINT `diaatende_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`);

--
-- Limitadores para a tabela `medico_especialidade`
--
ALTER TABLE `medico_especialidade`
  ADD CONSTRAINT `medico_especialidade_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `medico_especialidade_ibfk_2` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`);

--
-- Limitadores para a tabela `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`id_unidade`) REFERENCES `unidade` (`id_unidade`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
