-- Passo 1:
-- Inicie uma transação

SET autocommit = 0;

START TRANSACTION;

USE checkpoint_lab_hugo;

-- Fazendo alguns INSERTS (SEM COMMIT)

INSERT INTO Operacoes (descricao) VALUES ('operação 1'), ('operação 2');

-- Não Faça COMMIT!

-- ---------------

-- Passo 2:

-- Fecha todas as tabelas abertas e grava (flush) no disco todas as tabelas que usam armazenamento baseado em cache.
-- em seguida bloqueia todas as tabelas para leitura.

FLUSH TABLES WITH READ LOCK;


-- Passo 3: Simular Crash!

-- docker kill nome_do_container