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

