
-- Passo 1: Discente 1 deve criar Tabela e realizar inserts na Tabela.

CREATE TABLE Categoria (
   idCategoria INT NOT NULL AUTO_INCREMENT,
   nomeCategoria VARCHAR(50) NOT NULL,
   PRIMARY KEY (idCategoria)
);

INSERT INTO Categoria VALUES (NULL, 'Limpeza');
INSERT INTO Categoria VALUES (NULL, 'Higiene Pessoal');
INSERT INTO Categoria VALUES (NULL, 'Laticínios');

-- Passo 2: Discente 2 deve iniciar uma transação e fazer um update sem finalizar a transação.

SET autocommit = 0;

START TRANSACTION;

UPDATE Categoria
SET nomeCategoria = 'Matinais'
WHERE idCategoria = 1; -- Não realizar COMMIT OU ROLLBACK

-- Passo 3: Discente 1 inicia outra transação e realiza um outro UPDATE

SET autocommit = 0;

START TRANSACTION;

UPDATE Categoria
SET nomeCategoria = 'Hortifruti'
WHERE idCategoria = 1; -- Não realizar COMMIT OU ROLLBACK

