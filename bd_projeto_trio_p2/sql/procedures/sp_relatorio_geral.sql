USE loja_de_roupas;

delimiter $$
CREATE PROCEDURE IF NOT EXISTS sp_relatorio_geral()
BEGIN
START transaction;

-- Produtos com estoque baixo e seus fornecedores
SELECT
  p.nome,
  p.marca,
  e.quantidade,
  f.nome AS fornecedor,
  f.telefone
FROM
  produto AS p
  LEFT JOIN estoque AS e ON p.id = e.id_produto
  LEFT JOIN fornecedor AS f ON p.id_fornecedor = f.id
WHERE
  e.quantidade < 20
ORDER BY
  e.quantidade;

-- Vendas realizadas por um funcionário específico com detalhes
SELECT
  v.id,
  v.data_venda,
  c.nome AS cliente,
  SUM(iv.quantidade * iv.preco_unitario) AS total_venda
FROM
  Venda v
  JOIN Funcionario f ON v.id_funcionario = f.id
  JOIN Cliente c ON v.id_cliente = c.id
  JOIN Item_Venda iv ON v.id = iv.id_venda
WHERE
  f.nome = 'Roberto Sales'
GROUP BY
  v.id,
  v.data_venda,
  c.nome
ORDER BY
  v.data_venda DESC;

-- Produtos que nunca foram vendidos (usando SUBSELECT)
SELECT
  p.id,
  p.nome,
  p.marca,
  p.preco
FROM
  Produto p
WHERE
  p.id NOT IN (
    SELECT
      DISTINCT id_produto
    FROM
      Item_Venda
  );

-- Clientes que mais gastaram (top 10)
SELECT
  c.id,
  c.nome,
  SUM(iv.quantidade * iv.preco_unitario) AS total_gasto,
  COUNT(DISTINCT v.id) AS qtd_compras
FROM
  Cliente c
  JOIN Venda v ON c.id = v.id_cliente
  JOIN Item_Venda iv ON v.id = iv.id_venda
GROUP BY
  c.id,
  c.nome
ORDER BY
  total_gasto DESC
LIMIT
  10;

-- Promoções ativas com produtos participantes
SELECT
  pr.nome AS promocao,
  pr.valor_desconto,
  p.nome AS produto,
  p.preco,
  (p.preco * (1 - pr.valor_desconto / 100)) AS preco_promocional
FROM
  Promocao pr
  JOIN Promocao_Produto pp ON pr.id = pp.id_promocao
  JOIN Produto p ON pp.id_produto = p.id
WHERE
  pr.ativo = 1
  AND CURRENT_DATE BETWEEN pr.data_inicio AND COALESCE(pr.data_fim, CURRENT_DATE);

-- Vendas por categoria de produto
SELECT
  cat.nome AS categoria,
  SUM(iv.quantidade) AS qtd_vendida,
  SUM(iv.quantidade * iv.preco_unitario) AS total_vendido
FROM
  Categoria cat
  JOIN Produto p ON cat.id = p.id_categoria
  JOIN Item_Venda iv ON p.id = iv.id_produto
GROUP BY
  cat.nome
ORDER BY
  total_vendido DESC;

-- Produtos com maior giro de estoque
SELECT
  p.nome,
  p.marca,
  SUM(iv.quantidade) AS qtd_vendida,
  e.quantidade AS estoque_atual,
  (SUM(iv.quantidade) / e.quantidade) AS giro
FROM
  Produto p
  JOIN Item_Venda iv ON p.id = iv.id_produto
  JOIN Estoque e ON p.id = e.id_produto
GROUP BY
  p.id,
  p.nome,
  p.marca,
  e.quantidade
ORDER BY
  giro DESC;

-- Formas de pagamento preferidas por cliente
SELECT
  c.nome AS cliente,
  fp.nome AS forma_pagamento,
  COUNT(v.id) AS qtd_vezes_utilizada,
  SUM(iv.quantidade * iv.preco_unitario) AS total_gasto
FROM
  Cliente c
  JOIN Venda v ON c.id = v.id_cliente
  JOIN Forma_Pagamento fp ON v.id_forma_pagamento = fp.id
  JOIN Item_Venda iv ON v.id = iv.id_venda
GROUP BY
  c.nome,
  fp.nome
ORDER BY
  c.nome,
  qtd_vezes_utilizada DESC;

-- Funcionários que venderam produtos de uma categoria específica
SELECT
  f.nome AS funcionario,
  cat.nome AS categoria,
  COUNT(DISTINCT v.id) AS qtd_vendas,
  SUM(iv.quantidade) AS qtd_produtos
FROM
  Funcionario f
  JOIN Venda v ON f.id = v.id_funcionario
  JOIN Item_Venda iv ON v.id = iv.id_venda
  JOIN Produto p ON iv.id_produto = p.id
  JOIN Categoria cat ON p.id_categoria = cat.id
WHERE
  cat.nome = 'Eletrônicos'
GROUP BY
  f.nome,
  cat.nome
ORDER BY
  qtd_produtos DESC;

-- Produtos que estão em promoção mas nunca foram vendidos (usando SUBSELECT)
SELECT
  p.nome,
  pr.nome AS promocao,
  pr.valor_desconto
FROM
  Produto p
  JOIN Promocao_Produto pp ON p.id = pp.id_produto
  JOIN Promocao pr ON pp.id_promocao = pr.id
WHERE
  p.id NOT IN (
    SELECT
      DISTINCT id_produto
    FROM
      Item_Venda
  )
  AND pr.ativo = 1;

-- Comparativo de vendas mês a mês
SELECT
  DATE_FORMAT(data_venda, '%Y-%m') AS mes,
  COUNT(id) AS qtd_vendas,
  SUM(total) AS faturamento
FROM
  (
    SELECT
      v.id,
      v.data_venda,
      SUM(iv.quantidade * iv.preco_unitario) AS total
    FROM
      Venda v
      JOIN Item_Venda iv ON v.id = iv.id_venda
    GROUP BY
      v.id,
      v.data_venda
  ) AS vendas_totais
GROUP BY
  DATE_FORMAT(data_venda, '%Y-%m')
ORDER BY
  mes DESC;

-- Clientes que compraram todos os produtos de uma categoria (usando SUBSELECT)
SELECT
  c.nome
FROM
  Cliente c
WHERE
  NOT EXISTS (
    SELECT
      p.id
    FROM
      Produto p
      JOIN Categoria cat ON p.id_categoria = cat.id
    WHERE
      cat.nome = 'Livros'
      AND NOT EXISTS (
        SELECT
          1
        FROM
          Venda v
          JOIN Item_Venda iv ON v.id = iv.id_venda
        WHERE
          v.id_cliente = c.id
          AND iv.id_produto = p.id
      )
  );

-- Fornecedores com produtos mais vendidos
SELECT
  f.nome AS fornecedor,
  SUM(iv.quantidade) AS qtd_vendida,
  SUM(iv.quantidade * iv.preco_unitario) AS total_vendido
FROM
  Fornecedor f
  JOIN Produto p ON f.id = p.id_fornecedor
  JOIN Item_Venda iv ON p.id = iv.id_produto
GROUP BY
  f.nome
ORDER BY
  total_vendido DESC;

-- Média de vendas por funcionário vs média geral
SELECT
  f.nome AS funcionario,
  COUNT(v.id) AS qtd_vendas,
  AVG(iv.quantidade * iv.preco_unitario) AS media_funcionario,
  (
    SELECT
      AVG(iv2.quantidade * iv2.preco_unitario)
    FROM
      Item_Venda iv2
  ) AS media_geral
FROM
  Funcionario f
  JOIN Venda v ON f.id = v.id_funcionario
  JOIN Item_Venda iv ON v.id = iv.id_venda
GROUP BY
  f.nome
ORDER BY
  media_funcionario DESC;

-- Produtos que estão abaixo da média de preço da sua categoria
SELECT
  p.nome,
  p.preco,
  cat.nome AS categoria,
  (
    SELECT
      AVG(p2.preco)
    FROM
      Produto p2
    WHERE
      p2.id_categoria = cat.id
  ) AS media_categoria
FROM
  Produto p
  JOIN Categoria cat ON p.id_categoria = cat.id
WHERE
  p.preco < (
    SELECT
      AVG(p2.preco)
    FROM
      Produto p2
    WHERE
      p2.id_categoria = cat.id
  )
ORDER BY
  cat.nome,
  p.preco;

-- Vendas com desconto vs vendas sem desconto
SELECT
  DATE_FORMAT(v.data_venda, '%Y-%m') AS mes,
  SUM(
    CASE
      WHEN iv.id_promocao IS NOT NULL THEN 1
      ELSE 0
    END
  ) AS vendas_com_desconto,
  SUM(
    CASE
      WHEN iv.id_promocao IS NULL THEN 1
      ELSE 0
    END
  ) AS vendas_sem_desconto,
  SUM(
    CASE
      WHEN iv.id_promocao IS NOT NULL THEN iv.quantidade * iv.preco_unitario * (1 - pr.valor_desconto / 100)
      ELSE iv.quantidade * iv.preco_unitario
    END
  ) AS total_liquido
FROM
  Venda v
  JOIN Item_Venda iv ON v.id = iv.id_venda
  LEFT JOIN Promocao pr ON iv.id_promocao = pr.id
GROUP BY
  DATE_FORMAT(v.data_venda, '%Y-%m')
ORDER BY
  mes DESC;

-- Clientes que compraram em todos os meses do último ano
SELECT
  c.nome
FROM
  Cliente c
WHERE
  NOT EXISTS (
    SELECT
      DISTINCT DATE_FORMAT(v2.data_venda, '%Y-%m') AS mes
    FROM
      Venda v2
    WHERE
      YEAR(v2.data_venda) = YEAR(DATE_SUB(CURDATE(), INTERVAL 1 YEAR))
      AND NOT EXISTS (
        SELECT
          1
        FROM
          Venda v
        WHERE
          v.id_cliente = c.id
          AND YEAR(v.data_venda) = YEAR(DATE_SUB(CURDATE(), INTERVAL 1 YEAR))
          AND DATE_FORMAT(v.data_venda, '%Y-%m') = DATE_FORMAT(v2.data_venda, '%Y-%m')
      )
  );

-- Produtos que sempre foram vendidos com promoção
SELECT
  p.nome
FROM
  Produto p
WHERE
  NOT EXISTS (
    SELECT
      iv.id
    FROM
      Item_Venda iv
    WHERE
      iv.id_produto = p.id
      AND iv.id_promocao IS NULL
  );

-- Evolução mensal de vendas por categoria
SELECT
  cat.nome AS categoria,
  DATE_FORMAT(v.data_venda, '%Y-%m') AS mes,
  SUM(iv.quantidade) AS qtd_vendida,
  SUM(iv.quantidade * iv.preco_unitario) AS total_vendido
FROM
  Categoria cat
  JOIN Produto p ON cat.id = p.id_categoria
  JOIN Item_Venda iv ON p.id = iv.id_produto
  JOIN Venda v ON iv.id_venda = v.id
GROUP BY
  cat.nome,
  DATE_FORMAT(v.data_venda, '%Y-%m')
ORDER BY
  cat.nome,
  mes;

-- Relação entre estoque e vendas dos últimos 30 dias
SELECT
  p.nome,
  e.quantidade AS estoque_atual,
  (
    SELECT
      SUM(iv.quantidade)
    FROM
      Item_Venda iv
      JOIN Venda v ON iv.id_venda = v.id
    WHERE
      iv.id_produto = p.id
      AND v.data_venda >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
  ) AS vendas_30_dias,
  e.quantidade / NULLIF(
    (
      SELECT
        SUM(iv.quantidade)
      FROM
        Item_Venda iv
        JOIN Venda v ON iv.id_venda = v.id
      WHERE
        iv.id_produto = p.id
        AND v.data_venda >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
    ),
    0
  ) AS meses_estoque
FROM
  Produto p
  JOIN Estoque e ON p.id = e.id_produto
ORDER BY
  meses_estoque DESC;

COMMIT;

END $$
delimiter ;
