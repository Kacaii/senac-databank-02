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
USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE FUNCTION get_calcular_total_venda(p_id_venda INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
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
use loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE FUNCTION get_verificar_estoque(p_id_produto INT) RETURNS INT READS SQL DATA
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
USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE FUNCTION get_verificar_validade_promocao(p_id_promocao INT) RETURNS BOOLEAN READS SQL DATA
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

RETURN COALESCE(v_valida, FALSE);

END $$
DELIMITER ;

COMMIT;

-- drop function verificar_validade_promocao;
