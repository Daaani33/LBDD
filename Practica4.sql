USE [Biblioteca0]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 15/04/2019 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumno](
	[IdAlumno] [int] NULL,
	[Matricula] [int] NULL,
	[IdCarrera] [int] NULL,
	[Apellido_A] [varchar](50) NULL,
	[Apellido2_A] [varchar](50) NULL,
	[cStatus_A] [char](1) NULL,
	[Sexo] [char](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 15/04/2019 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Autor](
	[IdAutor] [int] NULL,
	[Nombre_Autor] [varchar](50) NULL,
	[Apellido_Autor] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 15/04/2019 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Carrera](
	[IdCarrera] [int] NULL,
	[Carrera] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 15/04/2019 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Editorial](
	[IdEditorial] [int] NULL,
	[Empresa] [varchar](50) NULL,
	[Pais] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 15/04/2019 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[IdFactura] [int] NULL,
	[fecha_Factura] [date] NULL,
	[IdPrestamo] [int] NULL,
	[IdAlumno] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genero]    Script Date: 15/04/2019 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genero](
	[IdGenero] [int] NULL,
	[Genero] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 15/04/2019 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Libro](
	[Titulo] [varchar](50) NULL,
	[ISBN] [int] NULL,
	[IdAutor] [int] NULL,
	[IdEditorial] [int] NULL,
	[cStatus_L] [char](1) NULL,
	[IdSeccion] [int] NULL,
	[IdGenero] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Multa]    Script Date: 15/04/2019 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Multa](
	[IdMulta] [int] NULL,
	[Fecha_Exp] [date] NULL,
	[Multa] [money] NULL,
	[IdAlumno] [int] NULL,
	[IdLibro] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 15/04/2019 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo](
	[IdPrestamo] [int] NULL,
	[Fecha_Prestamo] [date] NULL,
	[Fecha_Exp] [date] NULL,
	[IdAlumno] [int] NULL,
	[IdLibro] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seccion]    Script Date: 15/04/2019 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seccion](
	[IdSeccion] [int] NULL,
	[Seccion] [int] NULL
) ON [PRIMARY]

GO
