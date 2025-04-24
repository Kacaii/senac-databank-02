BEGIN TRANSACTION;

-- Inserindo dados na tabela Fornecedor
INSERT INTO Fornecedor (Id, Nome, Endereco, Telefone, Email) VALUES
(
    1,
    'Fornecedor A',
    'Rua Industrial, 100',
    '(11) 1111-1111',
    'fornecedorA@email.com'
),
(
    2,
    'Fornecedor B',
    'Av. Comercial, 200',
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
    'Alameda das Indústrias, 400',
    '(44) 4444-4444',
    'fornecedorD@email.com'
),
(
    5,
    'Fornecedor E',
    'Estrada das Fábricas, 500',
    '(55) 5555-5555',
    'fornecedorE@email.com'
);

-- Inserindo dados na tabela Categoria
INSERT INTO Categoria (Id, Nome) VALUES
(1, 'Eletrônicos'),
(2, 'Vestuário'),
(3, 'Alimentos'),
(4, 'Móveis'),
(5, 'Esportes');

-- Inserindo dados na tabela Produto
INSERT INTO Produto (
    Id, Nome, Descricao, Preco, Tamanho, Cor, Marca, Id_fornecedor, Id_categoria
) VALUES
(
    1,
    'Smartphone X',
    'Smartphone de última geração',
    2999.90,
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
    'MarcaModa',
    2,
    2
),
(
    3,
    'Arroz Integral',
    'Pacote 5kg de arroz integral',
    22.50,
    '5kg',
    NULL,
    'AlimentosSaudáveis',
    3,
    3
),
(
    4,
    'Sofá 3 Lugares',
    'Sofá retrátil em couro sintético',
    1599.00,
    '200x90x80cm',
    'Marrom',
    'ConfortoTotal',
    4,
    4
),
(
    5,
    'Bola de Futebol',
    'Bola oficial tamanho 5',
    129.90,
    '5',
    'Branca e preta',
    'EsporteTop',
    5,
    5
),
(
    6,
    'Notebook Pro',
    'Notebook com 16GB RAM e SSD 512GB',
    4599.00,
    '15.6"',
    'Prata',
    'TechBrand',
    1,
    1
),
(
    7,
    'Calça Jeans',
    'Calça jeans slim fit',
    119.90,
    '42',
    'Azul',
    'MarcaModa',
    2,
    2
),
(
    8,
    'Azeite de Oliva',
    'Azeite extra virgem 500ml',
    35.90,
    '500ml',
    NULL,
    'AlimentosSaudáveis',
    3,
    3
),
(
    9,
    'Mesa de Jantar',
    'Mesa com 6 cadeiras',
    2399.00,
    '180x90x75cm',
    'Branco',
    'ConfortoTotal',
    4,
    4
),
(
    10,
    'Raquete de Tênis',
    'Raquete profissional',
    499.90,
    'Único',
    'Vermelha',
    'EsporteTop',
    5,
    5
);

-- Inserindo dados na tabela Estoque
INSERT INTO Estoque (
    Id, Quantidade, Data_entrada, Data_saida, Id_produto
) VALUES
(1, 50, '2023-01-10', '2023-12-31', 1),
(2, 100, '2023-02-15', '2023-12-31', 2),
(3, 200, '2023-03-20', '2023-12-31', 3),
(4, 10, '2023-04-25', '2023-12-31', 4),
(5, 30, '2023-05-30', '2023-12-31', 5),
(6, 25, '2023-06-05', '2023-12-31', 6),
(7, 60, '2023-07-10', '2023-12-31', 7),
(8, 150, '2023-08-15', '2023-12-31', 8),
(9, 8, '2023-09-20', '2023-12-31', 9),
(10, 20, '2023-10-25', '2023-12-31', 10);

-- Inserindo dados na tabela Forma_Pagamento
INSERT INTO Forma_pagamento (Id, Nome) VALUES
(1, 'Cartão de Crédito'),
(2, 'Cartão de Débito'),
(3, 'Dinheiro'),
(4, 'PIX'),
(5, 'Boleto Bancário');

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Id, Nome, Endereco, Telefone, Email) VALUES
(1, 'João Silva', 'Rua A, 123', '(11) 9999-9999', 'joao@email.com'),
(2, 'Maria Souza', 'Av. B, 456', '(22) 8888-8888', 'maria@email.com'),
(3, 'Carlos Oliveira', 'Travessa C, 789', '(33) 7777-7777', 'carlos@email.com'),
(4, 'Ana Pereira', 'Alameda D, 101', '(44) 6666-6666', 'ana@email.com'),
(5, 'Pedro Santos', 'Estrada E, 202', '(55) 5555-5555', 'pedro@email.com');

-- Inserindo dados na tabela Funcionario
INSERT INTO Funcionario (Id, Nome, Cargo, Telefone) VALUES
(1, 'Fernando Costa', 'Vendedor', '(11) 1111-2222'),
(2, 'Patricia Lima', 'Gerente', '(22) 2222-3333'),
(3, 'Ricardo Alves', 'Caixa', '(33) 3333-4444'),
(4, 'Juliana Martins', 'Vendedor', '(44) 4444-5555'),
(5, 'Marcos Oliveira', 'Estoquista', '(55) 5555-6666');

-- Inserindo dados na tabela Promocao
INSERT INTO Promocao (
    Id, Nome, Descricao, Valor_desconto, Ativo, Data_inicio, Data_fim
) VALUES
(
    1,
    'Black Friday',
    'Descontos especiais na Black Friday',
    0.20,
    1,
    '2023-11-24',
    '2023-11-26'
),
(2, 'Natal', 'Promoção de Natal', 0.15, 1, '2023-12-15', '2023-12-25'),
(
    3,
    'Ano Novo',
    'Promoção de início de ano',
    0.10,
    0,
    '2024-01-01',
    '2024-01-15'
),
(
    4,
    'Dia dos Pais',
    'Ofertas para o Dia dos Pais',
    0.12,
    0,
    '2023-08-13',
    '2023-08-13'
),
(
    5,
    'Volta às Aulas',
    'Descontos em material escolar',
    0.25,
    0,
    '2023-01-25',
    '2023-02-10'
);

-- Inserindo dados na tabela Venda
INSERT INTO Venda (
    Id, Data_venda, Id_cliente, Id_forma_pagamento, Id_funcionario
) VALUES
(1, '2023-11-25', 1, 1, 1),
(2, '2023-11-26', 2, 2, 2),
(3, '2023-12-20', 3, 4, 3),
(4, '2023-12-22', 4, 3, 4),
(5, '2023-12-24', 5, 1, 5),
(6, '2023-08-13', 1, 2, 1),
(7, '2023-01-30', 2, 5, 2),
(8, '2023-02-05', 3, 4, 3),
(9, '2023-11-25', 4, 1, 4),
(10, '2023-12-24', 5, 3, 5);

-- Inserindo dados na tabela Item_Venda
INSERT INTO Item_venda (
    Id, Id_venda, Id_produto, Quantidade, Preco_unitario, Id_promocao
) VALUES
(1, 1, 1, 1, 2999.90, 1),
(2, 1, 2, 2, 49.90, 1),
(3, 2, 3, 5, 22.50, NULL),
(4, 3, 4, 1, 1599.00, 2),
(5, 4, 5, 1, 129.90, NULL),
(6, 5, 6, 1, 4599.00, 2),
(7, 6, 7, 3, 119.90, 4),
(8, 7, 8, 2, 35.90, 5),
(9, 8, 9, 1, 2399.00, 5),
(10, 9, 10, 1, 499.90, 1),
(11, 10, 1, 1, 2999.90, 2),
(12, 10, 3, 3, 22.50, 2),
(13, 2, 5, 2, 129.90, NULL),
(14, 3, 7, 1, 119.90, 2),
(15, 4, 9, 1, 2399.00, NULL);

-- Inserindo dados na tabela Promocao_Produto
INSERT INTO Promocao_produto (Id, Id_produto, Id_promocao) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 4, 2),
(4, 6, 2),
(5, 7, 4),
(6, 8, 5),
(7, 9, 5),
(8, 10, 1),
(9, 1, 2),
(10, 3, 2),
(11, 7, 2),
(12, 10, 3);

COMMIT;
