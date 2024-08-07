-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/
CREATE DATABASE tennis_table;
use tennis_table;

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
    FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);




insert into empresa (razao_social, cnpj) values ('Empresa 1', '00000000000000');
insert into aquario (descricao, fk_empresa) values ('Aquário de Estrela-do-mar', 1);

/*
comando para sql server - banco remoto - ambiente de produção
*/

CREATE TABLE empresa (
	id INT PRIMARY KEY IDENTITY(1,1),
	razao_social VARCHAR(50),
	cnpj CHAR(14)
);

CREATE TABLE usuario (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
	fk_empresa INT FOREIGN KEY REFERENCES empresa(id)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY IDENTITY(1,1),
	descricao VARCHAR(300),
	fk_empresa INT FOREIGN KEY REFERENCES empresa(id)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT FOREIGN KEY REFERENCES aquario(id)
);

insert into empresa (razao_social, cnpj) values ('Empresa 1', '00000000000000');

/*
comandos para criar usuário em banco de dados azure, sqlserver,
com permissão de insert + update + delete + select
*/

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
