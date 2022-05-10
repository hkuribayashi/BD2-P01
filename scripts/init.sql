DROP DATABASE IF EXISTS loja;

CREATE DATABASE loja;

\c loja;

CREATE TABLE Pessoa (
    idPessoa serial NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE Produto (
    idProduto serial NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    valor FLOAT NOT NULL
);

CREATE TABLE Pessoa_Produto (
  idPessoa INT,
  idProduto INT,
  quantidade INT CHECK (quantidade > 1),
  PRIMARY KEY (idPessoa, idProduto),
  CONSTRAINT fk_article FOREIGN KEY(idPessoa) REFERENCES Pessoa(idPessoa),
  CONSTRAINT fk_tag FOREIGN KEY(idProduto) REFERENCES Produto(idProduto)
);

INSERT INTO Pessoa (nome, sobrenome, email)
VALUES ('Maria', 'Silva', 'maria.silva@xpto.com');

INSERT INTO Produto (nome, valor)
VALUES ('Arroz', 10.0);

INSERT INTO Produto (nome, valor)
VALUES ('Feijão', 11.0);

INSERT INTO Pessoa_Produto
VALUES (1, 2, 10);