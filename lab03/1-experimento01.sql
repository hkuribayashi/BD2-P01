-- Discente 1
USE deadlock_lab;

SET autocommit = 0;

START TRANSACTION;

UPDATE Conta SET saldo = saldo - 100 WHERE id = 1;

-- Discente 2
USE deadlock_lab;

SET autocommit = 0;

START TRANSACTION;

UPDATE Conta SET saldo = saldo - 100 WHERE id = 2;

-- Discente 1
UPDATE Conta SET saldo = saldo + 100 WHERE id = 2;

-- Discente 2
UPDATE Conta SET saldo = saldo + 100 WHERE id = 1;

SHOW ENGINE INNODB STATUS;