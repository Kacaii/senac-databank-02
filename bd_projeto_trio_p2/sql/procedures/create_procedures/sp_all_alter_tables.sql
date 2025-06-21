USE loja_de_roupas;

delimiter $$
CREATE PROCEDURE IF NOT EXISTS sp_all_alter_tables()
BEGIN
START TRANSACTION;

ALTER TABLE
cliente
ADD
COLUMN data_nascimento DATE;

ALTER TABLE
venda
ADD
COLUMN observacoes VARCHAR(255);

ALTER TABLE
venda
ADD
COLUMN codigo_rastreamento VARCHAR(50);

ALTER TABLE
produto
ADD
COLUMN material VARCHAR(50);

ALTER TABLE
funcionario
ADD
COLUMN cpf TEXT;

ALTER TABLE
fornecedor
ADD
COLUMN cnpj TEXT;

ALTER TABLE
cliente
ADD
COLUMN limite_credito DECIMAL(10, 2) DEFAULT 0;

ALTER TABLE
produto
ADD
COLUMN peso DECIMAL(10, 3);

ALTER TABLE
produto
ADD
COLUMN ativo BOOLEAN DEFAULT 1;

COMMIT;

END $$
delimiter ;
