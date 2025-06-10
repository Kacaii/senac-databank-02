USE loja_de_roupas;

delimiter $$
CREATE PROCEDURE sp_create_views()
BEGIN
START transaction;

-- 1. view: produtos com estoque baixo (quantidade < 20)
CREATE
OR REPLACE VIEW vw_estoque_baixo AS
SELECT
  p.id,
  p.nome,
  p.marca,
  e.quantidade,
  p.preco
FROM
  produto AS p
  LEFT JOIN estoque AS e ON p.id = e.id_produto
WHERE
  e.quantidade < 20
ORDER BY
  e.quantidade ASC;

-- 2. view: vendas por cliente (total gasto)
CREATE
OR REPLACE VIEW vw_vendas_por_cliente AS
SELECT
  c.id AS cliente_id,
  c.nome AS cliente,
  count(v.id) AS total_compras,
  sum(iv.quantidade * iv.preco_unitario) AS total_gasto
FROM
  cliente AS c
  LEFT JOIN venda AS v ON c.id = v.id_cliente
  LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
GROUP BY
  c.id,
  c.nome
ORDER BY
  total_gasto DESC;

-- 3. view: produtos mais vendidos (ranking)
CREATE
OR REPLACE VIEW vw_produtos_mais_vendidos AS
SELECT
  p.id,
  p.nome,
  p.marca,
  sum(iv.quantidade) AS total_vendido,
  sum(iv.quantidade * iv.preco_unitario) AS faturamento_total
FROM
  produto AS p
  LEFT JOIN item_venda AS iv ON p.id = iv.id_produto
GROUP BY
  p.id,
  p.nome,
  p.marca
ORDER BY
  total_vendido DESC
LIMIT
  20;

-- 4. view: vendas por funcionário (performance)
CREATE
OR REPLACE VIEW vw_vendas_por_funcionario AS
SELECT
  f.id AS funcionario_id,
  f.nome AS funcionario,
  f.cargo,
  count(v.id) AS total_vendas,
  sum(iv.quantidade * iv.preco_unitario) AS faturamento_gerado
FROM
  funcionario AS f
  LEFT JOIN venda AS v ON f.id = v.id_funcionario
  LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
GROUP BY
  f.id,
  f.nome,
  f.cargo
ORDER BY
  faturamento_gerado DESC;

-- 5. view: produtos em promoção ativa
CREATE
OR REPLACE VIEW vw_produtos_em_promocao AS
SELECT
  p.id AS produto_id,
  p.nome AS produto,
  pr.nome AS promocao,
  pr.valor_desconto AS desconto_percentual,
  p.preco AS preco_original,
  (p.preco * (1 - (pr.valor_desconto / 100))) AS preco_promocional
FROM
  produto AS p
  LEFT JOIN promocao_produto AS pp ON p.id = pp.id_produto
  LEFT JOIN promocao AS pr ON pp.id_promocao = pr.id
WHERE
  pr.ativo = 1
  AND curdate() BETWEEN pr.data_inicio AND coalesce(pr.data_fim, curdate())
ORDER BY
  pr.valor_desconto DESC;

-- 6. view: faturamento mensal
CREATE
OR REPLACE VIEW vw_faturamento_mensal AS
SELECT
  date_format(v.data_venda, '%y-%m') AS mes,
  count(v.id) AS total_vendas,
  sum(iv.quantidade * iv.preco_unitario) AS faturamento_bruto,
  sum(
    CASE
      WHEN iv.id_promocao IS NOT NULL THEN (
        iv.quantidade * iv.preco_unitario * (1 - (pr.valor_desconto / 100))
      )
      ELSE (iv.quantidade * iv.preco_unitario)
    END
  ) AS faturamento_liquido
FROM
  venda AS v
  LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
  LEFT JOIN promocao AS pr ON iv.id_promocao = pr.id
GROUP BY
  date_format(v.data_venda, '%y-%m')
ORDER BY
  mes DESC;

-- 7. view: fornecedores e seus produtos
CREATE
OR REPLACE VIEW vw_fornecedores_produtos AS
SELECT
  f.id AS fornecedor_id,
  f.nome AS fornecedor,
  count(p.id) AS total_produtos,
  GROUP_CONCAT(p.nome SEPARATOR ', ') AS lista_produtos
FROM
  fornecedor AS f
  LEFT JOIN produto AS p ON f.id = p.id_fornecedor
GROUP BY
  f.id,
  f.nome
ORDER BY
  total_produtos DESC;

-- 8. view: métodos de pagamento mais utilizados
CREATE
OR REPLACE VIEW vw_metodos_pagamento_utilizados AS
SELECT
  fp.id AS metodo_id,
  fp.nome AS metodo_pagamento,
  count(v.id) AS total_utilizacoes,
  sum(iv.quantidade * iv.preco_unitario) AS valor_total
FROM
  forma_pagamento AS fp
  LEFT JOIN venda AS v ON fp.id = v.id_forma_pagamento
  LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
GROUP BY
  fp.id,
  fp.nome
ORDER BY
  total_utilizacoes DESC;

-- 9. view: categorias e faturamento
CREATE
OR REPLACE VIEW vw_categorias_faturamento AS
SELECT
  c.id AS categoria_id,
  c.nome AS categoria,
  count(DISTINCT p.id) AS total_produtos,
  sum(iv.quantidade) AS total_vendido,
  sum(iv.quantidade * iv.preco_unitario) AS faturamento
FROM
  categoria AS c
  LEFT JOIN produto AS p ON c.id = p.id_categoria
  LEFT JOIN item_venda AS iv ON p.id = iv.id_produto
GROUP BY
  c.id,
  c.nome
ORDER BY
  faturamento DESC;

-- 10. view: histórico completo de vendas (detalhado)
CREATE
OR REPLACE VIEW vw_historico_vendas_detalhado AS
SELECT
  v.id AS venda_id,
  v.data_venda,
  c.nome AS cliente,
  f.nome AS funcionario,
  fp.nome AS forma_pagamento,
  p.nome AS produto,
  iv.quantidade,
  iv.preco_unitario,
  coalesce(pr.nome, 'sem promoção') AS promocao,
  (iv.quantidade * iv.preco_unitario) AS subtotal
FROM
  venda AS v
  LEFT JOIN cliente AS c ON v.id_cliente = c.id
  LEFT JOIN funcionario AS f ON v.id_funcionario = f.id
  LEFT JOIN forma_pagamento AS fp ON v.id_forma_pagamento = fp.id
  LEFT JOIN item_venda AS iv ON v.id = iv.id_venda
  LEFT JOIN produto AS p ON iv.id_produto = p.id
  LEFT JOIN promocao AS pr ON iv.id_promocao = pr.id
ORDER BY
  v.data_venda DESC;

COMMIT;

END $$
delimiter ;
