USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE FUNCTION adicionar_estoque(p_id_produto INTEGER, p_quantidade INTEGER) RETURNS BOOLEAN DETERMINISTIC
BEGIN

DECLARE
rows_affected INTEGER;

IF NOT EXISTS (
  SELECT
    1
  FROM
    Produto
  WHERE
    id = p_id_produto
) THEN RETURN FALSE;

END IF;

INSERT INTO
  Estoque (id_produto, data_entrada, quantidade)
VALUES
  (p_id_produto, CURDATE(), p_quantidade);

SET
  rows_affected = ROW_COUNT();

RETURN rows_affected > 0;

END $$
DELIMITER ;

COMMIT;

-- drop function adicionar_estoque;
