SET autocommit = 0;

START TRANSACTION;

SELECT * FROM Pessoa_Produto
WHERE idPessoa = 1 AND idProduto = 2
FOR UPDATE;

-- Passo 2: Discente 2 inicia uma nova transação e tenta fazer um update nos registros bloqueados pelo Discente 1

SET autocommit = 0;

START TRANSACTION;

UPDATE Pessoa_Produto
SET quantidade = 5
WHERE idPessoa = 1 AND idProduto = 2;

-- Passe 3: Discente 1 realiza o COMMIT

COMMIT;

