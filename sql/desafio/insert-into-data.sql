-- insert into data
show tables;
use ecommerce;

INSERT INTO Clientes (Fname, Minit, Lname, CPF, address)
VALUES
('João', 'P', 'Silva', '12345678901', 'Rua das Flores, 123'),
('Maria', 'A', 'Oliveira', '98765432100', 'Av. Brasil, 456'),
('Pedro', 'M', 'Santos', '11122233344', 'Rua do Campo, 789');

INSERT INTO payments (idPayment, idCliente, statusPayment, startDate, typePayment, limitAvailabre)
VALUES
(1, 1, TRUE, '2025-03-01', 'Cartão', 500.00),
(2, 2, FALSE, '2025-03-05', 'Boleto', 300.00),
(3, 3, TRUE, '2025-03-10', 'Dois cartões', 1000.00);

INSERT INTO Pedidos (idCliente, statusPedido, frete, description, paymentCash,idPayment)
VALUES
(1, 'Enviado', 15.50, 'Pedido de maquiagem',0,1),
(2, 'Entregue', 25.00, 'Pedido de roupas',1,2),
(3, 'Processando', 10.00, 'Pedido de tecnologia',0,3);

INSERT INTO PRODUTOS (idProduto, categoria, descricao, valor,Pname)
VALUES
(1, 'maquiagem', 'Batom Vermelho', 20.00, 'batom'),
(2, 'roupas', 'Camiseta Branca', 50.00,'casaco'),
(3, 'tech', 'Fone de Ouvido', 150.00, 'mouse');

INSERT INTO Estoque (idEstoque, localidade, qtd)
VALUES
(1, 'São Paulo', 100),
(2, 'Rio de Janeiro', 50),
(3, 'Belo Horizonte', 30);

INSERT IGNORE INTO RelationshipClientePedido (idPedido, IdCliente, qtd, statusPedidoProduto)
VALUES
(2, 2, 1, 'Entregue'),
(3, 3, 3, 'Processando');


INSERT INTO ProdutoEstoque (idProduto, idEstoque, qtd)
VALUES
(1, 1, 20),
(2, 2, 10),
(3, 3, 15);

INSERT INTO TerceiroVendedor (idTerceiroVendedor, razaoSocial, localidade, nameFantasy, cnpj,cpf,contato)
VALUES
(1, 'Vendedor A Ltda.', 'São Paulo', 'Loja A',15423651289875,124398987,41752863968),
(2, 'Vendedor B S.A.', 'Rio de Janeiro', 'Loja B',15423656489875,458762549,46856267841),
(3, 'Vendedor C Comércio', 'Belo Horizonte', 'Loja C',15423426589875,561498753,12354967853);

INSERT INTO ProdutoTerceiroVendedor (idProduto, idTerceiroVendedor)
VALUES
(1, 1),
(2, 2),
(3, 3);


INSERT INTO Fornecedor (idFornecedor, razaoSocial, cnpj, contato)
VALUES
(1, 'Fornecedor X', '12345678000101',56149837525),
(2, 'Fornecedor Y', '98765432000101',53941852723),
(3, 'Fornecedor Z', '11122233000101',39575142620);

INSERT INTO FornecedoresProdutos (idFornecedor, idProduto)
VALUES
(1, 1),
(2, 2),
(3, 3);
