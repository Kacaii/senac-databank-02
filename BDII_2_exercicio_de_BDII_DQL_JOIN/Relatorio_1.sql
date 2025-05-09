use petshop;

select
    empregado.nome as nome_empregado,
    empregado.cpf as cpf_empregado,
    empregado.dataadm as data_admissao,
    empregado.salario,
    departamento.nome as departamento,
    telefone.numero as numero_de_telefone
from
    empregado
left join
    departamento
    on empregado.departamento_iddepartamento = departamento.iddepartamento
left join
    telefone on empregado.cpf = telefone.empregado_cpf
where
    empregado.dataadm between '2019-01-01' and '2022-03-31'
order by empregado.dataadm desc;
