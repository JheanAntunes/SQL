use ecommerce;
 
 -- 01 - Clientes que efetuaram pedidos.
CREATE VIEW clienteswithOrder AS
    SELECT 
        c.idCliente AS client_id,
        Fname,
        CPF,
        address,
        email,
        telefone,
        idPedido,
        statusPedido,
        frete,
        description
    FROM
        clientes AS c
            JOIN
        pedidos AS p ON c.idCliente = p.idCliente;
        
SELECT 
    *
FROM
    clienteswithOrder
WHERE
    statusPedido IN ('Entregue' , 'Processando');

 -- 02 - Fornecedores de produtos
CREATE VIEW FornecedoresProdutos_vw AS
    SELECT 
        razaoSocial,
        cnpj,
        contato,
        categoria,
        descricao,
        valor,
        Pname
    FROM
        fornecedor
            JOIN
        fornecedoresprodutos ON fornecedor.idfornecedor = fornecedoresprodutos.idfornecedor
            JOIN
        produtos ON fornecedoresprodutos.idProduto = produtos.idProduto;
SELECT 
    *
FROM
    FornecedoresProdutos_vw;
 
 -- 03 - Produtos que tem Estoque;
CREATE VIEW produtosEstoques AS
    SELECT 
        pname,
        categoria,
        descricao,
        valor,
        localidade,
        estoque.qtd,
        CASE
            WHEN estoque.qtd = 100 THEN 'Máximo'
            WHEN estoque.qtd >= 50 THEN 'Metade'
            WHEN estoque.qtd < 50 THEN 'Disponivel'
        END AS limiteEstoque
    FROM
        produtos
            JOIN
        produtoestoque ON produtos.idProduto = produtoestoque.idProduto
            JOIN
        estoque ON produtoestoque.idEstoque = estoque.idEstoque;
select * from produtosEstoques where qtd between 50 and 100;

