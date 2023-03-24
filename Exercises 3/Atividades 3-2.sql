/*
2º - Criar uma tabela para Cadastro do País com os Seguintes Campos: (1.0)
  ---> Código do País do Tipo texto para armazenar uma sigla do País. Ex.: BRA, Esse campo deverá ser a Chave Primária.
  ---> Nome - Campo de Texto;
  ---> DDI 
  
- Campo de Texto;
  ---> Data de Cadastro - Campo Data e Hora com a Data Atual como Padrão;

- Ao final da Criação da Tabela, deverá se cadastrar o país Brasil, com seus respectivos dados.
*/

CREATE TABLE HACARLOS.PAIS (
	ID_PAIS VARCHAR2(3) NOT NULL,
	NOME VARCHAR2(60) NOT NULL,
	DDI NUMBER(5) NOT NULL,
	DT_CADASTRO TIMESTAMP DEFAULT SYSDATE,
	CONSTRAINT pk_pais PRIMARY KEY(ID_PAIS)
);

INSERT INTO HACARLOS.PAIS (
	ID_PAIS,
	NOME,
	DDI,
	DT_CADASTRO
) VALUES (
	'BRA',
	'BRASIL',
	55,
	SYSDATE
);

DROP TABLE HACARLOS.PAIS;