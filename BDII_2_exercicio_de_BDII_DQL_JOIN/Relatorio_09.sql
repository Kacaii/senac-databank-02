use petshop;

select
    fpg.tipo as forma_pagamento,
    count(fpg.venda_idvenda) as vendas_realizadas
from
    venda as v
inner join
    formapgvenda as fpg
    on v.idvenda = fpg.venda_idvenda
group by fpg.tipo
order by vendas_realizadas desc;
