#Criar um banco de dados para o projeto 2.
create database mysql_projeto2;

use mysql_projeto2;

#Criar a tabela “usuario” com os seguintes campos: (Id, Nome, Imagem, Nome de usuario, Data de cadastro)
CREATE TABLE usuario (
	id INT NOT NULL AUTO_INCREMENT,
  	nome VARCHAR(100),
  	imagem VARCHAR(200), # URL
  	username VARCHAR(15),
    dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
  	PRIMARY KEY (id)
);

#Criar a tabela “cartao” com os seguintes campos: (Id, Numero, Cvv, Data de expiracao, Valido, Data de cadastro).
CREATE TABLE cartao (
	id INT NOT NULL AUTO_INCREMENT,
	numero VARCHAR(16) UNIQUE,
	cvv VARCHAR(3),
	dt_expiracao DATETIME,
	valido BOOLEAN,
	dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

drop tables transacao, cartao;

#Criar a tabela “transacao” com os seguintes campos: (Id, Id_usuario, Id_cartao, Valor, Data de cadastro).
CREATE TABLE transacao (
	id INT NOT NULL AUTO_INCREMENT,
	id_usuario INT NOT NULL,
	id_cartao INT NOT NULL,
	valor DECIMAL(17, 2),
	dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
    FOREIGN KEY (id_usuario)
        REFERENCES usuario(id)
        ON DELETE CASCADE,
    FOREIGN KEY (id_cartao)
        REFERENCES cartao(id)
        ON DELETE CASCADE        
);

#Criar uma query que insira um usuário com os campos nome, imagem, nome de usuário e data de cadastro.
INSERT INTO usuario (nome, imagem, username)
VALUES ('nomeA', 'img/urlA', 'usernameA');
INSERT INTO usuario (nome, imagem, username)
VALUES ('nomeB', 'img/urlB', 'usernameB');

#Criar uma query que retorne todos os usuários cadastrados em ordem alfabética.
select * from usuario order by nome asc;

#Criar uma query que insira um cartão com os campos número, cvv, data de expiração, válido e data de cadastro.
INSERT INTO cartao (numero, cvv, dt_expiracao, valido)
VALUES ('1111111111111111', '789', '2018-01-01', 1);
INSERT INTO cartao (numero, cvv, dt_expiracao, valido)
VALUES ('4111111111111234', '123', '2020-01-01', 0);

#Criar uma query que retorne apenas os cartões válidos em ordem crescente da data de cadastro.
select * from cartao where valido = true order by dt_cadastro asc;

#Criar uma query que insira uma transação com os campos id_usuario, id_cartao, valor e data de cadastro.
INSERT INTO transacao (id_usuario, id_cartao, valor)
VALUES (1, 7, 1450.05);
INSERT INTO transacao (id_usuario, id_cartao, valor)
VALUES (2, 8, 150.45);

#Criar uma query que retorne todas as transações cadastradas em ordem decrescente da data de cadastro, contendo os dados do usuário e cartão, não apenas seus IDs.
select * from transacao
inner join usuario on usuario.id = transacao.id_usuario
inner join cartao on cartao.id = transacao.id_cartao
order by transacao.dt_cadastro desc;





