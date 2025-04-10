-- Primeiro, excluir as tabelas que possuem chaves estrangeiras
-- referenciando outras tabelas
DROP TABLE IF EXISTS "Promocao_Produto";
DROP TABLE IF EXISTS "Item_Venda";
DROP TABLE IF EXISTS "Estoque";
DROP TABLE IF EXISTS "Venda";
DROP TABLE IF EXISTS "Produto";

-- Em seguida, excluir as tabelas que são referenciadas por outras
DROP TABLE IF EXISTS "Promocao";
DROP TABLE IF EXISTS "Fornecedor";
DROP TABLE IF EXISTS "Categoria";
DROP TABLE IF EXISTS "Forma_Pagamento";
DROP TABLE IF EXISTS "Cliente";
DROP TABLE IF EXISTS "Funcionario";
