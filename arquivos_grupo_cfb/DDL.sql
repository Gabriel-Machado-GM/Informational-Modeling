--Apagar todas as tabelas
drop table interacao_medicamentosa, incluido_em, Lembrete,  Medicamento, sofre_de, tomou_vai_tomar, Estoque, Telefone, Endereco, Pedido, Enfermidade, Vacina, Cliente, Categoria, Fornecedor;

use DBCFB;

CREATE TABLE Fornecedor
(
  ID_fornecedor INT NOT NULL IDENTITY(1,1),
  nome VARCHAR(255) NOT NULL,
  PRIMARY KEY (ID_fornecedor)
);

CREATE TABLE Categoria
(
  ID_categoria INT NOT NULL IDENTITY(1,1),
  nome VARCHAR(255) NOT NULL,
  PRIMARY KEY (ID_categoria)
);

CREATE TABLE Cliente
(
  ID_cliente INT NOT NULL IDENTITY(1,1),
  nome VARCHAR(255) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  e_mail VARCHAR(255) NOT NULL,
  nascimento DATE NOT NULL,
  PRIMARY KEY (ID_cliente)
);

CREATE TABLE Vacina
(
  ID_vacina INT NOT NULL IDENTITY(1,1),
  nome VARCHAR(255) NOT NULL,
  laboratorio VARCHAR(255) NOT NULL,
  PRIMARY KEY (ID_vacina)
);

CREATE TABLE Enfermidade
(
  ID_enfermidade INT NOT NULL IDENTITY(1,1),
  nome VARCHAR(255) NOT NULL,
  PRIMARY KEY (ID_enfermidade)
);

CREATE TABLE Pedido
(
  ID_pedido INT NOT NULL IDENTITY(1,1),
  data DATE NOT NULL,
  ID_cliente INT NOT NULL,
  PRIMARY KEY (ID_pedido),
  FOREIGN KEY (ID_cliente) REFERENCES Cliente(ID_cliente)
);

CREATE TABLE Endereco
(
  cep VARCHAR(8) NOT NULL,
  logradouro VARCHAR(255) NOT NULL,
  numero INT NOT NULL,
  bairro VARCHAR(255) NOT NULL,
  uf VARCHAR(2) NOT NULL,
  cidade VARCHAR(255) NOT NULL,
  ID_endereco INT NOT NULL IDENTITY(1,1),
  ID_cliente INT NOT NULL,
  PRIMARY KEY (ID_endereco),
  FOREIGN KEY (ID_cliente) REFERENCES Cliente(ID_cliente)
);

CREATE TABLE Telefone
(
  ddd VARCHAR(2) NOT NULL,
  numero VARCHAR(9) NOT NULL,
  ID_telefone INT NOT NULL IDENTITY(1,1),
  ID_cliente INT NOT NULL,
  PRIMARY KEY (ID_telefone),
  FOREIGN KEY (ID_cliente) REFERENCES Cliente(ID_cliente)
);

CREATE TABLE Estoque
(
  ID_estoque INT NOT NULL IDENTITY(1,1),
  qtd_adquirida INT NOT NULL,
  qtd_disponivel INT NOT NULL,
  qtd_vendida INT NOT NULL,
  PRIMARY KEY (id_estoque)
);

CREATE TABLE tomou_vai_tomar
(
  data DATE NOT NULL,
  ID_cliente INT NOT NULL,
  ID_vacina INT NOT NULL,
  PRIMARY KEY (ID_cliente, ID_vacina),
  FOREIGN KEY (ID_cliente) REFERENCES Cliente(ID_cliente),
  FOREIGN KEY (ID_vacina) REFERENCES Vacina(ID_vacina)
);

CREATE TABLE sofre_de
(
  ID_cliente INT NOT NULL,
  ID_enfermidade INT NOT NULL,
  PRIMARY KEY (ID_cliente, ID_enfermidade),
  FOREIGN KEY (ID_cliente) REFERENCES Cliente(ID_cliente),
  FOREIGN KEY (ID_enfermidade) REFERENCES Enfermidade(ID_enfermidade)
);

CREATE TABLE Medicamento
(
  ID_medicamento INT NOT NULL IDENTITY(1,1),
  nome VARCHAR(255) NOT NULL,
  preco NUMERIC(8,2) NOT NULL,
  ID_fornecedor INT NOT NULL,
  ID_estoque INT NOT NULL,
  ID_categoria INT NOT NULL,
  PRIMARY KEY (ID_medicamento),
  FOREIGN KEY (ID_fornecedor) REFERENCES Fornecedor(ID_fornecedor),
  FOREIGN KEY (ID_estoque) REFERENCES Estoque(ID_estoque),
  FOREIGN KEY (ID_categoria) REFERENCES Categoria(ID_categoria)
);

CREATE TABLE Lembrete
(
  data_de_inicio DATE NOT NULL,
  periodo_de_tempo INT NOT NULL,
  ID_lembrete INT NOT NULL IDENTITY(1,1),
  status VARCHAR(7) CHECK(status IN ('ATIVO', 'INATIVO')) NOT NULL,
  ID_cliente INT NOT NULL,
  ID_medicamento INT NOT NULL,
  PRIMARY KEY (ID_lembrete),
  FOREIGN KEY (ID_cliente) REFERENCES Cliente(ID_cliente),
  FOREIGN KEY (ID_medicamento) REFERENCES Medicamento(ID_medicamento),
);

CREATE TABLE incluido_em
(
  quantidade INT NOT NULL,
  duracao_do_uso INT,
  ID_medicamento INT NOT NULL,
  ID_pedido INT NOT NULL,
  PRIMARY KEY (ID_medicamento, ID_pedido),
  FOREIGN KEY (ID_medicamento) REFERENCES Medicamento(ID_medicamento),
  FOREIGN KEY (ID_pedido) REFERENCES Pedido(ID_pedido)
);

CREATE TABLE interacao_medicamentosa
(
  efeito TEXT NOT NULL,
  ID_medicamento_1 INT NOT NULL,
  ID_medicamento_2 INT NOT NULL,
  PRIMARY KEY (ID_medicamento_1, ID_medicamento_2),
  FOREIGN KEY (ID_medicamento_1) REFERENCES Medicamento(ID_medicamento),
  FOREIGN KEY (ID_medicamento_2) REFERENCES Medicamento(ID_medicamento)
);