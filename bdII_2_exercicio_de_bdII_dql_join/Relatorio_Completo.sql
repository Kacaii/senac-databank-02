use petshop;

select
    e.nome as nome_empregado,
    e.cpf as cpf_empregado,
    e.dataadm as data_admissao,
    e.salario,
    d.nome as departamento,
    t.numero as numero_de_telefone
from
    empregado as e
left join
    departamento as d
    on e.departamento_iddepartamento = d.iddepartamento
left join
    telefone as t
    on e.cpf = t.empregado_cpf
where
    e.dataadm between '2019-01-01' and '2022-03-31'
order by e.dataadm desc;
use petshop;

select
    e.nome as nome_empregado,
    e.cpf as cpf_empregado,
    e.dataadm as data_admissao,
    d.nome as departamento,
    t.numero as numero_de_telefone,
    concat('R$ ', round(e.salario, 2)) as salario
from
    empregado as e
left join
    departamento as d
    on e.departamento_iddepartamento = d.iddepartamento
left join
    telefone as t
    on e.cpf = t.empregado_cpf
where
    e.salario <= (select avg(empregado.salario) from empregado)
order by e.nome asc;
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
use petshop;

select
    e.nome,
    e.cpf,
    case
        when e.sexo = 'F' then 'Feminino'
        when e.sexo = 'M' then 'Masculino'
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
use petshop;

select
    substring(v.data, 1, 10) as data_venda,
    count(v.idvenda) as quantida_de_vendas,
    concat('R$ ', sum((v.valor - v.desconto))) as valor_total
from
    venda as v
group by data_venda
order by data_venda desc;
use petshop;

select
    p.nome as produto,
    f.nome as forncecedor,
    f.email as email_fornecedor,
    t.numero as numero_fornecedor,
    substring_index(p.nome, ' ', 1) as categoria,
    concat('R$ ', round(p.valorvenda, 2)) as valor_produto
from
    produtos as p
left join
    itenscompra as ic
    on p.idproduto = ic.produtos_idproduto
left join
    compras as c
    on ic.compras_idcompra = c.idcompra
left join
    fornecedor as f
    on c.fornecedor_cpf_cnpj = f.cpf_cnpj
left join
    telefone as t
    on f.cpf_cnpj = t.fornecedor_cpf_cnpj
order by produto;
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
