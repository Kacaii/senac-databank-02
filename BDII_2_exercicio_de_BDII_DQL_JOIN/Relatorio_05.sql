use petshop;

select
    e.nome,
    e.cpf,
    case
        when e.sexo = 'F' then 'Feminino'
        when e.sexo = 'M' then 'Masculino'
        else 'Não-Binário'
    end as 'genero',
    concat('R$ ', round(e.salario, 2)) as salario,
    count(i.empregado_cpf) as vendas_servico_realizadas,
    concat(
        'R$ ',
        coalesce(
            sum((i.valor - i.desconto) * i.quantidade),
            0
        )
    ) as valor_total_vendas_servico,
    concat('R$ ', sum(e.comissao)) as total_comissao
from
    empregado as e
left join
    itensservico as i
    on e.cpf = i.empregado_cpf
group by e.cpf
order by vendas_servico_realizadas desc;
