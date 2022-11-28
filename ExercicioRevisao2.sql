Create DataBase ExercicioRevisao2 
Go
Use  ExercicioRevisao2 
Go


Create Table Carro (
placa				varchar(7)		not null,
marca				varchar(10)     not null,
modelo				varchar(10)		not null,
cor					varchar(10)		not null,
ano					char(4)			not null
Primary Key (placa)
)
Go

Create Table Pe�a (
codigo		int				not null,
nome		varchar(20)		not null,
valor		decimal(5,2)	not null
Primary Key (codigo)
)
Go

Create Table Cliente (
nome				varchar(40)		not null,
logradouro			varchar(50)     not null,
num					int				not null,
bairro				varchar(40)		not null,
telefone			varchar(9)		not null,
placa_carro			varchar(7)		not null
Primary Key (nome)
Foreign Key (placa_carro)
	References Carro (placa)
)
Go

Create Table Servi�o (
data			date			not null,
placa_carro		varchar(7)		not null,
codigo_peca		int				not null,
quant			int				not null,
valor			decimal(5,2)	not null
Primary Key (data)
Foreign Key (placa_carro)
	References Carro (placa),
Foreign Key (codigo_peca)
	References Pe�a (codigo)
)
Go

Insert Into Carro Values 
('AFT9087',	'VW',	'Gol',	'Preto',	2007),
('DXO9876',	'Ford',	'Ka',	'Azul',	2000),
('EGT4631',	'Renault',	'Clio',	'Verde',	2004),
('LKM7380',	'Fiat',	'Palio',	'Prata',	1997),
('BCD7521',	'Ford',	'Fiesta',	'Preto',	1999)

Insert Into Pe�a Values
(1, 'Vela',	70),
(2,	'Correia Dentada',	125),
(3, 'Trambulador',	90),
(4,	'Filtro de Ar',	30)

Insert Into Cliente Values
('Jo�o Alves',	'R. Pereira Barreto',	1258,	'Jd. Oliveiras',	'2154-9658',	'DXO9876'),
('Ana Maria',	'R. 7 de Setembro',	259,	'Centro',	'9658-8541',	'LKM7380'),
('Clara Oliveira',	'Av. Na��es Unidas',	10254,	'Pinheiros',	'2458-9658',	'EGT4631'),
('Jos� Sim�es',	'R. XV de Novembro',	36,	'�gua Branca',	'7895-2459',	'BCD7521'),
('Paula Rocha',	'R. Anhaia',	548,	'Barra Funda',	'6958-2548',	'AFT9087')

Insert Into Servi�o Values
('01/08/2020', 'DXO9876',	1,	4,	280),
('01/08/2020', 'DXO9876',	4,	1,	30),
('02/08/2020', 'EGT4631',	3,	1,	90),
('07/08/2020', 'DXO9876',	2,	1,	125)


Select telefone 
From Cliente Inner Join Carro
On Cliente.placa_carro = Carro.placa
Where modelo = 'Ka' and cor = 'Azul'

Select logradouro + ',' + Convert(varchar(5), num) + ' Bairro:' + bairro As endereco_completo
From Cliente Inner Join Servi�o
On Cliente.placa_carro = Servi�o.placa_carro
Where data = '02/08/2009'

Select placa 
From Carro 
Where ano > 2001

Select 'Marca: ' + marca + ' Modelo: ' + modelo + ' Cor: ' + cor As Carro 
From Carro
Where ano > 2005

Select codigo, nome 
From Pe�a 
Where valor < 80
