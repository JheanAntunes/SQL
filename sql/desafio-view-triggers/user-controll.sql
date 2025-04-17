create user 'supervisor'@localhost identified by '202020';
grant all privileges on ecommerce.clienteswithorder to 'supervisor'@localhost;
grant all privileges on ecommerce.fornecedoresprodutos_vw to 'supervisor'@localhost;
grant all privileges on ecommerce.produtosestoques to 'supervisor'@localhost;