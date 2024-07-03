-- Criação do Banco de dados --
--

CREATE DATABASE projagrinho;

-- Utilizando o Banco de Dados --
--

USE DATABASE projagrinho;
-- Estrutura da tabela usuario --
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `tela_escura` tinyint(1) NOT NULL DEFAULT '0',
  `administrador` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY(`id_usuario`),
  UNIQUE KEY `id_usuario` (`id_usuario`)

) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Estrutura da tabela comentario --
--

DROP TABLE IF EXISTS `comentario`;
CREATE TABLE IF NOT EXISTS `comentario` (
  `id_comentario` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `qtd_curtidas` INT UNSIGNED,
  `qtd_respostas` INT UNSIGNED,
  `id_usuario` bigint UNSIGNED NOT NULL,
  `id_noticia` bigint UNSIGNED NOT NULL,
  `comentario_armazenado` varchar(255) NOT NULL,
  PRIMARY KEY(`id_comentario`),
  UNIQUE KEY `id_comentario` (`id_comentario`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_noticia` (`id_noticia`) 
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Estrutura da tabela noticia --
--

DROP TABLE IF EXISTS `noticia`;
CREATE TABLE IF NOT EXISTS `noticia` (
  `id_noticia` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_publicacao` DATE NOT NULL,
  `qtd_comentario` INT UNSIGNED,
  `qtd_curtidas` INT UNSIGNED,
  `id_administrador` bigint UNSIGNED,
  `id_categoria` bigint UNSIGNED NOT NULL,
  `id_comentario` bigint UNSIGNED,
  `noticia_armazenada` varchar(255) NOT NULL,
  PRIMARY KEY `id_noticia` (`id_noticia`),
  KEY `id_administrador` (`id_administrador`),
  KEY `id_comentario` (`id_comentario`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Estrutura da tabela de categorias para o Filtro de busca --
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `id_categoria` (`id_categoria`),
  UNIQUE KEY `nome` (`nome`)
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

INSERT INTO noticia (id_noticia, data_publicacao, qtd_comentario, qtd_curtidas, id_administrador, id_comentario, id_categoria) VALUES
(1, '2024-05-06', 5, 500, 2, 1, 2),
(2, '2023-02-05', 30, 400, 2, 2, 4);

-- Inserção das categorias das noticias --
--

INSERT INTO categoria (id_categoria, nome) VALUES
(1, 'Bovinos'),
(2, 'Suínos'),
(3, 'Aves'),
(4, 'Grãos'),
(5, 'Máquinario'),
(6, 'Inovações'),
(7, 'Floresta');

-- Estrutura da view entre o usuario e a noticia --
--

DROP VIEW IF EXISTS `view_usuario_noticia`;
CREATE TABLE IF NOT EXISTS `view_usuario_noticia` (
`id_usuario` bigint UNSIGNED
,`id_noticia` bigint UNSIGNED
,`nome_usuario` VARCHAR(255)
,`data_publicacao` DATE
,`qtd_comentario` INT
,`qtd_curtidas` INT
, `id_categoria` bigint UNSIGNED
);


ALTER TABLE comentario
  ADD CONSTRAINT usuario_c1 FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT noticia_c1 FOREIGN KEY (id_noticia) REFERENCES noticia (id_noticia) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE noticia
  ADD CONSTRAINT administrador_c1 FOREIGN KEY (id_administrador) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT comentario_c1 FOREIGN KEY (id_comentario) REFERENCES comentario (id_comentario) ON DELETE CASCADE ON UPDATE CASCADE;
