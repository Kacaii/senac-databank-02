USE loja_de_roupas;

START TRANSACTION;

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS sp_relatorio_vendas_periodo(IN p_data_inicio DATE, IN p_data_fim DATE)
BEGIN

SELECT
  v.id AS id_venda,
  v.data_venda,
  c.nome AS cliente,
  f.nome AS funcionario,
  fp.nome AS forma_pagamento,
  SUM(iv.preco_unitario * iv.quantidade) AS total_venda
FROM
  Venda v
  JOIN Cliente c ON v.id_cliente = c.id
  JOIN Funcionario f ON v.id_funcionario = f.id
  JOIN Forma_Pagamento fp ON v.id_forma_pagamento = fp.id
  JOIN Item_Venda iv ON v.id = iv.id_venda
WHERE
  v.data_venda BETWEEN p_data_inicio AND p_data_fim
GROUP BY
  v.id,
  v.data_venda,
  c.nome,
  f.nome,
  fp.nome
ORDER BY
  v.data_venda;

END $$
DELIMITER ;

COMMIT;
