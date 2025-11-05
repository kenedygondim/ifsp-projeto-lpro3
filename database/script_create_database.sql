CREATE TABLE IF NOT EXISTS `tb_disciplina` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(255) NOT NULL DEFAULT '50',
	`periodo` int NOT NULL,
	`professor_Id` int,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `tb_alunos` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`email` varchar(50) NOT NULL UNIQUE,
	`nome_completo` int NOT NULL DEFAULT '200',
	`ira` decimal(10,0) NOT NULL,
	`periodo_ingresso` char(6) NOT NULL,
	`status_matricula` varchar(50) NOT NULL,
	`usuario_Id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `tb_professores` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_completo` varchar(255) NOT NULL DEFAULT '100',
	`email` varchar(255) NOT NULL DEFAULT '50',
	`data_admissao` date NOT NULL,
	`usuario_Id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `tb_aluno_disciplina` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`aluno_Id` int NOT NULL,
	`disciplina_id` int NOT NULL,
	`nota_avaliacao_1` double NOT NULL,
	`nota_avaliacao_2` double NOT NULL,
	`nota_avaliacao_3` double NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `tb_usuarios` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`prontuario` char(9) NOT NULL UNIQUE,
	`senha` varchar(100) NOT NULL,
	`ativo` boolean NOT NULL,
	`role` varchar(255) NOT NULL,
	`data_cadastro` date NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `tb_disciplina` ADD CONSTRAINT `tb_disciplina_fk3` FOREIGN KEY (`professor_Id`) REFERENCES `tb_professores`(`id`);
ALTER TABLE `tb_alunos` ADD CONSTRAINT `tb_alunos_fk6` FOREIGN KEY (`usuario_Id`) REFERENCES `tb_usuarios`(`id`);
ALTER TABLE `tb_professores` ADD CONSTRAINT `tb_professores_fk4` FOREIGN KEY (`usuario_Id`) REFERENCES `tb_usuarios`(`id`);
ALTER TABLE `tb_aluno_disciplina` ADD CONSTRAINT `tb_aluno_disciplina_fk1` FOREIGN KEY (`aluno_Id`) REFERENCES `tb_alunos`(`id`);

ALTER TABLE `tb_aluno_disciplina` ADD CONSTRAINT `tb_aluno_disciplina_fk2` FOREIGN KEY (`disciplina_id`) REFERENCES `tb_disciplina`(`id`);
