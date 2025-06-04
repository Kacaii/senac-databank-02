use loja_de_roupas;

start transaction;

alter table cliente
add column data_nascimento DATE;

alter table venda
add column observacoes VARCHAR(255);

alter table venda
add column codigo_rastreamento VARCHAR(50);

alter table produto
add column material VARCHAR(50);

alter table funcionario
add column cpf TEXT;

alter table fornecedor add column cnpj TEXT;

alter table cliente
add column limite_credito DECIMAL(10, 2) default 0;

alter table produto add column peso DECIMAL(10, 3);

alter table produto add column ativo BOOLEAN default 1;

commit;
