CREATE DATABASE IF NOT EXISTS camilly
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE camilly;
SHOW TABLES;


-- Tabela para armazenar os autores
CREATE TABLE Autor (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    nacionalidade VARCHAR(50) DEFAULT 'Brasileira' NOT NULL
);

-- Tabela para armazenar as editoras
CREATE TABLE Editora (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL
);

-- Tabela para armazenar os livros
CREATE TABLE Livro (
    codigo VARCHAR(20) PRIMARY KEY,
    titulo VARCHAR(200) UNIQUE NOT NULL,
    valor_multa DECIMAL(10,2) DEFAULT 5.00 CHECK(valor_multa >= 1.00),
    data_inclusao DATE NOT NULL,
    codigo_editora INT,
    FOREIGN KEY (codigo_editora) REFERENCES Editora(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela para armazenar as nacionalidades
CREATE TABLE Nacionalidade (
    nacionalidade VARCHAR(50) PRIMARY KEY
);

-- Tabela para a associação entre autores e livros (relação muitos-para-muitos)
CREATE TABLE Autor_Livro (
    codigo_autor INT,
    codigo_livro VARCHAR(20),
    PRIMARY KEY (codigo_autor, codigo_livro),
    FOREIGN KEY (codigo_autor) REFERENCES Autor(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (codigo_livro) REFERENCES Livro(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela para armazenar os empréstimos
CREATE TABLE Emprestimo (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_devolucao TIMESTAMP,
    codigo_livro VARCHAR(20),
    FOREIGN KEY (codigo_livro) REFERENCES Livro(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

	SHOW TABLES;
	DESCRIBE Autor;
    DESCRIBE Nacionalidade;
    DESCRIBE Editora;
	DESCRIBE Livro;
	DESCRIBE Autor_Livro;
    DESCRIBE Emprestimo;
    
    