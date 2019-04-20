use biblio_3
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