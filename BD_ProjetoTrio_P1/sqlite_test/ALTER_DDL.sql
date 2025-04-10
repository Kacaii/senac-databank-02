-- 1. Adicionar coluna de CPF na tabela Cliente
ALTER TABLE Cliente ADD COLUMN Cpf TEXT;

-- 2. Adicionar data de cadastro em Produto
ALTER TABLE Produto ADD COLUMN Data_cadastro TEXT DEFAULT CURRENT_DATE;

-- 3. Adicionar valor total em Venda
ALTER TABLE Venda ADD COLUMN Valor_total REAL;

-- 4. Adicionar observações em Venda
ALTER TABLE Venda ADD COLUMN Observacoes TEXT;

-- 5. Adicionar salário em Funcionario
ALTER TABLE Funcionario ADD COLUMN Salario REAL;

-- 6. Adicionar coluna ativo em Produto
ALTER TABLE Produto ADD COLUMN Ativo INTEGER DEFAULT 1;

-- 7. Adicionar coluna de limite de crédito em Cliente
ALTER TABLE Cliente ADD COLUMN Limite_credito REAL DEFAULT 0;

-- 8. Adicionar coluna de código de barras em Produto
ALTER TABLE Produto ADD COLUMN Codigo_barras TEXT;

-- 9. Adicionar coluna de data de nascimento em Cliente
ALTER TABLE Cliente ADD COLUMN Data_nascimento TEXT;

-- 10. Adicionar coluna de peso em Produto (em kg)
ALTER TABLE Produto ADD COLUMN Peso REAL;
