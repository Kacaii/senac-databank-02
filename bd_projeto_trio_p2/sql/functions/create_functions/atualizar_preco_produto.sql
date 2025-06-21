USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE FUNCTION atualizar_preco_produto(p_id INTEGER, p_novo_preco DECIMAL(10, 2)) RETURNS BOOLEAN DETERMINISTIC
BEGIN

DECLARE
rows_affected INTEGER;

UPDATE
  Produto
SET
  preco = p_novo_preco
WHERE
  id = p_id;

SET
  rows_affected = ROW_COUNT();

RETURN rows_affected > 0;

END $$
DELIMITER ;

COMMIT;

-- drop function atualizar_preco_produto;
