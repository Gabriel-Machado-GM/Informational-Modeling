-------------
-- CLIENTE --
-------------
use DWCFB;
INSERT INTO DWCFB.dbo.Cliente
SELECT 
    NEWID(), 
    c.ID_cliente, 
    c.nome,
	GETDATE() as data_inicio,
	NULL as data_fim
FROM DBCFB.dbo.Cliente c;


-----------------
-- MEDICAMENTO --
-----------------

INSERT INTO DWCFB.dbo.Medicamento
SELECT 
	NEWID(), 
	m.ID_medicamento,
	m.nome,
	m.preco,
	GETDATE() as data_inicio,
	NULL as data_fim
FROM DBCFB.dbo.Medicamento m;


---------------
-- CATEGORIA --
---------------

INSERT INTO DWCFB.dbo.Categoria
SELECT 
	NEWID(), 
	cat.ID_categoria,
	cat.nome,
	GETDATE() as data_inicio,
	NULL as data_fim
FROM DBCFB.dbo.Categoria cat;


----------------
-- FORNECEDOR --
----------------

INSERT INTO DWCFB.dbo.Fornecedor
SELECT 
	NEWID(), 
	f.ID_fornecedor,
	f.nome,
	GETDATE() as data_inicio,
	NULL as data_fim
FROM DBCFB.dbo.Fornecedor f;


--------------
-- Endereco --
-------------- 

INSERT INTO DWCFB.dbo.Endereco
SELECT 
	NEWID(), 
	e.ID_Endereco,
	e.cep,
	e.logradouro,
	e.numero,
	e.bairro,
	e.uf,
	e.cidade,
	NULL,
	GETDATE(),
	NULL
FROM DBCFB.dbo.Endereco e;


---------
-- Dia --
---------

INSERT INTO DWCFB.dbo.Dia
SELECT 
	NEWID(), 
	p.data,
	DATENAME(dw, p.data) as 'DiaSemana',
	DAY(p.data) as 'DiaMes',
	MONTH(p.data) as 'Mes',
	YEAR(p.data) as 'Ano'
FROM DBCFB.dbo.Pedido p;


-------------
-- Receita --
-------------


INSERT INTO DWCFB.dbo.Receita
SELECT 
	NEWID(),
	ped.ID_pedido,
	SUM(dw_m.preco * iem.quantidade) as 'Valor',
	SUM(iem.quantidade) as 'UnidadesVendidas',
	dw_f.ChaveFornecedor,
	dw_e.ChaveEndereco,
	dw_d.ChaveDia,
	dw_cat.ChaveCategoria,
	dw_m.ChaveMedicamento,
	dw_c.ChaveCliente
	
FROM DBCFB.dbo.Pedido ped
	-- Incluído em
	JOIN DBCFB.dbo.incluido_em iem
		ON ped.ID_pedido = iem.ID_pedido
	-- Medicamento
	JOIN DBCFB.dbo.Medicamento db_m
		ON db_m.ID_medicamento = iem.ID_medicamento
	JOIN DWCFB.dbo.Medicamento dw_m
		ON dw_m.ID_Medicamento = iem.ID_medicamento
	-- Fornecedor
	JOIN DBCFB.dbo.Fornecedor db_f
		ON db_f.ID_fornecedor = db_m.ID_fornecedor
	JOIN DWCFB.dbo.Fornecedor dw_f
		ON dw_f.ID_Fornecedor = db_f.ID_fornecedor
	-- Cliente
	JOIN DWCFB.dbo.Cliente dw_c
		ON dw_c.ID_Cliente = ped.ID_cliente
	-- Endereco
	JOIN DBCFB.dbo.Endereco db_e
		ON dw_c.ID_Cliente = db_e.ID_cliente
	JOIN DWCFB.dbo.Endereco dw_e
		ON dw_e.CEP = db_e.cep
	-- Dia
	JOIN DWCFB.dbo.Dia dw_d
		ON dw_d.DataCompleta = ped.data
	-- Categoria
	JOIN DWCFB.dbo.Categoria dw_cat
		ON dw_cat.ID_Categoria = db_m.ID_categoria
GROUP BY 
	ped.ID_pedido, 
	dw_f.ChaveFornecedor,
	dw_e.ChaveEndereco,
	dw_d.ChaveDia,
	dw_cat.ChaveCategoria,
	dw_m.ChaveMedicamento,
	dw_c.ChaveCliente;


--------------------
-- Receita_detail --
--------------------

INSERT INTO DWCFB.dbo.Receita_detail
SELECT 
	NEWID(),
	ped.ID_pedido,
	SUM(dw_m.preco * iem.quantidade) as 'Valor',
	SUM(iem.quantidade) as 'UnidadesVendidas',
	DATEPART(hour, GETDATE()) as 'Hora',
	dw_e.ChaveEndereco,
	dw_f.ChaveFornecedor,
	dw_d.ChaveDia,
	dw_cat.ChaveCategoria,
	dw_m.ChaveMedicamento,
	dw_c.ChaveCliente
	
FROM DBCFB.dbo.Pedido ped
	-- Incluído em
	JOIN DBCFB.dbo.incluido_em iem
		ON ped.ID_pedido = iem.ID_pedido
	-- Medicamento
	JOIN DBCFB.dbo.Medicamento db_m
		ON db_m.ID_medicamento = iem.ID_medicamento
	JOIN DWCFB.dbo.Medicamento dw_m
		ON dw_m.ID_Medicamento = iem.ID_medicamento
	-- Fornecedor
	JOIN DBCFB.dbo.Fornecedor db_f
		ON db_f.ID_fornecedor = db_m.ID_fornecedor
	JOIN DWCFB.dbo.Fornecedor dw_f
		ON dw_f.ID_Fornecedor = db_f.ID_fornecedor
	-- Cliente
	JOIN DWCFB.dbo.Cliente dw_c
		ON dw_c.ID_Cliente = ped.ID_cliente
	-- Endereco
	JOIN DBCFB.dbo.Endereco db_e
		ON dw_c.ID_Cliente = db_e.ID_cliente
	JOIN DWCFB.dbo.Endereco dw_e
		ON dw_e.CEP = db_e.cep
	-- Dia
	JOIN DWCFB.dbo.Dia dw_d
		ON dw_d.DataCompleta = ped.data
	-- Categoria
	JOIN DWCFB.dbo.Categoria dw_cat
		ON dw_cat.ID_Categoria = db_m.ID_categoria
GROUP BY 
	ped.ID_pedido, 
	dw_f.ChaveFornecedor,
	dw_e.ChaveEndereco,
	dw_d.ChaveDia,
	dw_cat.ChaveCategoria,
	dw_m.ChaveMedicamento,
	dw_c.ChaveCliente;



