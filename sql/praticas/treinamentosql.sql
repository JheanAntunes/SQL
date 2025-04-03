CREATE DATABASE if not exists TreinamentoSQL;
USE TreinamentoSQL;
CREATE TABLE pessoas (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Idade INT,
    Cidade VARCHAR(50),
    Profissao VARCHAR(50)
); 

show tables;

SELECT 
    Nome,
    Idade,
    CASE
        WHEN Idade < 18 THEN 'Menor de Idade'
        WHEN Idade BETWEEN 18 AND 60 THEN 'Adulto'
        ELSE 'Idoso'
    END AS faixa_etaria
FROM
    pessoas;

INSERT INTO pessoas (ID, Nome, Idade, Cidade, Profissao)
VALUES
    (6, 'Jhean', 25, 'Rio de Janeiro', 'Arquiteta');

SELECT 
    nome,
    idade,
    cidade,
    profissao,
    CASE
        WHEN cidade = 'Rio de Janeiro' THEN 'Carioca'
        WHEN cidade = 'São Paulo' THEN 'Paulista'
        WHEN cidade = 'Salvador' THEN 'Baiano'
        ELSE 'Outros'
    END AS origem
FROM
    pessoas;

SELECT 
    profissao, COUNT(profissao) as employee, AVG(idade) AS idade_media
FROM
    pessoas
GROUP BY profissao;

SELECT 
     cidade, COUNT(*) as employee
FROM
    pessoas
GROUP BY cidade;

SELECT 
    nome, Idade, COUNT(*) AS Instancia
FROM
    pessoas
GROUP BY nome , Idade;

-- ALTER modify structure
ALTER TABLE pessoas add column gender char;
ALTER TABLE pessoas drop column gender;

-- UPDATE
UPDATE pessoas 
SET 
    idade = 41
WHERE
    ID = 5;
    
SELECT 
    *
FROM
    pessoas;

CREATE TABLE vendas (
    Venda_ID INT PRIMARY KEY,
    Cliente_ID INT,
    Produto VARCHAR(50),
    Quantidade INT,
    Valor_Total DECIMAL(10, 2),
    FOREIGN KEY (Cliente_ID) REFERENCES pessoas(ID)
);

SELECT
    produto,
    valor_total,
    CASE
        WHEN valor_total > 3000 THEN 'Alto'
        WHEN valor_total BETWEEN 1000 AND 3000 THEN 'Médio'
        ELSE 'Baixo'
    END AS status_venda
FROM
    vendas ORDER BY valor_total DESC;
    

SELECT 
    produto, SUM(valor_total) AS valor_total_por_produto
FROM
    vendas
GROUP BY produto;

SELECT 
    COUNT(*) as qtdTeclado
FROM
    vendas
WHERE
    produto = 'Teclado';

INSERT INTO vendas (Venda_ID, Cliente_ID, Produto, Quantidade, Valor_Total)
VALUES
    (101, 1, 'Smartphone', 2, 4000.00),
    (102, 3, 'Notebook', 1, 3000.00),
    (103, 2, 'Teclado', 5, 250.00),
    (104, 5, 'Monitor', 1, 1200.00),
    (105, 4, 'Impressora', 1, 800.00);

-- ORDER BY ASCENDENTE, DESCENDENTE
select * from vendas order by Valor_Total DESC, Produto, Cliente_ID;

-- SUBQUERIES
SELECT 
    *
FROM
    pessoas
WHERE
    ID IN (SELECT 
            Cliente_ID
        FROM
            vendas
        WHERE
            Quantidade > 1);