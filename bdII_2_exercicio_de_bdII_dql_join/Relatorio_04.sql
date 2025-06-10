use petshop;

select
    e.nome,
    e.cpf,
    case
        when e.sexo = 'F' then 'Feminino'
        when e.sexo = 'M' then 'Masculino'
    end as 'genero',
    concat('R$ ', round(e.salario, 2)) as salario,
    count(v.empregado_cpf) as vendas_realizadas,
    concat(
        'R$ ',
        coalesce(sum((v.valor - v.desconto)), 0)
    ) as valor_total_vendas,
    concat('R$ ', sum(e.comissao)) as total_comissao
from
    empregado as e
left join
    venda as v
    on e.cpf = v.empregado_cpf
group by e.cpf
order by vendas_realizadas desc;
