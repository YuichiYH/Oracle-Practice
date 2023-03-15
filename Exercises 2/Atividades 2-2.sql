-- 2º - Realizar o Cadastro de 3 novos clientes na tabela de Clientes. --

INSERT INTO	HACARLOS.CLIENTE 
SELECT
	max(c.ID_CLIENTE) + 1,
	'Pessoa0',
	'Apelido0',
	'F',
	To_char(Sysdate),
	'854632589655',
	Sysdate,
	max(c.SN_ATIVO)
FROM
	HACARLOS.CLIENTE c ;

INSERT INTO	HACARLOS.CLIENTE (
	ID_CLIENTE,
	NOME,
	NOME_FANTASIA,
	TIPO_CLIENTE ,
	COD_INSCRICAO ,
	COD_CGC_CPF,
	DT_CADASTRO,
	SN_ATIVO 
)
VALUES(
	10,
	'Pessoa1',
	'Apelido1',
	'F',
	'1823-02-03',
	'84795832588',
	SYSDATE,
	'S' 
);

INSERT INTO	HACARLOS.CLIENTE (
	ID_CLIENTE,
	NOME,
	NOME_FANTASIA,
	TIPO_CLIENTE ,
	COD_INSCRICAO ,
	COD_CGC_CPF,
	DT_CADASTRO,
	SN_ATIVO 
)
VALUES(
	11,
	'Pessoa2',
	'Apelido2',
	'F',
	TO_CHAR(Sysdate),
	'55544433322',
	SYSDATE,
	'S' 
);
