USE chez_miau;
CREATE TABLE Cliente(
id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_cliente VARCHAR(50) NOT NULL,
telefone CHAR(12),
endereco VARCHAR(100),
cidade VARCHAR(50),
tipo_assinatura VARCHAR(20)
);

CREATE TABLE Gato(
id_gato INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_cliente INT,
nome_gato VARCHAR(20) NOT NULL,
raca VARCHAR(20),
pelagem VARCHAR(20),
sexo CHAR(1),
idade CHAR(2),
personalidade VARCHAR(15),
adocao TINYINT,
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Pedido(
id_pedido INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_cliente INT,
data_pedido DATETIME,
tipo_pedido VARCHAR(10),
quantidade TINYINT,
preco_total DECIMAL(3,3),
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Cardapio(
id_cardapio INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_pedido INT,
nome_item VARCHAR(50) NOT NULL,
descricao_item VARCHAR(200),
quantidade_item TINYINT,
preco_item DECIMAL(3,3),
FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

CREATE TABLE Souvenir(
id_souvenir INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_pedido INT,
nome_item VARCHAR(50) NOT NULL,
descricao_item VARCHAR(200),
quantidade_item TINYINT,
preco_item DECIMAL(3,3),
FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

ALTER TABLE Cliente
ADD CPF CHAR(11) NOT NULL;

INSERT INTO Cliente
VALUES (DEFAULT, 'June Cartier', 051994079019, 'Rua Felizardo Furtado nº500 BL. H', 'Porto Alegre', 'VIP', 38099440099);

SELECT * FROM Cliente;

INSERT INTO Cliente
VALUES (DEFAULT, 'Aline Corange', 051993785636, 'Avenida Desembargador André da Rocha nª123/ apto 201', 'Porto Alegre', 'Casual', 98006009066);

INSERT INTO Cliente
VALUES (DEFAULT, 'Nikolas Peters', 011984760231, 'Avenida São João nº1800/ apto 701', 'São Paulo', 'Crazy Cat Person', 05247644093);

INSERT INTO Cliente
VALUES (DEFAULT, 'Vinzent Steinberg', 491775538557, 'Grassistraße nº8', 'Leipzig', 'VIP', 11859244009);

INSERT INTO Gato
VALUES (DEFAULT, DEFAULT, 'Morgana', 'Persa', 'Longa/ Preta', 'F', 5, 'Brincalhão', false); 

INSERT INTO Gato
VALUES (DEFAULT, DEFAULT, 'Klaus', 'SRD', 'Curta/ Tigrado', 'M', 3, 'Brincalhão', true);

INSERT INTO Gato
VALUES 
(DEFAULT, DEFAULT, 'Merlin', 'SRD', 'Longa/ Amarela e Bca', 'M', 10, 'Carinhosa', false),
(DEFAULT, DEFAULT, 'Bonequinha', 'British Short Hair', 'Curta/ Cinza e Bca', 'F', 8, 'Arisca', false),
(DEFAULT, DEFAULT, 'Chloe', 'SRD', 'Curta/ Tricolor', 'F', 4, 'Carinhosa', true),
(DEFAULT, DEFAULT, 'Nemo', 'Angorá', 'Longa/ Branca', 'M', 3, 'Tímida', true); 

SELECT * FROM Gato;
SELECT * FROM Cliente;

ALTER TABLE Cardapio
MODIFY preco_item DECIMAL(4,2) NOT NULL;

INSERT INTO Cardapio
VALUES
(DEFAULT, DEFAULT, 'Catpuccino', 'Café expresso, leite vaporizado, com toque de canela, chocolate e caramelo, decorado coffee arte de gatinho', 1, 12.00),
(DEFAULT, DEFAULT, 'Pão de Queijo', 'Delicioso pão de queijo mineiro recheado com requeijão cremoso', 1, 8.00),
(DEFAULT, DEFAULT, 'Brownie', 'Fatia de brownie de chocolate recheado com nutella', 1, 10.00);

ALTER TABLE Souvenir
MODIFY preco_item DECIMAL (5,2) NOT NULL;

INSERT INTO Souvenir
VALUES
(DEFAULT, DEFAULT, 'Caneca Chez Miau', 'Caneca em cerâmica fofa e personalizada do seu cat café favorito', 1, 40.00),
(DEFAULT, DEFAULT, 'Calendário Chez Miau', 'Calendário mensal personalizado com fotos dos nossos amiguinhnos peludos', 1, 25.00),
(DEFAULT, DEFAULT, 'Agenda 2022', 'Agenda exclusiva Chez Miau', 1, 50.00);

ALTER TABLE Pedido
MODIFY preco_total DECIMAL (5,2);

UPDATE Cardapio
SET nome_item = 'Cheesecake', descricao_item = 'Fatia do nosso delicioso cheesecake de frutas vermelhas', preco_item = 15.00
WHERE id_cardapio = 3;

SELECT * FROM Cardapio;

UPDATE Gato
SET id_cliente = 4
WHERE id_gato = 2;

UPDATE Gato
SET id_cliente = 4
WHERE id_gato = 1;

DELETE FROM Souvenir
WHERE id_souvenir = 3;

INSERT INTO Pedido
VALUES (DEFAULT, 4, '2021-08-13 16:00:00', 'Cardapio', 3, 35.00);

UPDATE Cardapio
SET id_pedido = 1
WHERE id_cardapio = 1;

UPDATE Cardapio
SET id_pedido = 1
WHERE id_cardapio = 2;

UPDATE Cardapio
SET id_pedido = 1
WHERE id_cardapio = 3;

SELECT * FROM Cardapio
WHERE id_pedido = 1
GROUP BY id_cardapio
ORDER BY nome_item;

SELECT * FROM Gato
WHERE id_cliente = 4
GROUP BY nome_gato
ORDER BY id_gato;