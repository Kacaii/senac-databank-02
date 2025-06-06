CREATE SCHEMA IF NOT EXISTS `loja_de_roupas`;
USE `loja_de_roupas`;

START TRANSACTION;

CREATE TABLE IF NOT EXISTS `Produto` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255),
  `preco` DECIMAL(10,2) NOT NULL,
  `tamanho` VARCHAR(255) NOT NULL,
  `cor` VARCHAR(255),
  `marca` VARCHAR(255),
  `id_fornecedor` INTEGER NOT NULL,
  `id_categoria` INTEGER NOT NULL,
  PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `Item_Venda` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `id_venda` INTEGER NOT NULL,
  `id_produto` INTEGER NOT NULL,
  `id_promocao` INTEGER,
  `preco_unitario` DECIMAL(10,2) NOT NULL,
  `quantidade` INTEGER NOT NULL,
  PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `Promocao` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255),
  `valor_desconto` DECIMAL(10,2),
  `ativo` BOOLEAN NOT NULL,
  `data_inicio` DATE NOT NULL,
  `data_fim` DATE,
  PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `Promocao_Produto` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `id_produto` INTEGER NOT NULL,
  `id_promocao` INTEGER NOT NULL,
  PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `Estoque` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `id_produto` INTEGER NOT NULL,
  `data_entrada` DATE NOT NULL,
  `data_saida` DATE,
  `quantidade` INTEGER NOT NULL,
  PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `Fornecedor` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `nome` VARCHAR(255) NOT NULL,
  `endereco` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(255),
  `email` VARCHAR(255),
  PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `Categoria` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `Venda` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `id_cliente` INTEGER NOT NULL,
  `id_funcionario` INTEGER NOT NULL,
  `id_forma_pagamento` INTEGER NOT NULL,
  `data_venda` DATE NOT NULL,
  PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `Cliente` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `nome` VARCHAR(255) NOT NULL,
  `endereco` VARCHAR(255),
  `telefone` VARCHAR(255),
  `email` VARCHAR(255),
  PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `Forma_Pagamento` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `Funcionario` (
  `id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
  `nome` VARCHAR(255) NOT NULL,
  `cargo` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(255),
  PRIMARY KEY(`id`)
);


ALTER TABLE `Item_Venda`
ADD FOREIGN KEY(`id_produto`) REFERENCES `Produto`(`id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `Item_Venda`
ADD FOREIGN KEY(`id_promocao`) REFERENCES `Promocao`(`id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `Promocao_Produto`
ADD FOREIGN KEY(`id_produto`) REFERENCES `Produto`(`id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `Promocao_Produto`
ADD FOREIGN KEY(`id_promocao`) REFERENCES `Promocao`(`id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `Produto`
ADD FOREIGN KEY(`id_fornecedor`) REFERENCES `Fornecedor`(`id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `Produto`
ADD FOREIGN KEY(`id_categoria`) REFERENCES `Categoria`(`id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `Item_Venda`
ADD FOREIGN KEY(`id_venda`) REFERENCES `Venda`(`id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `Venda`
ADD FOREIGN KEY(`id_cliente`) REFERENCES `Cliente`(`id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `Venda`
ADD FOREIGN KEY(`id_forma_pagamento`) REFERENCES `Forma_Pagamento`(`id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `Venda`
ADD FOREIGN KEY(`id_funcionario`) REFERENCES `Funcionario`(`id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `Estoque`
ADD FOREIGN KEY(`id_produto`) REFERENCES `Produto`(`id`)
ON UPDATE CASCADE ON DELETE CASCADE;


-- Views --
-- 1. View: Produtos com estoque baixo (quantidade < 20)
CREATE OR REPLACE VIEW vw_estoque_baixo AS
SELECT
    p.id,
    p.nome,
    p.marca,
    e.quantidade,
    p.preco
FROM produto AS p
LEFT JOIN estoque AS e ON p.id = e.id_produto
WHERE e.quantidade < 20
ORDER BY e.quantidade ASC;


-- 2. View: Vendas por cliente (total gasto)
CREATE OR REPLACE VIEW vw_vendas_por_cliente AS
SELECT
    c.id AS cliente_id,
    c.nome AS cliente,
    COUNT(v.id) AS total_compras,
    SUM(iv.quantidade * iv.preco_unitario) AS total_gasto
FROM cliente AS c
LEFT JOIN venda AS v ON c.id = v.id_cliente
LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
GROUP BY c.id, c.nome
ORDER BY total_gasto DESC;


-- 3. View: Produtos mais vendidos (ranking)
CREATE OR REPLACE VIEW vw_produtos_mais_vendidos AS
SELECT
    p.id,
    p.nome,
    p.marca,
    SUM(iv.quantidade) AS total_vendido,
    SUM(iv.quantidade * iv.preco_unitario) AS faturamento_total
FROM produto AS p
LEFT JOIN item_venda AS iv ON p.id = iv.id_produto
GROUP BY p.id, p.nome, p.marca
ORDER BY total_vendido DESC
LIMIT 20;


-- 4. View: Vendas por funcionário (performance)
CREATE OR REPLACE VIEW vw_vendas_por_funcionario AS
SELECT
    f.id AS funcionario_id,
    f.nome AS funcionario,
    f.cargo,
    COUNT(v.id) AS total_vendas,
    SUM(iv.quantidade * iv.preco_unitario) AS faturamento_gerado
FROM funcionario AS f
LEFT JOIN venda AS v ON f.id = v.id_funcionario
LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
GROUP BY f.id, f.nome, f.cargo
ORDER BY faturamento_gerado DESC;


-- 5. View: Produtos em promoção ativa
CREATE OR REPLACE VIEW vw_produtos_em_promocao AS
SELECT
    p.id AS produto_id,
    p.nome AS produto,
    pr.nome AS promocao,
    pr.valor_desconto AS desconto_percentual,
    p.preco AS preco_original,
    (p.preco * (1 - (pr.valor_desconto / 100))) AS preco_promocional
FROM produto AS p
LEFT JOIN promocao_produto AS pp ON p.id = pp.id_produto
LEFT JOIN promocao AS pr ON pp.id_promocao = pr.id
WHERE
    pr.ativo = 1
    AND CURDATE() BETWEEN pr.data_inicio AND COALESCE(
        pr.data_fim, CURDATE()
    )
ORDER BY pr.valor_desconto DESC;


-- 6. View: Faturamento mensal
CREATE OR REPLACE VIEW vw_faturamento_mensal AS
SELECT
    DATE_FORMAT(v.data_venda, '%Y-%m') AS mes,
    COUNT(v.id) AS total_vendas,
    SUM(iv.quantidade * iv.preco_unitario) AS faturamento_bruto,
    SUM(CASE
        WHEN iv.id_promocao IS NOT NULL
            THEN
                (
                    iv.quantidade
                    * iv.preco_unitario
                    * (1 - (pr.valor_desconto / 100))
                )
        ELSE (iv.quantidade * iv.preco_unitario)
    END) AS faturamento_liquido
FROM venda AS v
LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
LEFT JOIN promocao AS pr ON iv.id_promocao = pr.id
GROUP BY DATE_FORMAT(v.data_venda, '%Y-%m')
ORDER BY mes DESC;


-- 7. View: Fornecedores e seus produtos
CREATE OR REPLACE VIEW vw_fornecedores_produtos AS
SELECT
    f.id AS fornecedor_id,
    f.nome AS fornecedor,
    COUNT(p.id) AS total_produtos,
    GROUP_CONCAT(p.nome SEPARATOR ', ') AS lista_produtos
FROM fornecedor AS f
LEFT JOIN produto AS p ON f.id = p.id_fornecedor
GROUP BY f.id, f.nome
ORDER BY total_produtos DESC;


-- 8. View: Métodos de pagamento mais utilizados
CREATE OR REPLACE VIEW vw_metodos_pagamento_utilizados AS
SELECT
    fp.id AS metodo_id,
    fp.nome AS metodo_pagamento,
    COUNT(v.id) AS total_utilizacoes,
    SUM(iv.quantidade * iv.preco_unitario) AS valor_total
FROM forma_pagamento AS fp
LEFT JOIN venda AS v ON fp.id = v.id_forma_pagamento
LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
GROUP BY fp.id, fp.nome
ORDER BY total_utilizacoes DESC;


-- 9. View: Categorias e faturamento
CREATE OR REPLACE VIEW vw_categorias_faturamento AS
SELECT
    c.id AS categoria_id,
    c.nome AS categoria,
    COUNT(DISTINCT p.id) AS total_produtos,
    SUM(iv.quantidade) AS total_vendido,
    SUM(iv.quantidade * iv.preco_unitario) AS faturamento
FROM categoria AS c
LEFT JOIN produto AS p ON c.id = p.id_categoria
LEFT JOIN item_venda AS iv ON p.id = iv.id_produto
GROUP BY c.id, c.nome
ORDER BY faturamento DESC;


-- 10. View: Histórico completo de vendas (detalhado)
CREATE OR REPLACE VIEW vw_historico_vendas_detalhado AS
SELECT
    v.id AS venda_id,
    v.data_venda,
    c.nome AS cliente,
    f.nome AS funcionario,
    fp.nome AS forma_pagamento,
    p.nome AS produto,
    iv.quantidade,
    iv.preco_unitario,
    IFNULL(pr.nome, 'Sem promoção') AS promocao,
    (iv.quantidade * iv.preco_unitario) AS subtotal
FROM venda AS v
LEFT JOIN cliente AS c ON v.id_cliente = c.id
LEFT JOIN funcionario AS f ON v.id_funcionario = f.id
LEFT JOIN forma_pagamento AS fp ON v.id_forma_pagamento = fp.id
LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
LEFT JOIN produto AS p ON iv.id_produto = p.id
LEFT JOIN promocao AS pr ON iv.id_promocao = pr.id
ORDER BY v.data_venda DESC;

-- 13
delimiter $$ 
CREATE PROCEDURE relatorio_top_fornecedores()
begin 


SELECT f.nome AS fornecedor,
       SUM(iv.quantidade) AS qtd_vendida,
       SUM(iv.quantidade * iv.preco_unitario) AS total_vendido
FROM Fornecedor f
JOIN Produto p ON f.id = p.id_fornecedor
JOIN Item_Venda iv ON p.id = iv.id_produto
GROUP BY f.nome
ORDER BY total_vendido DESC;


end $$
delimiter ;



-- 12 
delimiter $$
CREATE PROCEDURE clientes_top_produtos()
begin 


SELECT c.nome
FROM Cliente c
WHERE NOT EXISTS (
    SELECT p.id
    FROM Produto p
    JOIN Categoria cat ON p.id_categoria = cat.id
    WHERE cat.nome = 'Livros'
    AND NOT EXISTS (
        SELECT 1
        FROM Venda v
        JOIN Item_Venda iv ON v.id = iv.id_venda
        WHERE v.id_cliente = c.id
        AND iv.id_produto = p.id
    )
);

end $$
delimiter ;



-- 11
delimiter $$
CREATE PROCEDURE comparativo_top_mes()
begin 


SELECT
    DATE_FORMAT(data_venda, '%Y-%m') AS mes,
    COUNT(id) AS qtd_vendas,
    SUM(total) AS faturamento
FROM (
    SELECT
        v.id,
        v.data_venda,
        SUM(iv.quantidade * iv.preco_unitario) AS total
    FROM Venda v
    JOIN Item_Venda iv ON v.id = iv.id_venda
    GROUP BY v.id, v.data_venda
) AS vendas_totais
GROUP BY DATE_FORMAT(data_venda, '%Y-%m')
ORDER BY mes DESC;



end $$
delimiter ;

-- 6
delimiter $$ 
CREATE PROCEDURE vendas_top_produtos()
begin 


SELECT
    DATE_FORMAT(data_venda, '%Y-%m') AS mes,
    COUNT(id) AS qtd_vendas,
    SUM(total) AS faturamento
FROM (
    SELECT
        v.id,
        v.data_venda,
        SUM(iv.quantidade * iv.preco_unitario) AS total
    FROM Venda v
    JOIN Item_Venda iv ON v.id = iv.id_venda
    GROUP BY v.id, v.data_venda
) AS vendas_totais
GROUP BY DATE_FORMAT(data_venda, '%Y-%m')
ORDER BY mes DESC;


end $$
delimiter ;

-- 14
delimiter $$
CREATE PROCEDURE MediaVendas_top_MediaGeral()
begin 


SELECT
    f.nome AS funcionario,
    COUNT(v.id) AS qtd_vendas,
    AVG(iv.quantidade * iv.preco_unitario) AS media_funcionario,
    (SELECT AVG(iv2.quantidade * iv2.preco_unitario)
        FROM Item_Venda iv2) AS media_geral
FROM Funcionario f
JOIN Venda v ON f.id = v.id_funcionario
JOIN Item_Venda iv ON v.id = iv.id_venda
GROUP BY f.nome
ORDER BY media_funcionario DESC;



end $$
delimiter ;


COMMIT;
