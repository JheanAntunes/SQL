-- criação do banco de dados para o cnário de E-commerce;
create database IF NOT EXISTS ecommerce;
use ecommerce;

-- criar tabela cliente
CREATE TABLE if not exists Clientes(
  idCliente INT NOT NULL AUTO_INCREMENT,
  Fname VARCHAR(45) NOT NULL,
  Minit VARCHAR(3) NOT NULL,
  Lname VARCHAR(20) NULL,
  CPF CHAR(11) NOT NULL,
  address VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCliente),
  UNIQUE INDEX CPF_UNIQUE (CPF ASC) VISIBLE);
  
-- para ser continuado no desafio: termine de implementar a tabela e crie a conex;ao com as tabelas necessárias
-- além disso, reflita essa modificação no diagrama de esquema relacional
CREATE TABLE payments (
    idPayment INT NOT NULL,
    idCliente INT NOT NULL,
    statusPayment BOOL,
    startDate DATE,
    typePayment ENUM('Boleto', 'Cartão', 'Dois cartões'),
    limitAvailabre FLOAT,
    PRIMARY KEY (idPayment , idCliente),
    CONSTRAINT fk_payments_idCliente FOREIGN KEY (idCliente)
        REFERENCES Clientes (idCliente)
);


-- criar tabela pedido
CREATE TABLE IF NOT EXISTS Pedidos (
    idPedido INT NOT NULL AUTO_INCREMENT,
    idCliente INT,
    statusPedido ENUM('Em andamento', 'Processando', 'Enviado', 'Entregue') DEFAULT 'Processando',
    frete FLOAT NOT NULL,
    description VARCHAR(45) NULL,
    PRIMARY KEY (idPedido),
	CONSTRAINT fk_idCliente_Pedidos FOREIGN KEY (idCliente)
        REFERENCES clientes (idCliente)
);

desc pedidos;

-- criar tabela de relacionamento N:M  Clientes & Pedidos
CREATE TABLE IF NOT EXISTS RelationshipClientePedido (
    idPedido INT,
    IdCliente INT,
    qtd INT DEFAULT 0,
    statusPedidoProduto ENUM('Em andamento', 'Processando', 'Enviado', 'Entregue') DEFAULT 'Processando',
    PRIMARY KEY (idPedido , IdCliente),
    CONSTRAINT fk_idPedido_RelationshipClientePedido FOREIGN KEY (idPedido)
        REFERENCES pedidos (idPedido),
	CONSTRAINT fk_IdCliente_RelationshipClientePedido FOREIGN KEY (IdCliente)
        REFERENCES clientes (IdCliente)
);

-- criar a tabela de produtos;
CREATE TABLE IF NOT EXISTS PRODUTOS (
    idProduto INT,
    categoria ENUM('maquiagem', 'perfumaria', 'roupas', 'tech') DEFAULT 'tech' ,
    descricao VARCHAR(45) NULL,
    valor FLOAT NOT NULL,
    PRIMARY KEY (idProduto)
);

desc produtos;

-- criar tabela de relationship N:M Produto & Estoque
CREATE TABLE IF NOT EXISTS ProdutoEstoque (
    idProduto INT,
    idEstoque INT,
    qtd INT DEFAULT 0,
    PRIMARY KEY (idProduto , idEstoque),
    CONSTRAINT fk_idProduto_ProdutoEstoque FOREIGN KEY (idProduto)
        REFERENCES produtos (idProduto),
    CONSTRAINT fk_idEstoque_ProdutoEstoque FOREIGN KEY (idEstoque)
        REFERENCES estoque (idEstoque)
);

-- criar a tabela de estoque
CREATE TABLE IF NOT EXISTS Estoque (
    idEstoque INT,
    localidade VARCHAR(45) NOT NULL,
    PRIMARY KEY (idEstoque)
);

-- criar a tabela de relationship N:M produto & TerceiroVendedor
CREATE TABLE IF NOT EXISTS ProdutoTerceiroVendedor (
    idProduto INT,
    idTerceiroVendedor INT,
    PRIMARY KEY (idProduto , idTerceiroVendedor),
    CONSTRAINT fk_idProduto_ProdutoTerceiroVendedor FOREIGN KEY (idProduto)
        REFERENCES produtos (idProduto),
	CONSTRAINT fk_idTerceiroVendedor_ProdutoTerceiroVendedor FOREIGN KEY (idTerceiroVendedor)
        REFERENCES TerceiroVendedor(idTerceiroVendedor)
);

-- criar a tabela de TerceiroVendedor
CREATE TABLE IF NOT EXISTS TerceiroVendedor (
    idTerceiroVendedor INT,
    razaoSocial VARCHAR(45) NOT NULL,
    localidade VARCHAR(45) NULL,
    nameFantasy VARCHAR(45) NULL,
    PRIMARY KEY (idTerceiroVendedor),
    CONSTRAINT unique_razaoSocial_TerceiroVendedor UNIQUE (razaoSocial)
);

desc TerceiroVendedor;

-- criar a tabela de relationship N:M Fornecedor & Produto
CREATE TABLE IF NOT EXISTS FornecedoresProdutos (
    idFornecedor INT,
    idProduto INT,
    PRIMARY KEY (idFornecedor , idProduto),
    CONSTRAINT fk_idFornecedor_FornecedoresProdutos FOREIGN KEY (idFornecedor)
        REFERENCES Fornecedor (idFornecedor),
    CONSTRAINT fk_idProduto_FornecedoresProdutos FOREIGN KEY (idProduto)
        REFERENCES Produtos (idProduto)
);

-- criar a tabela de fornecedor
CREATE TABLE IF NOT EXISTS Fornecedor (
    idFornecedor INT,
    razaoSocial VARCHAR(45) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    UNIQUE (cnpj),
    PRIMARY KEY (idFornecedor)
);

desc fornecedor;

-- criar a tabela de entrega;

CREATE TABLE IF NOT EXISTS Entregas (
  idEntregas INT NOT NULL,
  status ENUM('análise', 'enviado', 'entregue') NOT NULL default 'análise',
  date DATE NOT NULL,
  Pedido_idPedido INT NOT NULL,
  code VARCHAR(45) NOT NULL,
  PRIMARY KEY (idEntregas, Pedido_idPedido),
  INDEX fk_Entregas_Pedido1_idx (Pedido_idPedido ASC) VISIBLE,
  CONSTRAINT fk_Entregas_Pedido1
    FOREIGN KEY (Pedido_idPedido)
    REFERENCES Pedidos (idPedido)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

