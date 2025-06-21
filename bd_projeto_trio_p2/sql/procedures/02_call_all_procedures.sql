USE loja_de_roupas;

START TRANSACTION;

CALL sp_all_alter_tables();
CALL sp_all_inserts();
CALL sp_all_updates();
CALL sp_create_views();
CALL sp_relatorio_geral();
CALL sp_relatorio_vendas_periodo('2023-03-01', '2024-06-30');
--                                        ^^ Inicio     ^^ Fim

COMMIT;
