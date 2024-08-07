CREATE DATABASE tennis_table;
use tennis_table;
-- cada usuário pode ter apenas uma pontuação associada a ele e cada pontuação está diretamente vinculada a um único usuário.
-- Isso permite que várias respostas na tabela resposta sejam associadas a uma única pergunta na tabela pergunta.

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    email VARCHAR(50),
    senha VARCHAR(50)
);

CREATE TABLE dicas (
    idDicas INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    descricao VARCHAR(150),
    ativos char(3)
);


CREATE TABLE video (
    idVideo INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(300),
    texto varchar(300),
    ativo char(3),
    videoUrl varchar(300)
);

CREATE TABLE pergunta (
    idPergunta INT PRIMARY KEY AUTO_INCREMENT,
    pergunta varchar(150),
    ativa char(3)
);

CREATE TABLE resposta (
    idResposta INT PRIMARY KEY AUTO_INCREMENT,
    resposta varchar(150),
    ativa char(3),
    respostacerta char(3),
    idPergunta INT,
    FOREIGN KEY (idPergunta) REFERENCES pergunta(idPergunta)
);

CREATE TABLE pontuacao (
    idPontuacao INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario int,
    pontos int,
    FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);
select*from usuario;
