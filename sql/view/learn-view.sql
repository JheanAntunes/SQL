show databases;
use ecommerce;
show tables;

desc produtos;
-- view: clientes que tem pedidos;
CREATE VIEW ClientesWithOrders (Nome, address , telefone , idPedido , statusPedido , frete , description , paymentCash , idPayment) AS
    SELECT 
      Concat(Fname, Minit, Lname) as Nome , address , telefone , idPedido , statusPedido , frete , description , paymentCash , idPayment
    FROM
        clientes
            JOIN
        pedidos ON clientes.idCliente = pedidos.idCliente;

select * from ClientesWithOrders order by frete DESC;

-- UPDATE VIEW
CREATE OR REPLACE VIEW ClientesWithOrders (Nome, address , telefone , Pedido_id, statusPedido , frete , description , paymentCash , idPayment, qtd) AS
    SELECT 
      Concat(Fname, Minit, Lname) as Nome , address , telefone , pedidos.idPedido as Pedido_id , statusPedido , frete , description , paymentCash , idPayment, qtd 
    FROM
        clientes
            JOIN
        pedidos ON clientes.idCliente = pedidos.idPedido JOIN relationshipclientepedido on pedidos.idPedido = relationshipclientepedido.idPedido;
        
-- DROP VIEW
DROP VIEW ClientesWithOrders;