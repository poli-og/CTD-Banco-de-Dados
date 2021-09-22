-- MESA 03 - 30/08/2021
-- Anderson Bueno
-- Lays Maiara
-- Marcos Rezende
-- Poliana Gomes
-- Luana Borges
-- Mauricio Gregory

CREATE DATABASE dhtube;

USE dhtube;

CREATE TABLE avatar(
	id  INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    urlimagem VARCHAR(45)
);


CREATE TABLE pais	(
	id  INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

CREATE TABLE usuario	(
	id  INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    senha VARCHAR(45),
    email VARCHAR(45),
    cep  VARCHAR(45),
    dataNascimento DATETIME,
    idPais INT,
    idAvatar INT,
	FOREIGN KEY (idPais) REFERENCES pais(id),
    FOREIGN KEY (idAvatar) REFERENCES avatar(id)
);

CREATE TABLE playlist	(
	id  INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dataCriacao DATETIME,
    privado SMALLINT(6),
    idUsuario INT,
	FOREIGN KEY (idUsuario) REFERENCES usuario(id)
);

	
CREATE TABLE video	(
	id  INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    descricao TEXT,
    tamanho DOUBLE,
    nomeArquivo VARCHAR(100),
    duracao DOUBLE,
    imagem VARCHAR(100),
    qtdReproducoes INT,
    qtdLikes INT,
    qtdDeslikes INT,
    privado SMALLINT,
    dataPublicacao DATETIME,
    idUsuario INT,
	FOREIGN KEY (idUsuario) REFERENCES usuario(id)
);

CREATE TABLE playlist_video	(
	-- id  INT PRIMARY KEY AUTO_INCREMENT,
    idVideo INT,
    idPlaylits INT,
	FOREIGN KEY (idVideo) REFERENCES video(id),
    FOREIGN KEY (idPlaylits) REFERENCES playlist(id)
);

CREATE TABLE canal	(
	id  INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao TEXT,
    dataCriacao DATETIME,
    idUsuario INT,
	FOREIGN KEY (idUsuario) REFERENCES usuario(id)
);
