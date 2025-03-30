-- Insert into workshop

INSERT INTO clientes (cliente_id, cliente_name, cliente_phoneNumber, cliente_email, cliente_address)
VALUES
(1, 'João Silva', '987654321', 'joao.silva@email.com', 'Rua das Flores, 123'),
(2, 'Maria Oliveira', '987123456', 'maria.oliveira@email.com', 'Av. Brasil, 456'),
(3, 'Pedro Santos', '987987654', 'pedro.santos@email.com', 'Rua do Campo, 789');

INSERT INTO VEHICLES (vehicle_id, cliente_id, placa, marca, modelo, ano)
VALUES
(1, 1, 'ABC1234', 'Toyota', 'Corolla', '2015-01-01'),
(2, 2, 'DEF5678', 'Honda', 'Civic', '2018-05-20'),
(3, 3, 'GHI9012', 'Ford', 'Fiesta', '2020-09-15');

INSERT INTO employee (employee_id, employee_name, employee_cargo, employee_salary)
VALUES
(1, 'Carlos Andrade', 'Mecanico', 2500.00),
(2, 'Ana Souza', 'Aux', 1800.00),
(3, 'Rafael Lima', 'Mecanico', 3000.00);

INSERT INTO service (service_id, description, price)
VALUES
(1, 'Troca de óleo', 150.00),
(2, 'Alinhamento e balanceamento', 200.00),
(3, 'Revisão completa', 500.00);

INSERT INTO ServicoOrders (servicoOrders_id, employee_id, vehicle_id, dataAbertura, dataConclusao, statusOs)
VALUES
(1, 1, 1, '2025-03-01', '2025-03-03', 'Concluído'),
(2, 3, 2, '2025-03-05', '2025-05-09', 'Em andamento'),
(3, 1, 3, '2025-03-10', '2025-04-15', 'Aberto');

INSERT INTO itensOs (servicoOrders_id, service_id, qtd)
VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(3, 1, 2),
(3, 2, 1);