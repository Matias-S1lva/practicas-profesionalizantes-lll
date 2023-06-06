use master 
go
if Exists(select * from sys.sysdatabases where name='DBCiclistas')
drop database DBCiclistas
go
create Database DBCiclistas
go
use DBCiclistas
go
--creacion de tablas
create table Paises(
ID int identity(1,1) primary key,
Descripcion varchar(60)
constraint ukDescripcion unique (Descripcion)
);
go

create table Ciclistas(
ID int identity(1,1) primary key,
Nombre varchar(60) not null,
Fk_Pais_origen int not null foreign key references Paises(ID),
Fecha_nacimiento Date
);
go

create table Equipos(
ID int identity(1,1) primary key,
Nombre varchar(60) not null,
Fk_Pais_origen int not null foreign key references Paises(ID),
Director varchar(50)
);
go

create table Contrato_ciclistas(
FK_Ciclista int not null foreign key references Ciclistas(ID),
FK_Equipo int not null foreign key references Equipos(ID),
constraint ukContrato_ciclistas unique (FK_Ciclista, FK_Equipo),
Fecha_Inicio_Contrato Date,
Fecha_Fin_Contrato Date
);

create table Pruebas(
ID int identity(1,1) primary key,
Nombre varchar(60) not null,
Año int,
NumeroEtapa int ,
KilometrosTotales int,
Fk_Ciclista int not null foreign key references Ciclistas(ID),
);
go

create table Participaciones(
FK_Equipo int not null foreign key references Equipos(ID),
FK_Prueba int not null foreign key references Pruebas(ID),
constraint ukParticipaciones unique (FK_Equipo, FK_Prueba)    
);
go

-- agregando Paises origen  
INSERT INTO [dbo].[Paises]
           ([Descripcion])
     VALUES
           ('Argentina')
GO

INSERT INTO [dbo].[Paises]
           ([Descripcion])
     VALUES
           ('Francia')
GO

INSERT INTO [dbo].[Paises]
           ([Descripcion])
     VALUES
           ('Brasil')
GO

INSERT INTO [dbo].[Paises]
           ([Descripcion])
     VALUES
           ('España')
GO

INSERT INTO [dbo].[Paises]
           ([Descripcion])
     VALUES
           ('Estados Unidos')
GO

-- agregando Ciclistas
INSERT INTO [dbo].[Ciclistas]
           ([Nombre]
           ,[Fk_Pais_origen]
           ,[Fecha_nacimiento])
     VALUES
           ('Scaloni'
           ,1
           ,'1987-06-24')
GO

-- agregando Equipos
INSERT INTO [dbo].[Equipos]
			([Nombre],
			[Fk_Pais_origen],
			[Director])
	VALUES
		('Movistar Team',
		4,
		'Alfonso Galilea')
GO

INSERT INTO [dbo].[Equipos]
			([Nombre],
			[Fk_Pais_origen],
			[Director])
	VALUES
		('Trek-Segafredo',
		5,
		'Steven de Jongh')
GO

INSERT INTO [dbo].[Equipos]
			([Nombre],
			[Fk_Pais_origen],
			[Director])
	VALUES
		('Weber Shimano Ladies Power',
		1,
		'Veronica Martinez')
GO

INSERT INTO [dbo].[Equipos]
			([Nombre],
			[Fk_Pais_origen],
			[Director])
	VALUES
		('Soul Brasil Pro Cycling Team',
		3,
		'Ana Paula Castro')
GO


--FORMATO DE FECHA: AAAA-MM-DD para que funcione en otra versión de SQL
insert into Ciclistas values ('Roberto Perez',1, '2000-09-13');
insert into Ciclistas values ('Pablo Garcia',2, '1992-02-23');
insert into Ciclistas values ('Jorge Docampo',1, '1942-04-17');
insert into Ciclistas values ('Lionel Scaloni',1, '1962-01-09');
insert into Ciclistas values ('Lionel Marconi',3, '1962-09-13');

