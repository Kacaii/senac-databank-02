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

DROP PROCEDURE sp_all_alter_tables;
DROP PROCEDURE sp_all_inserts;
DROP PROCEDURE sp_all_updates;
DROP PROCEDURE sp_create_functions;
DROP PROCEDURE sp_create_views;
DROP PROCEDURE sp_relatorio_geral;

COMMIT;

START TRANSACTION;

DROP TRIGGER tg_atualizar_estoque_apos_venda;
DROP TRIGGER tg_categoria_automatica_produto;
DROP TRIGGER tg_definir_data_entrada_estoque;
DROP TRIGGER tg_desativar_promocao_expirada;
DROP TRIGGER tg_impedir_preco_zero;
DROP TRIGGER tg_validar_nome_produto;

COMMIT;

START TRANSACTION;

DROP FUNCTION adicionar_estoque;
DROP FUNCTION atualizar_preco_produto;
DROP FUNCTION get_calcular_total_venda;
DROP FUNCTION get_quantidade_media_vendas_produto;
DROP FUNCTION get_verificar_estoque;
DROP FUNCTION get_verificar_validade_promocao;

COMMIT;
