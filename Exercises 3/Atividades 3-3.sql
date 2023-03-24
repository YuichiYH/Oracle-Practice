/*
3º - Criar uma Tabela para Cadastro de Estados com os Seguintes campos (1.5):
  --->  UF - Campo do Tipo Texto, de tamanho 3 para armazenar o UF. Ex.: SP, esse campo deverá ser a chave primária.
  ---> Código do País - Chave Estrangeira da tabela de Pais;
  ---> Nome - Campo Texto;
  ---> Data de Cadastro - Campo Data e Hora com a Data Atual como Padrão;


- Ao final da Criação, Alimentar a Tabela com os Estados do arquivo Excel Anexo.
IMPORTANTE - Lembre-se que cada estado deverá ser cadastrado com seu respectivo País;
*/

CREATE TABLE HACARLOS.ESTADO (
	UF VARCHAR(3) NOT NULL,
	COD_PAIS VARCHAR(3) NOT NULL,
	NOME VARCHAR(255) NOT NULL,
	DT_CADASTRO TIMESTAMP DEFAULT SYSDATE,
	CONSTRAINT pk_estado PRIMARY KEY (UF),
	CONSTRAINT fk_estado_pais FOREIGN KEY (COD_PAIS) REFERENCES HACARLOS.PAIS(ID_PAIS) 
);

/* Eu não consegui achar um jeito mais facil de importar o arquivo Excel para o Oracle, 
 * fora a ferramenta de import, acho que a ferramenta import é a mais valida para isso
 * porém acho que é "trapacear" usar essa ferramenta nesse exercicio
 * 
 * Então eu fiz um codigo no python para fazer os into values para não precisar ficar 
 * digitando cada linha manualmente
 * 
 * nota: enquanto escrevia isso percebi que falar em trapacear e usar um pograma python 
 * para fazer todo trabalho não são diferentes mas você entendeu meu ponto kkkkkk
*/
INSERT ALL
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('AC', 'BRA', 'Acre', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('AL', 'BRA', 'Alagoas', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('AP', 'BRA', 'Amapá', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('AM', 'BRA', 'Amazonas', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('BA', 'BRA', 'Bahia', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('CE', 'BRA', 'Ceará', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('DF', 'BRA', 'Distrito Federal', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('ES', 'BRA', 'Espírito Santo', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('GO', 'BRA', 'Goiás', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('MA', 'BRA', 'Maranhão', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('MT', 'BRA', 'Mato Grosso', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('MS', 'BRA', 'Mato Grosso do Sul', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('MG', 'BRA', 'Minas Gerais', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('PA', 'BRA', 'Pará', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('PB', 'BRA', 'Paraíba', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('PR', 'BRA', 'Paraná', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('PE', 'BRA', 'Pernambuco', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('PI', 'BRA', 'Piauí', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('RJ', 'BRA', 'Rio de Janeiro', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('RN', 'BRA', 'Rio Grande do Norte', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('RS', 'BRA', 'Rio Grande do Sul', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('RO', 'BRA', 'Rondônia', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('RR', 'BRA', 'Roraima', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('SC', 'BRA', 'Santa Catarina', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('SP', 'BRA', 'São Paulo', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('SE', 'BRA', 'Sergipe', SYSDATE)
	INTO HACARLOS.ESTADO (UF, COD_PAIS, NOME, DT_CADASTRO) VALUES ('TO', 'BRA', 'Tocantins', SYSDATE)
SELECT 1 FROM DUAL;