use Proyecto

---------LibrosConAutor--------
create procedure LibrosConAutor
@nombre varchar(50)
as
begin
select Autor.Autor, COUNT(Libro.Id_Libro) as LibrosConAutor
from Libro
join Autor on Libro.Id_Autor = Autor.Id_Autor
where Autor.Autor = @nombre
GROUP BY  Autor
end

---------OrdenDeLibrosConCategoria--------
create procedure OrdenDeLibrosConCategoria
@genero varchar(50)
as
begin
select Categoria.Nomb_Categoria, COUNT(Libro.Id_Libro) as OrdenDeLibrosConCategoria
from Libro
join Categoria on Libro.Id_Categoria = Categoria.Id_Categoria
where Categoria.Nomb_Categoria = @genero
GROUP BY  Nomb_Categoria
end

---------VecesPrestado--------
create procedure VecesPrestado
@titulo varchar(50)
as
begin
select Libro.Titulo_Lib, COUNT(Prestamo.Id_Prestamo) as VecesPrestado
from Prestamo
join Libro on Prestamo.Id_Libro = Libro.Id_Libro
where Libro.Titulo_Lib = @titulo
GROUP BY Titulo_Lib
end

---------MultaMayor--------
create procedure MultaMayor
as
begin
select Alumno.Matricula, Multa.Multa
from Multa
join Alumno on Multa.Id_Alumno = Alumno.Id_Alumno
where Multa.Multa > 50.0000
end

---------MiniMulta--------
create procedure MiniMulta
@matricula int
as
begin
select Alumno.Matricula, MIN(Multa.Multa) as MiniMulta
from Multa
left join Alumno on Multa.Id_Alumno = Alumno.Id_Alumno
where Alumno.Matricula = @matricula
GROUP BY Matricula
ORDER BY MIN(Multa.Multa)
end

---------EntregaRapida--------
create procedure EntregaRapida
@matricula int
as
begin
select Alumno.Matricula, MIN(Prestamo.Fecha_Expiracion) as EntregaRapida
from Prestamo
join Alumno on Prestamo.Id_Alumno = Alumno.Id_Alumno
where Alumno.Matricula = @matricula
GROUP BY Matricula
ORDER BY MIN(Prestamo.Fecha_Expiracion)
end

---------PromMultaLibro--------
create procedure PromMultaLibro
@titulo varchar(50)
as
begin
select Libro.Titulo_Lib, AVG(Multa.Multa) as PromMultaLibro
from Multa
join Libro on Multa.Id_Libro = Libro.Id_Libro
where Libro.Titulo_Lib = @titulo
GROUP BY Titulo_Lib
end
---------LibroInfoAutor--------
create procedure LibroInfoAutor
as
begin
select Libro.Titulo_Lib, Autor.*
from Libro
right join Autor on Libro.Id_Autor = Autor.Id_Autor
end

---------LibroPreferidoAlumnos--------
create procedure LibroPreferidoAlumnos
@titulo varchar(50)
as
begin
select Libro.Titulo_Lib, SUM(Prestamo.Id_Alumno) as LibroPreferidoAlumnos
from Libro 
join Prestamo on Prestamo.Id_Libro = Libro.Id_Libro
where Libro.Titulo_Lib = @titulo
GROUP BY Titulo_Lib
end

---------Triggers--------
create trigger trg_InsertLibro
on Libro
after insert as
begin
select * from inserted
end
go
------------------
create trigger trg_UpdateMulta
on Multa
after update as
begin
select * from inserted
end
go
-------Funcion--------
create function fnDividir (@n1 int, @n2 int)
returns decimal(10,3)
begin
	return @n1/@n2
end

-------QueryDinamico---
DECLARE @Autor int = 1
DECLARE @query nvarchar(2000)
set @query = 'select * from dbo.Libro 
			where Id_Autor='
DECLARE @SQL NVARCHAR(2000) = CONCAT(@query, @Autor)
SELECT @SQL
EXEC(@SQL)