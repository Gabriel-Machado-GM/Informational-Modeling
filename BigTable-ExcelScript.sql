USE DWCFB;
CREATE VIEW BigTable as
SELECT
	cat.nome as nomecat, cat.data_inicio as data_iniciocat, cat.data_fim as data_fimcat,
	cli.NomeCliente, cli.data_inicio as data_iniciocli, cli.data_fim as data_fimcli,
	d.DataCompleta, d.DiaSemana, d.DiaMes, d.Mes, d.Ano,
	e.CEP, e.logradouro, e.numero, e.bairro, e.uf, e.cidade, e.taxa_casos_covid, e.data_inicio as data_inicioe, e.data_fim as data_fime,
	f.nome as nomef, f.data_inicio as data_iniciof, f.data_fim as data_fimf,
	m.nome as nomem, m.preco, m.data_inicio as data_inciom, m.data_fim as data_fimm,
	r.Valor, r.Unidadesvendidas

FROM
	[DWCFB].[dbo].[Receita] r inner join [DWCFB].[dbo].Medicamento m on r.ChaveMedicamento=m.ChaveMedicamento
	inner join [DWCFB].[dbo].Fornecedor f on f.ChaveFornecedor=r.ChaveFornecedor
	inner join [DWCFB].[dbo].Endereco e on e.ChaveEndereco=r.ChaveEndereco
	inner join [DWCFB].[dbo].Dia d on d.ChaveDia=r.ChaveDia
	inner join [DWCFB].[dbo].Cliente cli on cli.ChaveCliente=r.ChaveCliente
	inner join [DWCFB].[dbo].Categoria cat on cat.ChaveCategoria=r.ChaveCategoria;

SELECT * FROM BigTable;