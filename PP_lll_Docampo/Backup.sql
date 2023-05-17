use master
go
declare @DatabaseName varchar (100);
declare @ToPathName varchar(200);
set @DatabaseName='DBEjemplo2023';
set @ToPathName='C:\PP_lll\BackUps\'+ @DatabaseName+'-'+ convert(varchar(20),getdate(),112) + '.bak';
backup database @DatabaseName to Disk=@ToPathName
go
