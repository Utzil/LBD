create database biblio_3
use biblio_3

/*-- 1 --*/
create table Libro (
	Id_Libro int identity (1,1) not null,
	Titulo_Lib varchar(50) not null,
	ISBN_Lib int not null,
	Id_Autor int not null,
	Id_Seccion int not null,
	Id_Editorial int not null,
	Id_Categoria int not null,
	cStatus char (1) not null,

	constraint pk_libro primary key (Id_Libro),
	constraint fk_Autor foreign key (Id_Autor) references Autor (Id_Autor),
	constraint fk_Seccion foreign key (Id_Seccion) references Seccion (Id_Seccion),
	constraint fk_Editorial foreign key (Id_Editorial) references Editorial (Id_Editorial),
	constraint fk_Categoria foreign key (Id_Categoria) references Categoria (Id_Categoria)
);

select * from Libro

/*-- 2 --*/
create table Alumno (
	Id_Alumno  int identity (1,1) not null, 
	Nombre varchar(50)  not null,
	Matricula int  not null,
	CarreraID int foreign key references Carrera (Id_carrera), 
	Apellido varchar(50)  not null,
	Apellido2 varchar(50) not null,
	ActivoAlum char(1) not null,
	Edad int not null,
	Sexo char(1) not null,

	constraint Id_Alumno primary key (Id_Alumno)
);

-- 3 --
create table Carrera(
	Id_carrera int identity (1,1),
	carrera varchar(20),

	constraint PK_carrera primary key (Id_carrera)
);

/*-- 4 --*/
drop table Autor
create table Autor(
	Id_Autor int identity (1,1) not null,
	Autor varchar(50) not null,
	Autor2 varchar(50) not null
	
	constraint PK_Autor primary key (Id_Autor)
);

/*-- 5 --*/
create table Prestamo (
	Id_Prestamo int identity (1,1) not null,
	Fecha_Prestamo date not null,
	Fecha_Expiracion date not null,
	Id_Alumno int not null, 
	Id_Libro int not null,

	constraint PK_Prestamo primary key (Id_Prestamo),
	constraint fk_Alumno foreign key (Id_Alumno) references Alumno (Id_Alumno),
	constraint fk_Libro foreign key (Id_Libro) references Libro (Id_Libro),
);

/*-- 6 --*/
create table Multa (
	Id_Multa int identity (1,1) not null,
	Id_Alumno int not null,
	Id_prestamo int not null,
	Id_Libro int  not null,
	Multa money not null

	constraint PK_Multa primary key (Id_Multa),
	constraint FK_fAlumno foreign key (Id_Alumno) references Alumno (Id_Alumno),
	constraint Fk_fPrestamo foreign key (Id_prestamo) references Prestamo (Id_prestamo),
	constraint FK_fLibro foreign key (Id_Libro) references Libro (Id_Libro),
);

/*-- 7 --*/
create table Editorial(
Id_Editorial int identity (1,1) not null,
Editorial varchar(50) not null

constraint PK_Editorial primary key (Id_Editorial),
);

/*-- 8 --*/
create table Seccion(
Id_Seccion int identity (1,1) not null,
Seccion_Nombre varchar(50) not null

constraint PK_Seccion primary key (Id_Seccion)
);

/*-- 9 categoria/genero --*/
create table Categoria(
Id_Categoria int identity (1,1) not null,
Nomb_Categoria varchar(50) not null

constraint PK_Categoria primary key (Id_Categoria)
);

--INSERTS--

SELECT * FROM Alumno
INSERT INTO Alumno VALUES('Daniel',1234533,'1','Ovalle','Hernandez','s',33,'M');
INSERT INTO Alumno VALUES('Uziel',12235533,'1','Pueñuela','Rodriguez','s',22,'M');
INSERT INTO Alumno VALUES('Aaron',1234567,'6','Olivo','Alvarez','s',18,'M');
INSERT INTO Alumno VALUES('Juan',1305920,'5','Jacobo','Acuña','s',17,'M');
INSERT INTO Alumno VALUES('Andres',75301264,'4','Carbajal','Ramos','s',21,'M');
INSERT INTO Alumno VALUES('Carlos',0134572,'4','Rodriguez','Guitierrez','n',20,'M');
INSERT INTO Alumno VALUES('Hugo',2136548,'6','Martinez','Raimrez','s',17,'M');
INSERT INTO Alumno VALUES('Fransisco',0214872,'2','Aguirre','Mendoza','n',20,'M');
INSERT INTO Alumno VALUES('Elias',12365948,'1','Huerta','Pacheco','s',21,'M');
INSERT INTO Alumno VALUES('Luis',17349658,'3','Hernandez','Rodriguez','s',22,'M');
INSERT INTO Alumno VALUES('Enrique',1732564,'5','Peña','Treviño','s',20,'M');
INSERT INTO Alumno VALUES('Jose',1732365,'4','Venegas','Barrera','s',19,'M');
INSERT INTO Alumno VALUES('Marcelo',1645780,'3','Gamboa','Santana','s',19,'M');
INSERT INTO Alumno VALUES('Ivan',1624597,'5','Gomez','Beinitez','s',20,'M');
INSERT INTO Alumno VALUES('Bruce',1796548,'3','Araujo','hernandez','s',25,'M');
INSERT INTO Alumno VALUES('Juana',1754962,'1','Aguilar','Alanis','n',18,'F');
INSERT INTO Alumno VALUES('Abril',1745823,'2','Campos','Picasso','s',18,'F');
INSERT INTO Alumno VALUES('Andrea',1789453,'3','Rivera','Perez','s',17,'F');
INSERT INTO Alumno VALUES('Carolina',1738546,'4','de Leon','Villareal','s',17,'F');
INSERT INTO Alumno VALUES('Karen',1794652,'5','Rojas','de Luna','n',19,'F');
INSERT INTO Alumno VALUES('Ana',1723465,'6','Moreno','Martinez','s',20,'F');
INSERT INTO Alumno VALUES('Paola',1785246,'3','Cardenas','Calderon','s',20,'F');
INSERT INTO Alumno VALUES('Hanzel',1799652,'1','Baldemar','Mata','s',17,'F');
INSERT INTO Alumno VALUES('Mariana',1712034,'2','Carranza','Zuñiga','s',20,'F');
INSERT INTO Alumno VALUES('Marisol',1745023,'4','Valdez','Falcon','s',21,'F');

SELECT * FROM Carrera
INSERT INTO cARRERA VALUES ('LSTI');
INSERT INTO Carrera VALUES ('LCC');
INSERT INTO Carrera VALUES ('LA');
INSERT INTO Carrera VALUES ('LF');
INSERT INTO Carrera VALUES ('LMAD');
INSERT INTO Carrera VALUES ('LM');

select *from Autor
insert into Autor values('Gabriel Garcia Marquez',' ');
insert into Autor values('Carlos Sisi',' ');
insert into Autor values('Dan Brown',' ');
insert into Autor values('J.K. Rowlin','Gabriel Garcia Marquez');
insert into Autor values('Lawrence',' ');
insert into Autor values('Daniel Goleman',' ');
insert into Autor values('Stephen King',' ');
insert into Autor values('Megan Maxwell','Jose Carlos');
insert into Autor values('Joseph Conrad',' ');
insert into Autor values('Jonh Grisham',' ');
insert into Autor values('Herman Melville',' ');
insert into Autor values('Johann Wolfgang von Goethe',' ');
insert into Autor values('Nikolai Gogol',' ');
insert into Autor values('Pablo Neruda',' ');
insert into Autor values('Juan Carlos Onetti.',' ');
insert into Autor values('Mario Vargas Llosa',' ');
insert into Autor values('Isabel Allende',' ');
insert into Autor values('Julio Cortázar',' ');
insert into Autor values('Jorge Luis Borges',' ');
insert into Autor values('Xavier Velasco','José Emilio Pacheco');
insert into Autor values('Carlos Fuentes',' ');
insert into Autor values('Juan Rulfo',' ');
insert into Autor values('Octavio Paz',' ');
insert into Autor values(' ','Stephen King');
insert into Autor values('Arturo Venegas',' ');
insert into Autor values('Ricardo Rogia',' ');
insert into Autor values('Uziel Peñuela',' ');
insert into Autor values('Wilson P.J.',' ');
insert into Autor values('Sam tech ',' ');
insert into Autor values('John Green ',' ');
insert into Autor values('Blue Jeans',' ');
insert into Autor values ('J.K. Rowling', ' ');

select * from Editorial
insert into Editorial values ('Ariel');
insert into Editorial values ('Alianza');
insert into Editorial values ('Tecnos');
insert into Editorial values ('Sintesis');
insert into Editorial values ('Civitas');
insert into Editorial values ('Siglo XXI');
insert into Editorial values ('Tirant lo Blanch');
insert into Editorial values ('Catedra');
insert into Editorial values ('Aranzadi');
insert into Editorial values ('CSIC');
insert into Editorial values ('Piramide');
insert into Editorial values ('Critica');
insert into Editorial values ('McGraw-Hill');
insert into Editorial values ('Trotta');
insert into Editorial values ('Paidos');
insert into Editorial values ('Bosch');
insert into Editorial values ('Marcial Pons');
insert into Editorial values ('Universidad de Granada');
insert into Editorial values ('Centro de Estudios Politicos');
insert into Editorial values ('Universidad de Barcelona');
insert into Editorial values ('Universidad de Salamanca');
insert into Editorial values ('Espasa');
insert into Editorial values ('Akal');
insert into Editorial values ('Cometa');
insert into Editorial values ('Oceanos');
insert into Editorial values ('Comares');
insert into Editorial values ('Arco Libros');
insert into Editorial values ('Grao');
insert into Editorial values ('Dykinson');
insert into Editorial values ('Centro de Investigaciones Sociologicas');
insert into Editorial values ('Universidad de Sevilla');
insert into Editorial values ('Univerdidad de Extremadura');
insert into Editorial values ('Primociones y Publicaciones Universitarias (PPU)');
insert into Editorial values ('Universidad Nacional de Educaion a Distancia');
insert into Editorial values ('Universidad Complutense de Madrid');
insert into Editorial values ('Ministerio de Trabajo');
insert into Editorial values ('Universidade de Santiago de Compostela');
insert into Editorial values ('Universitat de Valencia');
insert into Editorial values ('Gredos');
insert into Editorial values ('Ministerio de Hacienda');
insert into Editorial values ('Cambridge University Press');
insert into Editorial values ('Taurus');
insert into Editorial values ('Icaria');
insert into Editorial values ('Ministerio de Cultura');
insert into Editorial values ('Universidad de Alicante');
insert into Editorial values ('Biblioteca Nueva');
insert into Editorial values ('Anthropos');
insert into Editorial values ('Universidad de Oviedo');
insert into Editorial values ('Narcea');
insert into Editorial values ('Visor');


select * from Seccion
insert into Seccion values('Matematicas');
insert into Seccion values('Fisica');
insert into Seccion values('Ciensias sociales');
insert into Seccion values('Programacion en C');
insert into Seccion values('Programacion en C#');
insert into Seccion values('Programacion Web');
insert into Seccion values('Ethical Hacking');
insert into Seccion values('Literatura');
insert into Seccion values('Calculo Diferencial');
insert into Seccion values('Calculo Integral');
insert into Seccion values('Estadistica');
insert into Seccion values('poesia');
insert into Seccion values('Ciencias Naturales');
insert into Seccion values('Medio Ambiente');
insert into Seccion values('Lenguas Extranjeras');
insert into Seccion values('Guias de Asesoramiento');
insert into Seccion values('Arquitecturas Computacionales');
insert into Seccion values('Sistemas Operativos');
insert into Seccion values('Circuitos Digitales');
insert into Seccion values('Redes y Comunicaciones');
insert into Seccion values('Derechos Informaticos');
insert into Seccion values('Normatividad y Regulaciones');
insert into Seccion values('Derechos Morales');
insert into Seccion values('Metodologias y Controles de Accesos');
insert into Seccion	values ('Recreacion');
insert into Seccion values ('Materias de Formacion Universitaria');

use biblio_3
SELECT*FROM  libro
SELECT*FROM  Seccion
SELECT*FROM  Autor
Select * from  Editorial
SELECT*FROM  Categoria
insert into Libro values ('Harry Potter "Las Reliquias de la Muerte"', 1324568701, 33, 25, 1, 13, 1 );
insert into Libro values ('50  Sombras de Grey', 1234056728, 20, 8, 1, 13, 1 );
insert into Libro values ('Don Quijote', 1754231682, 21, 9, 2, 13, 1 );
insert into Libro values ('It "Eso"', 1832610594, 25, 10, 3, 13, 1 );
insert into Libro values ('La Niebla', 1032145685, 31, 11, 4, 13, 1 );
insert into Libro values ('El Calculo', 1852130465, 3, 12, 5, 13, 1 );
insert into Libro values ('Derivadas e Integrales', 1523556474, 4, 1, 6, 13, 1 );
insert into Libro values ('Top 10 OWASP', 1132056449, 6, 2, 7, 13, 1 );
insert into Libro values ('Como Elaborar un Programa deSeguridad', 1245313356, 5, 3, 8, 13, 1 );
insert into Libro values ('Biologia l', 1497613285, 5, 5, 9, 13, 1 );
insert into Libro values ('Bioquimica', 1532021224, 4, 6, 10, 13, 1 );
insert into Libro values ('Anatomia Curso l', 1956132480, 3, 7, 11, 13, 1 );
insert into Libro values ('Probabilidad y estadistica', 1025558963, 2, 8, 12, 13, 1 );
insert into Libro values ('Estadistica', 1789651230, 1, 6, 13, 13, 1 );
insert into Libro values ('Controles de Acceso', 1794613025, 8, 5, 14, 13, 1 );
insert into Libro values ('Como programar en Java', 1032015648, 9, 21, 15, 13, 1 );
insert into Libro values ('Aprende a Programar en PHP', 1321123651, 13, 11, 16, 13, 1 );
insert into Libro values ('Tips de SQL para Desarrollador', 1159847324, 10, 20, 17, 13, 1 );
insert into Libro values ('Algebra Lienal', 1357482652, 11, 24, 18, 13, 1 );
insert into Libro values ('Ambiente y Sustentabilidad', 1951246852, 12, 23, 19, 13, 1 );
insert into Libro values ('Apreciasion de Las Artes', 1789456328, 14, 22, 20, 13, 1 );
insert into Libro values ('Ingenieria Social: el Arte del Engaño', 1124567824, 31, 19, 21, 13, 1 );
insert into Libro values ('Aplicacion de las Tecnologias de la Informacion', 1444662531, 1, 18, 22, 13, 1 );
insert into Libro values ('Sumatorias de series y Permutaciones', 1136252578, 16, 9, 2, 13, 1 );
insert into Libro values ('Criptografia y sus aplicaciones', 1123462925, 20, 6, 23, 13, 1 );
insert into Libro values ('El Libro de la Selva', 1995563212, 21, 5, 24, 13, 1 );
insert into Libro values ('Telecomunicaciones y Redes', 1159848821, 25, 4, 50, 13, 1 );
insert into Libro values ('Teoria de Automatas', 1356248197, 28, 3, 25, 13, 1 );
insert into Libro values ('Principios de Arquitecturas Computacionales', 1220315642, 29, 2, 26, 13, 1 );
insert into Libro values ('Filosofia', 1258346147, 2, 20, 27, 13, 1 );
insert into Libro values ('Etimologias', 1258956134, 33, 18, 28, 13, 1 );
insert into Libro values ('Programacion Web', 1456332268, 21, 17, 29, 13, 1 );
insert into Libro values ('Jerarquias de Aplicaciones', 1685112438, 1, 17, 30, 13, 1 );
insert into Libro values ('La Biblia', 1153025986, 19, 10, 31, 13, 1 );
insert into Libro values ('El Señor de los Anillos', 1852754889, 11, 16, 32, 13, 1 );
insert into Libro values ('El Codigo Da Vinci', 1107112543, 16, 15, 33, 13, 1 );
insert into Libro values ('El Pirncipito', 1963994123, 27, 14, 34, 13, 1 );
insert into Libro values ('Cien Años de Soledad', 1850552358, 25, 13, 35, 13, 1 );
insert into Libro values ('El DIario de Ana Frank', 1963753569, 11, 12, 36, 13, 1 );
insert into Libro values ('El Alquimista', 1953001995, 24, 9, 37, 13, 1 );
insert into Libro values ('El Perfume', 1710134782, 21, 7, 38, 13, 1 );
insert into Libro values ('El Amor en los Tiempos del Colera', 1823497428, 27, 8, 39, 13, 1 );
insert into Libro values ('Cronica de una Muerte Anunciada', 1369772542, 26, 6, 40, 13, 1 );
insert into Libro values ('Angeles y Demonios', 1123550204, 23, 5, 41, 13, 1 );
insert into Libro values ('La Iliada', 1357103039, 15, 4, 42, 13, 1 );
insert into Libro values ('La Divina Comedia', 1364005990, 14, 3, 43, 13, 1 );
insert into Libro values ('La Metamorfosis', 1420897542, 11, 1, 44, 13, 1 );
insert into Libro values ('La Casa de los Espiritus', 1864978668, 10, 2, 45, 13, 1 );
insert into Libro values ('Blanca Nieves', 1301852899, 8, 22, 46, 13, 1 );
insert into Libro values ('Los Mil y una Noche', 1256321199, 9, 22, 47, 13, 1 );
insert into Libro values ('La sombra del Viento', 1648730011, 7, 23, 48, 13, 1 );
insert into Libro values ('Viaje Al Centro de la Tierra', 1892352122, 2, 24, 49, 13, 1 );
insert into Libro values ('El Arte de la Guerra', 1102246258, 1, 26, 16, 13, 1 );

select*from Prestamo
insert into Prestamo values('2019/04/16', '2019/04/15', 17, 1);
insert into Prestamo Values ('2019/04/12', '2019/04/18', 5, 50);
insert into Prestamo Values ('2019/04/12', '2019/04/18', 5, 54);
insert into Prestamo Values ('2019/04/14', '2019/04/15', 2, 20 );
insert into Prestamo Values ('2019/04/15', '2019/04/22', 16, 19);

select * from Categoria
insert into Categoria values ('Suspenso');
insert into Categoria values ('Terror');
insert into Categoria values ('Drama');
insert into Categoria values ('Comedia');
insert into Categoria values ('Ciencia');
insert into Categoria values ('Salud');
insert into Categoria values ('Romance');
insert into Categoria values ('Educativo');
insert into Categoria values ('Cientifico');
insert into Categoria values ('Investigacion');
insert into Categoria values ('Normativo');
insert into Categoria values ('infantil');
insert into Categoria values ('Ciencia Ficcion');


Select*from Multa
insert into Multa values (12, 1, 12, $15);

--Vistas--
create view VistaAutor as
select a. * from Autor a
go
select *from VistaAutor

create view VistaCategoria as
select c.* from Categoria c
go

create view VistaSeccion as
select s.* from Seccion s
go

create view VistaEditorial as
select e.* from Editorial  e
go

create view VistasAlumno as
select a.*, Carrera.carrera 
from Alumno a
join Carrera on a.CarreraID = Carrera.Id_carrera
go
select*from VistasAlumno 

create view VistaCarrera as
select c.*from Carrera c
go
select*from VistaCarrera


create view VistasLibro2 as
select l.Id_Libro,l.Titulo_Lib, l.ISBN_Lib, Autor.Id_Autor, l.Id_Seccion, Editorial.Editorial,
l.Id_Categoria, l.cStatus, Seccion.Seccion_Nombre, Categoria.Nomb_Categoria
from Libro l

join Autor on l.Id_Autor = Autor.Id_Autor
join Editorial on l.Id_Editorial = Editorial.Editorial
join Seccion on l.Id_Seccion = Seccion.Seccion_Nombre
join Categoria on l.Id_Categoria = Categoria.Nomb_Categoria
go
select*from VistasLibro2

create view VistaMulta as
select m.Id_Multa, Alumno.Id_Alumno, Prestamo.Id_Prestamo, Libro.Id_Libro,m.Multa 
from Multa m
join Alumno on m.Id_Alumno = Alumno.Id_Alumno
join Prestamo on m.Id_prestamo = Prestamo.Id_Prestamo
join Libro on m.Id_Libro = Libro.Id_Libro
go 
select*from VistaMulta

create view VistaPrestamo as
select p.*from Prestamo p
go
select*from VistaPrestamo