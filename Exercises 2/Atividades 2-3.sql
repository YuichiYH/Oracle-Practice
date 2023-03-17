/*
3º - Incluir Pedidos para Cada um dos Clientes. Os pedidos devem conter: 
 - Uma Observação diferente para cada pedido;
 - Os Pedidos devem conter, ao menos, dois itens de pedido cadastrado.
 - O Valor Total do Pedido deve conter a Soma do Total dos Itens do Pedido.
*/

-- Cria primeiro pedido
/* NOTA: tentei utilizar insert all em vez de vários insert 
 * porem não consegui entender como inserir uma chave primeria 
 * no momento, continuarei estudando para aprender se é possivel 
 * utilizar o insert all nesse caso
 * 
 * NOTA 2: tentei tambem utilizar o update no VL_TOTAL porém
 * não consegui descobrir como pegar somente as entradas da tabela
 * ITEM_PEDIDO que correspondem com o ID_PEDIDO da tabela PEDIDO
*/

-- primeiro pedido
INSERT INTO HACARLOS.PEDIDO (
	ID_PEDIDO,
	ID_CLIENTE,
	VL_TOTAL ,
	OBSERVACAO ,
	DT_CRIACAO ,
	DT_FINALIZACAO ,
	SN_SITUACAO )
 VALUES (
 	5,
 	9,
 	0,
	'test 1',
	SYSDATE ,
	NULL,
	'I'
 );

INSERT INTO ITEM_PEDIDO (
	ID_PEDIDO,
	SEQ_ITEM ,
	ID_PRODUTO ,
	QTD_ITEM ,
	VL_UNITARIO ,
	VL_TOTAL )
SELECT
	5 ID_PEDIDO,
	1 SEQ_ITEM ,
	p.ID_PRODUTO ID_PRODUTO ,
	10 QTD_ITEM ,
	p.VL_UNITARIO VL_UNITARIO ,
	(p.VL_UNITARIO * 10) VL_TOTAL 
FROM
	HACARLOS.PRODUTO p 
WHERE p.ID_PRODUTO = 6;

INSERT INTO ITEM_PEDIDO (
	ID_PEDIDO,
	SEQ_ITEM ,
	ID_PRODUTO ,
	QTD_ITEM ,
	VL_UNITARIO ,
	VL_TOTAL )
SELECT
	5 ID_PEDIDO,
	2 SEQ_ITEM ,
	p.ID_PRODUTO ID_PRODUTO ,
	12 QTD_ITEM ,
	p.VL_UNITARIO VL_UNITARIO ,
	(p.VL_UNITARIO * 12) VL_TOTAL 
FROM
	HACARLOS.PRODUTO p 
WHERE p.ID_PRODUTO = 7;

UPDATE HACARLOS.PEDIDO 
SET VL_TOTAL = (SELECT
	CASE
		WHEN sum(ip.VL_TOTAL) IS NULL THEN 0
		ELSE sum(ip.VL_TOTAL)
	END
FROM
	HACARLOS.ITEM_PEDIDO ip
WHERE
	ip.ID_PEDIDO = 5
)
WHERE ID_PEDIDO = 5;


-- segundo pedido
INSERT INTO HACARLOS.PEDIDO (
	ID_PEDIDO,
	ID_CLIENTE,
	VL_TOTAL ,
	OBSERVACAO ,
	DT_CRIACAO ,
	DT_FINALIZACAO ,
	SN_SITUACAO )
 VALUES (
 	6,
 	11,
 	0,
	'test 2',
	SYSDATE ,
	SYSDATE ,
	'I'
 );

INSERT INTO ITEM_PEDIDO (
	ID_PEDIDO,
	SEQ_ITEM ,
	ID_PRODUTO ,
	QTD_ITEM ,
	VL_UNITARIO ,
	VL_TOTAL )
SELECT
	6 ID_PEDIDO,
	1 SEQ_ITEM ,
	p.ID_PRODUTO ID_PRODUTO ,
	20 QTD_ITEM ,
	p.VL_UNITARIO VL_UNITARIO ,
	(p.VL_UNITARIO * 20) VL_TOTAL 
FROM
	HACARLOS.PRODUTO p 
WHERE p.ID_PRODUTO = 5;

INSERT INTO ITEM_PEDIDO (
	ID_PEDIDO,
	SEQ_ITEM ,
	ID_PRODUTO ,
	QTD_ITEM ,
	VL_UNITARIO ,
	VL_TOTAL )
SELECT
	6 ID_PEDIDO,
	2 SEQ_ITEM ,
	p.ID_PRODUTO ID_PRODUTO ,
	2 QTD_ITEM ,
	p.VL_UNITARIO VL_UNITARIO ,
	(p.VL_UNITARIO * 2) VL_TOTAL 
FROM
	HACARLOS.PRODUTO p 
WHERE p.ID_PRODUTO = 3;

UPDATE HACARLOS.PEDIDO 
SET VL_TOTAL = (SELECT
	CASE
		WHEN sum(ip.VL_TOTAL) IS NULL THEN 0
		ELSE sum(ip.VL_TOTAL)
	END
FROM
	HACARLOS.ITEM_PEDIDO ip
WHERE
	ip.ID_PEDIDO = 6
)
WHERE ID_PEDIDO = 6;

-- terceiro pedido
 INSERT INTO HACARLOS.PEDIDO (
	ID_PEDIDO,
	ID_CLIENTE,
	VL_TOTAL ,
	OBSERVACAO ,
	DT_CRIACAO ,
	DT_FINALIZACAO ,
	SN_SITUACAO )
 VALUES (
 	7,
 	9,
 	0,
	'test 3',
	SYSDATE ,
	NULL,
	'I'
 );

INSERT INTO ITEM_PEDIDO (
	ID_PEDIDO,
	SEQ_ITEM ,
	ID_PRODUTO ,
	QTD_ITEM ,
	VL_UNITARIO ,
	VL_TOTAL )
SELECT
	7 ID_PEDIDO,
	1 SEQ_ITEM ,
	p.ID_PRODUTO ID_PRODUTO ,
	1 QTD_ITEM ,
	p.VL_UNITARIO VL_UNITARIO ,
	(p.VL_UNITARIO * 1) VL_TOTAL 
FROM
	HACARLOS.PRODUTO p 
WHERE p.ID_PRODUTO = 9;
 
INSERT INTO ITEM_PEDIDO (
	ID_PEDIDO,
	SEQ_ITEM ,
	ID_PRODUTO ,
	QTD_ITEM ,
	VL_UNITARIO ,
	VL_TOTAL )
SELECT
	7 ID_PEDIDO,
	2 SEQ_ITEM ,
	p.ID_PRODUTO ID_PRODUTO ,
	7 QTD_ITEM ,
	p.VL_UNITARIO VL_UNITARIO ,
	(p.VL_UNITARIO * 1) VL_TOTAL 
FROM
	HACARLOS.PRODUTO p 
WHERE p.ID_PRODUTO = 4;

UPDATE HACARLOS.PEDIDO 
SET VL_TOTAL = (SELECT
	CASE
		WHEN sum(ip.VL_TOTAL) IS NULL THEN 0
		ELSE sum(ip.VL_TOTAL)
	END
FROM
	HACARLOS.ITEM_PEDIDO ip
WHERE
	ip.ID_PEDIDO = 7
)
WHERE ID_PEDIDO = 7;