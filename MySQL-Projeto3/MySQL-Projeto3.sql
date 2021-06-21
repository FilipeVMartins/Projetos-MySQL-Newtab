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

#Criar a tabela “postsEncontrados” com os seguintes campos: (Id, conteúdo de texto do post, url do post, Data/Hora de cadastro).
CREATE TABLE postsEncontrados (
	id INT NOT NULL AUTO_INCREMENT,
	id_pesquisa INT NOT NULL,
	id_twitterUser INT NOT NULL,
  	post_text VARCHAR(350),
  	post_url VARCHAR(200),
    dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
  	PRIMARY KEY (id),
    FOREIGN KEY (id_pesquisa)
        REFERENCES pesquisas(id)
        ON DELETE CASCADE,
    FOREIGN KEY (id_twitterUser)
        REFERENCES twitterUsers(id)
        ON DELETE CASCADE	  
);

#Criar a tabela “imagensEncontradas” com os seguintes campos: (Id, conteúdo de texto postado junto com a imagem, url do post, url da imagem postada, Data/Hora de cadastro).
CREATE TABLE imagensEncontradas (
	id INT NOT NULL AUTO_INCREMENT,
	id_pesquisa INT NOT NULL,
	id_twitterUser INT NOT NULL,
  	post_text VARCHAR(350),
  	post_url VARCHAR(200),
  	posted_image_url VARCHAR(200),
    dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
  	PRIMARY KEY (id),
    FOREIGN KEY (id_pesquisa)
        REFERENCES pesquisas(id)
        ON DELETE CASCADE,
    FOREIGN KEY (id_twitterUser)
        REFERENCES twitterUsers(id)
        ON DELETE CASCADE		  
);

#Criar a tabela “twitterUsers“ com os seguintes campos: (Id, nome, username, url da imagem de perfil, Data/Hora de cadastro).
CREATE TABLE “twitterUsers“ (
	id INT NOT NULL AUTO_INCREMENT,
  	name VARCHAR(150),
  	username VARCHAR(50),
  	profile_image_url VARCHAR(200),
    dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

#Criar uma query que busque a existência de um registro na tabela “twitterUsers“ pelo campo username
select * from “twitterUsers“ where username = "@twitterTestUser";

#Criar uma query que insira um novo registro na tabela "twitterTestUser" caso nenhum registro com o username pesquisado tenha sido encontrado.
INSERT INTO twitterTestUser (name, username, profile_image_url)
VALUES ('nomeA', '@twitterTestUser', 'imageUrl');

#Criar uma query que insira um novo registro na tabela “postsEncontrados”.
INSERT INTO twitterTestUser (post_text, post_url)
VALUES ('Lorem ipsum...', 'postUrl');

#Criar uma query que insira um novo registro na tabela “imagensEncontradas”.
INSERT INTO twitterTestUser (post_text, post_url, posted_image_url)
VALUES ('Lorem ipsum...', 'postUrl', 'postedImageUrl');


#Criar uma query que retorne todas as imagens encontradas em todas as pesquisas realizadas anteriormente por determinada hashtag, onde os posts mais recentes serão exibidos primeiro.
select * 
from 
	imagensEncontradas
	inner join pesquisas on pesquisas.id = imagensEncontradas.id_pesquisa
where pesquisas.Hashtag LIKE "%SearchedHashTag%"
order by postsEncontrados.dt_cadastro desc;


#Criar uma query que retorne todos os posts de um determinado usuário do twitter encontrados nas pesquisas.
select * 
from 
	postsEncontrados
	inner join twitterUsers on twitterUsers.id = postsEncontrados.id_twitterUser
where postsEncontrados.username = "@twitterTestUser"
order by postsEncontrados.dt_cadastro desc;

