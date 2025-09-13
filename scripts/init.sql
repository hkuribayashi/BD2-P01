-- Apagar e recriar o banco
DROP DATABASE IF EXISTS loja;
CREATE DATABASE loja;
USE loja;

-- Tabela Pessoa
CREATE TABLE Pessoa (
                        idPessoa INT AUTO_INCREMENT PRIMARY KEY,
                        nome VARCHAR(50) NOT NULL,
                        sobrenome VARCHAR(50) NOT NULL,
                        email VARCHAR(50) NOT NULL
);

-- Tabela Produto
CREATE TABLE Produto (
                         idProduto INT AUTO_INCREMENT PRIMARY KEY,
                         nome VARCHAR(50) NOT NULL,
                         valor DECIMAL(10,2) NOT NULL
);

-- Tabela de relacionamento Pessoa_Produto
CREATE TABLE Pessoa_Produto (
                                idPessoa INT,
                                idProduto INT,
                                quantidade INT CHECK (quantidade > 1),
                                PRIMARY KEY (idPessoa, idProduto),
                                CONSTRAINT fk_pessoa FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa),
                                CONSTRAINT fk_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- Inserindo registros iniciais
INSERT INTO Pessoa (nome, sobrenome, email)
VALUES ('Maria', 'Silva', 'maria.silva@xpto.com');

INSERT INTO Produto (nome, valor)
VALUES ('Arroz', 10.0);

INSERT INTO Produto (nome, valor)
VALUES ('Feijão', 11.0);

INSERT INTO Pessoa_Produto (idPessoa, idProduto, quantidade)
VALUES (1, 2, 10);
