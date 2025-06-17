CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NULL
);

CREATE TABLE ideia (
	id_ideia INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(150) NOT NULL,
	descricao TEXT NOT NULL,
	data_criacao DATETIME NOT NULL DEFAULT GETDATE(),
	id_categoria INT NOT NULL,
    autor VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    senha VARCHAR(256) NOT NULL,
    data_registro DATETIME DEFAULT GETDATE()
);

ALTER TABLE ideia
DROP COLUMN autor;

ALTER TABLE ideia
ADD  id_usuario INT NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario);

select * from ideia