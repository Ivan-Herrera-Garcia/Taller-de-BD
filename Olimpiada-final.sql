create database Olimpiada
GO

use Olimpiada

create table Sede (
id_sede int,
presupuesto money, 
num_complejos int,
Primary key (id_sede)
)
GO

create table Area (
localizacion varchar (30),
Primary key (localizacion)
)
GO

create table Evento (
fecha date,
duracion time,
num_participantes int,
id_evento int,
jefe varchar (30),
primary key (id_evento)
)
Go 

create table Equipo (
id_evento int, 
equipamiento varchar (30)
Primary key (equipamiento, id_evento)
)

create table Complejo (
id_sede int,
jefe varchar (30),
area_total int,
localizacion varchar (30),
tipo varchar (15) NOT NULL CHECK (tipo IN ('Unideportivo','Polideportivo')),
Primary key (jefe)
)
GO


create table Comisario (
nombre_completo varchar (30),
tipo varchar (15) NOT NULL CHECK (tipo IN ('Juez','Observador')),
Primary key (nombre_completo)
)
GO

create table Ev_Co (
id_evento int,
nombre_completo varchar (30),
Primary key (id_evento, nombre_completo)
)
GO

alter table Equipo
add constraint restriccioneventoid foreign key (id_evento) references Evento (id_evento)
GO 
alter table Ev_Co
add constraint restriccionevento foreign key (id_evento) references Evento (id_evento)
GO
alter table Ev_Co
add constraint restriccioncomisario foreign key (nombre_completo) references Comisario (nombre_completo)
GO
alter table Complejo
add constraint restriccionarea foreign key (localizacion) references Area (localizacion)
GO
alter table Complejo 
add constraint restriccionsede foreign key (id_sede) references Sede (id_sede)
GO
alter table Evento 
add constraint restriccioncomplejo foreign key (jefe) references Complejo (jefe)
GO
insert into Sede 
--Id-sede, presupuesto, num complejo
values  (1,(SELECT FLOOR(RAND()*(99999-1)+1)), 1),
		(2,(SELECT FLOOR(RAND()*(99999-1)+1)),1),
		(3,(SELECT FLOOR(RAND()*(99999-1)+1)),1),
		(4,(SELECT FLOOR(RAND()*(99999-1)+1)),1),
		(5,(SELECT FLOOR(RAND()*(99999-1)+1)),1),
		(6,(SELECT FLOOR(RAND()*(99999-1)+1)),1),
		(7,(SELECT FLOOR(RAND()*(99999-1)+1)),1),
		(8,(SELECT FLOOR(RAND()*(99999-1)+1)),1),
		(9,(SELECT FLOOR(RAND()*(99999-1)+1)),1),
		(10,(SELECT FLOOR(RAND()*(99999-1)+1)),1)
GO		


insert into Area 
--localizacion
values  ('Centro'),
		('Esquina NE'),
		('Esquina NO'),
		('Esquina E'),
		('Esquina SE'),
		('Esquina SO'),
		('Oeste'),
		('Norte'),
		('Sur'),
		('Este')
GO

insert into Complejo
--id-sede, jefe, area total, localizacion, tipo ('Unideportivo','Polideportivo')
values  (1, 'Juan', (SELECT FLOOR(RAND()*(99-1)+1)),'Centro', 'Polideportivo'),
		(2, 'Pedro', (SELECT FLOOR(RAND()*(99-1)+1)),'Esquina NE', 'Unideportivo'),
		(3, 'Maria', (SELECT FLOOR(RAND()*(99-1)+1)),'Esquina NO', 'Polideportivo'),
		(4, 'Lucia', (SELECT FLOOR(RAND()*(99-1)+1)),'Esquina E', 'Unideportivo'),
		(5, 'Ivan', (SELECT FLOOR(RAND()*(99-1)+1)),'Esquina SE', 'Unideportivo'),
		(6, 'Fatima', (SELECT FLOOR(RAND()*(99-1)+1)),'Esquina SO', 'Polideportivo'),
		(7, 'Josefina', (SELECT FLOOR(RAND()*(99-1)+1)),'Oeste', 'Polideportivo'),
		(8, 'Peter', (SELECT FLOOR(RAND()*(99-1)+1)),'Norte', 'Polideportivo'),
		(9, 'Juana', (SELECT FLOOR(RAND()*(99-1)+1)),'Sur', 'Unideportivo'),
		(10, 'Alexa', (SELECT FLOOR(RAND()*(99-1)+1)),'Este', 'Polideportivo')
GO

insert into Evento
--fecha, duracion, num_participantes, id-evento, jefe
values	('2020-01-05', '1:00:00', (SELECT FLOOR(RAND()*(9-1)+1)), 1, 'Juan'),
		('2020-04-03', '4:10:00', (SELECT FLOOR(RAND()*(9-1)+1)), 2, 'Pedro'),
		('2020-07-05', '2:30:00', (SELECT FLOOR(RAND()*(9-1)+1)), 3, 'Maria'),
		('2020-07-07', '2:50:00', (SELECT FLOOR(RAND()*(9-1)+1)), 4, 'Lucia'),
		('2020-08-09', '5:20:00', (SELECT FLOOR(RAND()*(9-1)+1)), 5, 'Ivan'),
		('2020-07-03', '4:30:00', (SELECT FLOOR(RAND()*(9-1)+1)), 6, 'Fatima'),
		('2020-06-05', '3:20:00', (SELECT FLOOR(RAND()*(9-1)+1)), 7, 'Josefina'),
		('2020-03-03', '2:40:00', (SELECT FLOOR(RAND()*(9-1)+1)), 8, 'Peter'),
		('2020-03-07', '4:50:00', (SELECT FLOOR(RAND()*(9-1)+1)), 9, 'Juana'),
		('2020-04-06', '1:50:00', (SELECT FLOOR(RAND()*(9-1)+1)), 10, 'Alexa')
GO

insert into Equipo
values  (1,'Arco'),
		(2,'Lanza'),
		(3,'Pertigas'),
		(4,'Barras'),
		(5, 'Golf'),
		(6, 'Futbol'),
		(7, 'Rugby'),
		(8, 'Tenis'),
		(9, 'Remo'),
		(10, 'Esgrima')

insert into Comisario 
values  ('Pepe', 'Juez'),
		('Rodrigo', 'Observador'),
		('Amber', 'Juez'),
		('Patricia', 'Observador'),
		('Edson', 'Juez'),
		('Antonio', 'Observador'),
		('Joaquin', 'Observador'),
		('Jesus', 'Juez'),
		('Zero', 'Juez'),
		('Killua', 'Observador')
GO

insert into Ev_Co
values (1, 'Pepe'),
		(2, 'Rodrigo'),
		(3, 'Amber'),
		(4, 'Patricia'),
		(5, 'Edson'),
		(6, 'Antonio'),
		(7, 'Joaquin'),
		(8, 'Jesus'),
		(9, 'Zero'),
		(10, 'Killua')
GO

--Indice
create index idx_sede on Sede (id_sede)
GO
create index idx_evento on Evento (id_evento)
GO
create index idx_area on Area (localizacion)
GO

--Consultas
--1
select COUNT(nombre_completo)
from Comisario 
where tipo like 'Juez'
GO

--2
select COUNT(nombre_completo)
from Comisario
where tipo like 'Observador'
GO

--3
select SUM(presupuesto)
from Sede

--4
select MAX(presupuesto)
from Sede

--5
select MIN(presupuesto)
from Sede

--6
select AVG(presupuesto)
from Sede

--7
select COUNT(num_participantes)
from Equipo join Evento
ON Equipo.id_evento=Evento.id_evento
where equipamiento like 'Esgrima'

--8
select (num_participantes)
from Equipo join Evento
ON Equipo.id_evento=Evento.id_evento
where equipamiento like 'Golf'

--9
select jefe 
from Complejo join Sede
on Complejo.id_sede=Sede.id_sede
where presupuesto=(select MAX(presupuesto) from Sede)

--10
select jefe
from Complejo join Sede
on Complejo.id_sede=Sede.id_sede
where presupuesto=(select MIN(presupuesto) from Sede)

--11
select COUNT(tipo)
from Complejo
where tipo like 'Unideportivo'

--12
select COUNT(tipo)
from Complejo
where tipo like 'Polideportivo'

--13
select SUM(area_total)
from Complejo

--14
select MAX(area_total)
from Complejo

--15
select AVG(area_total)
from Complejo

--16
select fecha from Complejo join Evento
on Complejo.jefe=Evento.jefe
where Complejo.jefe='Pedro'

--17
select fecha from Complejo join Evento
on Complejo.jefe=Evento.jefe
where Complejo.jefe='Ivan'

--18
select COUNT(id_sede)
from Sede

--19
select * from Complejo
order by jefe ASC

--20
select * from Complejo
order by jefe DESC

--21
select * 
from Evento
order by jefe ASC

--22
select * 
from Evento
order by jefe DESC

--23
Update Complejo
set area_total=10
where tipo = 'Unideportivo'

--24
Update Complejo
set area_total=20
where tipo = 'Polideportivo'


--25
Update Evento
set num_participantes=10
where id_evento=5
