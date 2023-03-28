/*
1 - Criar uma Consulta usando Funções.
Tabela: Clientes: 
Campos:
Id do Cliente;
Nome;
Tempo de Cliente Em Anos¹ - (Função - FUNCTION - que deve receber como parâmetro a Data de 
Cadastro e retornar um campo numérico);
Se a data INICIAL for MAIOR QUE a data FINAL, função não deverá realizar o calculo e retornar
apenas 0  (Zero).
*/

CREATE OR REPLACE FUNCTION func_time_by_register (rgt_date TIMESTAMP)
	RETURN NUMBER 
	IS 
		time_between NUMBER;
	BEGIN 
		IF rgt_date > sysdate THEN
			RETURN 0;
		END IF;
		time_between := TRUNC(MONTHS_BETWEEN(SYSDATE, rgt_date)/12);
		RETURN time_between;
		
	END func_time_by_register;
	
SELECT 
	ID_CLIENTE ,
	NOME ,
	func_time_by_register(DT_CADASTRO)
FROM HACARLOS.CLIENTE c ;