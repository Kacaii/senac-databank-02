use petshop;

select
    c.nome,
    v.data as data_venda,
    e.nome as empregado,
    concat('R$ ', round(v.valor, 2)) as valor_inicial,
    concat('R$ ', round(v.desconto, 2)) as desconto,
    concat('R$ ', round((v.valor - v.desconto), 2)) as valor_final
from
    venda as v
inner join
    cliente as c
    on v.cliente_cpf = c.cpf
inner join
    empregado as e
    on v.empregado_cpf = e.cpf
order by data_venda asc;
