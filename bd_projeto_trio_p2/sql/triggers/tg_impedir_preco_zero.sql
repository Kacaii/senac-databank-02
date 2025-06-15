USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE TRIGGER impedir_preco_zero
BEFORE INSERT ON Produto
FOR EACH ROW
BEGIN
  IF NEW.preco <= 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Preço do produto deve ser maior que zero.';
  END IF;

END $$
DELIMITER ;

COMMIT;
