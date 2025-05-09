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
    e.salario <= (select AVG(empregado.salario) from empregado)
order by e.nome asc;
