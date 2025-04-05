show databases;
use treinamentosql;
show tables;
desc pessoas;
create function first_function (numA decimal(10,2), numB int) 
returns int deterministic
    return numA + numB;

select first_function(10.2, 2) as soma;