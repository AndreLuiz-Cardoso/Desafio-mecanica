-- Criação do banco de dados
CREATE DATABASE mecanica;
USE mecanica;

-- Criar tabela cliente
CREATE TABLE clients (
    idclient INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(255),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF)
);

-- Criar tabela veiculo
CREATE TABLE veiculo (
    idveiculo INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50),
    anofabricacao YEAR,
    cor VARCHAR(20),
    conserto_ou_revisao ENUM('conserto', 'revisão')
);

-- Criar tabela mecanico
CREATE TABLE mecanico (
    idmecanico INT AUTO_INCREMENT PRIMARY KEY,
    idnome VARCHAR(50),
    endereco VARCHAR(255),
    especialidade VARCHAR(50)
);

-- Criar tabela ordem de serviço
CREATE TABLE ordem_de_servico (
    idos INT AUTO_INCREMENT PRIMARY KEY,
    dtordem DATE,
    valor DECIMAL(10, 2),
    dtconclusao DATE
);

-- Criar tabela fornecedor
CREATE TABLE supplier (
    idsupplier INT AUTO_INCREMENT PRIMARY KEY,
    socialname VARCHAR(255) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    Contact VARCHAR(20) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

-- Criar tabela vendedor
CREATE TABLE seller (
    idseller INT AUTO_INCREMENT PRIMARY KEY,
    socialname VARCHAR(255) NOT NULL,
    abstname VARCHAR(255),
    CNPJ CHAR(14) NOT NULL,
    CPF CHAR(11) NOT NULL,
    location VARCHAR(255),
    Contact VARCHAR(20) NOT NULL,
    CONSTRAINT unique_CPF_supplier UNIQUE (CPF),
    CONSTRAINT unique_CNPJ_supplier UNIQUE (CNPJ)
);

-- Criar tabela produto (assumindo uma tabela produto)
CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(255),
    classification_kids BOOLEAN,
    category VARCHAR(255),
    avaliacao INT,
    size VARCHAR(10)
);

-- Produtos por vendedor
CREATE TABLE productseller (
    idPseller INT,
    idProduct INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (idPseller, idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller (idseller),
    CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES product (idProduct)
);

-- Criar tabela de pedidos (assumindo uma tabela orders)
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY
);

-- Produto por pedido
CREATE TABLE productorder (
    idpoproduct INT,
    idporder INT,
    poquantity INT DEFAULT 1,
    postatus ENUM('disponivel', 'sem estoque') DEFAULT 'disponivel',
    PRIMARY KEY (idpoproduct, idporder),
    CONSTRAINT fk_productorder_seller FOREIGN KEY (idpoproduct) REFERENCES product (idProduct),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idporder) REFERENCES orders (idOrder)
);

-- Criar tabela de armazenagem de produtos (assumindo uma tabela prodstorage)
CREATE TABLE prodstorage (
    idprostorages INT AUTO_INCREMENT PRIMARY KEY
);

-- Produto localização
CREATE TABLE storelocation (
    idlproduct INT,
    idlstorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idlproduct, idlstorage),
    CONSTRAINT fk_productlocation_seller FOREIGN KEY (idlproduct) REFERENCES product (idProduct),
    CONSTRAINT fk_productlocation_product FOREIGN KEY (idlstorage) REFERENCES prodstorage (idprostorages)
);

-- Inserir dados na tabela clients
INSERT INTO clients (Pname, CPF, Address)
VALUES
    ('maria', '32045568895', 'rua testando'),
    ('joao', '32055568895', 'rua testando 2'),
    ('pedro', '32895568895', 'rua testando 3');

-- Inserir dados na tabela product
INSERT INTO product (Pname, classification_kids, category, avaliacao, size)
VALUES
    ('video game', FALSE, 'eletronico', 4, NULL),
    ('blusa', FALSE, 'vestimenta', 5, NULL),
    ('macarrao', FALSE, 'alimentos', 6, NULL);

-- Selecionar todos os dados da tabela clients
SELECT * FROM clients;
