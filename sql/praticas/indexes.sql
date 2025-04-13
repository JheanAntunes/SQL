create database if not exists customer_managment;
use customer_managment;
drop table customes;
create table custosmers(
	customer_id SMALLINT UNSIGNED auto_increment primary key,
    store_id tinyint NOT NULL,
    first_name varchar(45) not null,
    last_name varchar(45) not null,
    email varchar(40),
    cpf char(9),
    active boolean not null default true,
    create_date datetime not null,
    last_update timestamp default current_timestamp,
    address varchar(30),
    KEY idx_fk_store_id (store_id),
	KEY idx_fk_address_id (address_id),
    KEY idx_last_name (last_name)
);

show index from customer;

 alter table customer_managment.customer add index active_customers_index (active);

CREATE TABLE exemplo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60),
    ativo BOOLEAN DEFAULT TRUE,
    email VARCHAR(50)
)  ENGINE=MEMORY;

create index idx_hash_ativo on exemplo(ativo) using hash;
create index idx_btree_ativo on exemplo(nome) using btree;
show index from exemplo;
