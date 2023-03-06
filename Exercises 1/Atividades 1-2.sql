/*
2º - Montar uma Query (consulta) na tabela de Produto que retorne os seguintes campos: 

- Descrição do Produto: Sem acento e Caixa Alta;
- O Valor Unitário do Produto: Com Máscara no Formato Brasileiro, separando decimal com Vírgula e Milhar com Ponto (Não precisa conter o RS).
- Incluir uma Coluna de Texto Livre com a informação: "VIDRARIA DE LABORATÓRIO".
- Incluir uma Coluna chamada "Competencia" que retorne O Ano e o Mês da data atual segundo a Mascara: YYYYMM.


Condição: A query deve retornar somente os Produtos cuja a classe seja "VIDRARIA DE LABORATÓRIO".
*/

SELECT
	TRANSLATE(UPPER(p.DESCRICAO), 'ÁÀÂÃÉÊÍÎÓÔÚÛ','AAAAEEIIOOUU') AS "DESCRIÇÃO DO PRODUTO",
	TO_CHAR(p.VL_UNITARIO,'FM999G990D99') AS "VALOR UNITARIO DO PRODUTO",
	'VIDRARIA DE LABORATÓRIO' AS "VIDRARIA DE LABORATÓRIO", --Nota: não seria melhor utilizar cp.DESCRICAO ?
	TO_CHAR(SYSDATE, 'YYYY/MM')  AS "COMPETENCIA"
FROM
	HACARLOS.PRODUTO p
	INNER JOIN HACARLOS.CLASSE_PRODUTO cp 
	ON p.ID_CLASSE = cp.ID_CLASSE
WHERE 
	cp.DESCRICAO = 'VIDRARIA DE LABORATÓRIO';