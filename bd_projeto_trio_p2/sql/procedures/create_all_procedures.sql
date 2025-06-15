USE loja_de_roupas;

delimiter $$
CREATE PROCEDURE sp_all_alter_tables()
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
USE loja_de_roupas;

delimiter $$
CREATE PROCEDURE sp_all_inserts()
BEGIN
START transaction;

-- Inserindo dados na tabela Fornecedor
INSERT INTO
  fornecedor (id, nome, endereco, telefone, email)
VALUES
  (
    1,
    'Fornecedor A',
    'Rua dos Fornecedores, 100',
    '(11) 1111-1111',
    'fornecedorA@email.com'
  ),
  (
    2,
    'Fornecedor B',
    'Avenida das Indústrias, 200',
    '(22) 2222-2222',
    'fornecedorB@email.com'
  ),
  (
    3,
    'Fornecedor C',
    'Travessa dos Produtos, 300',
    '(33) 3333-3333',
    'fornecedorC@email.com'
  ),
  (
    4,
    'Fornecedor D',
    'Alameda das Fábricas, 400',
    '(44) 4444-4444',
    'fornecedorD@email.com'
  ),
  (
    5,
    'Fornecedor E',
    'Praça dos Distribuidores, 500',
    '(55) 5555-5555',
    'fornecedorE@email.com'
  ),
  (
    6,
    'Fornecedor F',
    'Estrada dos Atacadistas, 600',
    '(66) 6666-6666',
    'fornecedorF@email.com'
  ),
  (
    7,
    'Fornecedor G',
    'Rodovia dos Importadores, 700',
    '(77) 7777-7777',
    'fornecedorG@email.com'
  ),
  (
    8,
    'Fornecedor H',
    'Avenida dos Exportadores, 800',
    '(88) 8888-8888',
    'fornecedorH@email.com'
  ),
  (
    9,
    'Fornecedor I',
    'Rua dos Atacados, 900',
    '(99) 9999-9999',
    'fornecedorI@email.com'
  ),
  (
    10,
    'Fornecedor J',
    'Alameda dos Varejistas, 1000',
    '(00) 0000-0000',
    'fornecedorJ@email.com'
  ),
  (
    11,
    'Fornecedor K',
    'Travessa dos Grossistas, 1100',
    '(12) 1212-1212',
    'fornecedorK@email.com'
  );

-- Inserindo dados na tabela Categoria
INSERT INTO
  categoria (id, nome)
VALUES
  (1, 'Eletrônicos'),
  (2, 'Roupas'),
  (3, 'Calçados'),
  (4, 'Acessórios'),
  (5, 'Alimentos'),
  (6, 'Bebidas'),
  (7, 'Limpeza'),
  (8, 'Perfumaria'),
  (9, 'Móveis'),
  (10, 'Decoração'),
  (11, 'Esportes');

-- Inserindo dados na tabela Produto
INSERT INTO
  produto (
    id,
    nome,
    descricao,
    preco,
    tamanho,
    cor,
    marca,
    id_fornecedor,
    id_categoria
  )
VALUES
  (
    1,
    'Smartphone X',
    'Smartphone de última geração',
    2999.99,
    'Único',
    'Preto',
    'TechBrand',
    1,
    1
  ),
  (
    2,
    'Camiseta Básica',
    'Camiseta 100% algodão',
    49.90,
    'M',
    'Branca',
    'MarcaFashion',
    2,
    2
  ),
  (
    3,
    'Tênis Esportivo',
    'Tênis para corrida',
    199.90,
    '42',
    'Azul',
    'Esportiva',
    3,
    3
  ),
  (
    4,
    'Fone de Ouvido',
    'Fone com cancelamento de ruído',
    399.90,
    'Único',
    'Preto',
    'AudioTech',
    1,
    1
  ),
  (
    5,
    'Arroz Integral',
    'Pacote 5kg',
    24.90,
    '5kg',
    NULL,
    'AlimentosSaudáveis',
    5,
    5
  ),
  (
    6,
    'Vinho Tinto',
    'Vinho seco da serra gaúcha',
    89.90,
    '750ml',
    NULL,
    'VinícolaBoa',
    6,
    6
  ),
  (
    7,
    'Detergente',
    'Detergente líquido 500ml',
    3.90,
    '500ml',
    'Verde',
    'LimpezaTotal',
    7,
    7
  ),
  (
    8,
    'Perfume Florado',
    'Perfume feminino 100ml',
    129.90,
    '100ml',
    NULL,
    'Aromas',
    8,
    8
  ),
  (
    9,
    'Sofá 3 Lugares',
    'Sofá retrátil',
    1999.90,
    '200x90x80cm',
    'Marrom',
    'ConfortoMóveis',
    9,
    9
  ),
  (
    10,
    'Luminária de Mesa',
    'Luminária LED',
    129.90,
    '40cm',
    'Branca',
    'Ilumina',
    10,
    10
  ),
  (
    11,
    'Bola de Futebol',
    'Bola oficial tamanho 5',
    99.90,
    '5',
    'Branca e preta',
    'EsporteTop',
    11,
    11
  ),
  (
    12,
    'Notebook Ultra',
    'Notebook com SSD 512GB',
    4599.90,
    '15.6"',
    'Prata',
    'TechBrand',
    1,
    1
  ),
  (
    13,
    'Calça Jeans',
    'Calça skinny',
    129.90,
    '38',
    'Azul',
    'MarcaFashion',
    2,
    2
  ),
  (
    14,
    'Sandália Comfort',
    'Sandália ortopédica',
    159.90,
    '36',
    'Marrom',
    'PéConforto',
    3,
    3
  ),
  (
    15,
    'Café Premium',
    'Café em grãos 1kg',
    29.90,
    '1kg',
    NULL,
    'CaféBom',
    5,
    5
  );

-- Inserindo dados na tabela Estoque
INSERT INTO
  estoque (
    id,
    quantidade,
    data_entrada,
    data_saida,
    id_produto
  )
VALUES
  (1, 50, '2023-01-10', '2023-12-31', 1),
  (2, 100, '2023-01-15', '2023-12-31', 2),
  (3, 30, '2023-02-01', '2023-12-31', 3),
  (4, 40, '2023-02-10', '2023-12-31', 4),
  (5, 200, '2023-03-05', '2023-12-31', 5),
  (6, 60, '2023-03-15', '2023-12-31', 6),
  (7, 150, '2023-04-01', '2023-12-31', 7),
  (8, 25, '2023-04-10', '2023-12-31', 8),
  (9, 10, '2023-05-05', '2023-12-31', 9),
  (10, 35, '2023-05-15', '2023-12-31', 10),
  (11, 20, '2023-06-01', '2023-12-31', 11),
  (12, 15, '2023-06-10', '2023-12-31', 12),
  (13, 80, '2023-07-05', '2023-12-31', 13),
  (14, 45, '2023-07-15', '2023-12-31', 14),
  (15, 90, '2023-08-01', '2023-12-31', 15);

-- Inserindo dados na tabela Cliente
INSERT INTO
  cliente (id, nome, endereco, telefone, email)
VALUES
  (
    1,
    'João Silva',
    'Rua A, 123',
    '(11) 1234-5678',
    'joao@email.com'
  ),
  (
    2,
    'Maria Souza',
    'Av. B, 456',
    '(22) 2345-6789',
    'maria@email.com'
  ),
  (
    3,
    'Carlos Oliveira',
    'Rua C, 789',
    '(33) 3456-7890',
    'carlos@email.com'
  ),
  (
    4,
    'Ana Pereira',
    'Av. D, 101',
    '(44) 4567-8901',
    'ana@email.com'
  ),
  (
    5,
    'Pedro Santos',
    'Rua E, 112',
    '(55) 5678-9012',
    'pedro@email.com'
  ),
  (
    6,
    'Juliana Costa',
    'Av. F, 131',
    '(66) 6789-0123',
    'juliana@email.com'
  ),
  (
    7,
    'Marcos Ribeiro',
    'Rua G, 415',
    '(77) 7890-1234',
    'marcos@email.com'
  ),
  (
    8,
    'Fernanda Lima',
    'Av. H, 161',
    '(88) 8901-2345',
    'fernanda@email.com'
  ),
  (
    9,
    'Ricardo Alves',
    'Rua I, 718',
    '(99) 9012-3456',
    'ricardo@email.com'
  ),
  (
    10,
    'Patricia Gomes',
    'Av. J, 192',
    '(00) 0123-4567',
    'patricia@email.com'
  ),
  (
    11,
    'Lucas Martins',
    'Rua K, 210',
    '(12) 1234-5678',
    'lucas@email.com'
  );

-- Inserindo dados na tabela Funcionario
INSERT INTO
  funcionario (id, nome, cargo, telefone)
VALUES
  (1, 'Roberto Sales', 'Vendedor', '(11) 9876-5432'),
  (2, 'Amanda Rocha', 'Gerente', '(22) 8765-4321'),
  (3, 'Felipe Mendes', 'Caixa', '(33) 7654-3210'),
  (4, 'Camila Torres', 'Vendedor', '(44) 6543-2109'),
  (
    5,
    'Gustavo Neves',
    'Estoquista',
    '(55) 5432-1098'
  ),
  (
    6,
    'Isabela Castro',
    'Vendedor',
    '(66) 4321-0987'
  ),
  (
    7,
    'Daniel Pires',
    'Supervisor',
    '(77) 3210-9876'
  ),
  (8, 'Tatiana Lopes', 'Vendedor', '(88) 2109-8765'),
  (9, 'Eduardo Sampaio', 'Caixa', '(99) 1098-7654'),
  (10, 'Vanessa Dias', 'Vendedor', '(00) 0987-6543'),
  (
    11,
    'Hugo Moreira',
    'Estoquista',
    '(12) 9876-5432'
  );

-- Inserindo dados na tabela Forma_Pagamento
INSERT INTO
  forma_pagamento (id, nome)
VALUES
  (1, 'Dinheiro'),
  (2, 'Cartão de Crédito'),
  (3, 'Cartão de Débito'),
  (4, 'PIX'),
  (5, 'Boleto'),
  (6, 'Transferência Bancária'),
  (7, 'Cheque'),
  (8, 'Vale Alimentação'),
  (9, 'Vale Refeição'),
  (10, 'Dois Cartões'),
  (11, 'Parcelado');

-- Inserindo dados na tabela Promocao
INSERT INTO
  promocao (
    id,
    nome,
    descricao,
    valor_desconto,
    ativo,
    data_inicio,
    data_fim
  )
VALUES
  (
    1,
    'Black Friday',
    'Descontos especiais',
    30.0,
    1,
    '2023-11-24',
    '2023-11-26'
  ),
  (
    2,
    'Natal',
    'Promoção de fim de ano',
    20.0,
    1,
    '2023-12-15',
    '2023-12-25'
  ),
  (
    3,
    'Ano Novo',
    'Promoção de início de ano',
    15.0,
    1,
    '2024-01-01',
    '2024-01-10'
  ),
  (
    4,
    'Dia dos Pais',
    'Promoção especial',
    25.0,
    0,
    '2023-08-13',
    '2023-08-13'
  ),
  (
    5,
    'Dia das Mães',
    'Promoção especial',
    25.0,
    0,
    '2023-05-14',
    '2023-05-14'
  ),
  (
    6,
    'Volta às Aulas',
    'Descontos em material',
    10.0,
    0,
    '2023-01-20',
    '2023-02-20'
  ),
  (
    7,
    'Liquidação de Verão',
    'Promoção de verão',
    40.0,
    0,
    '2023-01-05',
    '2023-02-05'
  ),
  (
    8,
    'Liquidação de Inverno',
    'Promoção de inverno',
    40.0,
    0,
    '2023-07-05',
    '2023-08-05'
  ),
  (
    9,
    'Aniversário da Loja',
    'Promoção comemorativa',
    15.0,
    1,
    '2023-10-10',
    '2023-10-17'
  ),
  (
    10,
    'Cyber Monday',
    'Promoção de tecnologia',
    20.0,
    1,
    '2023-11-27',
    '2023-11-27'
  ),
  (
    11,
    'Dia do Consumidor',
    'Promoção especial',
    10.0,
    0,
    '2023-03-15',
    '2023-03-15'
  );

-- Inserindo dados na tabela Venda
INSERT INTO
  venda (
    id,
    data_venda,
    id_cliente,
    id_forma_pagamento,
    id_funcionario
  )
VALUES
  (1, '2023-01-15', 1, 2, 1),
  (2, '2023-01-20', 2, 3, 2),
  (3, '2023-02-05', 3, 1, 3),
  (4, '2023-02-10', 4, 4, 4),
  (5, '2023-03-15', 5, 2, 5),
  (6, '2023-03-20', 6, 3, 6),
  (7, '2023-04-05', 7, 1, 7),
  (8, '2023-04-10', 8, 4, 8),
  (9, '2023-05-15', 9, 2, 9),
  (10, '2023-05-20', 10, 3, 10),
  (11, '2023-06-05', 11, 1, 11),
  (12, '2023-06-10', 1, 4, 1),
  (13, '2023-07-15', 2, 2, 2),
  (14, '2023-07-20', 3, 3, 3),
  (15, '2023-08-05', 4, 1, 4);

-- Inserindo dados na tabela Item_Venda
INSERT INTO
  item_venda (
    id,
    id_venda,
    id_produto,
    quantidade,
    preco_unitario,
    id_promocao
  )
VALUES
  (1, 1, 1, 1, 2999.99, NULL),
  (2, 1, 4, 1, 399.90, NULL),
  (3, 2, 2, 2, 49.90, NULL),
  (4, 3, 3, 1, 199.90, NULL),
  (5, 4, 5, 3, 24.90, NULL),
  (6, 5, 6, 2, 89.90, NULL),
  (7, 6, 7, 5, 3.90, NULL),
  (8, 7, 8, 1, 129.90, 9),
  (9, 8, 9, 1, 1999.90, NULL),
  (10, 9, 10, 2, 129.90, NULL),
  (11, 10, 11, 1, 99.90, NULL),
  (12, 11, 12, 1, 4599.90, NULL),
  (13, 12, 13, 1, 129.90, NULL),
  (14, 13, 14, 1, 159.90, NULL),
  (15, 14, 15, 2, 29.90, NULL),
  (16, 15, 1, 1, 2999.99, 1),
  (17, 15, 4, 1, 399.90, 1),
  (18, 2, 5, 1, 24.90, NULL),
  (19, 3, 7, 2, 3.90, NULL),
  (20, 4, 10, 1, 129.90, NULL);

-- Inserindo dados na tabela Promocao_Produto
INSERT INTO
  promocao_produto (id, id_produto, id_promocao)
VALUES
  (1, 1, 1),
  (2, 4, 1),
  (3, 8, 9),
  (4, 12, 10),
  (5, 2, 2),
  (6, 3, 2),
  (7, 5, 5),
  (8, 6, 5),
  (9, 7, 6),
  (10, 9, 4),
  (11, 10, 4),
  (12, 11, 3),
  (13, 13, 7),
  (14, 14, 7),
  (15, 15, 8);

COMMIT;

END $$
delimiter ;
USE loja_de_roupas;

delimiter $$
CREATE PROCEDURE sp_all_updates()
BEGIN
START TRANSACTION;

-- 1. Atualizar o preço de um produto (aumento de 10%)
UPDATE
    produto
SET
    preco = preco * 1.10
WHERE
    id = 1;

-- 2. Atualizar o endereço de um cliente
UPDATE
    cliente
SET
    endereco = 'Av. Nova, 1001'
WHERE
    id = 3;

-- 3. Atualizar o telefone de um funcionário
UPDATE
    funcionario
SET
    telefone = '(11) 9999-8888'
WHERE
    id = 5;

-- 4. Atualizar a descrição de uma promoção
UPDATE
    promocao
SET
    descricao = 'Maior promoção do ano'
WHERE
    id = 1;

-- 5. Atualizar a quantidade em estoque de um produto
UPDATE
    estoque
SET
    quantidade = 75
WHERE
    id = 2;

-- 6. Atualizar o cargo de um funcionário para supervisor
UPDATE
    funcionario
SET
    cargo = 'Supervisor'
WHERE
    id = 6;

-- 7. Atualizar o email de um fornecedor
UPDATE
    fornecedor
SET
    email = 'novoemail@fornecedorA.com'
WHERE
    id = 1;

-- 8. Atualizar a data de fim de uma promoção
UPDATE
    promocao
SET
    data_fim = '2023-12-31'
WHERE
    id = 9;

-- 9. Atualizar o tamanho de um produto
UPDATE
    produto
SET
    tamanho = 'L'
WHERE
    id = 2;

-- 10. Atualizar a forma de pagamento de uma venda
UPDATE
    venda
SET
    id_forma_pagamento = 4
WHERE
    id = 7;

-- 11. Excluir um item de venda específico
DELETE FROM
    item_venda
WHERE
    id = 18;

-- 12. Excluir uma promoção que não está mais ativa
DELETE FROM
    promocao
WHERE
    id = 11
    AND ativo = 0;

-- 13. Excluir um registro de estoque de um produto descontinuado
DELETE FROM
    estoque
WHERE
    id_produto = 15;

-- 14. Excluir a associação de um produto com uma promoção
DELETE FROM
    promocao_produto
WHERE
    id_produto = 7
    AND id_promocao = 6;

-- 15. Excluir um cliente inativo (supondo critério de inatividade)
DELETE FROM
    cliente
WHERE
    id = 11
    AND NOT EXISTS (
        SELECT 1
        FROM
            venda
        WHERE
            id_cliente = 11
    );

-- 16. Excluir um fornecedor que não tem produtos associados
DELETE FROM
    fornecedor
WHERE
    id = 4
    AND NOT EXISTS (
        SELECT 1
        FROM
            produto
        WHERE
            id_fornecedor = 4
    );

-- 17. Excluir uma categoria sem produtos
DELETE FROM
    categoria
WHERE
    id = 11
    AND NOT EXISTS (
        SELECT 1
        FROM
            produto
        WHERE
            id_categoria = 11
    );

-- 18. Excluir um funcionário que não realizou vendas
DELETE FROM
    funcionario
WHERE
    id = 10
    AND NOT EXISTS (
        SELECT 1
        FROM
            venda
        WHERE
            id_funcionario = 10
    );

-- 19. Excluir uma forma de pagamento não utilizada
DELETE FROM
    forma_pagamento
WHERE
    id = 7
    AND NOT EXISTS (
        SELECT 1
        FROM
            venda
        WHERE
            id_forma_pagamento = 7
    );

-- 20. Excluir um produto que nunca foi vendido
DELETE FROM
    produto
WHERE
    id = 14
    AND NOT EXISTS (
        SELECT 1
        FROM
            item_venda
        WHERE
            id_produto = 14
    );
COMMIT;

END $$
delimiter ;
USE loja_de_roupas;

delimiter $$
CREATE PROCEDURE sp_create_views()
BEGIN
START transaction;

-- 1. view: produtos com estoque baixo (quantidade < 20)
CREATE
OR REPLACE VIEW vw_estoque_baixo AS
SELECT
  p.id,
  p.nome,
  p.marca,
  e.quantidade,
  p.preco
FROM
  produto AS p
  LEFT JOIN estoque AS e ON p.id = e.id_produto
WHERE
  e.quantidade < 20
ORDER BY
  e.quantidade ASC;

-- 2. view: vendas por cliente (total gasto)
CREATE
OR REPLACE VIEW vw_vendas_por_cliente AS
SELECT
  c.id AS cliente_id,
  c.nome AS cliente,
  count(v.id) AS total_compras,
  sum(iv.quantidade * iv.preco_unitario) AS total_gasto
FROM
  cliente AS c
  LEFT JOIN venda AS v ON c.id = v.id_cliente
  LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
GROUP BY
  c.id,
  c.nome
ORDER BY
  total_gasto DESC;

-- 3. view: produtos mais vendidos (ranking)
CREATE
OR REPLACE VIEW vw_produtos_mais_vendidos AS
SELECT
  p.id,
  p.nome,
  p.marca,
  sum(iv.quantidade) AS total_vendido,
  sum(iv.quantidade * iv.preco_unitario) AS faturamento_total
FROM
  produto AS p
  LEFT JOIN item_venda AS iv ON p.id = iv.id_produto
GROUP BY
  p.id,
  p.nome,
  p.marca
ORDER BY
  total_vendido DESC
LIMIT
  20;

-- 4. view: vendas por funcionário (performance)
CREATE
OR REPLACE VIEW vw_vendas_por_funcionario AS
SELECT
  f.id AS funcionario_id,
  f.nome AS funcionario,
  f.cargo,
  count(v.id) AS total_vendas,
  sum(iv.quantidade * iv.preco_unitario) AS faturamento_gerado
FROM
  funcionario AS f
  LEFT JOIN venda AS v ON f.id = v.id_funcionario
  LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
GROUP BY
  f.id,
  f.nome,
  f.cargo
ORDER BY
  faturamento_gerado DESC;

-- 5. view: produtos em promoção ativa
CREATE
OR REPLACE VIEW vw_produtos_em_promocao AS
SELECT
  p.id AS produto_id,
  p.nome AS produto,
  pr.nome AS promocao,
  pr.valor_desconto AS desconto_percentual,
  p.preco AS preco_original,
  (p.preco * (1 - (pr.valor_desconto / 100))) AS preco_promocional
FROM
  produto AS p
  LEFT JOIN promocao_produto AS pp ON p.id = pp.id_produto
  LEFT JOIN promocao AS pr ON pp.id_promocao = pr.id
WHERE
  pr.ativo = 1
  AND curdate() BETWEEN pr.data_inicio AND coalesce(pr.data_fim, curdate())
ORDER BY
  pr.valor_desconto DESC;

-- 6. view: faturamento mensal
CREATE
OR REPLACE VIEW vw_faturamento_mensal AS
SELECT
  date_format(v.data_venda, '%y-%m') AS mes,
  count(v.id) AS total_vendas,
  sum(iv.quantidade * iv.preco_unitario) AS faturamento_bruto,
  sum(
    CASE
      WHEN iv.id_promocao IS NOT NULL THEN (
        iv.quantidade * iv.preco_unitario * (1 - (pr.valor_desconto / 100))
      )
      ELSE (iv.quantidade * iv.preco_unitario)
    END
  ) AS faturamento_liquido
FROM
  venda AS v
  LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
  LEFT JOIN promocao AS pr ON iv.id_promocao = pr.id
GROUP BY
  date_format(v.data_venda, '%y-%m')
ORDER BY
  mes DESC;

-- 7. view: fornecedores e seus produtos
CREATE
OR REPLACE VIEW vw_fornecedores_produtos AS
SELECT
  f.id AS fornecedor_id,
  f.nome AS fornecedor,
  count(p.id) AS total_produtos,
  GROUP_CONCAT(p.nome SEPARATOR ', ') AS lista_produtos
FROM
  fornecedor AS f
  LEFT JOIN produto AS p ON f.id = p.id_fornecedor
GROUP BY
  f.id,
  f.nome
ORDER BY
  total_produtos DESC;

-- 8. view: métodos de pagamento mais utilizados
CREATE
OR REPLACE VIEW vw_metodos_pagamento_utilizados AS
SELECT
  fp.id AS metodo_id,
  fp.nome AS metodo_pagamento,
  count(v.id) AS total_utilizacoes,
  sum(iv.quantidade * iv.preco_unitario) AS valor_total
FROM
  forma_pagamento AS fp
  LEFT JOIN venda AS v ON fp.id = v.id_forma_pagamento
  LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
GROUP BY
  fp.id,
  fp.nome
ORDER BY
  total_utilizacoes DESC;

-- 9. view: categorias e faturamento
CREATE
OR REPLACE VIEW vw_categorias_faturamento AS
SELECT
  c.id AS categoria_id,
  c.nome AS categoria,
  count(DISTINCT p.id) AS total_produtos,
  sum(iv.quantidade) AS total_vendido,
  sum(iv.quantidade * iv.preco_unitario) AS faturamento
FROM
  categoria AS c
  LEFT JOIN produto AS p ON c.id = p.id_categoria
  LEFT JOIN item_venda AS iv ON p.id = iv.id_produto
GROUP BY
  c.id,
  c.nome
ORDER BY
  faturamento DESC;

-- 10. view: histórico completo de vendas (detalhado)
CREATE
OR REPLACE VIEW vw_historico_vendas_detalhado AS
SELECT
  v.id AS venda_id,
  v.data_venda,
  c.nome AS cliente,
  f.nome AS funcionario,
  fp.nome AS forma_pagamento,
  p.nome AS produto,
  iv.quantidade,
  iv.preco_unitario,
  coalesce(pr.nome, 'sem promoção') AS promocao,
  (iv.quantidade * iv.preco_unitario) AS subtotal
FROM
  venda AS v
  LEFT JOIN cliente AS c ON v.id_cliente = c.id
  LEFT JOIN funcionario AS f ON v.id_funcionario = f.id
  LEFT JOIN forma_pagamento AS fp ON v.id_forma_pagamento = fp.id
  LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
  LEFT JOIN produto AS p ON iv.id_produto = p.id
  LEFT JOIN promocao AS pr ON iv.id_promocao = pr.id
ORDER BY
  v.data_venda DESC;

COMMIT;

END $$
delimiter ;
USE loja_de_roupas;

delimiter $$
CREATE PROCEDURE sp_relatorio_geral()
BEGIN
START transaction;

-- Produtos com estoque baixo e seus fornecedores
SELECT
  p.nome,
  p.marca,
  e.quantidade,
  f.nome AS fornecedor,
  f.telefone
FROM
  produto AS p
  LEFT JOIN estoque AS e ON p.id = e.id_produto
  LEFT JOIN fornecedor AS f ON p.id_fornecedor = f.id
WHERE
  e.quantidade < 20
ORDER BY
  e.quantidade;

-- Vendas realizadas por um funcionário específico com detalhes
SELECT
  v.id,
  v.data_venda,
  c.nome AS cliente,
  SUM(iv.quantidade * iv.preco_unitario) AS total_venda
FROM
  Venda v
  JOIN Funcionario f ON v.id_funcionario = f.id
  JOIN Cliente c ON v.id_cliente = c.id
  JOIN Item_Venda iv ON v.id = iv.id_venda
WHERE
  f.nome = 'Roberto Sales'
GROUP BY
  v.id,
  v.data_venda,
  c.nome
ORDER BY
  v.data_venda DESC;

-- Produtos que nunca foram vendidos (usando SUBSELECT)
SELECT
  p.id,
  p.nome,
  p.marca,
  p.preco
FROM
  Produto p
WHERE
  p.id NOT IN (
    SELECT
      DISTINCT id_produto
    FROM
      Item_Venda
  );

-- Clientes que mais gastaram (top 10)
SELECT
  c.id,
  c.nome,
  SUM(iv.quantidade * iv.preco_unitario) AS total_gasto,
  COUNT(DISTINCT v.id) AS qtd_compras
FROM
  Cliente c
  JOIN Venda v ON c.id = v.id_cliente
  JOIN Item_Venda iv ON v.id = iv.id_venda
GROUP BY
  c.id,
  c.nome
ORDER BY
  total_gasto DESC
LIMIT
  10;

-- Promoções ativas com produtos participantes
SELECT
  pr.nome AS promocao,
  pr.valor_desconto,
  p.nome AS produto,
  p.preco,
  (p.preco * (1 - pr.valor_desconto / 100)) AS preco_promocional
FROM
  Promocao pr
  JOIN Promocao_Produto pp ON pr.id = pp.id_promocao
  JOIN Produto p ON pp.id_produto = p.id
WHERE
  pr.ativo = 1
  AND CURRENT_DATE BETWEEN pr.data_inicio AND COALESCE(pr.data_fim, CURRENT_DATE);

-- Vendas por categoria de produto
SELECT
  cat.nome AS categoria,
  SUM(iv.quantidade) AS qtd_vendida,
  SUM(iv.quantidade * iv.preco_unitario) AS total_vendido
FROM
  Categoria cat
  JOIN Produto p ON cat.id = p.id_categoria
  JOIN Item_Venda iv ON p.id = iv.id_produto
GROUP BY
  cat.nome
ORDER BY
  total_vendido DESC;

-- Produtos com maior giro de estoque
SELECT
  p.nome,
  p.marca,
  SUM(iv.quantidade) AS qtd_vendida,
  e.quantidade AS estoque_atual,
  (SUM(iv.quantidade) / e.quantidade) AS giro
FROM
  Produto p
  JOIN Item_Venda iv ON p.id = iv.id_produto
  JOIN Estoque e ON p.id = e.id_produto
GROUP BY
  p.id,
  p.nome,
  p.marca,
  e.quantidade
ORDER BY
  giro DESC;

-- Formas de pagamento preferidas por cliente
SELECT
  c.nome AS cliente,
  fp.nome AS forma_pagamento,
  COUNT(v.id) AS qtd_vezes_utilizada,
  SUM(iv.quantidade * iv.preco_unitario) AS total_gasto
FROM
  Cliente c
  JOIN Venda v ON c.id = v.id_cliente
  JOIN Forma_Pagamento fp ON v.id_forma_pagamento = fp.id
  JOIN Item_Venda iv ON v.id = iv.id_venda
GROUP BY
  c.nome,
  fp.nome
ORDER BY
  c.nome,
  qtd_vezes_utilizada DESC;

-- Funcionários que venderam produtos de uma categoria específica
SELECT
  f.nome AS funcionario,
  cat.nome AS categoria,
  COUNT(DISTINCT v.id) AS qtd_vendas,
  SUM(iv.quantidade) AS qtd_produtos
FROM
  Funcionario f
  JOIN Venda v ON f.id = v.id_funcionario
  JOIN Item_Venda iv ON v.id = iv.id_venda
  JOIN Produto p ON iv.id_produto = p.id
  JOIN Categoria cat ON p.id_categoria = cat.id
WHERE
  cat.nome = 'Eletrônicos'
GROUP BY
  f.nome,
  cat.nome
ORDER BY
  qtd_produtos DESC;

-- Produtos que estão em promoção mas nunca foram vendidos (usando SUBSELECT)
SELECT
  p.nome,
  pr.nome AS promocao,
  pr.valor_desconto
FROM
  Produto p
  JOIN Promocao_Produto pp ON p.id = pp.id_produto
  JOIN Promocao pr ON pp.id_promocao = pr.id
WHERE
  p.id NOT IN (
    SELECT
      DISTINCT id_produto
    FROM
      Item_Venda
  )
  AND pr.ativo = 1;

-- Comparativo de vendas mês a mês
SELECT
  DATE_FORMAT(data_venda, '%Y-%m') AS mes,
  COUNT(id) AS qtd_vendas,
  SUM(total) AS faturamento
FROM
  (
    SELECT
      v.id,
      v.data_venda,
      SUM(iv.quantidade * iv.preco_unitario) AS total
    FROM
      Venda v
      JOIN Item_Venda iv ON v.id = iv.id_venda
    GROUP BY
      v.id,
      v.data_venda
  ) AS vendas_totais
GROUP BY
  DATE_FORMAT(data_venda, '%Y-%m')
ORDER BY
  mes DESC;

-- Clientes que compraram todos os produtos de uma categoria (usando SUBSELECT)
SELECT
  c.nome
FROM
  Cliente c
WHERE
  NOT EXISTS (
    SELECT
      p.id
    FROM
      Produto p
      JOIN Categoria cat ON p.id_categoria = cat.id
    WHERE
      cat.nome = 'Livros'
      AND NOT EXISTS (
        SELECT
          1
        FROM
          Venda v
          JOIN Item_Venda iv ON v.id = iv.id_venda
        WHERE
          v.id_cliente = c.id
          AND iv.id_produto = p.id
      )
  );

-- Fornecedores com produtos mais vendidos
SELECT
  f.nome AS fornecedor,
  SUM(iv.quantidade) AS qtd_vendida,
  SUM(iv.quantidade * iv.preco_unitario) AS total_vendido
FROM
  Fornecedor f
  JOIN Produto p ON f.id = p.id_fornecedor
  JOIN Item_Venda iv ON p.id = iv.id_produto
GROUP BY
  f.nome
ORDER BY
  total_vendido DESC;

-- Média de vendas por funcionário vs média geral
SELECT
  f.nome AS funcionario,
  COUNT(v.id) AS qtd_vendas,
  AVG(iv.quantidade * iv.preco_unitario) AS media_funcionario,
  (
    SELECT
      AVG(iv2.quantidade * iv2.preco_unitario)
    FROM
      Item_Venda iv2
  ) AS media_geral
FROM
  Funcionario f
  JOIN Venda v ON f.id = v.id_funcionario
  JOIN Item_Venda iv ON v.id = iv.id_venda
GROUP BY
  f.nome
ORDER BY
  media_funcionario DESC;

-- Produtos que estão abaixo da média de preço da sua categoria
SELECT
  p.nome,
  p.preco,
  cat.nome AS categoria,
  (
    SELECT
      AVG(p2.preco)
    FROM
      Produto p2
    WHERE
      p2.id_categoria = cat.id
  ) AS media_categoria
FROM
  Produto p
  JOIN Categoria cat ON p.id_categoria = cat.id
WHERE
  p.preco < (
    SELECT
      AVG(p2.preco)
    FROM
      Produto p2
    WHERE
      p2.id_categoria = cat.id
  )
ORDER BY
  cat.nome,
  p.preco;

-- Vendas com desconto vs vendas sem desconto
SELECT
  DATE_FORMAT(v.data_venda, '%Y-%m') AS mes,
  SUM(
    CASE
      WHEN iv.id_promocao IS NOT NULL THEN 1
      ELSE 0
    END
  ) AS vendas_com_desconto,
  SUM(
    CASE
      WHEN iv.id_promocao IS NULL THEN 1
      ELSE 0
    END
  ) AS vendas_sem_desconto,
  SUM(
    CASE
      WHEN iv.id_promocao IS NOT NULL THEN iv.quantidade * iv.preco_unitario * (1 - pr.valor_desconto / 100)
      ELSE iv.quantidade * iv.preco_unitario
    END
  ) AS total_liquido
FROM
  Venda v
  JOIN Item_Venda iv ON v.id = iv.id_venda
  LEFT JOIN Promocao pr ON iv.id_promocao = pr.id
GROUP BY
  DATE_FORMAT(v.data_venda, '%Y-%m')
ORDER BY
  mes DESC;

-- Clientes que compraram em todos os meses do último ano
SELECT
  c.nome
FROM
  Cliente c
WHERE
  NOT EXISTS (
    SELECT
      DISTINCT DATE_FORMAT(v2.data_venda, '%Y-%m') AS mes
    FROM
      Venda v2
    WHERE
      YEAR(v2.data_venda) = YEAR(DATE_SUB(CURDATE(), INTERVAL 1 YEAR))
      AND NOT EXISTS (
        SELECT
          1
        FROM
          Venda v
        WHERE
          v.id_cliente = c.id
          AND YEAR(v.data_venda) = YEAR(DATE_SUB(CURDATE(), INTERVAL 1 YEAR))
          AND DATE_FORMAT(v.data_venda, '%Y-%m') = DATE_FORMAT(v2.data_venda, '%Y-%m')
      )
  );

-- Produtos que sempre foram vendidos com promoção
SELECT
  p.nome
FROM
  Produto p
WHERE
  NOT EXISTS (
    SELECT
      iv.id
    FROM
      Item_Venda iv
    WHERE
      iv.id_produto = p.id
      AND iv.id_promocao IS NULL
  );

-- Evolução mensal de vendas por categoria
SELECT
  cat.nome AS categoria,
  DATE_FORMAT(v.data_venda, '%Y-%m') AS mes,
  SUM(iv.quantidade) AS qtd_vendida,
  SUM(iv.quantidade * iv.preco_unitario) AS total_vendido
FROM
  Categoria cat
  JOIN Produto p ON cat.id = p.id_categoria
  JOIN Item_Venda iv ON p.id = iv.id_produto
  JOIN Venda v ON iv.id_venda = v.id
GROUP BY
  cat.nome,
  DATE_FORMAT(v.data_venda, '%Y-%m')
ORDER BY
  cat.nome,
  mes;

-- Relação entre estoque e vendas dos últimos 30 dias
SELECT
  p.nome,
  e.quantidade AS estoque_atual,
  (
    SELECT
      SUM(iv.quantidade)
    FROM
      Item_Venda iv
      JOIN Venda v ON iv.id_venda = v.id
    WHERE
      iv.id_produto = p.id
      AND v.data_venda >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
  ) AS vendas_30_dias,
  e.quantidade / NULLIF(
    (
      SELECT
        SUM(iv.quantidade)
      FROM
        Item_Venda iv
        JOIN Venda v ON iv.id_venda = v.id
      WHERE
        iv.id_produto = p.id
        AND v.data_venda >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
    ),
    0
  ) AS meses_estoque
FROM
  Produto p
  JOIN Estoque e ON p.id = e.id_produto
ORDER BY
  meses_estoque DESC;

COMMIT;

END $$
delimiter ;
USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE PROCEDURE sp_relatorio_vendas_periodo(IN p_data_inicio DATE, IN p_data_fim DATE)
BEGIN

SELECT
  v.id AS id_venda,
  v.data_venda,
  c.nome AS cliente,
  f.nome AS funcionario,
  fp.nome AS forma_pagamento,
  SUM(iv.preco_unitario * iv.quantidade) AS total_venda
FROM
  Venda v
  JOIN Cliente c ON v.id_cliente = c.id
  JOIN Funcionario f ON v.id_funcionario = f.id
  JOIN Forma_Pagamento fp ON v.id_forma_pagamento = fp.id
  JOIN Item_Venda iv ON v.id = iv.id_venda
WHERE
  v.data_venda BETWEEN p_data_inicio AND p_data_fim
GROUP BY
  v.id,
  v.data_venda,
  c.nome,
  f.nome,
  fp.nome
ORDER BY
  v.data_venda;

END $$
DELIMITER ;

COMMIT;
