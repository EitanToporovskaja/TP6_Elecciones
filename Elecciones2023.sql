USE [master]
GO
/****** Object:  Database [Elecciones2023]    Script Date: 12/7/2023 08:05:24 ******/
CREATE DATABASE [Elecciones2023]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Elecciones2023', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Elecciones2023.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Elecciones2023_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Elecciones2023_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Elecciones2023] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Elecciones2023].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Elecciones2023] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Elecciones2023] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Elecciones2023] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Elecciones2023] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Elecciones2023] SET ARITHABORT OFF 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Elecciones2023] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Elecciones2023] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Elecciones2023] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Elecciones2023] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Elecciones2023] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Elecciones2023] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Elecciones2023] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Elecciones2023] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Elecciones2023] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Elecciones2023] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Elecciones2023] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Elecciones2023] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Elecciones2023] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Elecciones2023] SET RECOVERY FULL 
GO
ALTER DATABASE [Elecciones2023] SET  MULTI_USER 
GO
ALTER DATABASE [Elecciones2023] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Elecciones2023] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Elecciones2023] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Elecciones2023] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Elecciones2023] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Elecciones2023', N'ON'
GO
ALTER DATABASE [Elecciones2023] SET QUERY_STORE = OFF
GO
USE [Elecciones2023]
GO
/****** Object:  User [alumno]    Script Date: 12/7/2023 08:05:25 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Candidato]    Script Date: 12/7/2023 08:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidato](
	[IdCandidato] [int] IDENTITY(1,1) NOT NULL,
	[IdPartido] [int] NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Foto] [varchar](1000) NOT NULL,
	[Postulacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Candidato] PRIMARY KEY CLUSTERED 
(
	[IdCandidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partido]    Script Date: 12/7/2023 08:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partido](
	[IdPartido] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Logo] [varchar](1000) NOT NULL,
	[SitioWeb] [varchar](50) NOT NULL,
	[FechaFundacion] [date] NOT NULL,
	[CantidadDiputados] [int] NOT NULL,
	[CantidadCenadores] [int] NOT NULL,
 CONSTRAINT [PK_Partido] PRIMARY KEY CLUSTERED 
(
	[IdPartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Candidato] ON 

INSERT [dbo].[Candidato] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (1, 2, N'Fernanadez', N'Alberto', CAST(N'1972-05-05' AS Date), N'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2F2%2F27%2FMensaje_de_fin_de_a%25C3%25B1o_del_Presidente_Alberto_Fern%25C3%25A1ndez_%2528cropped%2529.jpg&tbnid=EOMCM0YrX28KlM&vet=12ahUKEwilv6Kk-IaAAxW-r5UCHb1gC1MQMygAegUIARDaAQ..i&imgrefurl=https%3A%2F%2Fes.wikipedia.org%2Fwiki%2FAlberto_Fern%25C3%25A1ndez&docid=_GcmqPvEuXKZeM&w=626&h=834&q=alberto%20fernandez&safe=active&ved=2ahUKEwilv6Kk-IaAAxW-r5UCHb1gC1MQMygAegUIARDaAQ', N'dos')
INSERT [dbo].[Candidato] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (2, 3, N'Fernandez', N'Cristina', CAST(N'1970-04-04' AS Date), N'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F2%2F22%2FCristinakirchnermensaje2010.jpg%2F640px-Cristinakirchnermensaje2010.jpg&tbnid=9cLULtKOH73t3M&vet=12ahUKEwiuiLmd-IaAAxVOppUCHePEAW4QMygBegUIARDjAQ..i&imgrefurl=https%3A%2F%2Fes.wikipedia.org%2Fwiki%2FCristina_Fern%25C3%25A1ndez_de_Kirchner&docid=K_wDVc3Ivz5bXM&w=640&h=851&q=cristina%20kirchner&safe=active&ved=2ahUKEwiuiLmd-IaAAxVOppUCHePEAW4QMygBegUIARDjAQ', N'dos')
INSERT [dbo].[Candidato] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (3, 4, N'Macri', N'Mauricio', CAST(N'1968-03-03' AS Date), N'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fe%2Fe2%2FMauricio_Macri_2016.jpg&tbnid=db96MG7fuGfYNM&vet=12ahUKEwjfwYmp-IaAAxWRiJUCHf7eD8QQMygAegUIARDhAQ..i&imgrefurl=https%3A%2F%2Fes.wikipedia.org%2Fwiki%2FMauricio_Macri&docid=WauyaKEtxQeO6M&w=844&h=1245&q=mauricio%20macri&safe=active&ved=2ahUKEwjfwYmp-IaAAxWRiJUCHf7eD8QQMygAegUIARDhAQ', N'dos')
INSERT [dbo].[Candidato] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (5, 5, N'Larreta', N'Horacio', CAST(N'1966-02-02' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS273rV3RzOvbYHP6LsJQM20-lQvYgBUQup2A&usqp=CAU', N'dos')
INSERT [dbo].[Candidato] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (6, 6, N'Del Caño', N'Nicolas', CAST(N'1964-01-01' AS Date), N'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.ambito.com%2Fp%2Fc27bcf95e35c536cae493b1cb3314dd0%2Fadjuntos%2F239%2Fimagenes%2F039%2F220%2F0039220584%2F1200x675%2Fsmart%2Fnicolas-del-canojpg.jpg&tbnid=ieRsG1CBCV69IM&vet=12ahUKEwiY--X694aAAxXalJUCHWywDIoQMygJegUIARCgAQ..i&imgrefurl=https%3A%2F%2Fwww.ambito.com%2Fpolitica%2Fprovincia-buenos-aires%2Fpara-combatir-la-desocupacion-del-cano-propuso-reducir-la-jornada-laboral-seis-horas-y-rebaja-salarial-n5245034&docid=npDEMO8cy8p_dM&w=1200&h=675&q=partido%20de%20nico%20del%20ca%C3%B1o&safe=active&ved=2ahUKEwiY--X694aAAxXalJUCHWywDIoQMygJegUIARCgAQ', N'dos')
SET IDENTITY_INSERT [dbo].[Candidato] OFF
GO
SET IDENTITY_INSERT [dbo].[Partido] ON 

INSERT [dbo].[Partido] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadCenadores]) VALUES (2, N'Alberto', N'https://www.google.com/imgres?imgurl=https%3A%2F%2Fagenfor.com.ar%2Fwp-content%2Fuploads%2F2021%2F07%2FFdT.jpg&tbnid=nXcMRitcdzXMWM&vet=12ahUKEwjz28zz9oaAAxVVNLkGHY_OAAQQMygJegUIARCaAQ..i&imgrefurl=https%3A%2F%2Fagenfor.com.ar%2Fla-justicia-electoral-autorizo-reconocimiento-e-inscripcion-de-la-alianza-frente-de-todos-formosa%2F&docid=kRnaPew7_ZFbjM&w=420&h=300&q=todos&safe=active&ved=2ahUKEwjz28zz9oaAAxVVNLkGHY_OAAQQMygJegUIARCaAQ', N'http', CAST(N'2011-01-01' AS Date), 1, 2)
INSERT [dbo].[Partido] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadCenadores]) VALUES (3, N'Cristina', N'https://www.google.com/imgres?imgurl=https%3A%2F%2Fagenfor.com.ar%2Fwp-content%2Fuploads%2F2021%2F07%2FFdT.jpg&tbnid=nXcMRitcdzXMWM&vet=12ahUKEwjz28zz9oaAAxVVNLkGHY_OAAQQMygJegUIARCaAQ..i&imgrefurl=https%3A%2F%2Fagenfor.com.ar%2Fla-justicia-electoral-autorizo-reconocimiento-e-inscripcion-de-la-alianza-frente-de-todos-formosa%2F&docid=kRnaPew7_ZFbjM&w=420&h=300&q=todos&safe=active&ved=2ahUKEwjz28zz9oaAAxVVNLkGHY_OAAQQMygJegUIARCaAQ', N'http', CAST(N'2009-02-02' AS Date), 1, 2)
INSERT [dbo].[Partido] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadCenadores]) VALUES (4, N'Mauricio', N'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Ff%2Ff1%2FJuntos-Por-El-Cambio-Logo.svg%2F800px-Juntos-Por-El-Cambio-Logo.svg.png&tbnid=oQmbfTCocL57YM&vet=12ahUKEwi7z5jv94aAAxV4rZUCHfQ3BckQMygBegUIARCOAQ..i&imgrefurl=https%3A%2F%2Fes.wikipedia.org%2Fwiki%2FJuntos_por_el_Cambio&docid=mZS36FkBbKIa3M&w=800&h=346&itg=1&q=juntos%20por%20el%20cambio&safe=active&ved=2ahUKEwi7z5jv94aAAxV4rZUCHfQ3BckQMygBegUIARCOAQ', N'http', CAST(N'2007-03-03' AS Date), 1, 2)
INSERT [dbo].[Partido] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadCenadores]) VALUES (5, N'Horacio', N'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Ff%2Ff1%2FJuntos-Por-El-Cambio-Logo.svg%2F800px-Juntos-Por-El-Cambio-Logo.svg.png&tbnid=oQmbfTCocL57YM&vet=12ahUKEwi7z5jv94aAAxV4rZUCHfQ3BckQMygBegUIARCOAQ..i&imgrefurl=https%3A%2F%2Fes.wikipedia.org%2Fwiki%2FJuntos_por_el_Cambio&docid=mZS36FkBbKIa3M&w=800&h=346&itg=1&q=juntos%20por%20el%20cambio&safe=active&ved=2ahUKEwi7z5jv94aAAxV4rZUCHfQ3BckQMygBegUIARCOAQ', N'http', CAST(N'2005-04-04' AS Date), 1, 2)
INSERT [dbo].[Partido] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadCenadores]) VALUES (6, N'Nicolas', N'alguno', N'http', CAST(N'2003-05-05' AS Date), 1, 2)
SET IDENTITY_INSERT [dbo].[Partido] OFF
GO
ALTER TABLE [dbo].[Candidato]  WITH CHECK ADD  CONSTRAINT [FK_Candidato_Partido] FOREIGN KEY([IdPartido])
REFERENCES [dbo].[Partido] ([IdPartido])
GO
ALTER TABLE [dbo].[Candidato] CHECK CONSTRAINT [FK_Candidato_Partido]
GO
USE [master]
GO
ALTER DATABASE [Elecciones2023] SET  READ_WRITE 
GO
