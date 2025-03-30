show databases;
create database if not exists workshop;
use workshop;
-- criar a tabela de clientes;
CREATE TABLE clientes (
    cliente_id INT NOT NULL,
    cliente_name VARCHAR(45) NOT NULL,
    cliente_phoneNumber VARCHAR(9) NOT NULL,
    cliente_email VARCHAR(45) NOT NULL,
    cliente_address VARCHAR(45) NULL,
    PRIMARY KEY (cliente_id)
);

-- CRIAR A TABELA DE VEHICLE
CREATE TABLE VEHICLES (
    vehicle_id INT NOT NULL,
    cliente_id INT NOT NULL,
    placa CHAR(7) NOT NULL,
    marca VARCHAR(45) NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    ano DATE NOT NULL,
    CONSTRAINT vehicles_unique_placa UNIQUE (placa),
    PRIMARY KEY (vehicle_id),
    CONSTRAINT fk_vehicles_cliente_id FOREIGN KEY (cliente_id)
        REFERENCES clientes (cliente_id)
);

-- Criar a tabela de employee
CREATE TABLE employee (
    employee_id INT NOT NULL,
    employee_name VARCHAR(45) NOT NULL,
    employee_cargo ENUM('Aux', 'Mecanico') DEFAULT 'Aux',
    employee_salary FLOAT NOT NULL,
    PRIMARY KEY (employee_id)
);

-- Criar a tabbela de Service
CREATE TABLE service (
    service_id INT NOT NULL PRIMARY KEY,
    description VARCHAR(45) NOT NULL,
    price FLOAT NOT NULL
);

-- Criar a tabela de OS
CREATE TABLE ServicoOrders (
    servicoOrders_id INT NOT NULL,
    employee_id INT NOT NULL,
    vehicle_id INT NOT NULL,
	dataAbertura DATE NOT NULL,
    dataConclusao DATE NOT NULL,
    statusOs ENUM('Aberto', 'Em andamento', 'Concluído') DEFAULT 'Aberto',
    PRIMARY KEY(servicoOrders_id),
    CONSTRAINT fk_ServiceOrders_vehicle_id foreign key(vehicle_id) references vehicles(vehicle_id),
    CONSTRAINT fk_ServiceOrders_employee_id foreign key(employee_id) references employee(employee_id)
);

-- Criar a tabela intermediária ServicoOrders & Service
CREATE TABLE itensOs (
    servicoOrders_id INT NOT NULL,
    service_id INT NOT NULL,
    qtd INT NOT NULL,
    PRIMARY KEY (servicoOrders_id , service_id),
    CONSTRAINT fk_itensOs_servicoOrders_id FOREIGN KEY (servicoOrders_id)
        REFERENCES ServicoOrders (servicoOrders_id),
    CONSTRAINT fk_itensOs_service_id FOREIGN KEY (service_id)
        REFERENCES service (service_id)
);

show tables;