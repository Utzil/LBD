use Proyecto

select Autor.Autor, COUNT(Libro.Id_Libro) as LibrosConAutor
from Libro
join Autor on Libro.Id_Autor = Autor.Id_Autor
GROUP BY  Autor

select Categoria.Nomb_Categoria, COUNT(Libro.Id_Libro) as LibrosConCategoria
from Libro
join Categoria on Libro.Id_Categoria = Categoria.Id_Categoria
GROUP BY  Nomb_Categoria

select Libro.Titulo_Lib, COUNT(Prestamo.Id_Prestamo) as MaxVecesPrestado
from Prestamo
join Libro on Prestamo.Id_Libro = Libro.Id_Libro
GROUP BY Titulo_Lib

select Alumno.Matricula, Multa.Multa
from Multa
join Alumno on Multa.Id_Alumno = Alumno.Id_Alumno
where Multa.Multa > 50.0000

select Alumno.Matricula, MIN(Multa.Multa) as MinimMulta
from Multa
left join Alumno on Multa.Id_Alumno = Alumno.Id_Alumno
GROUP BY Matricula
ORDER BY MIN(Multa.Multa)

select Alumno.Matricula, MIN(Prestamo.Fecha_Expiracion) as EntregaCorta
from Prestamo
join Alumno on Prestamo.Id_Alumno = Alumno.Id_Alumno
GROUP BY Matricula
ORDER BY MIN(Prestamo.Fecha_Expiracion)

select Libro.Titulo_Lib, AVG(Multa.Multa) as PromMultaLibro
from Multa
join Libro on Multa.Id_Libro = Libro.Id_Libro
GROUP BY Titulo_Lib

select Libro.Titulo_Lib, Autor.*
from Libro
right join Autor on Libro.Id_Autor = Autor.Id_Autor


select Libro.Titulo_Lib, SUM(Prestamo.Id_Alumno) as LibroMasPopular
from Libro 
join Prestamo on Prestamo.Id_Libro = Libro.Id_Libro
GROUP BY Titulo_Lib