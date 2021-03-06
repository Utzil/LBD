USE [master]
GO
/****** Object:  Database [Biblioteca1]    Script Date: 01/03/2019 12:23:25 a. m. ******/
CREATE DATABASE [Biblioteca1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Biblioteca1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Biblioteca1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Biblioteca1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Biblioteca1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Biblioteca1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Biblioteca1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Biblioteca1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Biblioteca1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Biblioteca1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Biblioteca1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Biblioteca1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Biblioteca1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Biblioteca1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Biblioteca1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteca1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Biblioteca1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Biblioteca1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Biblioteca1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Biblioteca1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Biblioteca1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Biblioteca1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Biblioteca1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Biblioteca1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Biblioteca1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Biblioteca1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Biblioteca1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Biblioteca1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Biblioteca1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Biblioteca1] SET RECOVERY FULL 
GO
ALTER DATABASE [Biblioteca1] SET  MULTI_USER 
GO
ALTER DATABASE [Biblioteca1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Biblioteca1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Biblioteca1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Biblioteca1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Biblioteca1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Biblioteca1', N'ON'
GO
ALTER DATABASE [Biblioteca1] SET QUERY_STORE = OFF
GO
USE [Biblioteca1]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 01/03/2019 12:23:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[id] [int] NOT NULL,
	[nombreAlum] [varchar](50) NULL,
	[id_alumno] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asesor]    Script Date: 01/03/2019 12:23:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asesor](
	[id] [int] NOT NULL,
	[nombreAsesor] [varchar](50) NULL,
	[id_asesor] [int] NULL,
	[materiaQueDa] [varchar](20) NULL,
	[temaQueDa] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asesorias]    Script Date: 01/03/2019 12:23:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asesorias](
	[id] [int] NOT NULL,
	[materia] [varchar](20) NULL,
	[tema] [varchar](50) NULL,
	[nombreAsesor] [varchar](20) NULL,
	[personAAsesorar] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donaciones]    Script Date: 01/03/2019 12:23:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donaciones](
	[id] [int] NOT NULL,
	[nombreDona] [varchar](50) NULL,
	[donacion] [money] NULL,
	[donacionLib] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 01/03/2019 12:23:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[id] [int] NOT NULL,
	[nombreEmp] [varchar](50) NULL,
	[id_empleado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EspacioDisponible]    Script Date: 01/03/2019 12:23:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EspacioDisponible](
	[id] [int] NOT NULL,
	[cupo] [int] NULL,
	[cupoTotal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 01/03/2019 12:23:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[id] [int] NOT NULL,
	[nombreLib] [varchar](50) NULL,
	[autor] [varchar](50) NULL,
	[editorial] [varchar](50) NULL,
	[genero] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paqueteria]    Script Date: 01/03/2019 12:23:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paqueteria](
	[id] [int] NOT NULL,
	[nombreDueno] [varchar](20) NULL,
	[numPaquete] [int] NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamos]    Script Date: 01/03/2019 12:23:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamos](
	[id] [int] NOT NULL,
	[nombrePres] [varchar](20) NULL,
	[cargoPrest] [money] NULL,
	[fechaInicio] [date] NULL,
	[fechaFinal] [date] NULL,
	[libroPrestado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitantes]    Script Date: 01/03/2019 12:23:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitantes](
	[id] [int] NOT NULL,
	[nombreVisit] [varchar](20) NULL,
	[id_visitante] [int] NULL,
	[paseVisitante] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Biblioteca1] SET  READ_WRITE 
GO
