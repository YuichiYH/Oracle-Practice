/*
2 - Criar uma Procedure que imprima o Valor a Pagar com base nos Pedidos do Cliente;

Parâmetros: Id do Cliente, Data Inicial e Data Final.
Regra de Negócio:
 
A Procedure deverá receber o Código do Cliente (Numérico), uma Data Inicial (Data) e 
uma Data Final (Data).

Se a data final foi menor que a data inicial, o programa deverá imprimir: 
"Data final deve ser maior que data inicial."

Considerando que foram informados dados válidos, o sistema deverá realizar uma 
consulta² na tabela de Clientes, Fazendo Join com a Tabela de Pedidos e Itens de Pedidos, 
onde o id_cliente seja igual ao parâmetro informado para o Código do Cliente, e a dt_pedido 
esteja entre os parâmetros Data Inicial e Data Final. A query deverá, então, 
agrupar os demais campos e Somar o Valor Total dos Itens de Pedido.

Caso a consulta acima não retorne nenhum dado, o programa deverá tratar a exceção e imprimir 
o texto: "Cliente Inexistente ou Sem Pedidos".

Caso sejam encontrados dados, a procedure deverá imprimir:
- "[NOME DO CLIENTE], VALOR TOTAL A PAGAR R$ [VALOR TOTAL]";
*/

CREATE OR REPLACE PROCEDURE pr_check_value_to_pay(
	id IN NUMBER, 
	startdate IN TIMESTAMP, 
	finaldate IN TIMESTAMP
)
IS 
	CURSOR c_cliente_pedido_item is(
		SELECT
			c.NOME ,
			p.ID_PEDIDO,
			sum(ip.VL_TOTAL)
		FROM HACARLOS.CLIENTE c
		LEFT JOIN HACARLOS.PEDIDO p 
			ON c.ID_CLIENTE = p.ID_CLIENTE 
		LEFT JOIN HACARLOS.ITEM_PEDIDO ip 
			ON p.ID_PEDIDO  = ip.ID_PEDIDO
		WHERE c.ID_CLIENTE = id
		AND p.DT_CRIACAO BETWEEN startdate AND finaldate
		GROUP BY 
			c.NOME ,
			p.ID_PEDIDO 
	);
	name HACARLOS.CLIENTE.NOME%TYPE;
	id_pedido HACARLOS.PEDIDO.ID_PEDIDO%TYPE;
	value HACARLOS.ITEM_PEDIDO.VL_TOTAL%TYPE;
	
BEGIN 
	IF finaldate <= startdate THEN 
		dbms_output.put_line('Data final deve ser maior que data inicial.');
		RETURN;
	END IF;

	IF c_cliente_pedido_item%ISOPEN THEN
		CLOSE c_cliente_pedido_item;
	END IF;

	OPEN c_cliente_pedido_item;

	LOOP
		FETCH c_cliente_pedido_item INTO name, id_pedido, value;
		EXIT WHEN c_cliente_pedido_item%NOTFOUND;
		
		DBMS_OUTPUT.PUT_LINE(name || ', VALOR TOTAL A PAGAR R$ ' || value);
			
	END LOOP;

	IF value IS NULL then
		dbms_output.put_line('Cliente Inexistente ou Sem Pedidos');
	END IF;

	EXCEPTION
	WHEN OTHERS THEN
		dbms_output.put_line('erro interno');
	

END pr_check_value_to_pay;

-- test
/*
BEGIN
	HACARLOS.PR_CHECK_VALUE_TO_PAY(2, TIMESTAMP '1700-04-28 00:00:00.000', sysdate);
END;
*/