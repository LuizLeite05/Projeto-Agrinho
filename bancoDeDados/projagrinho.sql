--Criação do Banco de Dados
CREATE DATABASE projagrinho;
--Utilização do Banco de Dados
USE DATABASE projagrinho;
-- Estrutura da tabela usuario --
--

DROP TABLE IF EXISTS `usuario`
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `tela_escura` tinyint(1) NOT NULL DEFAULT '0',
  `administrador` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY(`id_usuario`),
  UNIQUE KEY `id_usuario` (`id_usuario`),

) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Estrutura da tabela comentario --
--

DROP TABLE IF EXISTS `comentario`
CREATE TABLE IF NOT EXISTS `comentario` (
  `id_comentario` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `qtd_curtidas` INT UNSIGNED,
  `qtd_respostas` INT UNSIGNED,
  `id_usuario` bigint UNSIGNED NOT NULL,
  `id_noticia` bigint UNSIGNED NOT NULL,
  PRIMARY KEY(`id_comentario`),
  UNIQUE KEY `id_comentario` (`id_comentario`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_noticia` (`id_noticia`) 
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Estrutura da tabela noticia --
--

DROP TABLE IF EXISTS `noticia`
CREATE TABLE IF NOT EXISTS `noticia` (
  `id_noticia` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_publicacao` DATE NOT NULL,
  `qtd_comentario` INT UNSIGNED,
  `qtd_curtidas` INT UNSIGNED,
  `id_instituicao` INT UNSIGNED,
  `id_comentario` INT UNSIGNED,
  PRIMARY KEY `id_noticia` (`id_noticia`),
  KEY `administrador` (`administrador`),
  KEY `id_comentario` (`id_comentario`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserção dos primeiros usuarios testes do banco de dados --
--

INSERT INTO usuario (id_usuario, nome_usuario, email, senha, tela_escura, administrador) VALUES
(1, 'Antonio Neves', 'antonio123@gmail.com', '123456', 1, 0),
(2, 'Guilherme Fernandes', 'gui456@gmail.com', '123456', 0, 1),
(3, 'Rafael Oliveira', 'rafa789@gmail.com', '123456', 1, 0);

-- Inserção dos primeiros comentarios testes do banco de dados --
--

INSERT INTO comentario (id_comentario, qtd_curtidas, qtd_respostas, id_usuario, id_noticia) VALUES
(1, 2, 6, 1, 1),
(2, 8, 4, 2, 1);

-- Inserção das primeiras noticias testes do banco de dados --
--

INSERT INTO noticia (id_noticia, data_publicacao, qtd_comentario, qtd_curtidas, administrador, id_comentario) VALUES
(1, '2024-05-06', 5, 500, 2, 1),
(2, '2023-02-05', 30, 400, 2, 2);





