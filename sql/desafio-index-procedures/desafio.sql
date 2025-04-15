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

call insertclient('phenthe', 'P', 'MOLHO', '15345672901', 'Rua das mudas, 173', @statusInsert);
select @statusInsert;

drop procedure payments;
DELIMITER $$
CREATE PROCEDURE payments(
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

select * from clientes;

call payments(4, 4, TRUE, '2025-08-05', 'Cartão', 300.00, @statusInsertPayments);
select @statusInsertPayments;