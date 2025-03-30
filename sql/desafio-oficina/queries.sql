-- Extrair e visualizar com as cláusula DQL
use workshop;
show tables;

select * from clientes;
select * from vehicles;
select * from employee;
select * from service;
select * from ServicoOrders;
select * from itensOs;


-- Clientes que possuí um ou mais veículos
SELECT 
    *
FROM
    clientes
        JOIN
    vehicles ON clientes.cliente_id = vehicles.cliente_id;

-- Ordem de Serviço: Obter empregados que estão consertando veículos
SELECT 
    *
FROM
    ServicoOrders
        JOIN
    employee ON ServicoOrders.employee_id = employee.employee_id JOIN vehicles on ServicoOrders.vehicle_id = vehicles.vehicle_id JOIN clientes on clientes.cliente_id = vehicles.cliente_id;

-- Ordem de Serviço: Obter empregados que estão consertando veículos, alias
SELECT 
    s.servicoOrders_id,
    e.employee_name,
    v.marca,
    v.modelo,
    c.cliente_name
FROM 
    ServicoOrders s
JOIN 
    employee e ON s.employee_id = e.employee_id
JOIN 
    vehicles v ON s.vehicle_id = v.vehicle_id
JOIN 
    clientes c ON c.cliente_id = v.cliente_id;
    
    
-- Ordem de Serviço: Obter empregados que NÃO tem OS
SELECT 
    *
FROM
    ServicoOrders
        right JOIN
    employee ON ServicoOrders.employee_id = employee.employee_id;

-- Ordem de Serviço: Quantas Ordem de Serviço tem cada funcionario
SELECT 
    ServicoOrders.employee_id,
    employee_name,
    COUNT(*) AS OrdemServico
FROM
    ServicoOrders
        JOIN
    employee ON ServicoOrders.employee_id = employee.employee_id
GROUP BY employee_id;


-- Ordem de Serviço & Serviço: Os serviços que os funcionarios estão fazendo

SELECT 
    *
FROM
    itensOs
        JOIN
    servicoorders ON itensos.servicoOrders_id = servicoorders.servicoOrders_id
        JOIN
    service ON service.service_id = itensos.service_id
        JOIN
    employee ON servicoorders.employee_id = employee.employee_id;

-- Ordem de Serviço & Serviço: Quantos serviços os funcionarios fizeram este mes.
SELECT 
    employee_name, count(*) Services
FROM
    itensOs
        JOIN
    servicoorders ON itensos.servicoOrders_id = servicoorders.servicoOrders_id
        JOIN
    service ON service.service_id = itensos.service_id
        JOIN
    employee ON servicoorders.employee_id = employee.employee_id group by employee_name;

-- Filtre todos os empregados que têm o cargo de "Mecanico".
select * from employee where employee.employee_cargo = 'Mecanico';

-- Liste os clientes em ordem alfabética pelo nome
select * from clientes order by cliente_name;

DELETE FROM ServicoOrders
WHERE statusOs = 'Concluído'
  AND dataConclusao < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);