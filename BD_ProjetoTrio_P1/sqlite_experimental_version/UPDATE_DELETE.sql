BEGIN TRANSACTION;

-- 1. Atualizar o preço de um produto (aumento de 10%)
UPDATE Produto SET Preco = Preco * 1.10
WHERE Id = 1;

-- 2. Atualizar o endereço de um cliente
UPDATE Cliente SET Endereco = 'Av. Nova, 1001'
WHERE Id = 3;

-- 3. Atualizar o telefone de um funcionário
UPDATE Funcionario SET Telefone = '(11) 9999-8888'
WHERE Id = 5;

-- 4. Atualizar a descrição de uma promoção
UPDATE Promocao SET Descricao = 'Maior promoção do ano'
WHERE Id = 1;

-- 5. Atualizar a quantidade em estoque de um produto
UPDATE Estoque SET Quantidade = 75
WHERE Id = 2;

-- 6. Atualizar o cargo de um funcionário para supervisor
UPDATE Funcionario SET Cargo = 'Supervisor'
WHERE Id = 6;

-- 7. Atualizar o email de um fornecedor
UPDATE Fornecedor SET Email = 'novoemail@fornecedorA.com'
WHERE Id = 1;

-- 8. Atualizar a data de fim de uma promoção
UPDATE Promocao SET Data_fim = '2023-12-31'
WHERE Id = 9;

-- 9. Atualizar o tamanho de um produto
UPDATE Produto SET Tamanho = 'L'
WHERE Id = 2;

-- 10. Atualizar a forma de pagamento de uma venda
UPDATE Venda SET Id_forma_pagamento = 4
WHERE Id = 7;

-- 11. Excluir um item de venda específico
DELETE FROM Item_venda
WHERE Id = 18;

-- 12. Excluir uma promoção que não está mais ativa
DELETE FROM Promocao
WHERE Id = 11 AND Ativo = 0;

-- 13. Excluir um registro de estoque de um produto descontinuado
DELETE FROM Estoque
WHERE Id_produto = 15;

-- 14. Excluir a associação de um produto com uma promoção
DELETE FROM Promocao_produto
WHERE Id_produto = 7 AND Id_promocao = 6;

-- 15. Excluir um cliente inativo (supondo critério de inatividade)
DELETE FROM Cliente
WHERE Id = 11 AND NOT EXISTS (
    SELECT 1 FROM Venda
    WHERE Id_cliente = 11
);

-- 16. Excluir um fornecedor que não tem produtos associados
DELETE FROM Fornecedor
WHERE Id = 4 AND NOT EXISTS (
    SELECT 1 FROM Produto
    WHERE Id_fornecedor = 4
);

-- 17. Excluir uma categoria sem produtos
DELETE FROM Categoria
WHERE Id = 11 AND NOT EXISTS (
    SELECT 1 FROM Produto
    WHERE Id_categoria = 11
);

-- 18. Excluir um funcionário que não realizou vendas
DELETE FROM Funcionario
WHERE Id = 10 AND NOT EXISTS (
    SELECT 1 FROM Venda
    WHERE Id_funcionario = 10
);

-- 19. Excluir uma forma de pagamento não utilizada
DELETE FROM Forma_pagamento
WHERE Id = 7 AND NOT EXISTS (
    SELECT 1 FROM Venda
    WHERE Id_forma_pagamento = 7
);

-- 20. Excluir um produto que nunca foi vendido
DELETE FROM Produto
WHERE Id = 14 AND NOT EXISTS (
    SELECT 1 FROM Item_venda
    WHERE Id_produto = 14
);

COMMIT;
