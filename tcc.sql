-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 17-Dez-2021 às 02:22
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tcc`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
CREATE TABLE IF NOT EXISTS `agendamento` (
  `id_agendamento` int(11) NOT NULL AUTO_INCREMENT,
  `cpf_paciente` varchar(11) NOT NULL,
  `tipo_vacina` int(11) NOT NULL,
  `data_agendada` date DEFAULT NULL,
  PRIMARY KEY (`id_agendamento`),
  KEY `agendamento_paciente` (`cpf_paciente`),
  KEY `agendamento_vacina` (`tipo_vacina`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `agendamento`
--

INSERT INTO `agendamento` (`id_agendamento`, `cpf_paciente`, `tipo_vacina`, `data_agendada`) VALUES
(8, '123', 2, '2021-10-08'),
(10, '231', 3, '2021-09-18'),
(11, '321', 7, '2022-01-09'),
(12, '199', 1, '2021-10-28'),
(13, '1144', 6, '2021-11-30'),
(14, '1144', 17, '2021-12-17'),
(15, '12345678', 13, '2021-12-14'),
(16, '189889', 17, '2021-12-17'),
(17, '123', 9, '2021-12-17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dose`
--

DROP TABLE IF EXISTS `dose`;
CREATE TABLE IF NOT EXISTS `dose` (
  `id_dose` int(11) NOT NULL AUTO_INCREMENT,
  `lote` int(11) NOT NULL,
  `data_tomada` date DEFAULT NULL,
  `local` int(11) NOT NULL,
  `aplicador` int(11) NOT NULL,
  `cpf_paciente` varchar(11) NOT NULL,
  PRIMARY KEY (`id_dose`),
  KEY `lote` (`lote`),
  KEY `local_dose` (`local`),
  KEY `paciente_dose` (`cpf_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `dose`
--

INSERT INTO `dose` (`id_dose`, `lote`, `data_tomada`, `local`, `aplicador`, `cpf_paciente`) VALUES
(54, 222, '2021-10-22', 5, 190, '199'),
(55, 111, '2021-10-26', 5, 1144, '123'),
(56, 111, '2021-11-29', 5, 1144, '1144'),
(57, 888, '2021-12-10', 5, 1144, '123'),
(58, 888, '2021-12-14', 8, 1144, '1144'),
(59, 111, '2021-12-17', 10, 1144, '12345678'),
(60, 999, '2021-12-17', 7, 1144, '189889'),
(61, 1111, '2021-12-17', 9, 1144, '12345890'),
(62, 888, '2021-12-17', 8, 1144, '12345890'),
(63, 333, '2021-12-17', 5, 1144, '12345678');

-- --------------------------------------------------------

--
-- Estrutura da tabela `local`
--

DROP TABLE IF EXISTS `local`;
CREATE TABLE IF NOT EXISTS `local` (
  `id_postinho` int(11) NOT NULL AUTO_INCREMENT,
  `nome_postinho` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  PRIMARY KEY (`id_postinho`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `local`
--

INSERT INTO `local` (`id_postinho`, `nome_postinho`, `endereco`) VALUES
(2, 'Postinho Fecha Com Nos', 'Vale do Sol'),
(4, 'Ze Gotera', 'Acapulco'),
(5, 'VACINOLANDIA', '5'),
(6, 'vale da injecao', 'rua qualquer'),
(7, 'Anti-Vacina', 'Palerma em Abundancia'),
(8, 'encruzilhada 61 e 49', 'Blues'),
(9, 'Loucurinhas', 'Rua da loucura'),
(10, 'Payol', 'Payolandia171'),
(14, 'Ze Gotera1', 'teste23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lote`
--

DROP TABLE IF EXISTS `lote`;
CREATE TABLE IF NOT EXISTS `lote` (
  `id` int(11) NOT NULL,
  `tipo_vacina` int(11) NOT NULL,
  `fabricante` varchar(100) NOT NULL,
  `origem` varchar(100) NOT NULL,
  `destino` varchar(100) NOT NULL,
  `data_fabricacao` date NOT NULL,
  `data_validade` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lote_vacina` (`tipo_vacina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `lote`
--

INSERT INTO `lote` (`id`, `tipo_vacina`, `fabricante`, `origem`, `destino`, `data_fabricacao`, `data_validade`) VALUES
(111, 2, 'FirstParty', 'Inglaterra', 'Brasil', '2021-12-01', '2021-12-23'),
(222, 1, 'StarLink', 'EUA', 'Brasil', '2022-12-01', '2022-12-21'),
(223, 14, 'ARTIC', 'Desconhecido', 'Inexistente', '2021-12-15', '2021-12-23'),
(333, 6, 'Rush', 'Umbrella', 'Brasil', '2021-10-17', '2022-02-11'),
(444, 10, 'Fiocruz', 'BRASIL', 'EUA', '2021-10-29', '2021-11-29'),
(555, 11, 'Albert Einstein', 'Desconhecida', 'Todos', '2021-10-27', '2021-11-10'),
(667, 13, 'Darkness', 'Desconhecido', 'SabeLaQual', '2021-11-29', '2021-11-30'),
(888, 15, 'PseudosIntelectuais', 'Jamaica', 'Todos', '2021-12-17', '2021-12-02'),
(999, 17, 'KENDO', 'Sociedade das Almas', 'RuekoMundo', '2021-12-07', '2021-12-15'),
(1111, 2, 'Fiocruz', 'BRASIL', 'EUA', '2021-12-15', '2021-12-29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(300) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` char(10) NOT NULL,
  `cpf_responsavel` int(11) DEFAULT NULL,
  `endereco` varchar(100) NOT NULL,
  `permissao` int(11) NOT NULL,
  `senha` int(6) NOT NULL,
  `telefone` int(11) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `paciente`
--

INSERT INTO `paciente` (`cpf`, `nome`, `email`, `data_nascimento`, `sexo`, `cpf_responsavel`, `endereco`, `permissao`, `senha`, `telefone`) VALUES
('1144', 'JOTARO', 'jotaro@blood.com', '2021-10-04', 'masculino', 1111, 'PHANTOM BLOOD', 1, 123456, 111112),
('116688001', 'ChapolinC', 'colorado@gmail.com', '2021-11-15', 'feminino', 12345678, 'tangamandapio', 0, 123456, 19292818),
('123', 'AiinZ OoalGown', 'ainz@gmail.com', '1100-10-15', 'masculino', 123, 'Grande tumba Nazarick', 0, 123, 1997562602),
('1234560', 'Chapolin', 'chapolin@gmail.com', '2021-10-04', 'masculino', 190, 'NAO CONTAVAM COM AS MINHAS ASTUCIAS', 0, 123456, 9090),
('12345678', 'GIORNO', 'giorno@yahoo.com', '2021-10-11', 'masculino', 123, 'Avenida Bucarratchi', 2, 123456, 1111111),
('12345890', 'Joao', 'jaozin@gmail.com', '2021-12-17', 'masculino', 10101010, 'Voluntarios da patria', 0, 123456, 123456789),
('15872678', 'tes4', 'tempes1t@gmail.com', '2022-01-03', 'masculino', 123, 'Garaio mermao', 0, 123456, 12332432),
('189889', 'teste3s', 'teste13@gmail.com', '2021-12-15', 'masculino', 11442, 'testolandias', 0, 123456, 1514242561),
('190', 'Rimuru', 'tempest@gmail.com', '2021-05-19', 'masculino', 1144, 'A FLORESTA JURA TEMPESTA', 0, 123456, 123478),
('199', 'TESTE', 'teste@gmail.com', '2021-10-04', 'masculino', 1144, 'TESTE1', 2, 123456, 1111111),
('231', 'Son Goku', 'goku@asd', '2020-10-14', 'masculino', 123, 'Cidade do Norte', 2, 123, 1793829380),
('321', 'Rimura Tempest', 'slime@asd', '1020-09-12', 'masculino', 123, 'Jura Tempest', 1, 123, 1973829380),
('393', 'Guilherme', 'ruekomundo@gmail.com', '2021-12-06', 'masculino', 1144, 'Las Notche', 2, 123456, 1214324),
('475', 'Gabriel', 'teste1@gmail.com', '2021-12-21', 'masculino', 1234, 'TESTE2', 2, 123456, 163552625),
('50048895890', 'Vinny', 'vinicius-almeida01@hotmail.com', '2001-10-08', 'masculino', 123, 'Jamais sabera', 0, 123456, 992828037),
('90992839', 'Nnoitra', 'noitora@gmail.com', '2021-12-16', 'masculino', 1144, 'Las Notche', 0, 123456, 1536478);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vacina`
--

DROP TABLE IF EXISTS `vacina`;
CREATE TABLE IF NOT EXISTS `vacina` (
  `id_vacina` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  PRIMARY KEY (`id_vacina`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vacina`
--

INSERT INTO `vacina` (`id_vacina`, `tipo`, `descricao`) VALUES
(1, 'Triplice bacteriana', 'Contra 99,9% das bacterias'),
(2, 'Variolas', 'Gracas a vacina um virus letal como a variola pode ser erradicada.'),
(3, 'Pneumonia', 'A pneumonia e uma doenca que pode atingir pessoas de todas as idades, mas e mais perigosa para criancas'),
(4, 'Febre Amarela', 'A vacina da febre amarela e indicada para pessoas de 6 meses a 60 anos que moram ou que vao viajar p'),
(5, 'Gripe', 'O virus causador da gripe apresenta uma alta capacidade de mutacao. Por causa disso, a vacina e essencial'),
(6, 'HPV', 'A vacina quadrivalente contra o HPV, ou papiloma virus humano, tambem e uma forma de protecao contra'),
(7, 'Covid-19', 'Uma nova mutacaoo do Sars-cov assola o mundo atual, por isso, a vacinacao é o unico meio de dete-la'),
(9, 'Mers', 'Tambem um tipo de coronaverus que tem um potencial de transmissao alto, porem menos letal que o sars'),
(10, 'VacinaZ', 'zikavirus'),
(11, 'QI', 'VÃ­rus da inteligÃªncia absoluta, de acordo com a lenda esse vÃ­rus Ã© tÃ£o esperto que ele mesmo criou a vacina.'),
(13, 'Destroyer', 'Mata tudo e todos'),
(14, 'Necronomicon', 'Ao aplicar em um defunto o mesmo volta a life'),
(15, 'QI-200', 'Vacina para tratar pessoas que utilizam zap como fonte de informaÃ§Ã£o'),
(16, 'Spy', 'Se disfarÃ§a como uma celula para atrair o vÃ­rus e causar sua morte :D'),
(17, 'Espiritual', 'DestrÃ³i o vÃ­rus utilizando seu reishi espiritual'),
(18, 'Sarampo', 'Causa sarampia'),
(20, 'Destroyers', 'ferro rapeize'),
(21, 'Grobal', 'Pro grobo'),
(22, 'Zaraio', 'farmei');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `agendamento`
--
ALTER TABLE `agendamento`
  ADD CONSTRAINT `agendamento_paciente` FOREIGN KEY (`cpf_paciente`) REFERENCES `paciente` (`cpf`) ON UPDATE CASCADE,
  ADD CONSTRAINT `agendamento_vacina` FOREIGN KEY (`tipo_vacina`) REFERENCES `vacina` (`id_vacina`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `dose`
--
ALTER TABLE `dose`
  ADD CONSTRAINT `local_dose` FOREIGN KEY (`local`) REFERENCES `local` (`id_postinho`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lote_dose` FOREIGN KEY (`lote`) REFERENCES `lote` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `paciente_dose` FOREIGN KEY (`cpf_paciente`) REFERENCES `paciente` (`cpf`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `lote_vacina` FOREIGN KEY (`tipo_vacina`) REFERENCES `vacina` (`id_vacina`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
