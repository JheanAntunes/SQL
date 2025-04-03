-- Explorando os cmd DDL

SELECT NOW() AS Timestamp;

create database if not exists manipulation;
show databases;
use manipulation;

CREATE TABLE bankAccounts (
    Id_account INT AUTO_INCREMENT PRIMARY KEY,
    Ag_num INT NOT NULL,
    Ac_num INT NOT NULL,
    Saldo FLOAT,
    CONSTRAINT identification_account_constraint UNIQUE (Ag_num , Ac_num)
);

insert into bankAccounts (Ag_num,Ac_num,Saldo) values(1235,157,3000);

SELECT 
    *
FROM
    bankAccounts;

desc bankAccounts;
-- add attribute limitCredit

alter table bankAccounts add LimiteCredito float not null default 500.00;

-- drop attribute
alter table bankAccounts add Email varchar(50);
alter table bankAccounts drop column Email;

CREATE TABLE bankClient (
    Id_cliente INT AUTO_INCREMENT,
    ClientAccount INT,
    CPF VARCHAR(11) NOT NULL,
    RG CHAR(9) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    Renda_mensal FLOAT,
    PRIMARY KEY (Id_cliente , ClientAccount),
    CONSTRAINT fk_account_client FOREIGN KEY (ClientAccount)
        REFERENCES bankAccounts (Id_account)
        ON UPDATE CASCADE
);

insert into bankClient (ClientAccount,CPF,RG,Nome,endereco,Renda_mensal) values(
1, 20575340738, 123456987, 'Jhean', 'rua lá', 1512.00
);

SELECT 
    *
FROM
    bankClient;

alter table bankClient add UFF char(2) not null default 'RJ';

UPDATE bankClient AS b 
SET 
    b.UFF = 'MG'
WHERE
    Id_cliente = 1;


SELECT 
    c.Id_account,
    bankClient.ClientAccount,
    bankClient.Nome,
    c.Saldo, c.LimiteCredito,
    Renda_mensal
FROM
    bankAccounts AS c,
    bankClient
WHERE
    bankClient.ClientAccount = c.Id_account;

CREATE TABLE banktransaction (
    Id_transaction INT AUTO_INCREMENT PRIMARY KEY,
    Ocorreencia DATETIME,
    Status_transaction VARCHAR(20),
    Valor_transferido FLOAT,
    Source_account INT,
    Destination_account INT,
    CONSTRAINT fk_source_transaction FOREIGN KEY (Source_account)
        REFERENCES bankAccounts (Id_account),
    CONSTRAINT fk_destination_transaction FOREIGN KEY (Destination_account)
        REFERENCES bankAccounts (Id_account)
) 
SELECT 
    *
FROM
    information_schema.table_constraints
WHERE
    constraint_schema = 'manipulation';