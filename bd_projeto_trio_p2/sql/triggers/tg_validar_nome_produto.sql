USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE TRIGGER validar_nome_produto
BEFORE INSERT ON Produto
FOR EACH ROW
BEGIN
  IF TRIM(NEW.nome) = '' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'O nome do produto não pode ser vazio.';
  END IF;

END $$
DELIMITER ;

COMMIT;
