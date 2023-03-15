/*
1º - Criar uma relatório que retorne:
 - Cod. do Produto,
 - Descrição do Produto
 - Classe do Produto
 - Quantidade Pedida
 - Curva de Compra
      > Quantidade acima de 10 (Curva A)
      > Quantidade Entre 5 e 10 (Curva B)
      > Quantidade Abaixo de 5 (Curva C)
 - Data da Ultima Compra.


Ordem do Relatório: Coluna Descrição do Produto em Ordem Crescente.
Resultado esperado na imagem [AULA_2_IMG_001.png]
*/

SELECT 
	p.ID_PRODUTO,
	p.DESCRICAO,
	cp.DESCRICAO Classe,
	SUM(ip.QTD_ITEM) Quantidade,
	CASE
		WHEN SUM(ip.QTD_ITEM) > 10 THEN 'A'
		WHEN SUM(ip.QTD_ITEM) BETWEEN 5 AND 10 THEN 'B'
		ELSE 'C'
	END Curva,
	TO_CHAR(MAX(p2.DT_CRIACAO), 'DD/MM/YYYY') AS "DT_ULTIMA_COMPRA"
FROM 
	HACARLOS.PRODUTO p
INNER JOIN HACARLOS.CLASSE_PRODUTO cp 
	ON
	p.ID_CLASSE = cp.ID_CLASSE
INNER JOIN HACARLOS.ITEM_PEDIDO ip 
	ON
	p.ID_PRODUTO = ip.ID_PRODUTO
INNER JOIN HACARLOS.PEDIDO p2 
	ON
	ip.ID_PEDIDO = p2.ID_PEDIDO
GROUP BY 
	p.ID_PRODUTO,
	p.DESCRICAO,
	cp.DESCRICAO
ORDER BY
	p.DESCRICAO;