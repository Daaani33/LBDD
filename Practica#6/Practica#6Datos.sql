use Biblioteca2
-----Practica 6----
/* Crear 10 Reportes con sus respectivos joins 
Bibliblioteca */


select Autor.Nombre_Autor, COUNT(Libro.IdLibro) as LibrosPorAutor
from Libro
join Autor on Libro.IdAutor = Autor.IdAutor
GROUP BY  Nombre_Autor

select Genero.vGenero, COUNT(Libro.IdLibro) as CantidadDeLibrosPorGenero
from Libro
join Genero on Libro.IdGenero = Genero.IdGenero
GROUP BY  vGenero

select Libro.Titulo, COUNT(Prestamo.IdPrestamo) as MaximoDeVecesPrestado
from Prestamo
join Libro on Prestamo.IdLibro = Libro.IdLibro
GROUP BY Titulo

select Estudiante.Matricula, Multa.Cargo
from Multa
join Estudiante on Multa.IdAlumno = Estudiante.IdAlumno
where Multa.Cargo > 50.0000

select Estudiante.Matricula, MIN(Multa.Cargo) as MinimaMulta
from Multa
left join Estudiante on Multa.IdAlumno = Estudiante.IdAlumno
GROUP BY Matricula
ORDER BY MIN(Multa.Cargo)

select Estudiante.Matricula, MIN(Prestamo.Entrega) as EntregaMasRapida
from Prestamo
join Estudiante on Prestamo.IdAlumno = Estudiante.IdAlumno
GROUP BY Matricula
ORDER BY MIN(Prestamo.Entrega)

select Libro.Titulo, AVG(Multa.Cargo) as PromedioDeMultaPorLibro
from Multa
join Libro on Multa.IdLibro = Libro.IdLibro
GROUP BY Titulo

select Libro.Titulo, Autor.*
from Libro
right join Autor on Libro.IdAutor = Autor.IdAutor

select  Estudiante.Matricula, Sum(Factura.IdFactura) as SumaDeFacturasPorAlumno
from Factura
join Estudiante on Factura.IdAlumno = Estudiante.IdAlumno
GROUP BY Matricula


select Libro.Titulo, SUM(Prestamo.IdAlumno) as NumeroDeAlumnosQueTomaEsteLibro
from Libro 
join Prestamo on Prestamo.IdLibro = Libro.IdLibro
GROUP BY Titulo