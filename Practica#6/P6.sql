USE [master]
GO
/****** Object:  Database [Biblioteca2]    Script Date: 18/04/2019 15:07:07 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Biblioteca2')
BEGIN
CREATE DATABASE [Biblioteca2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Biblioteca2', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Biblioteca2.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Biblioteca2_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Biblioteca2_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

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
ALTER AUTHORIZATION ON DATABASE::[Biblioteca2] TO [DESKTOP-UC93B76\zaiko]
GO
USE [Biblioteca2]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 18/04/2019 15:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Autor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Autor](
	[IdAutor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Autor] [varchar](50) NOT NULL,
	[Apellido_Autor] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Autor__DD33B0314D9F5159] PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Autor] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 18/04/2019 15:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Carrera]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Carrera](
	[IdCarrera] [int] IDENTITY(1,1) NOT NULL,
	[vCarrera] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Carrera__884A8F1F5E76FF34] PRIMARY KEY CLUSTERED 
(
	[IdCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Carrera] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 18/04/2019 15:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Editorial]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Editorial](
	[IdEditorial] [int] IDENTITY(1,1) NOT NULL,
	[Empresa] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Editoria__EF8386714CAFF088] PRIMARY KEY CLUSTERED 
(
	[IdEditorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Editorial] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 18/04/2019 15:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estudiante]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Estudiante](
	[IdAlumno] [int] IDENTITY(1,1) NOT NULL,
	[Matricula] [int] NOT NULL,
	[IdCarrera] [int] NOT NULL,
	[Apellido_A] [varchar](50) NOT NULL,
	[Apellido2_A] [varchar](50) NOT NULL,
	[cStatus_A] [char](1) NOT NULL,
	[Sexo] [char](1) NULL,
	[Nombre_A] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Estudian__460B474021ED5F28] PRIMARY KEY CLUSTERED 
(
	[IdAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Estudiante] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 18/04/2019 15:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Factura]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Factura](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[fecha_Factura] [date] NOT NULL,
	[IdPrestamo] [int] NOT NULL,
	[IdAlumno] [int] NOT NULL,
 CONSTRAINT [PK__Factura__50E7BAF1F170C472] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Factura] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 18/04/2019 15:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genero]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Genero](
	[IdGenero] [int] IDENTITY(1,1) NOT NULL,
	[vGenero] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Genero__0F834988A8512532] PRIMARY KEY CLUSTERED 
(
	[IdGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Genero] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 18/04/2019 15:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Libro](
	[IdLibro] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NULL,
	[ISBN] [int] NULL,
	[IdAutor] [int] NOT NULL,
	[IdEditorial] [int] NOT NULL,
	[cStatus_L] [char](1) NOT NULL,
	[IdSector] [int] NOT NULL,
	[IdGenero] [int] NOT NULL,
 CONSTRAINT [PK__Libro__3E0B49AD67493C0F] PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Libro] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Multa]    Script Date: 18/04/2019 15:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Multa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Multa](
	[IdMulta] [int] IDENTITY(1,1) NOT NULL,
	[Cargo] [money] NOT NULL,
	[IdLibro] [int] NOT NULL,
	[IdAlumno] [int] NOT NULL,
	[IdPrestamo] [int] NOT NULL,
 CONSTRAINT [PK__Multa__2F525A8C0BCDE585] PRIMARY KEY CLUSTERED 
(
	[IdMulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Multa] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 18/04/2019 15:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prestamo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Prestamo](
	[IdPrestamo] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_Prestamo] [date] NOT NULL,
	[Fecha_Exp] [date] NOT NULL,
	[Entrega] [date] NOT NULL,
	[IdAlumno] [int] NOT NULL,
	[IdLibro] [int] NOT NULL,
 CONSTRAINT [PK__Prestamo__6FF194C0DE2E92C9] PRIMARY KEY CLUSTERED 
(
	[IdPrestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Prestamo] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Sector]    Script Date: 18/04/2019 15:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sector]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sector](
	[IdSector] [int] IDENTITY(1,1) NOT NULL,
	[Seccion] [varchar](50) NULL,
 CONSTRAINT [PK__Sector__D0011C18753BF85A] PRIMARY KEY CLUSTERED 
(
	[IdSector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Sector] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[InfoLib]    Script Date: 18/04/2019 15:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[InfoLib]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[InfoLib] as select l.IdLibro, l.Titulo, l.ISBN, a.Nombre_Autor, e.Empresa, l.cStatus_L, g.vGenero from Libro l,Genero g,Autor a,Editorial e
where l.IdLibro = IdLibro' 
GO
ALTER AUTHORIZATION ON [dbo].[InfoLib] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[InfoLib2]    Script Date: 18/04/2019 15:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[InfoLib2]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[InfoLib2] as select l.IdLibro, l.Titulo, l.ISBN, a.Nombre_Autor, e.Empresa, l.cStatus_L, g.vGenero from Libro l,Genero g,Autor a,Editorial e
where l.IdLibro = IdLibro and l.IdAutor = a.IdAutor and l.IdEditorial = e.IdEditorial and l.IdGenero = g.IdGenero' 
GO
ALTER AUTHORIZATION ON [dbo].[InfoLib2] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[InfoLibros]    Script Date: 18/04/2019 15:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[InfoLibros]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[InfoLibros] as select idLibro, Titulo, ISBN, IdAutor, IdEditorial, cStatus_L, IdGenero from Libro
where IdLibro = IdLibro' 
GO
ALTER AUTHORIZATION ON [dbo].[InfoLibros] TO  SCHEMA OWNER 
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
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Estudiant__IdCar__173876EA]') AND parent_object_id = OBJECT_ID(N'[dbo].[Estudiante]'))
ALTER TABLE [dbo].[Estudiante]  WITH CHECK ADD  CONSTRAINT [FK__Estudiant__IdCar__173876EA] FOREIGN KEY([IdCarrera])
REFERENCES [dbo].[Carrera] ([IdCarrera])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Estudiant__IdCar__173876EA]') AND parent_object_id = OBJECT_ID(N'[dbo].[Estudiante]'))
ALTER TABLE [dbo].[Estudiante] CHECK CONSTRAINT [FK__Estudiant__IdCar__173876EA]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Factura__IdAlumn__60A75C0F]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK__Factura__IdAlumn__60A75C0F] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Estudiante] ([IdAlumno])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Factura__IdAlumn__60A75C0F]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK__Factura__IdAlumn__60A75C0F]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Factura__IdPrest__5FB337D6]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK__Factura__IdPrest__5FB337D6] FOREIGN KEY([IdPrestamo])
REFERENCES [dbo].[Prestamo] ([IdPrestamo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Factura__IdPrest__5FB337D6]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK__Factura__IdPrest__5FB337D6]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdAutor__21B6055D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK__Libro__IdAutor__21B6055D] FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autor] ([IdAutor])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdAutor__21B6055D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK__Libro__IdAutor__21B6055D]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdEditori__22AA2996]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK__Libro__IdEditori__22AA2996] FOREIGN KEY([IdEditorial])
REFERENCES [dbo].[Editorial] ([IdEditorial])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdEditori__22AA2996]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK__Libro__IdEditori__22AA2996]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdGenero__24927208]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK__Libro__IdGenero__24927208] FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Genero] ([IdGenero])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdGenero__24927208]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK__Libro__IdGenero__24927208]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdSector__239E4DCF]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK__Libro__IdSector__239E4DCF] FOREIGN KEY([IdSector])
REFERENCES [dbo].[Sector] ([IdSector])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Libro__IdSector__239E4DCF]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK__Libro__IdSector__239E4DCF]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Multa__IdAlumno__4222D4EF]') AND parent_object_id = OBJECT_ID(N'[dbo].[Multa]'))
ALTER TABLE [dbo].[Multa]  WITH CHECK ADD  CONSTRAINT [FK__Multa__IdAlumno__4222D4EF] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Estudiante] ([IdAlumno])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Multa__IdAlumno__4222D4EF]') AND parent_object_id = OBJECT_ID(N'[dbo].[Multa]'))
ALTER TABLE [dbo].[Multa] CHECK CONSTRAINT [FK__Multa__IdAlumno__4222D4EF]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Multa__IdLibro__412EB0B6]') AND parent_object_id = OBJECT_ID(N'[dbo].[Multa]'))
ALTER TABLE [dbo].[Multa]  WITH CHECK ADD  CONSTRAINT [FK__Multa__IdLibro__412EB0B6] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Multa__IdLibro__412EB0B6]') AND parent_object_id = OBJECT_ID(N'[dbo].[Multa]'))
ALTER TABLE [dbo].[Multa] CHECK CONSTRAINT [FK__Multa__IdLibro__412EB0B6]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Multa__IdPrestam__403A8C7D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Multa]'))
ALTER TABLE [dbo].[Multa]  WITH CHECK ADD  CONSTRAINT [FK__Multa__IdPrestam__403A8C7D] FOREIGN KEY([IdPrestamo])
REFERENCES [dbo].[Prestamo] ([IdPrestamo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Multa__IdPrestam__403A8C7D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Multa]'))
ALTER TABLE [dbo].[Multa] CHECK CONSTRAINT [FK__Multa__IdPrestam__403A8C7D]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Alumno]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prestamo]'))
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [fk_Alumno] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Estudiante] ([IdAlumno])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Alumno]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prestamo]'))
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [fk_Alumno]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Libro]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prestamo]'))
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [fk_Libro] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Libro]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prestamo]'))
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [fk_Libro]
GO
/****** Object:  Statistic [_WA_Sys_00000002_1DE57479]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000002_1DE57479' and object_id = object_id(N'[dbo].[Autor]'))
CREATE STATISTICS [_WA_Sys_00000002_1DE57479] ON [dbo].[Autor]([Nombre_Autor]) WITH STATS_STREAM = 0x0100000001000000000000000000000079A2FCDC00000000E604000000000000A604000000000000A7030000A7000000320000000000000028D00000000000000700000049B2ED0033AA00001400000000000000140000000000000000000000398E633D0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000120000001200000001000000100000009A99A9400000A041000000009A99A9400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000130000000000000000000000000000008D0200000000000032030000000000003A030000000000009000000000000000AC00000000000000C600000000000000E200000000000000FD00000000000000180100000000000033010000000000004E010000000000006B010000000000008901000000000000A601000000000000C401000000000000E001000000000000FE010000000000001A02000000000000360200000000000053020000000000007002000000000000300010000000803F000000000000803F04000001001C004272756365300010000000803F000000000000803F04000001001A0044616E300010000000803F000000000000803F04000001001C0044726F7373300010000000803F000000000000803F04000001001B004761656C300010000000803F000000000000803F04000001001B0048616C6C300010000000803F000000000000803F04000001001B004875676F300010000000803F000000000000803F04000001001B004A6F686E300010000000803F000000000000803F04000001001D004A6F73657068300010000000803F000000000000803F04000001001E004A75616E69746F300010000000803F000000000000803F04000001001D004D616C636F6D300010000000803F000000000000803F04000001001E004F63746176696F300010000000803F000000000000803F04000001001C005265657365300010000000803F000000000000803F04000001001E005374657068656E300010000000803F000000000000803F04000001001C0053746576653000100000000040000000000000803F04000001001C00557A69656C300010000000803F000000000000803F04000001001D005665696761723000100000000040000000000000803F04000001001D00566963746F72300010000000803F000000000000803F04000001001D0057696C736F6EFF01000000000000000B0000000B000000280000002800000000000000000000003A000000427275636544726F737348616C6C4A6F686E75616E69746F4F63746176696F52656573655374657665557A69656C566963746F7257696C736F6E0D00000040000000008105000000810505000081040A0000C0010E000081030F00000106120000810718000081051F00008105240000810529000081062E00000106340000001400000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000003_1DE57479]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000003_1DE57479' and object_id = object_id(N'[dbo].[Autor]'))
CREATE STATISTICS [_WA_Sys_00000003_1DE57479] ON [dbo].[Autor]([Apellido_Autor]) WITH STATS_STREAM = 0x010000000100000000000000000000005DFAFD680000000074040000000000003404000000000000A7030000A7000000320000000000000028D0000000000000070000005DCA420131AA000014000000000000001400000000000000000000008988883D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F0000000F00000001000000100000006666CE400000A041000000006666CE400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000130000000000000000000000000000002B02000000000000C002000000000000C80200000000000078000000000000009500000000000000B200000000000000CE00000000000000EB000000000000000801000000000000250100000000000041010000000000005C010000000000007A010000000000009901000000000000B301000000000000D101000000000000F0010000000000000B02000000000000300010000000803F000000000000803F04000001001D00417261756A6F300010000000803F000000000000803F04000001001D0042616E616E61300010000000803F000000000000803F04000001001C0042726F776E300010000000803F000000000000803F04000001001D00436F6E726164300010000000803F000000000000803F04000001001D00447265796172300010000000803F000000000000803F04000001001D00476172636961300010000000803F000000000000803F04000001001C004761727A613000100000000040000000000000803F04000001001B004B696E67300010000000803F000000000000803F04000001001E004D61727175657A3000100000000040000000000000803F04000001001F004D617274696E657A300010000000803F000000000000803F04000001001A0050617A300010000000803F000000000000803F04000001001E005065F175656C61300010000000803F000000000000803F04000001001F00526F6F747A616E6B300010000000803F000000000000803F04000001001B005769636B3000100000008040000000000000803F0400000100200057696C6B6572736F6EFF01000000000000000B000000090000002800000028000000000000000000000034000000417261756A6F42726F776E4472657961724761727A614B696E674D617274696E657A5065F175656C615769636B6C6B6572736F6E0B00000040000000008106000000810506000081060B00008105110000810416000082081A00008107220000400229000081022B000002072D0000001400000000000000
GO
/****** Object:  Statistic [PK__Autor__DD33B0314D9F5159]    Script Date: 18/04/2019 15:07:07 ******/
if  exists (select * from sys.stats where name = N'PK__Autor__DD33B0314D9F5159' and object_id = object_id(N'[dbo].[Autor]'))
UPDATE STATISTICS [dbo].[Autor]([PK__Autor__DD33B0314D9F5159]) WITH STATS_STREAM = 0x010000000100000000000000000000006060BBAE000000000103000000000000C102000000000000380300003800000004000A0000000000000000006F526565070000009048400131AA0000140000000000000014000000000000000000803FCDCC4C3D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B0000000B0000000100000014000000000080400000A041000000000000804000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000055010000000000005D0100000000000058000000000000006F0000000000000086000000000000009D00000000000000B400000000000000CB00000000000000E200000000000000F900000000000000100100000000000027010000000000003E01000000000000100014000000803F000000000000803F01000000040000100014000000803F0000803F0000803F03000000040000100014000000803F0000803F0000803F05000000040000100014000000803F0000803F0000803F07000000040000100014000000803F0000803F0000803F09000000040000100014000000803F0000803F0000803F0B000000040000100014000000803F0000803F0000803F0D000000040000100014000000803F0000803F0000803F0F000000040000100014000000803F0000803F0000803F11000000040000100014000000803F0000803F0000803F13000000040000100014000000803F000000000000803F140000000400001400000000000000, ROWCOUNT = 20, PAGECOUNT = 1
GO
/****** Object:  Statistic [PK__Carrera__884A8F1F5E76FF34]    Script Date: 18/04/2019 15:07:07 ******/
if  exists (select * from sys.stats where name = N'PK__Carrera__884A8F1F5E76FF34' and object_id = object_id(N'[dbo].[Carrera]'))
UPDATE STATISTICS [dbo].[Carrera]([PK__Carrera__884A8F1F5E76FF34]) WITH STATS_STREAM = 0x01000000010000000000000000000000ED0358EE0000000040000000000000000000000000000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 6, PAGECOUNT = 1
GO
/****** Object:  Statistic [PK__Editoria__EF8386714CAFF088]    Script Date: 18/04/2019 15:07:07 ******/
if  exists (select * from sys.stats where name = N'PK__Editoria__EF8386714CAFF088' and object_id = object_id(N'[dbo].[Editorial]'))
UPDATE STATISTICS [dbo].[Editorial]([PK__Editoria__EF8386714CAFF088]) WITH STATS_STREAM = 0x0100000001000000000000000000000024F5376A000000000103000000000000C102000000000000380300003800000004000A0000000000000000006F526565070000009148400131AA0000140000000000000014000000000000000000803FCDCC4C3D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B0000000B0000000100000014000000000080400000A041000000000000804000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000055010000000000005D0100000000000058000000000000006F0000000000000086000000000000009D00000000000000B400000000000000CB00000000000000E200000000000000F900000000000000100100000000000027010000000000003E01000000000000100014000000803F000000000000803F01000000040000100014000000803F0000803F0000803F03000000040000100014000000803F0000803F0000803F05000000040000100014000000803F0000803F0000803F07000000040000100014000000803F0000803F0000803F09000000040000100014000000803F0000803F0000803F0B000000040000100014000000803F0000803F0000803F0D000000040000100014000000803F0000803F0000803F0F000000040000100014000000803F0000803F0000803F11000000040000100014000000803F0000803F0000803F13000000040000100014000000803F000000000000803F140000000400001400000000000000, ROWCOUNT = 20, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000002_15502E78]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000002_15502E78' and object_id = object_id(N'[dbo].[Estudiante]'))
CREATE STATISTICS [_WA_Sys_00000002_15502E78] ON [dbo].[Estudiante]([Matricula]) WITH STATS_STREAM = 0x01000000010000000000000000000000A89AED6900000000B3040000000000007304000000000000380300003800000004000A00000000000000000000000000070000005A0CEE0033AA00002E000000000000002E000000000000000000803F4316B23C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000190000001900000001000000140000000000804000003842000000000000804000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000007030000000000000F03000000000000C800000000000000DF00000000000000F6000000000000000D0100000000000024010000000000003B010000000000005201000000000000690100000000000080010000000000009701000000000000AE01000000000000C501000000000000DC01000000000000F3010000000000000A02000000000000210200000000000038020000000000004F0200000000000066020000000000007D020000000000009402000000000000AB02000000000000C202000000000000D902000000000000F002000000000000100014000000803F000000000000803F87D61200040000100014000000803F0000803F0000803F89D61200040000100014000000803F0000803F0000803F8BD61200040000100014000000803F0000803F0000803F8DD61200040000100014000000803F0000803F0000803F8FD61200040000100014000000803F0000803F0000803F91D61200040000100014000000803F0000803F0000803F93D61200040000100014000000803F0000803F0000803F95D61200040000100014000000803F0000803F0000803F97D61200040000100014000000803F0000803F0000803F99D61200040000100014000000803F0000803F0000803F9BD61200040000100014000000803F0000803F0000803F9DD61200040000100014000000803F0000803F0000803F9FD61200040000100014000000803F0000803F0000803FA1D61200040000100014000000803F0000803F0000803FA3D61200040000100014000000803F0000803F0000803FA5D61200040000100014000000803F0000803F0000803FA7D61200040000100014000000803F0000803F0000803FA9D61200040000100014000000803F0000803F0000803FABD61200040000100014000000803F0000803F0000803FADD61200040000100014000000803F0000803F0000803FAFD61200040000100014000000803F0000803F0000803FB1D61200040000100014000000803F000000000000803FB2D61200040000100014000000803F000000000000803F17D81200040000100014000000803F000000000000803F33FD12000400002E00000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000003_15502E78]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000003_15502E78' and object_id = object_id(N'[dbo].[Estudiante]'))
CREATE STATISTICS [_WA_Sys_00000003_15502E78] ON [dbo].[Estudiante]([IdCarrera]) WITH STATS_STREAM = 0x01000000010000000000000000000000AB41CB5E000000002802000000000000E8010000000000003803803F3800000004000A0000000000000000000014000007000000E70A450131AA00002E000000000000002E000000000000002549123EABAA2A3E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000040000000100000014000000000080400000384200000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000007C000000000000008400000000000000200000000000000037000000000000004E0000000000000065000000000000001000140000003041000000000000803F01000000040000100014000000E0400000E0400000E04003000000040000100014000000E0400000E0400000E04005000000040000100014000000E040000000000000803F060000000400002E00000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000004_15502E78]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000004_15502E78' and object_id = object_id(N'[dbo].[Estudiante]'))
CREATE STATISTICS [_WA_Sys_00000004_15502E78] ON [dbo].[Estudiante]([Apellido_A]) WITH STATS_STREAM = 0x0100000001000000000000000000000099DBCECE00000000BE050000000000007E05000000000000A7030000A7000000320000000000000028D0000001000000070000000E0C430131AA00002E000000000000002E00000000000000000000004316323D0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000170000001700000001000000100000009CDEE44000003842000000009CDEE44000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001300000000000000000000000000000066030000000000000A040000000000001204000000000000B800000000000000D600000000000000F3000000000000001101000000000000320100000000000051010000000000006F010000000000008D01000000000000AB01000000000000C801000000000000E401000000000000010200000000000021020000000000003D02000000000000590200000000000076020000000000009202000000000000B102000000000000CD02000000000000EC020000000000000B0300000000000028030000000000004603000000000000300010000000803F000000000000803F04000001001E004163657665646F300010000000803F000000000000803F04000001001D0041636F7374613000100000000040000000000000803F04000001001E00416775696C61723000100000000040000000000000803F04000001002100416C74616D6972616E6F300010000000803F000000000000803F04000001001F00416C76617261646F300010000000803F000000000000803F04000001001E00416C766172726F3000100000000040000000000000803F04000001001E00416E64726164653000100000000040000000000000803F04000001001E00417175696C65733000100000000040000000000000803F04000001001D00417261756A6F300010000000803F000000000000803F04000001001C004172626561300010000000803F000000000000803F04000001001D0041726E617564300010000000803F000000000000803F0400000100200041727265646F6E646F300010000000803F000000000000803F04000001001C0043616E746F3000100000000040000000000000803F04000001001C00447572616E3000100000000040000000000000803F04000001001D004761726369613000100000000040000000000000803F04000001001C004761727A61300010000000803F000000000000803F04000001001F00477565727265726F300010000000803F000000000000803F04000001001C004C6F70657A3000100000006041000000000000803F04000001001F004D617274696E657A3000100000000040000000000000803F04000001001F004D6564656C6CED6E300010000000803F000000000000803F04000001001D004D696C6C65723000100000000040000000000000803F04000001001E005065F175656C61300010000000803F000000000000803F04000001002000526F6472696775657AFF01000000000000000C0000000900000028000000280000000000000000000000390000004163657665646F6C74616D6972616E6F6E64726164657261756A6F7265646F6E646F4761726369617A614D617274696E657A5065F175656C610D0000004000000000C0010000008106010000810907000081061000004001160000810417000001071B0000C0032200008103250000010228000084082A00000107320000002E00000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000006_15502E78]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000006_15502E78' and object_id = object_id(N'[dbo].[Estudiante]'))
CREATE STATISTICS [_WA_Sys_00000006_15502E78] ON [dbo].[Estudiante]([cStatus_A]) WITH STATS_STREAM = 0x010000000100000000000000000000001EF49639000000002702000000000000E701000000000000AF033F04AF000000010000000000000028D000000000000007000000AE27420131AA00002E000000000000002E00000000000000000000000000003F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000000200000001000000110000000000803F00003842000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013000000000000000000000000000000380000000000000073000000000000007B0000000000000010000000000000002400000000000000100011000000E040000000000000803F300400001000110000001C42000000000000803F31040000FF01000000000000000C000000020000002800000028000000000000000000000002000000303103000000400000000082010000000A01010000002E00000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000007_15502E78]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000007_15502E78' and object_id = object_id(N'[dbo].[Estudiante]'))
CREATE STATISTICS [_WA_Sys_00000007_15502E78] ON [dbo].[Estudiante]([Sexo]) WITH STATS_STREAM = 0x010000000100000000000000000000006A930B2B000000002702000000000000E701000000000000AF023F04AF000000010000000000000028D000000000000007000000E874420131AA00002E000000000000002E00000000000000000000000000003F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000000200000001000000110000000000803F00003842000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013000000000000000000000000000000380000000000000073000000000000007B00000000000000100000000000000024000000000000001000110000009041000000000000803F46040000100011000000E041000000000000803F4D040000FF01000000000000000C000000020000002800000028000000000000000000000002000000464D03000000400000000085010000000701010000002E00000000000000
GO
/****** Object:  Statistic [PK__Estudian__460B474021ED5F28]    Script Date: 18/04/2019 15:07:07 ******/
if  exists (select * from sys.stats where name = N'PK__Estudian__460B474021ED5F28' and object_id = object_id(N'[dbo].[Estudiante]'))
UPDATE STATISTICS [dbo].[Estudiante]([PK__Estudian__460B474021ED5F28]) WITH STATS_STREAM = 0x010000000100000000000000000000001DA9FC6E0000000094040000000000005404000000000000380372323800000004000A000000000000000000FE7F0000070000007ADAED0033AA00002E000000000000002E000000000000000000803F4316B23C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001800000018000000010000001400000000008040000038420000000000008040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000E802000000000000F002000000000000C000000000000000D700000000000000EE0000000000000005010000000000001C0100000000000033010000000000004A01000000000000610100000000000078010000000000008F01000000000000A601000000000000BD01000000000000D401000000000000EB0100000000000002020000000000001902000000000000300200000000000047020000000000005E0200000000000075020000000000008C02000000000000A302000000000000BA02000000000000D102000000000000100014000000803F000000000000803F01000000040000100014000000803F0000803F0000803F03000000040000100014000000803F0000803F0000803F05000000040000100014000000803F0000803F0000803F07000000040000100014000000803F0000803F0000803F09000000040000100014000000803F0000803F0000803F0B000000040000100014000000803F0000803F0000803F0D000000040000100014000000803F0000803F0000803F0F000000040000100014000000803F0000803F0000803F11000000040000100014000000803F0000803F0000803F13000000040000100014000000803F0000803F0000803F15000000040000100014000000803F0000803F0000803F17000000040000100014000000803F0000803F0000803F19000000040000100014000000803F0000803F0000803F1B000000040000100014000000803F0000803F0000803F1D000000040000100014000000803F0000803F0000803F1F000000040000100014000000803F0000803F0000803F21000000040000100014000000803F0000803F0000803F23000000040000100014000000803F0000803F0000803F25000000040000100014000000803F0000803F0000803F27000000040000100014000000803F0000803F0000803F29000000040000100014000000803F0000803F0000803F2B000000040000100014000000803F0000803F0000803F2D000000040000100014000000803F000000000000803F2E0000000400002E00000000000000, ROWCOUNT = 46, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000004_5DCAEF64]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000004_5DCAEF64' and object_id = object_id(N'[dbo].[Factura]'))
CREATE STATISTICS [_WA_Sys_00000004_5DCAEF64] ON [dbo].[Factura]([IdAlumno]) WITH STATS_STREAM = 0x0100000001000000000000000000000036D1F9F700000000CB010000000000008B010000000000003803803F3800000004000A00000000000000000000140000070000009AFBEF0033AA000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000014000000000080400000803F00000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000001F0000000000000027000000000000000800000000000000100014000000803F000000000000803F050000000400000100000000000000
GO
/****** Object:  Statistic [PK__Factura__50E7BAF1F170C472]    Script Date: 18/04/2019 15:07:07 ******/
if  exists (select * from sys.stats where name = N'PK__Factura__50E7BAF1F170C472' and object_id = object_id(N'[dbo].[Factura]'))
UPDATE STATISTICS [dbo].[Factura]([PK__Factura__50E7BAF1F170C472]) WITH STATS_STREAM = 0x01000000010000000000000000000000ED0358EE0000000040000000000000000000000000000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 1, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000002_1BFD2C07]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000002_1BFD2C07' and object_id = object_id(N'[dbo].[Genero]'))
CREATE STATISTICS [_WA_Sys_00000002_1BFD2C07] ON [dbo].[Genero]([vGenero]) WITH STATS_STREAM = 0x01000000010000000000000000000000FB189387000000001C04000000000000DC03000000000000A703F96FA7000000320000000000000028D000000100000007000000B3AEF30033AA00000B000000000000000B00000000000000000000008C2EBA3D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B0000000B0000000100000010000000D14507410000304100000000D1450741000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013000000000000000000000000000000B20100000000000068020000000000007002000000000000580000000000000079000000000000009F00000000000000BC00000000000000DA00000000000000FA0000000000000018010000000000003701000000000000550100000000000077010000000000009501000000000000300010000000803F000000000000803F0400000100210042696F6772616669636F300010000000803F000000000000803F040000010026004369656E6369612046696363696F6E300010000000803F000000000000803F04000001001D00436F63696E61300010000000803F000000000000803F04000001001E00436F6D65646961300010000000803F000000000000803F0400000100200045647563617469766F300010000000803F000000000000803F04000001001E0045726F7469636F300010000000803F000000000000803F04000001001F0046616E7461736961300010000000803F000000000000803F04000001001E004A7576656E696C300010000000803F000000000000803F04000001002200507369636F6C6F6769636F300010000000803F000000000000803F04000001001E00526F6D616E6365300010000000803F000000000000803F04000001001D00546572726F72FF01000000000000000A0000000A000000280000002800000000000000000000004B00000042696F6772616669636F436F63696E616D6564696145647563617469766F726F7469636F46616E74617369614A7576656E696C507369636F6C6F6769636F526F6D616E6365546572726F720D0000004000000000810A000000C0020A000081040C00000105100000C001150000810816000001061E0000810824000081072C0000810B33000081073E00000106450000000B00000000000000
GO
/****** Object:  Statistic [PK__Genero__0F834988A8512532]    Script Date: 18/04/2019 15:07:07 ******/
if  exists (select * from sys.stats where name = N'PK__Genero__0F834988A8512532' and object_id = object_id(N'[dbo].[Genero]'))
UPDATE STATISTICS [dbo].[Genero]([PK__Genero__0F834988A8512532]) WITH STATS_STREAM = 0x0100000001000000000000000000000002D04AD30000000066020000000000002602000000000000380372723800000004000A000000000000000000C0020A00070000008748400131AA00000B000000000000000B000000000000000000803F8C2EBA3D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000006000000010000001400000000008040000030410000000000008040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000BA00000000000000C200000000000000300000000000000047000000000000005E0000000000000075000000000000008C00000000000000A300000000000000100014000000803F000000000000803F01000000040000100014000000803F0000803F0000803F03000000040000100014000000803F0000803F0000803F05000000040000100014000000803F0000803F0000803F07000000040000100014000000803F0000803F0000803F09000000040000100014000000803F0000803F0000803F0B0000000400000B00000000000000, ROWCOUNT = 11, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000002_1FCDBCEB]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000002_1FCDBCEB' and object_id = object_id(N'[dbo].[Libro]'))
CREATE STATISTICS [_WA_Sys_00000002_1FCDBCEB] ON [dbo].[Libro]([Titulo]) WITH STATS_STREAM = 0x01000000010000000000000000000000A9E4163C0000000071060000000000003106000000000000A7020000A7000000320000000000000028D0000001000000070000001EE7ED0033AA00001400000000000000140000000000000000000000CDCC4C3D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001400000014000000010000001000000066666A410000A0410000000066666A410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000130000000000000000000000000000009103000000000000BD04000000000000C504000000000000A000000000000000CB00000000000000E90000000000000008010000000000002601000000000000510100000000000071010000000000009901000000000000BA01000000000000E4010000000000000002000000000000370200000000000059020000000000008D02000000000000BA02000000000000DF020000000000000B030000000000002F0300000000000055030000000000007603000000000000300010000000803F000000000000803F04000001002B00353020536F6D627261732064652057696C736F6E300010000000803F000000000000803F04000001001E00416E6174656D61300010000000803F000000000000803F04000001001F004176656E67657273300010000000803F000000000000803F04000001001E0043616C63756C6F300010000000803F000000000000803F04000001002B00456C2064696172696F2064652042726974676574300010000000803F000000000000803F04000001002000456C20486F62626974300010000000803F000000000000803F04000001002800456C204A7565676F20646520456E646572300010000000803F000000000000803F04000001002100456C204A756761646F72300010000000803F000000000000803F04000001002A00456D6F63696F6E206475726120792070757261300010000000803F000000000000803F04000001001C00466F637573300010000000803F000000000000803F04000001003700486172727920506F74746572207920656C2043616C697A20646520467565676F300010000000803F000000000000803F040000010022004C612045737061F16F6C61300010000000803F000000000000803F040000010034004C61207675656C746120616C206D756E646F20656E2038302064696173300010000000803F000000000000803F04000001002D004C61732043726F6E69636173206465204E61726E6961300010000000803F000000000000803F040000010025004C756E6120646520506C75746F6E300010000000803F000000000000803F04000001002C004D61732042617261746F20706F7220446F63656E61300010000000803F000000000000803F040000010024004E756573747261204E6F636865300010000000803F000000000000803F0400000100260050726F796563746F204573706F7361300010000000803F000000000000803F04000001002100536E6F77204372617368300010000000803F000000000000803F04000001001B005562696BFF01000000000000000B0000000B00000028000000280000000000000000000000B7000000353020536F6D627261732064652057696C736F6E4176656E67657273456C2064696172696F20646520427269746765744A7565676F20646520456E6465726D6F63696F6E206475726120792070757261486172727920506F74746572207920656C2043616C697A20646520467565676F4C612045737061F16F6C61732043726F6E69636173206465204E61726E69614D61732042617261746F20706F7220446F63656E6150726F796563746F204573706F73615562696B0F000000400000000081140000008108140000C0011C0000C0021D000081111F0000010E30000001123E00008120500000C002700000810972000001147B000081158F0000810FA400000104B30000001400000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000004_1FCDBCEB]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000004_1FCDBCEB' and object_id = object_id(N'[dbo].[Libro]'))
CREATE STATISTICS [_WA_Sys_00000004_1FCDBCEB] ON [dbo].[Libro]([IdAutor]) WITH STATS_STREAM = 0x01000000010000000000000000000000B89722CF000000000103000000000000C102000000000000380300803800000004000A0000000000000000004C612076070000009648400131AA0000140000000000000014000000000000000000803F8988883D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B0000000B0000000100000014000000000080400000A041000000000000804000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000055010000000000005D0100000000000058000000000000006F0000000000000086000000000000009D00000000000000B400000000000000CB00000000000000E200000000000000F900000000000000100100000000000027010000000000003E010000000000001000140000004040000000000000803F010000000400001000140000000040000000000000803F02000000040000100014000000803F000000000000803F03000000040000100014000000803F000000400000803F07000000040000100014000000803F0000803F0000803F09000000040000100014000000803F000000000000803F0A0000000400001000140000000040000000000000803F0D000000040000100014000000803F000000000000803F0E0000000400001000140000000040000000000000803F10000000040000100014000000803F0000803F0000803F12000000040000100014000000803F000000000000803F130000000400001400000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000005_1FCDBCEB]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000005_1FCDBCEB' and object_id = object_id(N'[dbo].[Libro]'))
CREATE STATISTICS [_WA_Sys_00000005_1FCDBCEB] ON [dbo].[Libro]([IdEditorial]) WITH STATS_STREAM = 0x010000000100000000000000000000004FBE590200000000C302000000000000830200000000000038030A763800000004000A00000000000000000065204675070000009348400131AA000014000000000000001400000000000000ABAA2A3F8C2EBA3D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009000000090000000100000014000000000080400000A041000000000000804000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000017010000000000001F0100000000000048000000000000005F0000000000000076000000000000008D00000000000000A400000000000000BB00000000000000D200000000000000E90000000000000000010000000000001000140000008040000000000000803F010000000400001000140000000040000000000000803F020000000400001000140000004040000000000000803F0300000004000010001400000000400000004000000040050000000400001000140000000040000000000000803F06000000040000100014000000803F000000000000803F08000000040000100014000000803F000000000000803F09000000040000100014000000803F0000803F0000803F11000000040000100014000000803F000000000000803F140000000400001400000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000007_1FCDBCEB]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000007_1FCDBCEB' and object_id = object_id(N'[dbo].[Libro]'))
CREATE STATISTICS [_WA_Sys_00000007_1FCDBCEB] ON [dbo].[Libro]([IdSector]) WITH STATS_STREAM = 0x01000000010000000000000000000000242767A50000000047020000000000000702000000000000380300003800000004000A0000000000000000007F00000007000000B1C5440131AA00001400000000000000140000000000000000000000CDCC4C3E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000050000000100000014000000000080400000A04100000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000009B00000000000000A30000000000000028000000000000003F0000000000000056000000000000006D000000000000008400000000000000100014000000E040000000000000803F010000000400001000140000004040000000000000803F030000000400001000140000008040000000000000803F04000000040000100014000000A040000000000000803F05000000040000100014000000803F000000000000803F0A0000000400001400000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000008_1FCDBCEB]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000008_1FCDBCEB' and object_id = object_id(N'[dbo].[Libro]'))
CREATE STATISTICS [_WA_Sys_00000008_1FCDBCEB] ON [dbo].[Libro]([IdGenero]) WITH STATS_STREAM = 0x01000000010000000000000000000000FCC0F1B40000000047020000000000000702000000000000380300003800000004000A0000000000000000007F000000070000009248400131AA0000140000000000000014000000000000000000803FABAA2A3E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000050000000100000014000000000080400000A04100000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000009B00000000000000A30000000000000028000000000000003F0000000000000056000000000000006D000000000000008400000000000000100014000000803F000000000000803F030000000400001000140000000040000000000000803F040000000400001000140000003041000000000000803F05000000040000100014000000803F0000803F0000803F090000000400001000140000008040000000000000803F0B0000000400001400000000000000
GO
/****** Object:  Statistic [PK__Libro__3E0B49AD67493C0F]    Script Date: 18/04/2019 15:07:07 ******/
if  exists (select * from sys.stats where name = N'PK__Libro__3E0B49AD67493C0F' and object_id = object_id(N'[dbo].[Libro]'))
UPDATE STATISTICS [dbo].[Libro]([PK__Libro__3E0B49AD67493C0F]) WITH STATS_STREAM = 0x01000000010000000000000000000000FB29FEA1000000002003000000000000E002000000000000380300003800000004000A00000000000000000000000000070000002272370131AA0000140000000000000014000000000000000000803FCDCC4C3D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0000000C0000000100000014000000000080400000A041000000000000804000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000074010000000000007C01000000000000600000000000000077000000000000008E00000000000000A500000000000000BC00000000000000D300000000000000EA00000000000000010100000000000018010000000000002F0100000000000046010000000000005D01000000000000100014000000803F000000000000803F01000000040000100014000000803F0000803F0000803F03000000040000100014000000803F0000803F0000803F05000000040000100014000000803F0000803F0000803F07000000040000100014000000803F0000803F0000803F09000000040000100014000000803F0000803F0000803F0B000000040000100014000000803F000000000000803F0C000000040000100014000000803F000000000000803F11000000040000100014000000803F0000803F0000803F13000000040000100014000000803F0000803F0000803F15000000040000100014000000803F0000803F0000803F17000000040000100014000000803F000000000000803F180000000400001400000000000000, ROWCOUNT = 20, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000002_3E52440B]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000002_3E52440B' and object_id = object_id(N'[dbo].[Multa]'))
CREATE STATISTICS [_WA_Sys_00000002_3E52440B] ON [dbo].[Multa]([Cargo]) WITH STATS_STREAM = 0x0100000001000000000000000000000028FDCC3C00000000CF010000000000008F010000000000003C03803F3C00000008001304000000000000000000803F00070000007CDAED0033AA000002000000000000000200000000000000000000000000803F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000100000001000000180000000000004100000040000000000000004100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000023000000000000002B0000000000000008000000000000001000180000000040000000000000803F20A10700000000000400000200000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000003_3E52440B]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000003_3E52440B' and object_id = object_id(N'[dbo].[Multa]'))
CREATE STATISTICS [_WA_Sys_00000003_3E52440B] ON [dbo].[Multa]([IdLibro]) WITH STATS_STREAM = 0x010000000100000000000000000000005FEA249800000000EA01000000000000AA01000000000000380300003800000004000A0000000000000000000000000007000000BAAEF30033AA000002000000000000000200000000000000000000000000003F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000020000000100000014000000000080400000004000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000003E00000000000000460000000000000010000000000000002700000000000000100014000000803F000000000000803F06000000040000100014000000803F000000000000803F0A0000000400000200000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000004_3E52440B]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000004_3E52440B' and object_id = object_id(N'[dbo].[Multa]'))
CREATE STATISTICS [_WA_Sys_00000004_3E52440B] ON [dbo].[Multa]([IdAlumno]) WITH STATS_STREAM = 0x010000000100000000000000000000005DADD4CA00000000EA01000000000000AA01000000000000380300003800000004000A00000000000000000000000000070000007BDAED0033AA000002000000000000000200000000000000000000000000003F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000020000000100000014000000000080400000004000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000003E00000000000000460000000000000010000000000000002700000000000000100014000000803F000000000000803F05000000040000100014000000803F000000000000803F230000000400000200000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000005_3E52440B]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000005_3E52440B' and object_id = object_id(N'[dbo].[Multa]'))
CREATE STATISTICS [_WA_Sys_00000005_3E52440B] ON [dbo].[Multa]([IdPrestamo]) WITH STATS_STREAM = 0x01000000010000000000000000000000966B55CB00000000EA01000000000000AA01000000000000380300003800000004000A00000000000000000000000000070000002A85440131AA000002000000000000000200000000000000000000000000003F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000020000000100000014000000000080400000004000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000003E00000000000000460000000000000010000000000000002700000000000000100014000000803F000000000000803F01000000040000100014000000803F000000000000803F020000000400000200000000000000
GO
/****** Object:  Statistic [PK__Multa__2F525A8C0BCDE585]    Script Date: 18/04/2019 15:07:07 ******/
if  exists (select * from sys.stats where name = N'PK__Multa__2F525A8C0BCDE585' and object_id = object_id(N'[dbo].[Multa]'))
UPDATE STATISTICS [dbo].[Multa]([PK__Multa__2F525A8C0BCDE585]) WITH STATS_STREAM = 0x01000000010000000000000000000000ED0358EE0000000040000000000000000000000000000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 2, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000005_3A81B327]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000005_3A81B327' and object_id = object_id(N'[dbo].[Prestamo]'))
CREATE STATISTICS [_WA_Sys_00000005_3A81B327] ON [dbo].[Prestamo]([IdAlumno]) WITH STATS_STREAM = 0x01000000010000000000000000000000F3427161000000002802000000000000E801000000000000380300003800000004000A00000000000000000000740061070000003050440131AA000005000000000000000500000000000000000000000000803E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000040000000100000014000000000080400000A04000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000007C000000000000008400000000000000200000000000000037000000000000004E000000000000006500000000000000100014000000803F000000000000803F03000000040000100014000000803F000000000000803F040000000400001000140000000040000000000000803F05000000040000100014000000803F000000000000803F060000000400000500000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000006_3A81B327]    Script Date: 18/04/2019 15:07:07 ******/
if not exists (select * from sys.stats where name = N'_WA_Sys_00000006_3A81B327' and object_id = object_id(N'[dbo].[Prestamo]'))
CREATE STATISTICS [_WA_Sys_00000006_3A81B327] ON [dbo].[Prestamo]([IdLibro]) WITH STATS_STREAM = 0x010000000100000000000000000000009FA9FED8000000002802000000000000E801000000000000380300003800000004000A000000000000000000007400610700000028E7ED0033AA000005000000000000000500000000000000000000000000803E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000040000000100000014000000000080400000A04000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000007C000000000000008400000000000000200000000000000037000000000000004E000000000000006500000000000000100014000000803F000000000000803F03000000040000100014000000803F000000000000803F040000000400001000140000000040000000000000803F06000000040000100014000000803F000000000000803F0A0000000400000500000000000000
GO
/****** Object:  Statistic [PK__Prestamo__6FF194C0DE2E92C9]    Script Date: 18/04/2019 15:07:07 ******/
if  exists (select * from sys.stats where name = N'PK__Prestamo__6FF194C0DE2E92C9' and object_id = object_id(N'[dbo].[Prestamo]'))
UPDATE STATISTICS [dbo].[Prestamo]([PK__Prestamo__6FF194C0DE2E92C9]) WITH STATS_STREAM = 0x01000000010000000000000000000000ED0358EE0000000040000000000000000000000000000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 5, PAGECOUNT = 1
GO
/****** Object:  Statistic [PK__Sector__D0011C18753BF85A]    Script Date: 18/04/2019 15:07:07 ******/
if  exists (select * from sys.stats where name = N'PK__Sector__D0011C18753BF85A' and object_id = object_id(N'[dbo].[Sector]'))
UPDATE STATISTICS [dbo].[Sector]([PK__Sector__D0011C18753BF85A]) WITH STATS_STREAM = 0x01000000010000000000000000000000ED0358EE0000000040000000000000000000000000000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 10, PAGECOUNT = 1
GO
USE [master]
GO
ALTER DATABASE [Biblioteca2] SET  READ_WRITE 
GO
