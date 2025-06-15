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
