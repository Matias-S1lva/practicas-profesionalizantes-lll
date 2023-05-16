use master 
go
if Exists(select * from sys.sysdatabases where name='DBEjemplo2023')
drop database DBEjemplo2023
go
create Database DBEjemplo2023
go
use DBEjemplo2023
go
create table Personas(
ID int identity(1,1) primary key,
Dni int unique not null,
Nombre varchar(60) not null,
Direccion varchar(120) not null
)
go
 --inserto personas
 insert Personas values(1234567,'Pedro Ponce','Pedro de Mendoza 790 CABA')
 insert Personas values(1234568,'Maria Alonso','Mitre 475 V. Ballester Bs As')
