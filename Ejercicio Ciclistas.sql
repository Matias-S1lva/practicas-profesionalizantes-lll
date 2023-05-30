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
create table Ciclistas(
ID int identity(1,1) primary key,
Nombre varchar(60) not null,
Nacionalidad varchar(120) not null,
Fecha_nacimiento Date
);
go

create table Equipos(
ID int identity(1,1) primary key,
Nombre varchar(60) not null,
Nacionalidad varchar(60),
Dir varchar(50)
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

create table Nacionalidades(
ID int identity(1,1) primary key,
Descripcion varchar(60)
);

-- agregando Nacionalidades  
INSERT INTO [dbo].[Nacionalidades]
           ([Descripcion])
     VALUES
           ('Argentina')
GO
INSERT INTO [dbo].[Nacionalidades]
           ([Descripcion])
     VALUES
           ('Francia')
GO
INSERT INTO [dbo].[Nacionalidades]
           ([Descripcion])
     VALUES
           ('Brasil')
GO
-- agregando Ciclistas
INSERT INTO [dbo].[Ciclistas]
           ([Nombre]
           ,[Nacionalidad]
           ,[Fecha_nacimiento])
     VALUES
           ('Scaloni'
           ,'Argentina'
           ,'1987-06-24')
GO


insert into Ciclistas values ('Roberto Perez',1, '13/09/2000');
insert into Ciclistas values ('Pablo Garcia',2, '23/02/1992');
insert into Ciclistas values ('Jorge Docampo',1, '17/04/1942');
insert into Ciclistas values ('Lionel Scaloni',1, '09/01/1962');
insert into Ciclistas values ('Lionel Scaloni',3, '13/09/1962');
