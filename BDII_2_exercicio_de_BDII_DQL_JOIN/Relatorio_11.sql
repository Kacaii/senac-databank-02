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
