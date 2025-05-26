show tables;

select * from clientes;

-- Shared locks nivel of table
-- bloqueio compartilhado: Permite leituras de transações concorrentes, porém impede modificações!
lock tables clientes read;

-- Desbloquear
unlock tables;


-- Exclusive locks nivel of table
-- bloquei exclusivo: Somente está session/transaction tem o direito de leitura e escrita, as outras não tem até que o bloquio esteja ativado.
lock tables clientes write;
select Fname, minit, lname from clientes;
update clientes set minit = 'J' where idcliente = 2;

unlock table;
