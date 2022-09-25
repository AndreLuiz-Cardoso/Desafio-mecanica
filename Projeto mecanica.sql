-- criação do banco de dados para mecanica--
create database mecanica;
use mecanica;
-- criar tabela cliente
create table clients(
			idclient int auto_increment primary key,
            Pname varchar (10),
            CPF char (11) not null,
            Address varchar (30),
			constraint unique_cpf_cliente unique (CPF)
);

-- criar tabela veiculo
create table veiculo (
			idveiculo int auto_increment primary key,
            modelo varchar (10) not null,
            marca varchar (10),
            anofabricação varchar (10),
            cor varchar (10),
            conserto_ou_revisao enum ('conserto','revisão')
);

-- criar tabela mecanico
create table mecanico (
			idmecanico int auto_increment primary key,
            idnome varchar (10),
			endereço varchar (20),
            especialidade varchar (20)
             
);

-- criar tabela ordem de serviço
create table ordem_de_serviço (
			idos int auto_increment primary key,
			dtordem varchar (255),
			valor
            dtconclusãoint default 0
            
);

-- criar tabela fornecedor
create table supplier (
			idsupplier int auto_increment primary key,
            socialname varchar (255) not null,
            CNPJ char (11) not null,
            Contact varchar (10) not null,
            constraint unique_supplier unique  (CNPJ)  
);

-- criar tabela vendedor
create table seller (
			idseller int auto_increment primary key,
            socialname varchar (255) not null,
            abstname varchar (255),
            CNPJ char (11) not null,
			CPF char (11) not null,
            location varchar (255),
            Contact varchar (10) not null,
            constraint unique_CPF_supplier unique  (CPF),
			constraint unique_CNPJ_supplier unique  (CNPJ)  
);
-- produtos por vendedor

create table productseller (
			idPseller int,
            idProduct int,
            Quantity int default 1,
            primary key (idPseller, idProduct),
            constraint fk_product_seller foreign key (idPseller) references seller (idseller),
            constraint fk_product_product foreign key (idProduct) references product (idProduct)
);
-- Produto por pedido

create table productorder (
			idpoproduct int,
            idporder int,
            poquantity int default 1,
            postatus enum ('disponivel' , 'sem estoque') default 'disponivel',
            primary key (idpoproduct, idporder),
            constraint fk_productorder_seller foreign key (idpoproduct) references product (idProduct),
            constraint fk_productorder_product foreign key (idporder) references orders (idOrder)
);

-- Produto localização

create table storelocation (
			idlproduct int,
            idlstorage int,
			location varchar (255) not null,
            primary key (idlproduct, idlstorage),
            constraint fk_productlocation_seller foreign key (idlproduct) references product (idProduct),
            constraint fk_productlocation_product foreign key (idlstorage) references prodstorage (idprostorages)
);
show tables;

insert into clients (Pname, NameioInicial, Sobrenome, CPF, Address)
	values ('maria','m','silvia',32045568895,'rua testando'),
			('joao','m','gilson',32055568895,'rua testando 2'),
            ('pedro','m','sergio',32895568895,'rua testando 3');
 
 insert into product (Pname, classification_kids, category, avaliação, size)
	values ('video game',false,'eletronico',4,null),
			('blusa',false,'vestimenta',5,null),
            ('macarrao',false,'alimentos',6,null);  
            
select * from clients;