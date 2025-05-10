use petshop;

select
    p.nome as nome_pet,
    v.data as data_servico,
    s.nome as nome_servico,
    i.quantidade,
    e.nome as empregado,
    CONCAT('R$ ', ROUND(i.valor, 2)) as valor_servico
from
    pet as p
inner join
    itensservico as i
    on p.idpet = i.pet_idpet
inner join
    venda as v
    on i.venda_idvenda = v.idvenda
inner join
    servico as s
    on i.servico_idservico = s.idservico
inner join
    empregado as e
    on i.empregado_cpf = e.cpf
order by data_servico asc;
