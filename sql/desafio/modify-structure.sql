-- modify structure
show databases;
use ecommerce;
show tables;

-- add column email, telefone, dataCadastro table client & fornecedor & terceiroVendedor
alter table clientes add column(email varchar(80) null, telefone varchar(9) null, dataCadastro date);
alter table fornecedor add column(email varchar(80) null, telefone varchar(9) null, dataCadastro date);
alter table terceiroVendedor add column(email varchar(80) null, telefone varchar(9) null, dataCadastro date);
-- visualizar modificações
desc clientes;
desc fornecedor;
desc terceiroVendedor;