
-- Criar um novo banco de dados
CREATE DATABASE checkpoint_lab_hugo;

-- Comando para se conectar no BD criado
USE checkpoint_lab_hugo;

-- Criar uma tabela no BD
CREATE TABLE Operacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100)
) ENGINE=InnoDB;


