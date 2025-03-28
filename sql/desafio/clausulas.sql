-- consultas sql
/*
- Recuperações simples com SELECT Statement [x]
- Filtros com WHERE Statement [x]
- Crie expressões para gerar atributos derivados
- Defina ordenações dos dados com ORDER BY
- Condições de filtros aos grupos – HAVING Statement
- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
# Diretrizes
	Não há um mínimo de queries a serem realizadas;
	Os tópicos supracitados devem estar presentes nas queries;
	Elabore perguntas que podem ser respondidas pelas consultas;
	As cláusulas podem estar presentes em mais de uma query;
*/

show databases;
use ecommerce;
show tables;

-- Inner join: Fornecedores associado a produtos;
SELECT 
    *
FROM
    fornecedoresprodutos
        INNER JOIN
    fornecedor ON fornecedoresprodutos.idFornecedor = fornecedor.idFornecedor
        JOIN
    produtos ON fornecedoresprodutos.idProduto = produtos.idProduto;
    
-- Inner Join: Visualizar produtos que estão em estoques;
SELECT 
    *, CASE when estoque.qtd >= 100  THEN 'Limite do estoque'
		else 'disponivel'
	END CapacidadeEstoque
FROM
    ProdutoEstoque
        JOIN
    produtos ON ProdutoEstoque.idProduto = produtos.idProduto join estoque on ProdutoEstoque.idEstoque = estoque.idEstoque;
    
-- Inner JON: Terceiro Vendedores associado a produtos que estão vendendo;
SELECT * FROM ProdutoTerceiroVendedor JOIN TerceiroVendedor on ProdutoTerceiroVendedor.idTerceiroVendedor = TerceiroVendedor.idTerceiroVendedor JOIN produtos ON ProdutoTerceiroVendedor.idProduto = produtos.idProduto;

-- Inner Join: Clientes que realizaram pedidos e ordernar por fretes maiores.
select * from clientes join pedidos on clientes.idCliente = pedidos.idCliente order by pedidos.frete DESC;

-- Inner Join: Clientes com a quantidade de pedidos realizado.
select clientes.idCliente, fname, count(*) as qtdPedido from clientes join pedidos on clientes.idCliente = pedidos.idCliente group by clientes.idCliente