USE loja_de_roupas;

START TRANSACTION;

SELECT * FROM adicionar_estoque(1, 10) LIMIT 200;

SELECT * FROM atualizar_preco_produto(5, 99.99) LIMIT 200;

SELECT * FROM get_calcular_total_venda(3) LIMIT 200;

SELECT * FROM get_quantidade_media_vendas_produto(2) LIMIT 200;

SELECT * FROM get_verificar_estoque(4) LIMIT 200;

SELECT * FROM get_verificar_validade_promocao(1) LIMIT 200;

COMMIT;
