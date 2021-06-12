
#Criar um banco de dados para o projeto 1.
create database mysql_projeto1;

use mysql_projeto1;

#Criar a tabela “transacao” com os seguintes campos: (Id, Tipo, Nome, Valor, Data de cadastro).
CREATE TABLE transacao (
	id INT NOT NULL AUTO_INCREMENT,
  	tipo VARCHAR(6), # String 6 chars max 'venda'(5) or 'compra'(6)
  	nome VARCHAR(128), # String 128 chars max
  	valor DECIMAL(17, 2), # the max digits allowed from javascript float = 17 ; the required decimal digits = 2;
    dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP, # DEFAULT because the date is defined upon insert.
  	PRIMARY KEY (id)
);

#Criar uma query que insira uma transação com os campos tipo, nome, valor e data de cadastro.
INSERT INTO transacao (tipo, nome, valor)
VALUES ('venda', 'nome da transação1', 10.05); 
INSERT INTO transacao (tipo, nome, valor)
VALUES ('compra', 'nome da transação2', 110.05); 
INSERT INTO transacao (tipo, nome, valor)
VALUES ('venda', 'nome da transação3', 1210.05); 
INSERT INTO transacao (tipo, nome, valor)
VALUES ('compra', 'nome da transação4', 10750.05); 

#Criar uma query que retorne todas as transações cadastradas em ordem crescente da data de cadastro.
select * from transacao order by dt_cadastro asc;

#Criar uma query que retorne o saldo acumulado considerando todas as transações cadastradas.
select sum( if( tipo = 'venda', valor, -1*valor    )) as 'Saldo Acumulado' from transacao;

#Criar uma query que exclua todas as transações cadastradas.
delete from transacao;

drop table transacao;

