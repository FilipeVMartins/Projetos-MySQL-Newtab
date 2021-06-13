#Criar um banco de dados para o projeto 3.
create database mysql_projeto2;

use mysql_projeto2;

#Criar a tabela “usuarios” com os seguintes campos: (Id, Nome, Email, Senha, Data/Hora de cadastro, Data/Hora de modificação)
CREATE TABLE usuarios (
	id INT NOT NULL AUTO_INCREMENT,
  	nome VARCHAR(100),
  	email VARCHAR(50),
    senha VARCHAR(50),
    dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    dt_alterado DATETIME DEFAULT CURRENT_TIMESTAMP,
  	PRIMARY KEY (id)
);

#Criar uma query que insira um novo registro na tabela "usuarios"
INSERT INTO usuarios (nome, email, senha)
VALUES ('nomeA', 'emailA@email.com', PASSWORD('SenhaA'));

#Criar uma query que retorne um registro específico da tabela "usuarios" por email.
SELECT * from usuarios where email = 'emailA@email.com';

#Criar uma query que atualize um registro específico da tabela "usuarios" por id.
UPDATE usuarios
SET nome='nomeAA', email='emailAA@email.com', senha=PASSWORD('SenhaAA'), dt_alterado = CURRENT_TIMESTAMP
WHERE id='1';

#Criar a tabela “pesquisas” com os seguintes campos: (Id, Hashtag, Data/Hora de cadastro).
CREATE TABLE pesquisas (
	id INT NOT NULL AUTO_INCREMENT,
  	Hashtag VARCHAR(100),
    dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
  	PRIMARY KEY (id)
);

#Criar uma query que retorne todos os registros da tabela "pesquisas" em ordem decrescente de Data/Hora de cadastro.
SELECT * FROM pesquisas ORDER BY dt_cadastro DESC;

#Criar uma query que insira um novo registro na tabela "pesquisas"
INSERT INTO pesquisas (Hashtag)
VALUES ('HashtagA');