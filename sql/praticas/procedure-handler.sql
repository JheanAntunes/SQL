DELIMITER $$
CREATE PROCEDURE exemplo_loop()
BEGIN
    DECLARE contador INT DEFAULT 1;

    loop_exemplo: LOOP
        -- Mostra o valor atual do contador
        SELECT contador;

        -- Incrementa o contador
        SET contador = contador + 1;

        -- Sai do loop quando o contador for maior que 5
        IF contador > 5 THEN
            LEAVE loop_exemplo;
        END IF;
    END LOOP;
END $$
DELIMITER ;
CALL exemplo_loop();

DELIMITER $$

CREATE PROCEDURE exemplo_while()
BEGIN
    DECLARE soma INT DEFAULT 0;
    DECLARE contador INT DEFAULT 1;

    WHILE contador <= 10 DO
        SET soma = soma + contador; -- Soma o valor do contador
        SET contador = contador + 1; -- Incrementa o contador
    END WHILE;

    SELECT soma AS resultado_final; -- Mostra o total
END $$

DELIMITER ;
CALL exemplo_while();

DELIMITER $$
CREATE PROCEDURE exemplo_repeat()
BEGIN
    DECLARE contador INT DEFAULT 1;

    REPEAT
        SELECT contador; -- Mostra o valor atual do contador
        SET contador = contador + 1; -- Incrementa o contador
    UNTIL contador > 5 -- Sai quando a condição é verdadeira
    END REPEAT;
END $$
DELIMITER ;
	DELIMITER $$
		CREATE PROCEDURE exemplo_handler()
		BEGIN
				DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
						SET @erro = 'Ocorreu um erro, mas estamos continuando!';
				
				-- Tentativa de divisão por zero (gera erro)
				SET @resultado = 10 / 0;

				-- O próximo código será executado mesmo após o erro
				SET @mensagem = 'Execução continuada após o erro!';
				SELECT @mensagem;

               
		END $$

	DELIMITER ;
CALL exemplo_handler();