USE [master]
GO
/****** Object:  Database [Biblioteca2]    Script Date: 19/04/2019 12:31:21 ******/
CREATE DATABASE [Biblioteca2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Biblioteca2', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Biblioteca2.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Biblioteca2_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Biblioteca2_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Biblioteca2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Biblioteca2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Biblioteca2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Biblioteca2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Biblioteca2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Biblioteca2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Biblioteca2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Biblioteca2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Biblioteca2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteca2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Biblioteca2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteca2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Biblioteca2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Biblioteca2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Biblioteca2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Biblioteca2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Biblioteca2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Biblioteca2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Biblioteca2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Biblioteca2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Biblioteca2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Biblioteca2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Biblioteca2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Biblioteca2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Biblioteca2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Biblioteca2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Biblioteca2] SET  MULTI_USER 
GO
ALTER DATABASE [Biblioteca2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Biblioteca2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Biblioteca2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Biblioteca2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Biblioteca2]
GO
/****** Object:  StoredProcedure [dbo].[ReporteCantidadDeLibrosPorGenero]    Script Date: 19/04/2019 12:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ReporteCantidadDeLibrosPorGenero]
@genero varchar(50)
as
begin
select Genero.vGenero, COUNT(Libro.IdLibro) as CantidadDeLibrosPorGenero
from Libro
join Genero on Libro.IdGenero = Genero.IdGenero
where Genero.vGenero = @genero
GROUP BY  vGenero
end
GO
/****** Object:  StoredProcedure [dbo].[ReporteEntregaMasRapida]    Script Date: 19/04/2019 12:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ReporteEntregaMasRapida]
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
GO
/****** Object:  StoredProcedure [dbo].[ReporteLibroInfoAutor]    Script Date: 19/04/2019 12:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ReporteLibroInfoAutor]
as
begin
select Libro.Titulo, Autor.*
from Libro
right join Autor on Libro.IdAutor = Autor.IdAutor
end
GO
/****** Object:  StoredProcedure [dbo].[ReporteLibrosPorAutor]    Script Date: 19/04/2019 12:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ReporteLibrosPorAutor]
@nombre varchar(50)
as
begin
select Autor.Nombre_Autor, COUNT(Libro.IdLibro) as LibrosPorAutor
from Libro
join Autor on Libro.IdAutor = Autor.IdAutor
where Autor.Nombre_Autor = @nombre
GROUP BY  Nombre_Autor
end
GO
/****** Object:  StoredProcedure [dbo].[ReporteMaximoDeVecesPrestado]    Script Date: 19/04/2019 12:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ReporteMaximoDeVecesPrestado]
@titulo varchar(50)
as
begin
select Libro.Titulo, COUNT(Prestamo.IdPrestamo) as MaximoDeVecesPrestado
from Prestamo
join Libro on Prestamo.IdLibro = Libro.IdLibro
where Libro.Titulo = @titulo
GROUP BY Titulo
end
GO
/****** Object:  StoredProcedure [dbo].[ReporteMinimaMulta]    Script Date: 19/04/2019 12:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ReporteMinimaMulta]
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
GO
/****** Object:  StoredProcedure [dbo].[ReporteMultaMayor]    Script Date: 19/04/2019 12:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ReporteMultaMayor]
as
begin
select Estudiante.Matricula, Multa.Cargo
from Multa
join Estudiante on Multa.IdAlumno = Estudiante.IdAlumno
where Multa.Cargo > 50.0000
end
GO
/****** Object:  StoredProcedure [dbo].[ReporteNumeroDeAlumnosQueTomaEsteLibro]    Script Date: 19/04/2019 12:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ReporteNumeroDeAlumnosQueTomaEsteLibro]
@titulo varchar(50)
as
begin
select Libro.Titulo, SUM(Prestamo.IdAlumno) as NumeroDeAlumnosQueTomaEsteLibro
from Libro 
join Prestamo on Prestamo.IdLibro = Libro.IdLibro
where Libro.Titulo = @titulo
GROUP BY Titulo
end
GO
/****** Object:  StoredProcedure [dbo].[ReportePromedioDeMultaPorLibro]    Script Date: 19/04/2019 12:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ReportePromedioDeMultaPorLibro]
@titulo varchar(50)
as
begin
select Libro.Titulo, AVG(Multa.Cargo) as PromedioDeMultaPorLibro
from Multa
join Libro on Multa.IdLibro = Libro.IdLibro
where Libro.Titulo = @titulo
GROUP BY Titulo
end
GO
/****** Object:  StoredProcedure [dbo].[ReporteSumaDeFacturasPorAlumno]    Script Date: 19/04/2019 12:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ReporteSumaDeFacturasPorAlumno]
@matricula int
as
begin
select  Estudiante.Matricula, Sum(Factura.IdFactura) as SumaDeFacturasPorAlumno
from Factura
join Estudiante on Factura.IdAlumno = Estudiante.IdAlumno
where Estudiante.Matricula = @matricula 
GROUP BY Matricula
end
GO
/****** Object:  UserDefinedFunction [dbo].[fnDividir]    Script Date: 19/04/2019 12:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fnDividir] (@n1 int, @n2 int)
returns decimal(10,3)
begin
	return @n1/@n2
end
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 19/04/2019 12:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Autor](
	[IdAutor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Autor] [varchar](50) NOT NULL,
	[Apellido_Autor] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Carrera](
	[IdCarrera] [int] IDENTITY(1,1) NOT NULL,
	[vCarrera] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Editorial](
	[IdEditorial] [int] IDENTITY(1,1) NOT NULL,
	[Empresa] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEditorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estudiante](
	[IdAlumno] [int] IDENTITY(1,1) NOT NULL,
	[Matricula] [int] NOT NULL,
	[IdCarrera] [int] NOT NULL,
	[Apellido_A] [varchar](50) NOT NULL,
	[Apellido2_A] [varchar](50) NOT NULL,
	[cStatus_A] [char](1) NOT NULL,
	[Sexo] [char](1) NULL,
	[Nombre_A] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[fecha_Factura] [date] NOT NULL,
	[IdPrestamo] [int] NOT NULL,
	[IdAlumno] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genero]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genero](
	[IdGenero] [int] IDENTITY(1,1) NOT NULL,
	[vGenero] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Libro](
	[IdLibro] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NULL,
	[ISBN] [int] NULL,
	[IdAutor] [int] NOT NULL,
	[IdEditorial] [int] NOT NULL,
	[cStatus_L] [char](1) NOT NULL,
	[IdSector] [int] NOT NULL,
	[IdGenero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Multa]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Multa](
	[IdMulta] [int] IDENTITY(1,1) NOT NULL,
	[Cargo] [money] NOT NULL,
	[IdLibro] [int] NOT NULL,
	[IdAlumno] [int] NOT NULL,
	[IdPrestamo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo](
	[IdPrestamo] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_Prestamo] [date] NOT NULL,
	[Fecha_Exp] [date] NOT NULL,
	[Entrega] [date] NOT NULL,
	[IdAlumno] [int] NOT NULL,
	[IdLibro] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPrestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sector]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sector](
	[IdSector] [int] IDENTITY(1,1) NOT NULL,
	[Seccion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[AutorView]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[AutorView] as 
select a.*
from Autor a

GO
/****** Object:  View [dbo].[CarreraView]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[CarreraView] as 
select c.*
from Carrera c

GO
/****** Object:  View [dbo].[EditorialView]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[EditorialView] as 
select e.*
from Editorial e

GO
/****** Object:  View [dbo].[EstudianteView]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[EstudianteView] as 
select e.*, Carrera.vCarrera 
from Estudiante e
join Carrera on e.IdCarrera = Carrera.IdCarrera

GO
/****** Object:  View [dbo].[FacturaView]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[FacturaView] as 
select f.IdFactura, f.fecha_Factura, Prestamo.*, Estudiante.Matricula
from Factura f
join Prestamo on f.IdPrestamo = Prestamo.IdPrestamo
join Estudiante on f.IdAlumno = Estudiante.IdAlumno

GO
/****** Object:  View [dbo].[GeneroView]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GeneroView] as 
select g.*
from Genero g

GO
/****** Object:  View [dbo].[InfoLib]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[InfoLib] as select l.IdLibro, l.Titulo, l.ISBN, a.Nombre_Autor, e.Empresa, l.cStatus_L, g.vGenero from Libro l,Genero g,Autor a,Editorial e
where l.IdLibro = IdLibro
GO
/****** Object:  View [dbo].[InfoLib2]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[InfoLib2] as select l.IdLibro, l.Titulo, l.ISBN, a.Nombre_Autor, e.Empresa, l.cStatus_L, g.vGenero from Libro l,Genero g,Autor a,Editorial e
where l.IdLibro = IdLibro and l.IdAutor = a.IdAutor and l.IdEditorial = e.IdEditorial and l.IdGenero = g.IdGenero
GO
/****** Object:  View [dbo].[InfoLibros]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[InfoLibros] as select idLibro, Titulo, ISBN, IdAutor, IdEditorial, cStatus_L, IdGenero from Libro
where IdLibro = IdLibro
GO
/****** Object:  View [dbo].[LibroView]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[LibroView] as
select l.IdLibro, l.Titulo, l.ISBN, Autor.Nombre_Autor, Autor.Apellido_Autor, Editorial.Empresa, 
		l.cStatus_L, Sector.Seccion, Genero.vGenero
from Libro l
join Autor on l.IdAutor = Autor.IdAutor
join Editorial on l.IdEditorial = Editorial.IdEditorial
join Sector on l.IdSector = Sector.IdSector
join Genero on l.IdGenero = Genero.IdGenero

GO
/****** Object:  View [dbo].[MultaView]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MultaView] as
select m.IdMulta, m.Cargo, Libro.Titulo, Estudiante.Matricula, Prestamo.IdPrestamo
from Multa m
join Estudiante on m.IdAlumno = Estudiante.IdAlumno
join Libro on m.IdLibro = Libro.IdLibro
join Prestamo on m.IdPrestamo = Prestamo.IdPrestamo

GO
/****** Object:  View [dbo].[PrestamoView]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[PrestamoView] as 
select p.IdPrestamo, p.Fecha_Prestamo, p.Fecha_Exp, p.Entrega, Estudiante.Matricula, Libro.Titulo
from Prestamo p
join Estudiante on p.IdAlumno = Estudiante.IdAlumno
join Libro on p.IdLibro = Libro.IdLibro

GO
/****** Object:  View [dbo].[SectorView]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[SectorView] as 
select s.*
from Sector s

GO
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (1, N'Stephen', N'King')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (2, N'Dross', N'Rootzank')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (3, N'Juanito', N'Banana')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (4, N'Uziel', N'Peñuela')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (5, N'Victor', N'Martinez')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (6, N'Dan', N'Brown')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (7, N'Octavio', N'Paz')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (8, N'Gael', N'Marquez')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (9, N'Joseph', N'Conrad')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (10, N'John', N'Wick')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (11, N'Hugo', N'Garcia')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (12, N'Uziel', N'Martinez')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (13, N'Victor', N'Garza')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (14, N'Bruce', N'Araujo')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (15, N'Steve', N'King')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (16, N'Malcom', N'Wilkerson')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (17, N'Reese', N'Wilkerson')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (18, N'Hall', N'Wilkerson')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (19, N'Wilson', N'Wilkerson')
INSERT [dbo].[Autor] ([IdAutor], [Nombre_Autor], [Apellido_Autor]) VALUES (20, N'Veigar', N'Dreyar')
SET IDENTITY_INSERT [dbo].[Autor] OFF
SET IDENTITY_INSERT [dbo].[Carrera] ON 

INSERT [dbo].[Carrera] ([IdCarrera], [vCarrera]) VALUES (1, N'LCC')
INSERT [dbo].[Carrera] ([IdCarrera], [vCarrera]) VALUES (2, N'LMAD')
INSERT [dbo].[Carrera] ([IdCarrera], [vCarrera]) VALUES (3, N'LA')
INSERT [dbo].[Carrera] ([IdCarrera], [vCarrera]) VALUES (4, N'LSTI')
INSERT [dbo].[Carrera] ([IdCarrera], [vCarrera]) VALUES (5, N'LM')
INSERT [dbo].[Carrera] ([IdCarrera], [vCarrera]) VALUES (6, N'LF')
SET IDENTITY_INSERT [dbo].[Carrera] OFF
SET IDENTITY_INSERT [dbo].[Editorial] ON 

INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (1, N'Gedisa')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (2, N'Inde')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (3, N'Routledge')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (4, N'Oxford University Press')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (5, N'Siglo XXI')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (6, N'Wilson Editorial')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (7, N'CSIC')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (8, N'McGraw-Hill')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (9, N'Trotta')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (10, N'Arco Libros')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (11, N'Trea')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (12, N'Los Libros de la Catarata')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (13, N'Universidad de Alcalá')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (14, N'Istmo')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (15, N'Routledge')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (16, N'Fundación BBVA')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (17, N'Visor')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (18, N'John Benjamins Publishing')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (19, N'Universidad de Oviedo')
INSERT [dbo].[Editorial] ([IdEditorial], [Empresa]) VALUES (20, N'Akal')
SET IDENTITY_INSERT [dbo].[Editorial] OFF
SET IDENTITY_INSERT [dbo].[Estudiante] ON 

INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (1, 1234567, 1, N'Martinez', N'Garcia', N'1', N'M', N'Victor Hugo')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (2, 1234967, 1, N'Martinez', N'Gutierrez', N'0', N'M', N'Hugo')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (3, 1244467, 1, N'Garcia', N'Gutierrez', N'1', N'M', N'Victor')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (4, 1234568, 1, N'Aguilar', N'Acevedo', N'1', N'M', N'MANUEL')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (5, 1234569, 2, N'Acevedo', N'Aguilar', N'0', N'F', N'MARGARITA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (6, 1234570, 3, N'Aguilar', N'Garcia', N'1', N'F', N'MARÍA DEL CARMEN')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (7, 1234571, 4, N'Canto', N'Garcia', N'1', N'M', N'FERNANDO')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (8, 1234572, 5, N'Martinez', N'Canto', N'1', N'M', N'ROBERTO ')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (9, 1234573, 6, N'Martinez', N'Garcia', N'1', N'M', N'CARLOS')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (10, 1234574, 1, N'Acosta', N'Garcia', N'1', N'M', N'EDUARDO ')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (11, 1234575, 2, N'Alvarro', N'Acosta', N'0', N'M', N'RAFAEL')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (12, 1234576, 3, N'Martinez', N'Alvarado', N'1', N'M', N'DAVID ')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (13, 1234577, 4, N'Alvarado', N'Garcia', N'1', N'F', N'JOSEFINA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (14, 1234578, 5, N'Altamirano', N'Alvarro', N'1', N'M', N'FRANCISCO JAVIER')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (15, 1234579, 6, N'Altamirano', N'Mendoza', N'1', N'M', N'MARIO')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (16, 1234580, 1, N'Medellín', N'Mendoza', N'1', N'M', N'ARMANDO')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (17, 1234581, 2, N'Medellín', N'Villanueva', N'1', N'F', N'MARTHA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (18, 1234582, 3, N'Martinez', N'Villanueva', N'1', N'F', N'ELIZABETH ')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (19, 1234583, 4, N'Andrade', N'Anzures', N'1', N'F', N'GLORIA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (20, 1234584, 5, N'Andrade', N'Arredondo', N'1', N'F', N'GABRIELA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (21, 1234585, 6, N'Martinez', N'Arredondo', N'0', N'M', N'ANGEL')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (22, 1234586, 1, N'Arredondo', N'Garcia', N'1', N'M', N'SILVIA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (23, 1234587, 2, N'Lopez', N'Arredondo', N'1', N'M', N'GABRIEL')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (24, 1234588, 3, N'Arnaud', N'Garcia', N'1', N'M', N'PABLO')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (25, 1234589, 4, N'Martinez', N'Arnaud', N'1', N'M', N'RUBEN')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (26, 1234590, 5, N'Garcia', N'Garcia', N'1', N'M', N'FELIPE')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (27, 1234591, 6, N'Garza', N'Miller', N'1', N'M', N'JAIME ')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (28, 1234592, 1, N'Miller', N'Light', N'1', N'M', N'JULIO CESAR')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (29, 1234593, 2, N'Garza', N'Garcia', N'0', N'M', N'DIEGO')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (30, 1234594, 3, N'Martinez', N'Miller', N'1', N'F', N'ARACELI')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (31, 1234595, 4, N'Araujo', N'Guerrero', N'1', N'F', N'ANDREA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (32, 1234596, 5, N'Guerrero', N'Rodriguez', N'1', N'F', N'ISABEL')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (33, 1234597, 6, N'Peñuela', N'Araujo', N'1', N'F', N'MARÍA TERESA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (34, 1234598, 1, N'Duran', N'Araujo', N'1', N'F', N'ADRIANA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (35, 1234599, 2, N'Martinez', N'Duran', N'1', N'F', N'LUCIA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (36, 1234600, 3, N'Duran', N'Garcia', N'1', N'F', N'DIANA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (37, 1234601, 4, N'Araujo', N'Garcia', N'1', N'F', N'LEONA')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (38, 1234602, 5, N'Martinez', N'Araujo', N'0', N'F', N'CAITLYN')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (39, 1234603, 6, N'Rodriguez', N'Peñuela', N'1', N'M', N'GUSTAVO')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (40, 1234604, 1, N'Peñuela', N'Garcia', N'0', N'M', N'JUAN ')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (41, 1234605, 2, N'Martinez', N'Rodriguez', N'1', N'F', N'GUADALUPE')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (42, 1234606, 3, N'Martinez', N'Arbea', N'1', N'F', N'JUANA ')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (43, 1234607, 4, N'Arbea', N'Garcia', N'1', N'M', N'GERARDO')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (44, 1234608, 5, N'Aquiles', N'Brinco', N'1', N'M', N'JESUS')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (45, 1234609, 6, N'Martinez', N'Aquiles', N'1', N'M', N'UZIEL')
INSERT [dbo].[Estudiante] ([IdAlumno], [Matricula], [IdCarrera], [Apellido_A], [Apellido2_A], [cStatus_A], [Sexo], [Nombre_A]) VALUES (46, 1234610, 1, N'Aquiles', N'Garcia', N'1', N'M', N'BRUCE')
SET IDENTITY_INSERT [dbo].[Estudiante] OFF
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([IdFactura], [fecha_Factura], [IdPrestamo], [IdAlumno]) VALUES (1, CAST(0x433F0B00 AS Date), 1, 5)
SET IDENTITY_INSERT [dbo].[Factura] OFF
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (1, N'Terror')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (2, N'Psicologico')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (3, N'Ciencia Ficcion')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (4, N'Fantasia')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (5, N'Romance')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (6, N'Juvenil')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (7, N'Erotico')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (8, N'Biografico')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (9, N'Educativo')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (10, N'Cocina')
INSERT [dbo].[Genero] ([IdGenero], [vGenero]) VALUES (11, N'Comedia')
SET IDENTITY_INSERT [dbo].[Genero] OFF
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (1, N'50 Sombras de Wilson', 1234567890, 13, 13, N'1', 10, 7)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (2, N'Focus', 1234567891, 1, 1, N'1', 1, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (3, N'Avengers', 1234567892, 2, 3, N'0', 1, 3)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (4, N'Luna de Pluton', 1234567893, 1, 2, N'1', 4, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (5, N'Mas Barato por Docena', 1234567894, 1, 1, N'1', 1, 11)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (6, N'Calculo', 1234567895, 2, 3, N'1', 1, 9)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (7, N'El diario de Britget', 1234567896, 3, 5, N'0', 1, 11)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (8, N'Proyecto Esposa', 1234567897, 14, 5, N'1', 1, 11)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (9, N'La vuelta al mundo en 80 dias', 1234567810, 6, 6, N'1', 1, 11)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (10, N'Emocion dura y pura', 1234567811, 16, 1, N'1', 3, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (11, N'La Española', 1334567890, 18, 1, N'1', 3, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (12, N'Nuestra Noche', 1434567890, 19, 4, N'1', 3, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (17, N'El Hobbit', 1334567890, 10, 17, N'1', 4, 4)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (18, N'Harry Potter y el Caliz de Fuego', 1434567890, 5, 4, N'1', 4, 4)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (19, N'Las Cronicas de Narnia', 1534567890, 7, 6, N'1', 4, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (20, N'El Jugador', 1634567890, 8, 9, N'1', 5, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (21, N'El Juego de Ender', 1734567890, 9, 3, N'1', 5, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (22, N'Snow Crash', 1834567890, 13, 2, N'1', 5, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (23, N'Ubik', 1234507890, 16, 8, N'1', 5, 5)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [ISBN], [IdAutor], [IdEditorial], [cStatus_L], [IdSector], [IdGenero]) VALUES (24, N'Anatema', 1234067890, 17, 20, N'0', 5, 5)
SET IDENTITY_INSERT [dbo].[Libro] OFF
SET IDENTITY_INSERT [dbo].[Multa] ON 

INSERT [dbo].[Multa] ([IdMulta], [Cargo], [IdLibro], [IdAlumno], [IdPrestamo]) VALUES (1, 50.0000, 6, 5, 1)
INSERT [dbo].[Multa] ([IdMulta], [Cargo], [IdLibro], [IdAlumno], [IdPrestamo]) VALUES (2, 50.0000, 10, 35, 2)
SET IDENTITY_INSERT [dbo].[Multa] OFF
SET IDENTITY_INSERT [dbo].[Prestamo] ON 

INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (1, CAST(0x263F0B00 AS Date), CAST(0x9F3F0B00 AS Date), CAST(0x433F0B00 AS Date), 5, 6)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (2, CAST(0x5E3F0B00 AS Date), CAST(0xFB3F0B00 AS Date), CAST(0x7D3F0B00 AS Date), 5, 10)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (3, CAST(0x7F3F0B00 AS Date), CAST(0x18400B00 AS Date), CAST(0x9D3F0B00 AS Date), 3, 3)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (4, CAST(0x5F3F0B00 AS Date), CAST(0xF83F0B00 AS Date), CAST(0x17400B00 AS Date), 4, 4)
INSERT [dbo].[Prestamo] ([IdPrestamo], [Fecha_Prestamo], [Fecha_Exp], [Entrega], [IdAlumno], [IdLibro]) VALUES (5, CAST(0x803F0B00 AS Date), CAST(0xFA3F0B00 AS Date), CAST(0x19400B00 AS Date), 6, 6)
SET IDENTITY_INSERT [dbo].[Prestamo] OFF
SET IDENTITY_INSERT [dbo].[Sector] ON 

INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (1, N'Estanteria 1')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (2, N'Estanteria 2')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (3, N'Estanteria 3')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (4, N'Estanteria 4')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (5, N'Estanteria 5')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (6, N'Estanteria 6')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (7, N'Estanteria 7')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (8, N'Estanteria 8')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (9, N'Estanteria 9')
INSERT [dbo].[Sector] ([IdSector], [Seccion]) VALUES (10, N'Estanteria 10')
SET IDENTITY_INSERT [dbo].[Sector] OFF
ALTER TABLE [dbo].[Estudiante]  WITH CHECK ADD FOREIGN KEY([IdCarrera])
REFERENCES [dbo].[Carrera] ([IdCarrera])
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Estudiante] ([IdAlumno])
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([IdPrestamo])
REFERENCES [dbo].[Prestamo] ([IdPrestamo])
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autor] ([IdAutor])
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD FOREIGN KEY([IdEditorial])
REFERENCES [dbo].[Editorial] ([IdEditorial])
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Genero] ([IdGenero])
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD FOREIGN KEY([IdSector])
REFERENCES [dbo].[Sector] ([IdSector])
GO
ALTER TABLE [dbo].[Multa]  WITH CHECK ADD FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Estudiante] ([IdAlumno])
GO
ALTER TABLE [dbo].[Multa]  WITH CHECK ADD FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
ALTER TABLE [dbo].[Multa]  WITH CHECK ADD FOREIGN KEY([IdPrestamo])
REFERENCES [dbo].[Prestamo] ([IdPrestamo])
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [fk_Alumno] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Estudiante] ([IdAlumno])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [fk_Alumno]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [fk_Libro] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [fk_Libro]
GO
/****** Object:  Trigger [dbo].[trg_InsertLibro]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trg_InsertLibro]
on [dbo].[Libro]
after insert as
begin
select * from inserted
end

GO
/****** Object:  Trigger [dbo].[trg_UpdateMulta]    Script Date: 19/04/2019 12:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trg_UpdateMulta]
on [dbo].[Multa]
after update as
begin
select * from inserted
end

GO
USE [master]
GO
ALTER DATABASE [Biblioteca2] SET  READ_WRITE 
GO
