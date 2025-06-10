delimiter $$
create procedure sp_create_views()
begin 

start transaction;

-- 1. view: produtos com estoque baixo (quantidade < 20)
create or replace view vw_estoque_baixo as
select
    p.id,
    p.nome,
    p.marca,
    e.quantidade,
    p.preco
from produto as p
left join estoque as e on p.id = e.id_produto
where e.quantidade < 20
order by e.quantidade asc;


-- 2. view: vendas por cliente (total gasto)
create or replace view vw_vendas_por_cliente as
select
    c.id as cliente_id,
    c.nome as cliente,
    count(v.id) as total_compras,
    sum(iv.quantidade * iv.preco_unitario) as total_gasto
from cliente as c
left join venda as v on c.id = v.id_cliente
left join item_venda as iv on v.id = iv.id_venda
group by c.id, c.nome
order by total_gasto desc;


-- 3. view: produtos mais vendidos (ranking)
create or replace view vw_produtos_mais_vendidos as
select
    p.id,
    p.nome,
    p.marca,
    sum(iv.quantidade) as total_vendido,
    sum(iv.quantidade * iv.preco_unitario) as faturamento_total
from produto as p
left join item_venda as iv on p.id = iv.id_produto
group by p.id, p.nome, p.marca
order by total_vendido desc
limit 20;


-- 4. view: vendas por funcionário (performance)
create or replace view vw_vendas_por_funcionario as
select
    f.id as funcionario_id,
    f.nome as funcionario,
    f.cargo,
    count(v.id) as total_vendas,
    sum(iv.quantidade * iv.preco_unitario) as faturamento_gerado
from funcionario as f
left join venda as v on f.id = v.id_funcionario
left join item_venda as iv on v.id = iv.id_venda
group by f.id, f.nome, f.cargo
order by faturamento_gerado desc;


-- 5. view: produtos em promoção ativa
create or replace view vw_produtos_em_promocao as
select
    p.id as produto_id,
    p.nome as produto,
    pr.nome as promocao,
    pr.valor_desconto as desconto_percentual,
    p.preco as preco_original,
    (p.preco * (1 - (pr.valor_desconto / 100))) as preco_promocional
from produto as p
left join promocao_produto as pp on p.id = pp.id_produto
left join promocao as pr on pp.id_promocao = pr.id
where
    pr.ativo = 1
    and curdate() between pr.data_inicio and coalesce(
        pr.data_fim, curdate()
    )
order by pr.valor_desconto desc;


-- 6. view: faturamento mensal
create or replace view vw_faturamento_mensal as
select
    date_format(v.data_venda, '%y-%m') as mes,
    count(v.id) as total_vendas,
    sum(iv.quantidade * iv.preco_unitario) as faturamento_bruto,
    sum(case
        when iv.id_promocao is not null
            then
                (
                    iv.quantidade
                    * iv.preco_unitario
                    * (1 - (pr.valor_desconto / 100))
                )
        else (iv.quantidade * iv.preco_unitario)
    end) as faturamento_liquido
from venda as v
left join item_venda as iv on v.id = iv.id_venda
left join promocao as pr on iv.id_promocao = pr.id
group by date_format(v.data_venda, '%y-%m')
order by mes desc;


-- 7. view: fornecedores e seus produtos
create or replace view vw_fornecedores_produtos as
select
    f.id as fornecedor_id,
    f.nome as fornecedor,
    count(p.id) as total_produtos,
    group_concat(p.nome separator ', ') as lista_produtos
from fornecedor as f
left join produto as p on f.id = p.id_fornecedor
group by f.id, f.nome
order by total_produtos desc;


-- 8. view: métodos de pagamento mais utilizados
create or replace view vw_metodos_pagamento_utilizados as
select
    fp.id as metodo_id,
    fp.nome as metodo_pagamento,
    count(v.id) as total_utilizacoes,
    sum(iv.quantidade * iv.preco_unitario) as valor_total
from forma_pagamento as fp
left join venda as v on fp.id = v.id_forma_pagamento
left join item_venda as iv on v.id = iv.id_venda
group by fp.id, fp.nome
order by total_utilizacoes desc;


-- 9. view: categorias e faturamento
create or replace view vw_categorias_faturamento as
select
    c.id as categoria_id,
    c.nome as categoria,
    count(distinct p.id) as total_produtos,
    sum(iv.quantidade) as total_vendido,
    sum(iv.quantidade * iv.preco_unitario) as faturamento
from categoria as c
left join produto as p on c.id = p.id_categoria
left join item_venda as iv on p.id = iv.id_produto
group by c.id, c.nome
order by faturamento desc;


-- 10. view: histórico completo de vendas (detalhado)
create or replace view vw_historico_vendas_detalhado as
select
    v.id as venda_id,
    v.data_venda,
    c.nome as cliente,
    f.nome as funcionario,
    fp.nome as forma_pagamento,
    p.nome as produto,
    iv.quantidade,
    iv.preco_unitario,
    ifnull(pr.nome, 'sem promoção') as promocao,
    (iv.quantidade * iv.preco_unitario) as subtotal
from venda as v
left join cliente as c on v.id_cliente = c.id
left join funcionario as f on v.id_funcionario = f.id
left join forma_pagamento as fp on v.id_forma_pagamento = fp.id
left join item_venda as iv on v.id = iv.id_venda
left join produto as p on iv.id_produto = p.id
left join promocao as pr on iv.id_promocao = pr.id
order by v.data_venda desc;

commit;

end $$
delimiter ;
