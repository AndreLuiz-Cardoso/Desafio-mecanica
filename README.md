### Auto Repair Shop Database
## About
Running an auto repair shop has unique specifics that other businesses don't, such as technical knowledge, but the foundation is the same as any enterprise. In addition to providing good service, the car business requires good presentation, good customer service, and management knowledge. It is a daily challenge that requires the owner's commitment. Thus, the auto repair shop recognized the need to create and maintain a database to aid in data-driven decision making. The particular data for the company includes:

A system to control and manage the execution of service orders in an auto repair shop.
Customers bring vehicles to the repair shop for repairs or periodic maintenance.
Each vehicle is assigned to a team of mechanics who identify the services to be performed and fill out a service order with a delivery date.
From the service order, the cost of each service is calculated by consulting a labor reference table.
The cost of each part will also be included in the service order.
The customer authorizes the execution of the services.
The same team evaluates and executes the services.
A service order can include various types of parts, and a part can be included in more than one service order.

## Methodology
A conceptual model is an abstract model that describes the structure of a database independently of the DBMS. Thus, MySQL Workbench will be used to create an entity-relationship diagram. The defined entities are:

📂Clients
This entity aims to describe all the characteristics of the client.

CPF CHAR(11): Primary key of this entity, identifying the client.
Pname VARCHAR(50): Client's name.
Address VARCHAR(255): Client's address.
📂Vehicle
This entity aims to describe all the characteristics of the car.

idveiculo INT: Primary key of this entity.
modelo VARCHAR(50): Stores the car model.
marca VARCHAR(50): Stores the car brand.
anofabricacao YEAR: Stores the car's year of manufacture.
cor VARCHAR(20): Stores the car color.
conserto_ou_revisao ENUM('conserto', 'revisão'): Indicates whether the vehicle is for repair or maintenance.
📂 Mechanic
This entity aims to describe all the characteristics of the mechanics.

idmecanico INT: Primary key of this entity.
idnome VARCHAR(50): Mechanic's name.
endereco VARCHAR(255): Mechanic's address.
especialidade VARCHAR(50): Mechanic's specialty.
📂 Service Order
This entity aims to describe all the characteristics of the service order.

idos INT: Primary key of this entity.
dtordem DATE: Date the service order was opened.
valor DECIMAL(10, 2): Total value of the service order.
dtconclusao DATE: Completion date of the service order.
📂 Supplier
This entity aims to describe all the characteristics of the suppliers.

idsupplier INT: Primary key of this entity.
socialname VARCHAR(255): Supplier's social name.
CNPJ CHAR(14): Unique identifier for each supplier.
Contact VARCHAR(20): Supplier's contact information.
📂 Seller
This entity aims to describe all the characteristics of the sellers.

idseller INT: Primary key of this entity.
socialname VARCHAR(255): Seller's social name.
abstname VARCHAR(255): Seller's abbreviated name.
CNPJ CHAR(14): Seller's unique identifier.
CPF CHAR(11): Seller's personal identifier.
location VARCHAR(255): Seller's location.
Contact VARCHAR(20): Seller's contact information.
📂 Product
This entity aims to describe all the characteristics of the products.

idProduct INT: Primary key of this entity.
Pname VARCHAR(255): Product name.
classification_kids BOOLEAN: Indicates if the product is for children.
category VARCHAR(255): Product category.
avaliacao INT: Product rating.
size VARCHAR(10): Product size.
📂 Product by Seller
This entity relates products with sellers.

idPseller INT: Seller identifier.
idProduct INT: Product identifier.
Quantity INT: Quantity of products.
Foreign keys for idPseller and idProduct.
📂 Order
This entity aims to describe the orders.

idOrder INT: Primary key of this entity.
📂 Product by Order
This entity relates products with orders.

idpoproduct INT: Product identifier.
idporder INT: Order identifier.
poquantity INT: Product quantity in the order.
postatus ENUM('disponivel', 'sem estoque'): Product status.
Foreign keys for idpoproduct and idporder.
📂 Product Storage
This entity aims to describe the location of products in storage.

idlproduct INT: Product identifier.
idlstorage INT: Storage identifier.
location VARCHAR(255): Product location.
Foreign keys for idlproduct and idlstorage.
📂 Team
This entity aims to describe all the characteristics of the team.

Numero de Funcionarios INT: Describes the number of employees on the team.
Especialidade VARCHAR(45): Describes the team's specialty.
📂 Relationship: Payment Value
This relationship aims to describe the relation between the budget and service.

Preço DOUBLE: Describes the total amount to be paid based on the service and budget variables.
