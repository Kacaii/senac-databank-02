use petshop;

select
    svc.nome as nome_servico,
    sum(isvc.quantidade) as vendas_realizadas,
    concat('R$', sum((isvc.valor - isvc.desconto) * isvc.quantidade))
        as valor_total
from
    itensservico as isvc
inner join
    servico as svc
    on isvc.servico_idservico = svc.idservico
group by svc.nome
order by vendas_realizadas desc;
