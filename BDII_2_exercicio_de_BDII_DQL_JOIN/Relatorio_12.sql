use petshop;

select
    p.nome as produto,
    round(sum(ivp.quantidade), 0) as quantidade_total_vendida,
    concat('R$ ', round(
        coalesce(
            sum((ivp.valor - ivp.desconto) * ivp.quantidade),
            0
        ), 2
    )) as valor_total
from
    itensvendaprod as ivp
left join
    produtos as p
    on ivp.produto_idproduto
group by produto
order by quantidade_total_vendida desc;
