START TRANSACTION;

-- Inserir um novo cliente
INSERT INTO clientes (nome, email) VALUES ('João Silva', 'joao@email.com');

-- Criar um SAVEPOINT após a inserção do cliente
SAVEPOINT sp_cliente;

-- Atualizar o saldo de uma conta
UPDATE contas SET saldo = saldo - 200 WHERE id_conta = 1;

-- Criar outro SAVEPOINT após a atualização
SAVEPOINT sp_pagamento;

-- Simular um erro ao tentar inserir um registro inválido
INSERT INTO pagamentos (id_conta, valor) VALUES (999, -100); -- Erro: conta não existe

-- Reverter apenas a última operação (pagamento inválido), mantendo cliente e saldo
ROLLBACK TO SAVEPOINT sp_pagamento;

-- Confirmar as operações anteriores (cliente e saldo atualizado)
COMMIT;