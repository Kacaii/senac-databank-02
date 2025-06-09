use loja_de_roupas;

start transaction;

-- Inserindo dados na tabela Fornecedor
insert into fornecedor (id, nome, endereco, telefone, email) values
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
insert into categoria (id, nome) values
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
insert into produto (
    id, nome, descricao, preco, tamanho, cor, marca, id_fornecedor, id_categoria
) values
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
(13, 'Calça Jeans', 'Calça skinny', 129.90, '38', 'Azul', 'MarcaFashion', 2, 2),
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
(15, 'Café Premium', 'Café em grãos 1kg', 29.90, '1kg', NULL, 'CaféBom', 5, 5);

-- Inserindo dados na tabela Estoque
insert into estoque (
    id, quantidade, data_entrada, data_saida, id_produto
) values
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
insert into cliente (id, nome, endereco, telefone, email) values
(1, 'João Silva', 'Rua A, 123', '(11) 1234-5678', 'joao@email.com'),
(2, 'Maria Souza', 'Av. B, 456', '(22) 2345-6789', 'maria@email.com'),
(3, 'Carlos Oliveira', 'Rua C, 789', '(33) 3456-7890', 'carlos@email.com'),
(4, 'Ana Pereira', 'Av. D, 101', '(44) 4567-8901', 'ana@email.com'),
(5, 'Pedro Santos', 'Rua E, 112', '(55) 5678-9012', 'pedro@email.com'),
(6, 'Juliana Costa', 'Av. F, 131', '(66) 6789-0123', 'juliana@email.com'),
(7, 'Marcos Ribeiro', 'Rua G, 415', '(77) 7890-1234', 'marcos@email.com'),
(8, 'Fernanda Lima', 'Av. H, 161', '(88) 8901-2345', 'fernanda@email.com'),
(9, 'Ricardo Alves', 'Rua I, 718', '(99) 9012-3456', 'ricardo@email.com'),
(10, 'Patricia Gomes', 'Av. J, 192', '(00) 0123-4567', 'patricia@email.com'),
(11, 'Lucas Martins', 'Rua K, 210', '(12) 1234-5678', 'lucas@email.com');

-- Inserindo dados na tabela Funcionario
insert into funcionario (id, nome, cargo, telefone) values
(1, 'Roberto Sales', 'Vendedor', '(11) 9876-5432'),
(2, 'Amanda Rocha', 'Gerente', '(22) 8765-4321'),
(3, 'Felipe Mendes', 'Caixa', '(33) 7654-3210'),
(4, 'Camila Torres', 'Vendedor', '(44) 6543-2109'),
(5, 'Gustavo Neves', 'Estoquista', '(55) 5432-1098'),
(6, 'Isabela Castro', 'Vendedor', '(66) 4321-0987'),
(7, 'Daniel Pires', 'Supervisor', '(77) 3210-9876'),
(8, 'Tatiana Lopes', 'Vendedor', '(88) 2109-8765'),
(9, 'Eduardo Sampaio', 'Caixa', '(99) 1098-7654'),
(10, 'Vanessa Dias', 'Vendedor', '(00) 0987-6543'),
(11, 'Hugo Moreira', 'Estoquista', '(12) 9876-5432');

-- Inserindo dados na tabela Forma_Pagamento
insert into forma_pagamento (id, nome) values
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
insert into promocao (
    id, nome, descricao, valor_desconto, ativo, data_inicio, data_fim
) values
(1, 'Black Friday', 'Descontos especiais', 30.0, 1, '2023-11-24', '2023-11-26'),
(2, 'Natal', 'Promoção de fim de ano', 20.0, 1, '2023-12-15', '2023-12-25'),
(
    3,
    'Ano Novo',
    'Promoção de início de ano',
    15.0,
    1,
    '2024-01-01',
    '2024-01-10'
),
(4, 'Dia dos Pais', 'Promoção especial', 25.0, 0, '2023-08-13', '2023-08-13'),
(5, 'Dia das Mães', 'Promoção especial', 25.0, 0, '2023-05-14', '2023-05-14'),
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
insert into venda (
    id, data_venda, id_cliente, id_forma_pagamento, id_funcionario
) values
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
insert into item_venda (
    id, id_venda, id_produto, quantidade, preco_unitario, id_promocao
) values
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
insert into promocao_produto (id, id_produto, id_promocao) values
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

commit;
