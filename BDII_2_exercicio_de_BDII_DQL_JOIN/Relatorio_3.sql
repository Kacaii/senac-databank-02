use petshop;

select
    d.nome as departamento,
    count(e.cpf) as quantidade_de_empregados,
    concat('R$ ', round(avg(e.salario), 2)) as media_salarial,
    concat('R$ ', round(avg(e.comissao), 2)) as media_comissao
from
    departamento as d
inner join
    empregado as e
    on d.iddepartamento = e.departamento_iddepartamento
group by d.iddepartamento
order by d.nome asc;
