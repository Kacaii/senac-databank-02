USE loja_de_roupas;

delimiter $$
CREATE PROCEDURE sp_create_views()
BEGIN
START TRANSACTION;

-- 1. Atualizar o preço de um produto (aumento de 10%)
UPDATE
    produto
SET
    preco = preco * 1.10
WHERE
    id = 1;

-- 2. Atualizar o endereço de um cliente
UPDATE
    cliente
SET
    endereco = 'Av. Nova, 1001'
WHERE
    id = 3;

-- 3. Atualizar o telefone de um funcionário
UPDATE
    funcionario
SET
    telefone = '(11) 9999-8888'
WHERE
    id = 5;

-- 4. Atualizar a descrição de uma promoção
UPDATE
    promocao
SET
    descricao = 'Maior promoção do ano'
WHERE
    id = 1;

-- 5. Atualizar a quantidade em estoque de um produto
UPDATE
    estoque
SET
    quantidade = 75
WHERE
    id = 2;

-- 6. Atualizar o cargo de um funcionário para supervisor
UPDATE
    funcionario
SET
    cargo = 'Supervisor'
WHERE
    id = 6;

-- 7. Atualizar o email de um fornecedor
UPDATE
    fornecedor
SET
    email = 'novoemail@fornecedorA.com'
WHERE
    id = 1;

-- 8. Atualizar a data de fim de uma promoção
UPDATE
    promocao
SET
    data_fim = '2023-12-31'
WHERE
    id = 9;

-- 9. Atualizar o tamanho de um produto
UPDATE
    produto
SET
    tamanho = 'L'
WHERE
    id = 2;

-- 10. Atualizar a forma de pagamento de uma venda
UPDATE
    venda
SET
    id_forma_pagamento = 4
WHERE
    id = 7;

-- 11. Excluir um item de venda específico
DELETE FROM
    item_venda
WHERE
    id = 18;

-- 12. Excluir uma promoção que não está mais ativa
DELETE FROM
    promocao
WHERE
    id = 11
    AND ativo = 0;

-- 13. Excluir um registro de estoque de um produto descontinuado
DELETE FROM
    estoque
WHERE
    id_produto = 15;

-- 14. Excluir a associação de um produto com uma promoção
DELETE FROM
    promocao_produto
WHERE
    id_produto = 7
    AND id_promocao = 6;

-- 15. Excluir um cliente inativo (supondo critério de inatividade)
DELETE FROM
    cliente
WHERE
    id = 11
    AND NOT EXISTS (
        SELECT 1
        FROM
            venda
        WHERE
            id_cliente = 11
    );

-- 16. Excluir um fornecedor que não tem produtos associados
DELETE FROM
    fornecedor
WHERE
    id = 4
    AND NOT EXISTS (
        SELECT 1
        FROM
            produto
        WHERE
            id_fornecedor = 4
    );

-- 17. Excluir uma categoria sem produtos
DELETE FROM
    categoria
WHERE
    id = 11
    AND NOT EXISTS (
        SELECT 1
        FROM
            produto
        WHERE
            id_categoria = 11
    );

-- 18. Excluir um funcionário que não realizou vendas
DELETE FROM
    funcionario
WHERE
    id = 10
    AND NOT EXISTS (
        SELECT 1
        FROM
            venda
        WHERE
            id_funcionario = 10
    );

-- 19. Excluir uma forma de pagamento não utilizada
DELETE FROM
    forma_pagamento
WHERE
    id = 7
    AND NOT EXISTS (
        SELECT 1
        FROM
            venda
        WHERE
            id_forma_pagamento = 7
    );

-- 20. Excluir um produto que nunca foi vendido
DELETE FROM
    produto
WHERE
    id = 14
    AND NOT EXISTS (
        SELECT 1
        FROM
            item_venda
        WHERE
            id_produto = 14
    );
COMMIT;

END $$
delimiter ;
