USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE FUNCTION get_quantidade_media_vendas_produto(p_id_produto INT) RETURNS DECIMAL(10, 2) READS SQL DATA
BEGIN
DECLARE
v_media DECIMAL(10, 2);

SELECT
  AVG(iv.quantidade) INTO v_media
FROM
  Item_Venda iv
WHERE
  iv.id_produto = p_id_produto;

RETURN COALESCE(v_media, 0);

END $$
DELIMITER ;

COMMIT;

-- drop function get_quantidade_media_vendas_produto;
