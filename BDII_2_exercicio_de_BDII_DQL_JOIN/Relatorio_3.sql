use petshop;

select
    d.nome as departamento,
    COUNT(e.cpf) as quantidade_de_empregados,
    CONCAT('R$ ', ROUND(AVG(e.salario), 2)) as media_salarial,
    CONCAT('R$ ', ROUND(AVG(e.comissao), 2)) as media_comissao
from
    departamento as d
inner join
    empregado as e
    on d.iddepartamento = e.departamento_iddepartamento
group by d.iddepartamento
order by d.nome;
