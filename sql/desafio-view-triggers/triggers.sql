DELIMITER $$

CREATE TRIGGER StoredRemovedClients
BEFORE DELETE
ON clientes
FOR EACH ROW
BEGIN
    -- Adicionando o usuário removido na tabela de RemovedClients
    INSERT INTO RemovedClients (idCliente, Fname, cpf, address, email, telefone, dataCadastro)
    VALUES (OLD.idCliente, OLD.Fname, OLD.cpf, OLD.address, OLD.email, OLD.telefone, OLD.dataCadastro);
END $$

DELIMITER ;

-- adicionando um novo cliente:
call insertclient('Sad', 'P', 'Set', '45345372901', 'Rua dos triste, 483', @statusInsert);
SELECT @statusInsert;

-- simulação: Removendo um usuario existente;
DELETE FROM clientes 
WHERE
    Fname = 'sad';

create table if not exists RemovedClients (
	idCliente int not null primary key,
    Fname varchar(50),
    cpf char(11),
    address varchar(50),
    email varchar(50),
    telefone varchar(50),
    dataCadastro DATE
);

select * from RemovedClients;