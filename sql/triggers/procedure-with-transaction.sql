-- procedure with transaction

drop procedure sql_fail;

delimiter //

create procedure sql_fail(in nome varchar(20))
	begin
	 declare exit handler for sqlexception
		 begin 
			rollback;
            select 'A transação foi abortada devido algum problema' as message;
		 end;
		 
		start transaction;
		
		insert into clientes(
		Fname,
		Minit,
		Lname,
		CPF,
		address
		) values (nome, 'A', 'L', 19345378755, 'south africa');
        
        commit;
	end //
delimiter ;

call sql_fail('girafa');
select * from clientes;

delimiter //

create procedure sql_fail_error(in nome varchar(20))
	begin
	 declare exit handler for sqlexception
		 begin 
			rollback;
            select 'A transação foi abortada devido algum problema' as message;
		 end;
		 
		start transaction;
		
		insert into clientes(
		Fname,
		Minit,
		Lname,
		CPF,
		address
		) values (nome, 'A', 'L', 19345378755, 'south africa');
        
        commit;
	end //
delimiter ;

call sql_fail_error('girafa');
select * from clientes;