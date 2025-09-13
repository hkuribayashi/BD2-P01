
-- Criar um novo banco de dados
CREATE DATABASE deadlock_lab;

-- Comando para se conectar no BD criado
USE deadlock_lab;

-- Criar uma tabela no BD
CREATE TABLE Conta (
    id INT PRIMARY KEY,
    saldo DECIMAL(10,2) NOT NULL
);

-- Inserção de Dados na Tabela Criada
INSERT INTO Conta VALUES (1, 1000.00);
INSERT INTO Conta VALUES (2, 1000.00);

