USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE TRIGGER definir_data_entrada_estoque
BEFORE INSERT ON Estoque
FOR EACH ROW
BEGIN
  SET NEW.data_entrada = CURDATE();

END $$
DELIMITER ;

COMMIT;
