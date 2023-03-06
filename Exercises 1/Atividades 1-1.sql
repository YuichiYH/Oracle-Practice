/*
1º - Montar uma Query (consulta) na tabela de Clientes que retorne os seguintes campos: 
- Nome do Cliente: Sem acento e Caixa Alta;
- Nome do Fantasia: Sem acento e Caixa Alta;
- Cod. da Inscrição: Removendo os Pontos;
- Cod. do CGC ou CPF;
- Data do Cadastro: Formato DD/MM/YYYY

Condição: A query deve retornar somente os Clientes do tipo Pessoa Física (Tipo Pessoa = "F").
 */

SELECT
	TRANSLATE(UPPER(c.NOME), 'ÁÀÂÃÉÊÍÎÓÔÚÛ','AAAAEEIIOOUU') AS "NOME DO CLIENTE",
	TRANSLATE(UPPER(c.NOME_FANTASIA), 'ÁÀÂÃÉÊÍÎÓÔÚÛ','AAAAEEIIOOUU') AS "NOME DO FANTASIA",
	REPLACE(c.COD_INSCRICAO, '.', '') AS "COD. DA INSCRIÇÃO",
	c.COD_CGC_CPF AS "COD. DO CGC OU CPF"
FROM 
	HACARLOS.CLIENTE c
WHERE 
	c.TIPO_CLIENTE = 'F';