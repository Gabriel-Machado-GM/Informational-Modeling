INSERT INTO Fornecedor(nome)
VALUES  ('Astrazeneca'),
		('Bupanpan'),
		('Cimedique'),
		('Janssun'),
		('Neofisica'),
		('Eurodrogas'),
		('Acheti'),
		('Baiers'),
		('GSK'),
		('Tfizer');

INSERT INTO Categoria(nome)
VALUES  ('Infecções'),
		('Sistema Nervoso Central'),
		('Dor, febre e contusão'),
		('Anticoagulante'),
		('Cabelo');;

INSERT INTO Cliente(nome, cpf, e_mail, nascimento)
VALUES  ('Maria',23821945738,'Maria@gmail.com','1928-02-14'),
		('José',36574283202,'Jose@gmail.com','1959-12-15'),
		('Mateus',56782902413,'Mateus@gmail.com','1998-04-26'),
		('Marcos',72020667126,'Marcos@gmail.com','1945-06-17'),
		('Lucas',88501145463,'Lucas@gmail.com','2018-04-11'),
		('João',10498162380,'Joao@gmail.com','2004-02-19'),
		('Paulo',21462102138,'Paulo@gmail.com','1968-01-20'),
		('Jó',37942580476,'Jo@gmail.com','2000-03-01'),
		('Isaac',54423058813,'Isaac@gmail.com','2010-05-05'),
		('Abraão',70903537151,'Abraao@gmail.com','1948-07-23');

INSERT INTO Vacina(nome, laboratorio)
VALUES  ('Tétano','Pfizer'),
		('Coronavac','Butantan'),
		('Covid 19','Pfizer'),
		('Poliomielite','Lustosa'),
		('Covid 19','Moderna');

INSERT INTO Enfermidade(nome)
VALUES  ('Diabetes tipo 1'),
		('Diabetes tipo 2'),
		('Hipertensão'),
		('Asma'),
		('Aids'),
		('Cirrose');

INSERT INTO Pedido(data, ID_cliente)
VALUES  ('2021-08-30', 1),
		('2021-05-31', 6),
		('2021-07-22', 3),
		('2021-08-02', 5),
		('2021-08-13', 9);	

INSERT INTO Endereco(cep, logradouro, numero, bairro, uf, cidade, ID_cliente)
VALUES  (32028871	,'Rua Itororó'	,121, 'Adeodato', 'MG',	'Santa Luzia',	3),
		(14848316	,'Av. João XXIII',	473	, 'Ivoturucaia',	'SP',	'Jundiaí',	7),
		(19687400	,'Rua 13 de maio'	,1128	, 'Vila do Golf',	'SP',	'Ribeirão Preto',	4),
		(20821168	,'Av. Deodoro da Fonseca',	445, 'Baldeador',	'RJ',	'Niterói',	8),
		(33230540	,'Rua Comandante Saturnino',	738, 'Floresta',	'MG',	'Divinópolis',	6),
		(18988576	,'Rua da Pena',	1457, 'Colinas Park',	'MA',	'Açailância',	1),
		(38424528	,'Rua Torquarto de Alencar'	,381, 'Switch',	'RS',	'Santa Maria',	10),
		(13987996	,'Rua 26 de abril',	274	, 'Mandacaru',	'PE',	'Petrolina',	5),
		(65570191	,'Rua Gameleira',	309, 'Conceição',	'BA','Feira de Santana',	2),
		(87445506,'Av. da Liberdade', 671, 'Vila Operária',	'PR',	'Maringá',	9);

INSERT INTO Telefone(ddd, numero, ID_cliente)
VALUES  ('85', '21798961', 3),
		('47', '77416313', 2),
		('34', '22179177', 6),
		('14', '78647452', 4),
		('67', '99441485', 5),
		('77', '45874995', 8),
		('92', '16398915', 7),
		('55', '31918946', 9),
		('24', '39474593', 10),
		('36', '64757791', 1);

INSERT INTO Estoque(qtd_adquirida, qtd_disponivel, qtd_vendida)
VALUES  (45,	42,	3),
		(27,	25,	2),
		(33,	32,	1),
		(19,	12,	7),
		(11,	7,	4),
		(49,	47,	2),
		(35,	32,	3),
		(20,	19,	1),
		(15,	13,	2),
		(30, 10, 20);

INSERT INTO tomou_vai_tomar(ID_cliente, ID_vacina, data)
VALUES  (3, 4, '2020-10-19'),
		(1, 2, '2021-06-29'),
		(2, 3, '2021-04-24'),
		(4, 3, '2021-07-23'),
		(7, 5, '2021-08-02'),
		(8, 1, '2020-02-13'),
		(2, 4, '2021-07-24');

INSERT INTO sofre_de(ID_cliente, ID_enfermidade)
VALUES  (1, 3),
		(4, 2),
		(2, 5),
		(6, 6),
		(7, 1);

INSERT INTO Medicamento(nome, preco, ID_fornecedor, ID_estoque, ID_categoria)
VALUES  ('Decadron 4mg, caixa com 10 comprimidos', 16, 1, 1,	1),
		('Gardenal 50mg, caixa com 20 comprimidos',	7, 2, 2, 2),
		('Maxalgina Solução Oral 500mg/mL, caixa com 1 frasco gotejador com 20mL de solução de uso oral', 3,	3, 3, 3),
		('Aspirina Prevent 100mg, caixa com 30 comprimidos revestidos', 15, 4, 4, 4),
		('Melhoral Infantil 85mg, blíster com 8 comprimidos', 5,	5, 5, 3),
		('Diclofenaco Dietilamônio Cimed 10mg/g, caixa com 1 bisnaga com 60g de gel de uso dermatológico', 4, 6,	6, 3),
		('Imecap Hair caixa com 60 cápsulas', 50, 7, 7, 5),
		('Medicasp Shampoo caixa com 1 frasco com 130mL de shampoo',	23,	8,	8,	5),
		('Corticorten 20mg, caixa com 20 comprimidos', 6, 9,	9, 1),
		('Antietanol 250mg, caixa com 20 comprimidos', 8, 10, 10, 2);

INSERT INTO Lembrete(data_de_inicio, periodo_de_tempo, status, ID_cliente, ID_medicamento)
VALUES  ('2020-03-21',	90,	'INATIVO', 2, 2),
		('2021-06-09',	90,	'ATIVO', 1, 4),
		('2021-07-17',	120, 'ATIVO', 5, 5),
		('2021-07-13',	30,	'INATIVO', 4, 9),
		('2021-08-19',	30,	'ATIVO', 8, 1);

INSERT INTO incluido_em(ID_medicamento, ID_pedido,	quantidade, duracao_do_uso)
VALUES  (1,	1, 2, 10),
		(3, 1, 1, NULL),
		(2,	1, 2, 20),
		(6,	2, 2, NULL),
		(7,	2, 3, 60),
		(8,	3, 1, NULL),
		(10, 3, 20, 20),
		(4, 4, 4, 30),
		(9, 4, 2, 20),
		(1,	5, 1, 10),
		(4,	5, 3, 30),
		(5, 5, 4, 4);

INSERT INTO interacao_medicamentosa(ID_medicamento_1, ID_medicamento_2, efeito)
VALUES  (1,	2, 'Diminuição da eficácia da dexametasona'),
		(1,	4, 'Deve ser utilizado cautelosamente na hipoprotrombinemia'),
		(3,	4, 'a dipirona pode reduzir o efeito do ácido acetilsalicílico na agregação plaquetária, quando administrados concomitantemente. Portanto, essa combinação deve ser usada com precau,ção em pacientes que tomam baixa dose de ácido acetilsalicílico para cardioproteção.'),
		(1,	5, 'Deve ser utilizado cautelosamente na hipoprotrombinemia'),
		(3,	5, 'a dipirona pode reduzir o efeito do ácido acetilsalicílico na agregação plaquetária, quando administrados concomitantemente. Portanto, essa combinação deve ser usada com precaução em pacientes que tomam baixa dose de ácido acetilsalicílico para cardioproteção.'),
		(4,	9, 'o ácido acetilsalicílico deverá ser usado com precaução, quando associado aos corticosteroides.'),
		(5, 9, 'o ácido acetilsalicílico deverá ser usado com precaução, quando associado aos corticosteroides.');