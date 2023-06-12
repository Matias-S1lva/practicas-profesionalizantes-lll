--REGLAS DE FORMATO
--Nombre de campo: Nombre_de_campo (Mayúscula_minúscula)
--Foreign Key: Fk_Nombre_campo (Fk_Mayúscula_minúscula)

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
Edicion int not null,
Nombre varchar(60) not null,
Año Date,
Nro_etapas int,
Km_totales int,
Fk_Ganador int foreign key references Ciclistas(ID),
);
go

create table Participaciones(
FK_Equipo int not null foreign key references Equipos(ID),
FK_Prueba int not null foreign key references Pruebas(ID),
constraint ukParticipaciones unique (FK_Equipo, FK_Prueba)    
);
go

-- agregando Paises origen  

INSERT INTO Paises VALUES ('Argentina'); --1
INSERT INTO Paises VALUES ('Francia');
INSERT INTO Paises VALUES ('Brasil');
INSERT INTO Paises VALUES ('España');
INSERT INTO Paises VALUES ('Estados Unidos'); --5
INSERT INTO Paises VALUES ('Colombia');
INSERT INTO Paises VALUES ('Dinamarca');
INSERT INTO Paises VALUES ('Países Bajos');
INSERT INTO Paises VALUES ('Alemania');
INSERT INTO Paises VALUES ('Yugoslavia'); --10
INSERT INTO Paises VALUES ('Bélgica');
INSERT INTO Paises VALUES ('Irlanda');
INSERT INTO Paises VALUES ('Gran Bretaña');

-- agregando Equipos
INSERT INTO Equipos VALUES ('Movistar Team', 4, 'Alfonso Galilea'); --1
INSERT INTO Equipos VALUES ('Trek-Segafredo', 5, 'Steven de Jongh');
INSERT INTO Equipos VALUES ('Weber Shimano Ladies Power', 1, 'Veronica Martinez');
INSERT INTO Equipos VALUES ('Soul Brasil Pro Cycling Team', 3, 'Ana Paula Castro');
INSERT INTO Equipos VALUES ('Jumbo-Visma', 8, 'Addy Engels'); --5
INSERT INTO Equipos VALUES ('Bora-Hansgrohe', 9, 'Rolf Aldag'); 
INSERT INTO Equipos VALUES ('INEOS Grenadiers', 13, 'Shane Sutton');


--FORMATO DE FECHA: AAAA-MM-DD para que funcione en otra versión de SQL
insert into Ciclistas values ('Roberto Perez', 1, '2000-09-13'); --1
insert into Ciclistas values ('Pablo Garcia', 2, '1992-02-23');
insert into Ciclistas values ('Jorge Docampo', 1, '1942-04-17');
insert into Ciclistas values ('Lionel Scaloni', 1, '1962-01-09');
insert into Ciclistas values ('Lionel Marconi', 3, '1962-09-13'); --5
insert into Ciclistas values ('Sergio Higuita', 6, '1997-08-01');
insert into Ciclistas values ('Jonas Vingegaard', 7, '1996-12-10');
insert into Ciclistas values ('Primož Roglič', 10, '1989-10-29');
insert into Ciclistas values ('Sam Bennett', 11, '1990-10-16');
insert into Ciclistas values ('Geraint Thomas', 13, '1986-05-25'); --10

--Agregando Pruebas
insert into Pruebas (Edicion, Nombre, Año, Nro_etapas, Km_totales, Fk_Ganador) 
	values (109,'Tour de France', '2022', 21, 3350, 7);
insert into Pruebas values (101, 'Volta a Cataluña', '2022', 7, 1213, 6);
insert into Pruebas values (88, 'Paris-Niza', '2022', 8, 1197, 8);
insert into Pruebas values (60, 'Eschborn-Frankfurt der Radklassiker', '2022', 1, 185, 9);
insert into Pruebas values (85, 'Vuelta a Suiza', '2022', 8, 1340, 10);

--ContratosCiclistas
insert into Contrato_ciclistas values (7,5,'2018-08-01','2027-01-01');
insert into Contrato_ciclistas values (6,6,'2021-08-01','2024-08-01');
insert into Contrato_ciclistas values (8,5,'2016-08-01','2024-08-01');
insert into Contrato_ciclistas values (9,6, '2022-08-01','2024-08-01');
insert into Contrato_ciclistas values (10,7, '2010-08-01','2024-08-01');
