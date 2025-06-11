use loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE FUNCTION verificar_estoque(p_id_produto INT) RETURNS INT READS SQL DATA
BEGIN

DECLARE
v_quantidade INT;

SELECT
  SUM(quantidade) INTO v_quantidade
FROM
  Estoque
WHERE
  id_produto = p_id_produto;

RETURN COALESCE(v_quantidade, 0);

END $$
DELIMITER ;

COMMIT;

-- drop function verificar_estoque;
