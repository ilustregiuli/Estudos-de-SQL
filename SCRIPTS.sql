CREATE DATABASE PROJETO;

CREATE TABLE CLIENTE (
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDEREÇO VARCHAR(100)
);

INSERT INTO CLIENTE(NOME, SEXO, CPF, TELEFONE,ENDEREÇO) VALUES('OFELIA CARDOSO','F',1111111,'51-99335569',
'RUA JAPÃO, 32'), ('MARIA DA GRAÇA XUXA MENESTREL','F', 222222222,'54-9878253', 'SANTA CLARA DO SUL - RS');

INSERT INTO CLIENTE VALUES ('JOSE CARDOSO', 'M', NULL, 12345678, '22345678', 'RUA ARABIA'), ('REGINA DUARTA', 'F',
'REG@GMAIL.COM', 87654321, '8973-7894', 'RUA DOS ALPES, 34');

SELECT NOME, SEXO, CPF, SITUAÇÃO AS APROVADO FROM CLIENTE;

SELECT NOME, ENDEREÇO, CPF FROM CLIENTE WHERE ENDEREÇO LIKE = 'RS';

ALTER TABLE CLIENTE 


------------ Exercício Livraria -------------------------

CREATE DATABASE Livraria;
CREATE TABLE LIVRO (
	NOME_DO_LIVRO VARCHAR(30),
	NOME_DO_AUTOR VARCHAR(30),
	SEXO_AUTOR CHAR(1),
	PAGINAS INT(5),
	NOME_EDITORA VARCHAR(30),
	VALOR_LIVRO FLOAT(5,2),
	UF_EDITORA CHAR(2),
	ANO_PUBLICACAO CHAR(4)
);

INSERT INTO LIVRO (NOME_DO_LIVRO, NOME_DO_AUTOR, SEXO_AUTOR, PAGINAS, NOME_EDITORA,
VALOR_LIVRO, UF_EDITORA, ANO_PUBLICACAO) VALUES ('RECEITAS CASEIRAS', 'CELIA TAVARES', 'F',
210, 'ATLAS', 45.00, 'RJ', '2008'), ('PESSOAS EFETIVAS', 'EDUARDO SANTOS', 'M', 390, 'BETA',
78.99, 'RJ', '2018'), ('HABITOS SAUDAVEIS', 'EDUARDO SANTOS', 'M', 630, 'BETA', 150.98, 'RJ',
'2019'), ('A CASA MARROM', 'HERMES MACEDO', 'M', 250, 'BUBBA', 60.00, 'MG', '2016'), 
('ESTACIO QUERIDO', 'GERALDO FRANCISCO', 'M', 310, 'INSIGNA', 100.00, 'ES', '2015'),
('PRA SEMPRE AMIGAS', 'LEDA SILVA', 'F', 510, 'INSIGNA', 78.98, 'ES', '2011'), 
('COPAS INESQUECIVEIS', 'MARCO ALCANTARA', 'M', 200, 'LARSON', 130.98, 'RS', '2018'),
('O PODER DA MENTE', 'CLARA MAFRA', 'F', 120, 'CONTINENTAL', 56.58, 'RS', '2017');

1) SELECT * FROM LIVRO;
2) SELECT NOME_DO_LIVRO AS 'LIVRO', NOME_EDITORA AS 'EDITORA' FROM LIVRO;
3) SELECT NOME_DO_LIVRO AS 'LIVRO', UF_EDITORA AS 'UF' FROM LIVRO WHERE SEXO_AUTOR = 'M';
4) SELECT NOME_DO_LIVRO AS 'LIVRO', PAGINAS FROM LIVRO WHERE SEXO_AUTOR = 'F';
5) SELECT VALOR_LIVRO, UF_EDITORA FROM LIVRO WHERE UF_EDITORA = 'SP';
6) SELECT NOME_DO_AUTOR AS 'AUTOR', SEXO_AUTOR AS 'SEXO' FROM LIVRO WHERE UF_EDITORA = 'SP' OR UF_EDITORA =
'RJ' AND SEXO_AUTOR = 'M';



SELECT nome, sexo, endereço FROM CLIENTE
where 
sexo = 'M' or endereço like 'rua%';

--------------------------------------------------------------------------------------------------

Exercício sobre performance

1) Trazer os funcionarios que trabalham nos departamentos "Filmes" OU "Roupas";

Verificando a quantidade de registros em cada departamento:

SELECT departamento, count(*) FROM funcionarios
group by departamento
order by 1;

Filmes -> 21
Roupas -> 53

No "OU", colocar a primeira condição como a mais provável:

SELECT idFuncionario as 'ID', nome as 'Funcionario', departamento as 'DEPT.' FROM funcionarios
where
departamento = 'Roupas'
OR 
departamento = 'Filmes';

OBS: cada "stament" deve ser explícito, inteiro... não "aproveitar" parte da outra condição.
EX:

where
departamento = 'Roupas' OR 'Filmes'; // isso não funciona :(

2) O gestor de marketing pediu a lista de funcionarias que trabalham no departamento filmes ou lar. Ele
precisa enviar um email para os colaboradoras desses dois setores.

Verificando a quantidade de registros onde os funcionarios são mulheres:

SELECT count(*), sexo
FROM funcionarios
group by sexo;

resultado: 
491 Feminino
484 Masculino

Verificando a quantidade de registros onde tem os departamentos Lar ou Filmes

SELECT count(*), departamento
FROM funcionarios
group by departamento;

resultado:
Lar -> 52
Filmes -> 21


Pegar então nome e email das colaboradoras:

SELECT nome, departamento, sexo, email
FROM funcionarios
where
(departamento = 'Filmes'
 OR
departamento = 'Lar')
AND
sexo = 'Feminino';


3) Traga os funcionarios do sexo masculino ou funcionarios que trabalham no setor jardim.

SELECT sexo, count(*) FROM funcionarios
WHERE
sexo = 'Feminino'
group by sexo;

SELECT departamento, count(*) FROM funcionarios
WHERE
departamento = 'Jardim'
group by departamento;


SELECT nome as 'Funcionario', departamento as 'DEPT.', sexo FROM funcionarios
WHERE
sexo = 'Masculino'
OR
departamento = 'Jardim';

SELECT * from CLIENTE 
WHERE
email is null;

update CLIENTE
set nome = 'regina duarte'
where nome = 'regina DUARTA';

delete from CLIENTE
where nome = 'JOSE CARDOSO';	

INSERT INTO cliente VALUES('Lucinha Lins','F','atrizdesegunda@bol.com',00012369812,'(11) 2345678',
'Avenida dos Rosários, Vai Vai, Rio de Janeiro - RJ');

------------------ exercício sobre Primeira Forma Normal ----------------------

CREATE DATABASE comercio;  --- criando banco

CREATE TABLE cliente(

	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE

);

CREATE TABLE endereco(

	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL

);

CREATE TABLE telefone(

	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES','COM','CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL

);

CONCEITOS:

***************************************************************************************************
Chave Estrangeira: é uma chave primária de outra tabela usada para fazer referência entre registros.

Fazendo uma "CONSTRAINT" (regra) para criar uma Foreign Key:

CREATE TABLE endereco(

	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)

);

CREATE TABLE telefone (

	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES','COM','CEL') NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)

);

CREATE TABLE CLIENTE (

	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE

);

INSERT INTO CLIENTE VALUES(
	NULL, 'Giuli Gilberto Ilustre','M','ilustre.giuli@gmail.com','222.333.111-09'
);
INSERT INTO CLIENTE VALUES(
	NULL, 'Carlos Roberto','M','roberto.carlos@hotmail.com','900.105.320-18'
);
INSERT INTO CLIENTE VALUES(
	NULL, 'Maria da Graça Xuxa','F','xuxa@planetaputa.com','280.100.015-00'
);
INSERT INTO CLIENTE VALUES(
	NULL, 'John Lennon','M','lennon.beatles@beatles.com.uk','123.456.789-11'
);
INSERT INTO CLIENTE VALUES(
	NULL, 'Kurt Cobain','M','kurdt@nirvanabrasil.com','771.779.230-28'
);
INSERT INTO CLIENTE VALUES(
	NULL, 'Janis Joplin','F','joplin@mercedez.com.de','001.002.336-29'
);
INSERT INTO CLIENTE VALUES(
	NULL, 'Carla Perez','F','carla.perez@boquinhadagarrafa.com.br','998.032.569-99'
);
INSERT INTO CLIENTE VALUES(
	NULL, 'Carlinhos Aguiar','M','carlinhos@topatudo.com','199.171.237-46'
);
INSERT INTO CLIENTE VALUES(
	NULL, 'Gibi da Silva','M','NULL','087.998.114-27'
);
INSERT INTO CLIENTE VALUES(
	NULL, 'Ivo Holanda','M','ivo@pegadinhas.com.br','744.560.369-12'
);


mysql> select * from cliente;
+-----------+------------------------+------+--------------------------------------+----------------+
| IDCLIENTE | NOME                   | SEXO | EMAIL                                | CPF            |
+-----------+------------------------+------+--------------------------------------+----------------+
|         1 | Giuli Gilberto Ilustre | M    | ilustre.giuli@gmail.com              | 818.405.780-68 |
|         2 | Carlos Roberto         | M    | roberto.carlos@hotmail.com           | 900.105.320-18 |
|         3 | Maria da Graça Xuxa    | F    | xuxa@planetaputa.com                 | 280.100.015-00 |
|         4 | John Lennon            | M    | lennon.beatles@beatles.com.uk        | 123.456.789-11 |
|         5 | Kurt Cobain            | M    | kurdt@nirvanabrasil.com              | 771.779.230-28 |
|         6 | Janis Joplin           | F    | joplin@mercedez.com.de               | 001.002.336-29 |
|         7 | Carla Perez            | F    | carla.perez@boquinhadagarrafa.com.br | 998.032.569-99 |
|         8 | Carlinhos Aguiar       | M    | carlinhos@topatudo.com               | 199.171.237-46 |
|         9 | Gibi da Silva          | M    | NULL                                 | 087.998.114-27 |
|        10 | Ivo Holanda            | M    | ivo@pegadinhas.com.br                | 744.560.369-12 |
+-----------+------------------------+------+--------------------------------------+----------------+



