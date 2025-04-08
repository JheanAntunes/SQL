use treinamentosql;
show tables;
desc pessoas;
/*
DELIMITER //
CREATE TRIGGER nome_do_trigger
[BEFORE | AFTER] [INSERT | UPDATE | DELETE]
ON nome_da_tabela
FOR EACH ROW
BEGIN
    -- Lógica do trigger aqui
    -- Pode incluir condições, validações, mensagens de erro ou outras ações.
END;
//
DELIMITER ;
*/

DROP TRIGGER middlewareInsertPerson;
DELIMITER //
CREATE TRIGGER valida_idade_insere 
BEFORE INSERT ON pessoas 
FOR EACH ROW 
BEGIN
    IF NEW.idade < 18 THEN
        INSERT INTO mensagens_erro (mensagem) VALUES ('Idade deve ser maior ou igual a 18.');
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro de validação no trigger.';
    END IF;
END;
delimiter ;

 INSERT INTO pessoas (id, nome, idade, cidade, profissao) VALUES ('11','JEGEAN',11, 'Rio de Janeiro', 'Artist');

CALL insertPersons(11, 'JEGEAN', 11, 'Rio de Janeiro', 'Artist', @resultado);
SELECT @resultado;
select * from pessoas;

CREATE TABLE mensagens_erro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mensagem VARCHAR(255)
);