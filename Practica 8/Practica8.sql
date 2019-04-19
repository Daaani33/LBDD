

/* Practica 8 , 10 SP, 1 QueryDinamico , 2 Triggers y 1 función 
Asies */

use Biblioteca2
--SP-----
create procedure ReporteLibrosPorAutor
@nombre varchar(50)
as
begin
select Autor.Nombre_Autor, COUNT(Libro.IdLibro) as LibrosPorAutor
from Libro
join Autor on Libro.IdAutor = Autor.IdAutor
where Autor.Nombre_Autor = @nombre
GROUP BY  Nombre_Autor
end

create procedure ReporteCantidadDeLibrosPorGenero
@genero varchar(50)
as
begin
select Genero.vGenero, COUNT(Libro.IdLibro) as CantidadDeLibrosPorGenero
from Libro
join Genero on Libro.IdGenero = Genero.IdGenero
where Genero.vGenero = @genero
GROUP BY  vGenero
end

create procedure ReporteMaximoDeVecesPrestado
@titulo varchar(50)
as
begin
select Libro.Titulo, COUNT(Prestamo.IdPrestamo) as MaximoDeVecesPrestado
from Prestamo
join Libro on Prestamo.IdLibro = Libro.IdLibro
where Libro.Titulo = @titulo
GROUP BY Titulo
end

create procedure ReporteMultaMayor
as
begin
select Estudiante.Matricula, Multa.Cargo
from Multa
join Estudiante on Multa.IdAlumno = Estudiante.IdAlumno
where Multa.Cargo > 50.0000
end

create procedure ReporteMinimaMulta
@matricula int
as
begin
select Estudiante.Matricula, MIN(Multa.Cargo) as MinimaMulta
from Multa
left join Estudiante on Multa.IdAlumno = Estudiante.IdAlumno
where Estudiante.Matricula = @matricula
GROUP BY Matricula
ORDER BY MIN(Multa.Cargo)
end

create procedure ReporteEntregaMasRapida
@matricula int
as
begin
select Estudiante.Matricula, MIN(Prestamo.Entrega) as EntregaMasRapida
from Prestamo
join Estudiante on Prestamo.IdAlumno = Estudiante.IdAlumno
where Estudiante.Matricula = @matricula
GROUP BY Matricula
ORDER BY MIN(Prestamo.Entrega)
end

create procedure ReportePromedioDeMultaPorLibro
@titulo varchar(50)
as
begin
select Libro.Titulo, AVG(Multa.Cargo) as PromedioDeMultaPorLibro
from Multa
join Libro on Multa.IdLibro = Libro.IdLibro
where Libro.Titulo = @titulo
GROUP BY Titulo
end

create procedure ReporteLibroInfoAutor
as
begin
select Libro.Titulo, Autor.*
from Libro
right join Autor on Libro.IdAutor = Autor.IdAutor
end

create procedure ReporteSumaDeFacturasPorAlumno
@matricula int
as
begin
select  Estudiante.Matricula, Sum(Factura.IdFactura) as SumaDeFacturasPorAlumno
from Factura
join Estudiante on Factura.IdAlumno = Estudiante.IdAlumno
where Estudiante.Matricula = @matricula 
GROUP BY Matricula
end


create procedure ReporteNumeroDeAlumnosQueTomaEsteLibro
@titulo varchar(50)
as
begin
select Libro.Titulo, SUM(Prestamo.IdAlumno) as NumeroDeAlumnosQueTomaEsteLibro
from Libro 
join Prestamo on Prestamo.IdLibro = Libro.IdLibro
where Libro.Titulo = @titulo
GROUP BY Titulo
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
			where IdAutor='
DECLARE @SQL NVARCHAR(2000) = CONCAT(@query, @Autor)
SELECT @SQL
EXEC(@SQL)