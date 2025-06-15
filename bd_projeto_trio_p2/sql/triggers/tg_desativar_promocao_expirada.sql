USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE TRIGGER desativar_promocao_expirada
BEFORE UPDATE ON Promocao
FOR EACH ROW
BEGIN
  IF OLD.ativo = TRUE AND NEW.data_fim IS NOT NULL AND NEW.data_fim < CURDATE() THEN
    SET NEW.ativo = FALSE;
  END IF;

END $$
DELIMITER ;

COMMIT;
