/* Practica 7 , crear 10 views , 1 por cada tabla asies */

Use Biblioteca2

create view AutorView as 
select a.*
from Autor a
go
Select *from AutorView

create view GeneroView as 
select g.*
from Genero g
go
Select *from GeneroView

create view EditorialView as 
select e.*
from Editorial e
go

Select *from EditorialView

create view SectorView as 
select s.*
from Sector s
go

Select *from SectorView

create view CarreraView as 
select c.*
from Carrera c
go

Select *from CarreraView

create view EstudianteView as 
select e.*, Carrera.vCarrera 
from Estudiante e
join Carrera on e.IdCarrera = Carrera.IdCarrera
go

Select *from EstudianteView

create view FacturaView as 
select f.IdFactura, f.fecha_Factura, Prestamo.*, Estudiante.Matricula
from Factura f
join Prestamo on f.IdPrestamo = Prestamo.IdPrestamo
join Estudiante on f.IdAlumno = Estudiante.IdAlumno
go

select *from FacturaView

create view PrestamoView as 
select p.IdPrestamo, p.Fecha_Prestamo, p.Fecha_Exp, p.Entrega, Estudiante.Matricula, Libro.Titulo
from Prestamo p
join Estudiante on p.IdAlumno = Estudiante.IdAlumno
join Libro on p.IdLibro = Libro.IdLibro
go

Select *from PrestamoView


create view MultaView as
select m.IdMulta, m.Cargo, Libro.Titulo, Estudiante.Matricula, Prestamo.IdPrestamo
from Multa m
join Estudiante on m.IdAlumno = Estudiante.IdAlumno
join Libro on m.IdLibro = Libro.IdLibro
join Prestamo on m.IdPrestamo = Prestamo.IdPrestamo
go
Select *from MultaView

create view LibroView as
select l.IdLibro, l.Titulo, l.ISBN, Autor.Nombre_Autor, Autor.Apellido_Autor, Editorial.Empresa, 
		l.cStatus_L, Sector.Seccion, Genero.vGenero
from Libro l
join Autor on l.IdAutor = Autor.IdAutor
join Editorial on l.IdEditorial = Editorial.IdEditorial
join Sector on l.IdSector = Sector.IdSector
join Genero on l.IdGenero = Genero.IdGenero
go
select *from LibroView
