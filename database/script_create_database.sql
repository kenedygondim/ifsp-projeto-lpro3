CREATE DATABASE db_gerenciamento_notas;

USE db_gerenciamento_notas;

CREATE TABLE IF NOT EXISTS `tb_disciplinas` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(70) NOT NULL DEFAULT '50',
	`periodo` int NOT NULL,
	`carga_horaria` decimal(4, 2) NOT NULL,
	`professor_Id` int,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `tb_alunos` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`email` varchar(50) NOT NULL UNIQUE,
	`nome` varchar(100) NOT NULL,
	`ira` decimal(4,2) NOT NULL,
	`data_matricula` date NOT NULL,
	`status_matricula` varchar(50) NOT NULL,
	`usuario_Id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `tb_professores` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(100) NOT NULL DEFAULT '100',
	`email` varchar(50) NOT NULL DEFAULT '50',
	`usuario_Id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `tb_notas` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`aluno_Id` int NOT NULL,
	`avaliacao_id` int NOT NULL,
	`nota` decimal(4, 2) NOT NULL,
	`observacoes` varchar(255),
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `tb_usuarios` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`prontuario` char(9) NOT NULL UNIQUE,
	`senha` varchar(100) NOT NULL,
	`ativo` boolean NOT NULL,
	`data_cadastro` date NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `tb_avaliacoes` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_disciplina` int NOT NULL,
	`nome` varchar(50) NOT NULL,
	`peso` decimal(4, 2) NOT NULL DEFAULT '1',
	`data_avaliacao` date,
	PRIMARY KEY (`id`)
);

ALTER TABLE `tb_disciplina` ADD CONSTRAINT `tb_disciplina_fk4` FOREIGN KEY (`professor_Id`) REFERENCES `tb_professores`(`id`);
ALTER TABLE `tb_alunos` ADD CONSTRAINT `tb_alunos_fk6` FOREIGN KEY (`usuario_Id`) REFERENCES `tb_usuarios`(`id`);
ALTER TABLE `tb_professores` ADD CONSTRAINT `tb_professores_fk4` FOREIGN KEY (`usuario_Id`) REFERENCES `tb_usuarios`(`id`);
ALTER TABLE `tb_aluno_disciplina` ADD CONSTRAINT `tb_aluno_disciplina_fk1` FOREIGN KEY (`aluno_Id`) REFERENCES `tb_alunos`(`id`);

ALTER TABLE `tb_aluno_disciplina` ADD CONSTRAINT `tb_aluno_disciplina_fk2` FOREIGN KEY (`avaliacao_id`) REFERENCES `tb_avaliacoes`(`id`);

ALTER TABLE `tb_avaliacoes` ADD CONSTRAINT `tb_avaliacoes_fk1` FOREIGN KEY (`id_disciplina`) REFERENCES `tb_disciplina`(`id`);
