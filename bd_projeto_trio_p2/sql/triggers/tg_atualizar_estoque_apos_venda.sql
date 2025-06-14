USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE TRIGGER atualizar_estoque_apos_venda
AFTER INSERT ON Item_Venda
FOR EACH ROW
BEGIN
  UPDATE Estoque
  SET quantidade = quantidade - NEW.quantidade
  WHERE id_produto = NEW.id_produto
  ORDER BY data_entrada DESC
  LIMIT 1;

END $$
DELIMITER ;

COMMIT;
