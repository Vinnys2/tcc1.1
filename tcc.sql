-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-May-2021 às 15:39
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tcc`
drop database if exists tcc;
create database if not exists tcc;
use tcc;

CREATE TABLE `paciente` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(300) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` char(10) NOT NULL,
  `gestante` char(1) NOT NULL,
  `cpf_responsavel` int(11) DEFAULT NULL,
  `endereco` varchar(100) NOT NULL,
  `permissao` int(11) NOT NULL,
  `senha` int(6) NOT NULL,
  `telefone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Índices para tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`cpf`);

-----------------------------------------------------------------------------------------------------
-- Extraindo dados da tabela `paciente`
--
INSERT INTO `paciente` (`cpf`, `nome`, `email`, `data_nascimento`, `sexo`, `gestante`, `cpf_responsavel`, `endereco`, `permissao`, `senha`, `telefone`) VALUES
('123', 'AiinZ OoalGown', 'ainz@gmail.com', '1100-10-15', 'masculino', '', 123, 'Grande tumba Nazarick', 0, 123, 1997562602),
('231', 'Son Goku', 'goku@asd', '2020-10-14', 'masculino', 'n', 123, 'Cidade do Norte', 2, 123, 1793829380),
('321', 'Rimura Tempest', 'slime@asd', '1020-09-12', 'masculino', 'n', 123, 'Jura Tempest', 1, 123, 1973829380);



-- Estrutura da tabela `local`
--

CREATE TABLE `local` (
  `id_postinho` int(11) NOT NULL,
  `nome_postinho` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Índices para tabela `local`
--
ALTER TABLE `local`
  ADD PRIMARY KEY (`id_postinho`);


--
-- Extraindo dados da tabela `local`
--

INSERT INTO `local` (`id_postinho`, `nome_postinho`, `endereco`) VALUES
(2, 'Postinho Fecha Com Nos', 'Vale do Sol'),
(4, 'Zé Gotão', 'Acapulco');


--

CREATE TABLE `vacina` (
  `id_vacina` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Índices para tabela `vacina`
--
ALTER TABLE `vacina`
  ADD PRIMARY KEY (`id_vacina`);
  


--
-- Extraindo dados da tabela `vacina`
--

INSERT INTO `vacina` (`id_vacina`, `tipo`, `descricao`) VALUES
(1, 'Triplice bacteriana', 'Contra 99,9% das bactérias'),
(2, 'Variola', 'Graças a vacina um virus letal como a variola pode ser erradicada.'),
(3, 'Pneumonia', 'A pneumonia é uma doença que pode atingir pessoas de todas as idades, mas é mais perigosa para crian'),
(4, 'Febre Amarela', 'A vacina da febre amarela é indicada para pessoas de 6 meses a 60 anos que moram ou que vão viajar p'),
(5, 'Gripe', 'O vírus causador da gripe apresenta uma alta capacidade de mutação. Por causa disso, a vacina é essencial'),
(6, 'HPV', 'A vacina quadrivalente contra o HPV, ou papiloma vírus humano, também é uma forma de proteção contra'),
(7, 'Covid-19', 'Uma nova mutação do Sars-cov assola o mundo atual, por isso, a vacinação é o único meio de dete-la'),
(9, 'Mers', 'Também um tipo de coronavírus que tem um potencial de transmissão alto, porém menos letal que o sars');

 -- AUTO_INCREMENT de tabela `vacina`
--
ALTER TABLE `vacina`
  MODIFY `id_vacina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--


CREATE TABLE `agendamento` (
  `id_agendamento` int(11) NOT NULL,
  `cpf_paciente` varchar(11) NOT NULL,
  `tipo_vacina` int(11) NOT NULL,
  `data_agendada` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--- Índices para tabela `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`id_agendamento`),
  ADD KEY `agendamento_paciente` (`cpf_paciente`),
  ADD KEY `agendamento_vacina` (`tipo_vacina`);


INSERT INTO `agendamento` (`id_agendamento`, `cpf_paciente`, `tipo_vacina`, `data_agendada`) VALUES
(8, '123', 2, '2020-12-08'),
(10, '231', 3, '2020-12-18'),
(11, '321', 7, '2020-12-09');

--
ALTER TABLE `agendamento`
  MODIFY `id_agendamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

-- Limitadores para a tabela `agendamento`
--
ALTER TABLE `agendamento`
  ADD CONSTRAINT `agendamento_paciente` FOREIGN KEY (`cpf_paciente`) REFERENCES `paciente` (`cpf`) ON UPDATE CASCADE,
  ADD CONSTRAINT `agendamento_vacina` FOREIGN KEY (`tipo_vacina`) REFERENCES `vacina` (`id_vacina`) ON UPDATE CASCADE;
  

 
 
 
 
 -- Estrutura da tabela `lote`
 
 
 
 
 -- A criar
 
 
 
 
 -- Estrutura da tabela `dose`
 
--

CREATE TABLE `dose` (
  `id_dose` int(11) NOT NULL,
  `lote` int(11) NOT NULL,
  `data_tomada` date DEFAULT NULL,
  `local` int(11) NOT NULL,
  `aplicador` int(11) NOT NULL,
  `cpf_paciente` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Índices para tabela `dose`
--
ALTER TABLE `dose`
  ADD PRIMARY KEY (`id_dose`),
  ADD KEY `lote` (`lote`),
  ADD KEY `local_dose` (`local`),
  ADD KEY `paciente_dose` (`cpf_paciente`);






/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


