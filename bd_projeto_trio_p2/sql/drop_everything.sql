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

DROP PROCEDURE IF EXISTS sp_all_alter_tables;
DROP PROCEDURE IF EXISTS sp_all_inserts;
DROP PROCEDURE IF EXISTS sp_all_updates;
DROP PROCEDURE IF EXISTS sp_create_functions;
DROP PROCEDURE IF EXISTS sp_create_views;
DROP PROCEDURE IF EXISTS sp_relatorio_geral;

COMMIT;

START TRANSACTION;

DROP TRIGGER IF EXISTS tg_atualizar_estoque_apos_venda;
DROP TRIGGER IF EXISTS tg_categoria_automatica_produto;
DROP TRIGGER IF EXISTS tg_definir_data_entrada_estoque;
DROP TRIGGER IF EXISTS tg_desativar_promocao_expirada;
DROP TRIGGER IF EXISTS tg_impedir_preco_zero;
DROP TRIGGER IF EXISTS tg_validar_nome_produto;

COMMIT;

START TRANSACTION;

DROP FUNCTION IF EXISTS adicionar_estoque;
DROP FUNCTION IF EXISTS atualizar_preco_produto;
DROP FUNCTION IF EXISTS get_calcular_total_venda;
DROP FUNCTION IF EXISTS get_quantidade_media_vendas_produto;
DROP FUNCTION IF EXISTS get_verificar_estoque;
DROP FUNCTION IF EXISTS get_verificar_validade_promocao;

COMMIT;
