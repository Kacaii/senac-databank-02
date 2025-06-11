USE loja_de_roupas;

START TRANSACTION;

call sp_create_views();

call sp_create_functions();

call sp_all_inserts();

call sp_all_updates();

call sp_all_alter_tables();

COMMIT;
