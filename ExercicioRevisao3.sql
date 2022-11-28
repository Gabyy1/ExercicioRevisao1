Create DataBase ExercicioRevisao3
Go
Use ExercicioRevisao3
Go 

Create Table Paciente (
CPF			char(11)		not null,
nome		varchar(30)		not null,
rua			varchar(30)		not null,
num			int				not null,
bairro		varchar(20)		not null,
telefone	char(8)			null,
data_nasc	date			not null
Primary Key (CPF)
)
Go

Create Table Medico (
codigo			int			not null,
nome			varchar(30) not null,
especialidade	varchar(20) not null
Primary Key (codigo)
)
Go

Create Table Prontuario (
data				date			not null,
CPF_paciente		char(11)		not null,
codigo_medico	int				not null,
diagnostico			varchar(40)		not null,
medicamneto			varchar(20)		not null
Primary Key (data)
Foreign Key (CPF_paciente)
	References Paciente (CPF),
Foreign Key (codigo_medico)
	References Medico (codigo)
)
Go

Insert Into Paciente Values 
('35454562890',	'José Rubens',	'Campos Salles',	2750,	'Centro',	'21450998',	'1954-10-18'),
('29865439810', 'Ana Claudia',	'Sete de Setembro',	178,	'Centro',	'97382764',	'1960-05-29'),
('82176534800',	'Marcos Aurélio',	'Timóteo Penteado',	236,	'Vila Galvão',	'68172651',	'1980-09-24'),
('12386758770',	'Maria Rita',	'Castello Branco',	7765,	'Vila Rosália',	NULL,	'1975-03-30'),
('92173458910',	'Joana de Souza',	'XV de Novembro',	298,	'Centro',	'21276578',	'1944-04-24')
Go

Insert Into Medico Values 
(1,	'Wilson Cesar',	'Pediatra'),
(2,	'Marcia Matos',	'Geriatra'),
(3,	'Carolina Oliveira',	'Ortopedista'),
(4,	'Vinicius Araujo',	'Clínico Geral')
Go

Insert Into Prontuario Values 
('2020-09-10',	'35454562890',	2,	'Reumatismo',	'Celebra'),
('2020-09-11',	'92173458910',	2,	'Renite Alérgica',	'Allegra'),
('2020-09-12',	'29865439810',	1,	'Inflamação de garganta',	'Nimesulida'),
('2020-09-13',	'35454562890',	2,	'H1N1',	'Tamiflu'),
('2020-09-14',	'82176534800',	4,	'Gripe',	'Resprin'),
('2020-09-15',	'12386758770',	3,	'Braço Quebrado',	'Dorflex + Gesso')
Go


Select nome, rua + ',' + Convert(char(5), num) + ' Bairro:' + bairro As endereco_completo
From Paciente
Where DateDiff (Day, data_nasc, getdate()) /365 > 50 

Select especialidade 
From Medico
Where nome = 'Carolina Oliveira'

Select medicamneto
From Prontuario
Where diagnostico = 'Reumatismo'

Select diagnostico, medicamneto 
From Prontuario Inner Join Paciente 
On Prontuario.CPF_paciente = Paciente.CPF
Where nome = 'José Rubens'

Select Distinct Medico.nome, Case When Len (especialidade) > 3
					Then Substring(especialidade, 1, 3) + '.'
					Else especialidade
					End As especialidade 
From Medico Inner Join Prontuario
On Medico.codigo = Prontuario.codigo_medico
Inner Join Paciente 
On Paciente.CPF = Prontuario.CPF_paciente
Where Paciente.nome = 'José Rubens'

Select Substring (CPF, 1,3) + '.' + Substring (CPF, 4,3) + '.' + Substring (CPF, 7,3) + '-'
+ Substring (CPF, 10,2) As CPF, Paciente.nome, rua + ',' + Convert(varchar(5), num) + ' Bairro:' + bairro As endereco_completo, Case When telefone Is Null 
																								  Then '-'
																								  Else telefone
																								  End As telefone
From Paciente Inner Join Prontuario
On Paciente.CPF = Prontuario.CPF_paciente
Inner Join Medico
On Medico.codigo = Prontuario.codigo_medico
Where Medico.nome Like 'Vinicius%'

Select DateDiff (Day, data, GetDate()) As qtd_dias_desde_da_consulta
From Prontuario Inner Join Paciente
On Prontuario.CPF_paciente = Paciente.CPF
Where nome = 'Maria Rita'

Update Paciente
Set telefone = 98345621
Where nome = 'Maria Rita' 

Update Paciente
Set rua = 'Voluntarios da Patria' , num = 1980, bairro = 'Jd. Aeroporto'
Where nome = 'Joana de Souza'
