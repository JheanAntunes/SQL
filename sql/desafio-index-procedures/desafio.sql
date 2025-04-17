use ecommerce;

DELIMITER $$ 
CREATE PROCEDURE InsertClient(
    IN Fname VARCHAR(30), 
    IN Minit VARCHAR(30), 
    IN Lname VARCHAR(30), 
    IN CPF CHAR(11), 
    IN address VARCHAR(60),
    OUT statusInsert VARCHAR(50)
) 
BEGIN
    -- Configura o handler para capturar exceções
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
    BEGIN
        SET statusInsert = 'Error: Falha ao inserir novo usuário';
    END;

    -- Define o valor padrão para o status
    SET statusInsert = 'Usuário novo adicionado';

    -- Realiza a operação de inserção
    INSERT INTO Clientes (Fname, Minit, Lname, CPF, Address)
    VALUES (Fname, Minit, Lname, CPF, address);

END $$ 
DELIMITER ;

call insertclient('Sad', 'P', 'Set', '45345372901', 'Rua dos triste, 483', @statusInsert);
select @statusInsert;

drop procedure payments;
DELIMITER $$
CREATE PROCEDURE paymentscategoria(
IN p_idPayment INT, 
IN p_idCliente INT, 
IN p_statusPayment BOOL, 
IN p_startDate DATE, 
IN p_typePayment ENUM('Boleto', 'Cartão', 'Dois cartões'), 
IN p_limitAvailabre FLOAT,
OUT statusInsertPayments varchar(50)
)
BEGIN
-- tratamento de error
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    begin
     SET statusInsertPayments = 'Error: Falha ao inserir novo payments';
    end;
	 -- Define o valor padrão para o status
    SET statusInsertPayments = 'um novo payments adicionado';
    insert INTO payments(idPayment, idCliente, statusPayment, startDate, typePayment, limitAvailabre) Values (p_idPayment, p_idCliente, p_statusPayment, p_startDate, p_typePayment, p_limitAvailabre);
END $$ 
DELIMITER ;

select * from clientes as c JOIN payments as p on c.idCliente = p.idPayment;

call payments(5, 5, TRUE, '2025-08-05', 'Cartão', 300.00, @statusInsertPayments);
select @statusInsertPayments;

show index from clientes;
CREATE INDEX index_cpf ON clientes(cpf);
CREATE INDEX index_Fname ON clientes(fname);
DROP INDEX index_cpf on clientes;
/*
idx not clusted João -> ponteiro aponta para o idx clusted -> mysql pega o ponteiro do idx-clusted que está referenciado o registro no armazenamento
idx not clusted Maria -> ponteiro para idx clusted
idx not clusted Pedro -> ponteiro para idx clusted
idx not clusted phenthe -> ponteiro para idx clusted
idx not clusted Sad -> ponteiro para idx clusted
*/

 EXPLAIN select * from clientes as c where c.cpf = 45345372901;
 EXPLAIN select * from clientes as c where c.idCliente = 4;
 EXPLAIN select * from clientes as c where c.fname = 'Sad';
 
 