USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE FUNCTION calcular_total_venda(p_id_venda INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
DECLARE
v_total DECIMAL(10, 2);

SELECT
  SUM(preco_unitario * quantidade) INTO v_total
FROM
  Item_Venda
WHERE
  id_venda = p_id_venda;

RETURN COALESCE(v_total, 0);

END $$
DELIMITER ;

COMMIT;

-- drop function calcular_total_venda;
