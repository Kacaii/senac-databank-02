use petshop;

select
    substring(v.data, 1, 10) as data_venda,
    count(v.idvenda) as quantida_de_vendas,
    concat('R$ ', sum((v.valor - v.desconto))) as valor_total
from
    venda as v
group by data_venda
order by data_venda desc;
