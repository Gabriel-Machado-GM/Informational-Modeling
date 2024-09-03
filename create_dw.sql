USE DWCFB;


-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-11-24 01:48:41.21

-- tables
-- Table: Categoria
CREATE TABLE Categoria (
    ChaveCategoria uniqueidentifier  NOT NULL,
    ID_Categoria int  NOT NULL,
    nome varchar(255)  NOT NULL,
    data_inicio datetime  NOT NULL,
    data_fim datetime,
    CONSTRAINT Categoria_pk PRIMARY KEY  (ChaveCategoria)
);

-- Table: Cliente
CREATE TABLE Cliente (
    ChaveCliente uniqueidentifier  NOT NULL,
    ID_Cliente int  NOT NULL,
    NomeCliente varchar(255)  NOT NULL,
    data_inicio datetime  NOT NULL,
    data_fim datetime,
    CONSTRAINT Cliente_pk PRIMARY KEY  (ChaveCliente)
);

-- Table: Dia
CREATE TABLE Dia (
    ChaveDia uniqueidentifier  NOT NULL,
    DataCompleta date  NOT NULL,
    DiaSemana varchar(20)  NOT NULL,
    DiaMes int  NOT NULL,
    Mes int  NOT NULL,
    Ano int  NOT NULL,
    CONSTRAINT Dia_pk PRIMARY KEY  (ChaveDia)
);

-- Table: Endereco
CREATE TABLE Endereco (
    ChaveEndereco uniqueidentifier  NOT NULL,
    ID_Endereco int  NOT NULL,
    CEP varchar(8)  NOT NULL,
    logradouro varchar(255)  NOT NULL,
    numero int  NOT NULL,
    bairro varchar(255)  NOT NULL,
    uf varchar(2)  NOT NULL,
    cidade varchar(255)  NOT NULL,
    taxa_casos_covid numeric(7,2),
    data_inicio datetime  NOT NULL,
    data_fim datetime,
    CONSTRAINT Endereco_pk PRIMARY KEY  (ChaveEndereco)
);

-- Table: Fornecedor
CREATE TABLE Fornecedor (
    ChaveFornecedor uniqueidentifier  NOT NULL,
    ID_Fornecedor int  NOT NULL,
    nome varchar(255)  NOT NULL,
    data_inicio datetime  NOT NULL,
    data_fim datetime,
    CONSTRAINT Fornecedor_pk PRIMARY KEY  (ChaveFornecedor)
);

-- Table: Medicamento
CREATE TABLE Medicamento (
    ChaveMedicamento uniqueidentifier  NOT NULL,
    ID_Medicamento int  NOT NULL,
    nome varchar(255)  NOT NULL,
    preco numeric(5,2)  NOT NULL,
    data_inicio datetime  NOT NULL,
    data_fim datetime,
    CONSTRAINT Medicamento_pk PRIMARY KEY  (ChaveMedicamento)
);

-- Table: Receita
CREATE TABLE Receita (
    ChavePedido uniqueidentifier  NOT NULL,
    ID_Pedido int  NOT NULL,
    Valor numeric(9,2)  NOT NULL,
    UnidadesVendidas INT  NOT NULL,
    ChaveFornecedor uniqueidentifier  NOT NULL,
    ChaveEndereco uniqueidentifier  NOT NULL,
    ChaveDia uniqueidentifier  NOT NULL,
    ChaveCategoria uniqueidentifier  NOT NULL,
    ChaveMedicamento uniqueidentifier  NOT NULL,
    ChaveCliente uniqueidentifier  NOT NULL,
    CONSTRAINT Receita_pk PRIMARY KEY  (ChavePedido)
);

-- Table: Receita_detail
CREATE TABLE Receita_detail (
    ChavePedido uniqueidentifier  NOT NULL,
    ID_Pedido int  NOT NULL,
    Valor int  NOT NULL,
    UnidadesVendidas int  NOT NULL,
    Hora int  NOT NULL,
    ChaveEndereco uniqueidentifier  NOT NULL,
    ChaveFornecedor uniqueidentifier  NOT NULL,
    ChaveDia uniqueidentifier  NOT NULL,
    ChaveCategoria uniqueidentifier  NOT NULL,
    ChaveMedicamento uniqueidentifier  NOT NULL,
    ChaveCliente uniqueidentifier  NOT NULL,
    CONSTRAINT Receita_detail_pk PRIMARY KEY  (ChavePedido)
);

-- foreign keys
-- Reference: Receita_Categoria (table: Receita)
ALTER TABLE Receita ADD CONSTRAINT Receita_Categoria
    FOREIGN KEY (ChaveCategoria)
    REFERENCES Categoria (ChaveCategoria);

-- Reference: Receita_Cliente (table: Receita)
ALTER TABLE Receita ADD CONSTRAINT Receita_Cliente
    FOREIGN KEY (ChaveCliente)
    REFERENCES Cliente (ChaveCliente);

-- Reference: Receita_Dia (table: Receita)
ALTER TABLE Receita ADD CONSTRAINT Receita_Dia
    FOREIGN KEY (ChaveDia)
    REFERENCES Dia (ChaveDia);

-- Reference: Receita_Endereco (table: Receita)
ALTER TABLE Receita ADD CONSTRAINT Receita_Endereco
    FOREIGN KEY (ChaveEndereco)
    REFERENCES Endereco (ChaveEndereco);

-- Reference: Receita_Fornecedor (table: Receita)
ALTER TABLE Receita ADD CONSTRAINT Receita_Fornecedor
    FOREIGN KEY (ChaveFornecedor)
    REFERENCES Fornecedor (ChaveFornecedor);

-- Reference: Receita_Medicamento (table: Receita)
ALTER TABLE Receita ADD CONSTRAINT Receita_Medicamento
    FOREIGN KEY (ChaveMedicamento)
    REFERENCES Medicamento (ChaveMedicamento);

-- Reference: Receita_detail_Categoria (table: Receita_detail)
ALTER TABLE Receita_detail ADD CONSTRAINT Receita_detail_Categoria
    FOREIGN KEY (ChaveCategoria)
    REFERENCES Categoria (ChaveCategoria);

-- Reference: Receita_detail_Cliente (table: Receita_detail)
ALTER TABLE Receita_detail ADD CONSTRAINT Receita_detail_Cliente
    FOREIGN KEY (ChaveCliente)
    REFERENCES Cliente (ChaveCliente);

-- Reference: Receita_detail_Dia (table: Receita_detail)
ALTER TABLE Receita_detail ADD CONSTRAINT Receita_detail_Dia
    FOREIGN KEY (ChaveDia)
    REFERENCES Dia (ChaveDia);

-- Reference: Receita_detail_Endereco (table: Receita_detail)
ALTER TABLE Receita_detail ADD CONSTRAINT Receita_detail_Endereco
    FOREIGN KEY (ChaveEndereco)
    REFERENCES Endereco (ChaveEndereco);

-- Reference: Receita_detail_Fornecedor (table: Receita_detail)
ALTER TABLE Receita_detail ADD CONSTRAINT Receita_detail_Fornecedor
    FOREIGN KEY (ChaveFornecedor)
    REFERENCES Fornecedor (ChaveFornecedor);

-- Reference: Receita_detail_Medicamento (table: Receita_detail)
ALTER TABLE Receita_detail ADD CONSTRAINT Receita_detail_Medicamento
    FOREIGN KEY (ChaveMedicamento)
    REFERENCES Medicamento (ChaveMedicamento);

-- End of file.

