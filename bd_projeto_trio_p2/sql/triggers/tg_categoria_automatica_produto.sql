USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE TRIGGER categoria_automatica_produto
BEFORE INSERT ON Produto
FOR EACH ROW
BEGIN
  IF LOWER(NEW.descricao) LIKE '%camiseta%' THEN
    SET NEW.id_categoria = 1;
  END IF;

END $$
DELIMITER ;

COMMIT;
