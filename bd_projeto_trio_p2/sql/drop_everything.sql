USE loja_de_roupas;

START TRANSACTION;

DROP TABLE IF EXISTS item_venda;

DROP TABLE IF EXISTS promocao_produto;

DROP TABLE IF EXISTS venda;

DROP TABLE IF EXISTS estoque;

DROP TABLE IF EXISTS produto;

DROP TABLE IF EXISTS promocao;

DROP TABLE IF EXISTS fornecedor;

DROP TABLE IF EXISTS categoria;

DROP TABLE IF EXISTS forma_pagamento;

DROP TABLE IF EXISTS cliente;

DROP TABLE IF EXISTS funcionario;

COMMIT;

START TRANSACTION;

-- Lista de todas as views a serem removidas
DROP VIEW IF EXISTS vw_estoque_baixo;

DROP VIEW IF EXISTS vw_vendas_por_cliente;

DROP VIEW IF EXISTS vw_produtos_mais_vendidos;

DROP VIEW IF EXISTS vw_vendas_por_funcionario;

DROP VIEW IF EXISTS vw_produtos_em_promocao;

DROP VIEW IF EXISTS vw_faturamento_mensal;

DROP VIEW IF EXISTS vw_fornecedores_produtos;

DROP VIEW IF EXISTS vw_metodos_pagamento_utilizados;

DROP VIEW IF EXISTS vw_categorias_faturamento;

DROP VIEW IF EXISTS vw_historico_vendas_detalhado;

COMMIT;

START TRANSACTION;

drop procedure sp_all_alter_tables;
drop procedure sp_all_inserts;
drop procedure sp_all_updates;
drop procedure sp_create_functions;
drop procedure sp_create_views;
drop procedure sp_relatorio_geral;

COMMIT;
