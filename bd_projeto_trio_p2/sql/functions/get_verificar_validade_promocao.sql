USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE FUNCTION verificar_validade_promocao(p_id_promocao INT) RETURNS BOOLEAN READS SQL DATA
BEGIN
DECLARE
v_valida BOOLEAN;

SELECT
  ativo = TRUE
  AND CURDATE() BETWEEN data_inicio AND IFNULL(data_fim, CURDATE()) INTO v_valida
FROM
  Promocao
WHERE
  id = p_id_promocao;

RETURN IFNULL(v_valida, FALSE);

END $$
DELIMITER ;

COMMIT;

-- drop function verificar_validade_promocao;
