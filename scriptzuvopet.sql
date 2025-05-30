CREATE TABLE [dbo].[SOLICITUDESADOPCION](
	[Id] [int] NOT NULL,
	[IdAdoptante] [int] NOT NULL,
	[IdMascota] [int] NOT NULL,
	[Estado] [nvarchar](50) NULL,
	[ExperienciaPrevia] [bit] NULL,
	[TipoVivienda] [nvarchar](100) NULL,
	[OtrosAnimales] [bit] NULL,
	[Recursos] [nvarchar](255) NULL,
	[TiempoEnCasa] [nvarchar](255) NULL,
	[FechaSolicitud] [datetime] NULL,
	[FechaRespuesta] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MASCOTAS]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MASCOTAS](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Especie] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Tamano] [nvarchar](50) NOT NULL,
	[Sexo] [nvarchar](20) NULL,
	[Castrado] [bit] NOT NULL,
	[Vacunado] [bit] NOT NULL,
	[Desparasitado] [bit] NOT NULL,
	[Sano] [bit] NOT NULL,
	[Microchip] [bit] NOT NULL,
	[CompatibleConNinos] [bit] NOT NULL,
	[CompatibleConAdultos] [bit] NOT NULL,
	[CompatibleConOtrosAnimales] [bit] NOT NULL,
	[Personalidad] [nvarchar](max) NULL,
	[Descripcion] [text] NULL,
	[Estado] [nvarchar](50) NULL,
	[Latitud] [float] NULL,
	[Longitud] [float] NULL,
	[IdRefugio] [int] NULL,
	[Foto] [nvarchar](255) NULL,
	[Vistas] [int] NOT NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_MascotasAdoptadas]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[V_MascotasAdoptadas]
AS
SELECT 
    m.Id,
    m.Nombre,
    m.Especie,
    DATEDIFF(MONTH, m.FechaNacimiento, GETDATE()) AS Edad,
    m.Tamano,
    m.Sexo,
    m.Foto,
    s.IdAdoptante,
    s.FechaRespuesta AS FechaAdopcion
FROM
    MASCOTAS m
    INNER JOIN SOLICITUDESADOPCION s ON m.Id = s.IdMascota
WHERE
    s.Estado = 'Aprobada'
GO
/****** Object:  Table [dbo].[FAVORITOS]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAVORITOS](
	[Id] [int] NOT NULL,
	[IdAdoptante] [int] NOT NULL,
	[IdMascota] [int] NOT NULL,
	[FechaAgregado] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_MascotasFavoritas]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[V_MascotasFavoritas]
AS
SELECT 
	m.Id,
	m.Nombre,
	m.Especie,
	DATEDIFF(MONTH, m.FechaNacimiento, GETDATE()) AS Edad,
	m.Tamano,
	m.Sexo,
	m.Foto,
	f.IdAdoptante,
	f.FechaAgregado
FROM
 MASCOTAS m
 INNER JOIN
 FAVORITOS f on m.Id = f.IdMascota
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[Id] [int] NOT NULL,
	[NombreUsuario] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[ContrasenaLimpia] [nvarchar](255) NOT NULL,
	[ContrasenaEncriptada] [varbinary](max) NOT NULL,
	[Salt] [nvarchar](255) NOT NULL,
	[TipoUsuario] [nvarchar](20) NOT NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERFIL_USUARIO]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERFIL_USUARIO](
	[Id] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[FotoPerfil] [nvarchar](255) NULL,
	[Descripcion] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REFUGIOS]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REFUGIOS](
	[Id] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[NombreRefugio] [nvarchar](255) NOT NULL,
	[ContactoRefugio] [nvarchar](255) NOT NULL,
	[CantidadAnimales] [int] NOT NULL,
	[CapacidadMaxima] [int] NOT NULL,
	[Latitud] [float] NULL,
	[Longitud] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_RefugioPerfil]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[V_RefugioPerfil] AS
SELECT 
    U.Id AS IdUsuario,
    U.NombreUsuario,
    U.Email,
    P.FotoPerfil,
    P.Descripcion,
    R.NombreRefugio,
    R.ContactoRefugio,
    R.CantidadAnimales,
    R.CapacidadMaxima,
    R.Latitud,
	R.Longitud
FROM USUARIOS U
JOIN PERFIL_USUARIO P ON U.Id = P.IdUsuario
JOIN REFUGIOS R ON U.Id = R.IdUsuario
WHERE U.TipoUsuario = 'Refugio';
GO
/****** Object:  Table [dbo].[ADOPTANTES]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADOPTANTES](
	[Id] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
	[TipoVivienda] [nvarchar](100) NULL,
	[TieneJardin] [bit] NOT NULL,
	[OtrosAnimales] [bit] NOT NULL,
	[RecursosDisponibles] [nvarchar](255) NULL,
	[TiempoEnCasa] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_AdoptantePerfil]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[V_AdoptantePerfil] AS
SELECT 
    U.Id AS IdUsuario,
    U.NombreUsuario,
    U.Email,
    P.FotoPerfil,
    P.Descripcion,
    A.Nombre,
    A.TipoVivienda,
    A.TieneJardin,
    A.OtrosAnimales,
    A.RecursosDisponibles,
    A.TiempoEnCasa
FROM USUARIOS U
JOIN PERFIL_USUARIO P ON U.Id = P.IdUsuario
JOIN ADOPTANTES A ON U.Id = A.IdUsuario
WHERE U.TipoUsuario = 'Adoptante';
GO
/****** Object:  View [dbo].[V_SolicitudesRefugio]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[V_SolicitudesRefugio] AS
SELECT
    sa.Id,
    sa.IdAdoptante,
    sa.IdMascota,
    sa.Estado,
    sa.ExperienciaPrevia,
    sa.TipoVivienda,
    sa.OtrosAnimales,
    sa.Recursos,
    sa.TiempoEnCasa,
    sa.FechaSolicitud,
    sa.FechaRespuesta,
    m.Nombre AS NombreMascota,
    m.Especie,
    m.Tamano,
    m.Sexo,
    m.Estado AS EstadoMascota,
    m.Foto AS FotoMascota,
    a.Nombre AS NombreAdoptante,
    r.Id AS IdRefugio,
    r.NombreRefugio
FROM
    SOLICITUDESADOPCION sa
    INNER JOIN MASCOTAS m ON sa.IdMascota = m.Id
    INNER JOIN ADOPTANTES a ON sa.IdAdoptante = a.Id
    INNER JOIN REFUGIOS r ON m.IdRefugio = r.Id

GO
/****** Object:  Table [dbo].[HISTORIASEXITO]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HISTORIASEXITO](
	[Id] [int] NOT NULL,
	[IdAdoptante] [int] NOT NULL,
	[IdMascota] [int] NOT NULL,
	[Titulo] [nvarchar](255) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Foto] [nvarchar](255) NULL,
	[FechaPublicacion] [datetime] NULL,
	[Estado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIKESHISTORIAS]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIKESHISTORIAS](
	[Id] [int] NOT NULL,
	[IdHistoria] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[TipoReaccion] [nvarchar](20) NOT NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENSAJES]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENSAJES](
	[Id] [int] NOT NULL,
	[IdEmisor] [int] NOT NULL,
	[IdReceptor] [int] NOT NULL,
	[Contenido] [text] NOT NULL,
	[Fecha] [datetime] NULL,
	[Leido] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NOTIFICACIONES]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NOTIFICACIONES](
	[Id] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Mensaje] [nvarchar](255) NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
	[Url] [nvarchar](255) NULL,
	[Fecha] [datetime] NULL,
	[Leido] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ADOPTANTES] ([Id], [IdUsuario], [Nombre], [TipoVivienda], [TieneJardin], [OtrosAnimales], [RecursosDisponibles], [TiempoEnCasa]) VALUES (1, 1, N'Juan Pérez', N'Casa', 1, 1, N'["Jardín"]', N'4-8 horas')
INSERT [dbo].[ADOPTANTES] ([Id], [IdUsuario], [Nombre], [TipoVivienda], [TieneJardin], [OtrosAnimales], [RecursosDisponibles], [TiempoEnCasa]) VALUES (2, 2, N'María López', N'Departamento', 0, 0, N'["Tiempo parcial"]', N'4-8 horas')
INSERT [dbo].[ADOPTANTES] ([Id], [IdUsuario], [Nombre], [TipoVivienda], [TieneJardin], [OtrosAnimales], [RecursosDisponibles], [TiempoEnCasa]) VALUES (3, 3, N'Carlos Gómez', N'Casa', 1, 1, N'["Espacio amplio"]', N'4-8 horas')
INSERT [dbo].[ADOPTANTES] ([Id], [IdUsuario], [Nombre], [TipoVivienda], [TieneJardin], [OtrosAnimales], [RecursosDisponibles], [TiempoEnCasa]) VALUES (4, 6, N'Mario Jiménez Marset', N'Piso', 0, 1, N'["Estilo de vida adecuado","Compromiso emocional"]', N'4-8 horas')
GO
INSERT [dbo].[FAVORITOS] ([Id], [IdAdoptante], [IdMascota], [FechaAgregado]) VALUES (1, 1, 1, CAST(N'2025-04-06T20:43:13.480' AS DateTime))
INSERT [dbo].[FAVORITOS] ([Id], [IdAdoptante], [IdMascota], [FechaAgregado]) VALUES (2, 2, 2, CAST(N'2025-04-06T20:43:13.480' AS DateTime))
INSERT [dbo].[FAVORITOS] ([Id], [IdAdoptante], [IdMascota], [FechaAgregado]) VALUES (3, 3, 3, CAST(N'2025-04-06T20:43:13.480' AS DateTime))
INSERT [dbo].[FAVORITOS] ([Id], [IdAdoptante], [IdMascota], [FechaAgregado]) VALUES (4, 4, 1, CAST(N'2025-04-06T20:43:13.480' AS DateTime))
INSERT [dbo].[FAVORITOS] ([Id], [IdAdoptante], [IdMascota], [FechaAgregado]) VALUES (5, 4, 4, CAST(N'2025-04-06T20:43:13.480' AS DateTime))
INSERT [dbo].[FAVORITOS] ([Id], [IdAdoptante], [IdMascota], [FechaAgregado]) VALUES (7, 4, 13, CAST(N'2025-04-06T20:43:13.480' AS DateTime))
GO
INSERT [dbo].[HISTORIASEXITO] ([Id], [IdAdoptante], [IdMascota], [Titulo], [Descripcion], [Foto], [FechaPublicacion], [Estado]) VALUES (1, 1, 1, N'Max encontró un hogar', N'Después de meses en el refugio, Max fue adoptado por Juan.', N'dueno1.jpg', CAST(N'2025-04-06T20:43:13.487' AS DateTime), N'Aprobada')
INSERT [dbo].[HISTORIASEXITO] ([Id], [IdAdoptante], [IdMascota], [Titulo], [Descripcion], [Foto], [FechaPublicacion], [Estado]) VALUES (2, 2, 2, N'Luna es feliz en su nueva casa', N'María adoptó a Luna y la cuida con mucho amor.', N'dueno2.jpg', CAST(N'2025-04-06T20:43:13.487' AS DateTime), N'Aprobada')
INSERT [dbo].[HISTORIASEXITO] ([Id], [IdAdoptante], [IdMascota], [Titulo], [Descripcion], [Foto], [FechaPublicacion], [Estado]) VALUES (3, 3, 3, N'Rocky disfruta de su nueva familia', N'Aunque inicialmente fue rechazado, Rocky encontró un hogar.', N'dueno3.jpg', CAST(N'2025-04-06T20:43:13.487' AS DateTime), N'Aprobada')
GO
INSERT [dbo].[LIKESHISTORIAS] ([Id], [IdHistoria], [IdUsuario], [TipoReaccion], [Fecha]) VALUES (1, 1, 1, N'MeGusta', CAST(N'2025-04-06T20:43:13.493' AS DateTime))
INSERT [dbo].[LIKESHISTORIAS] ([Id], [IdHistoria], [IdUsuario], [TipoReaccion], [Fecha]) VALUES (2, 1, 2, N'MeEncanta', CAST(N'2025-04-06T20:43:13.493' AS DateTime))
INSERT [dbo].[LIKESHISTORIAS] ([Id], [IdHistoria], [IdUsuario], [TipoReaccion], [Fecha]) VALUES (3, 2, 3, N'Inspirador', CAST(N'2025-04-06T20:43:13.493' AS DateTime))
INSERT [dbo].[LIKESHISTORIAS] ([Id], [IdHistoria], [IdUsuario], [TipoReaccion], [Fecha]) VALUES (4, 3, 4, N'Solidario', CAST(N'2025-04-06T20:43:13.493' AS DateTime))
INSERT [dbo].[LIKESHISTORIAS] ([Id], [IdHistoria], [IdUsuario], [TipoReaccion], [Fecha]) VALUES (5, 3, 5, N'Asombroso', CAST(N'2025-04-06T20:43:13.493' AS DateTime))
INSERT [dbo].[LIKESHISTORIAS] ([Id], [IdHistoria], [IdUsuario], [TipoReaccion], [Fecha]) VALUES (6, 1, 6, N'MeEncanta', CAST(N'2025-04-06T20:43:13.493' AS DateTime))
INSERT [dbo].[LIKESHISTORIAS] ([Id], [IdHistoria], [IdUsuario], [TipoReaccion], [Fecha]) VALUES (7, 2, 6, N'Asombroso', CAST(N'2025-04-06T20:43:13.493' AS DateTime))
INSERT [dbo].[LIKESHISTORIAS] ([Id], [IdHistoria], [IdUsuario], [TipoReaccion], [Fecha]) VALUES (8, 3, 6, N'Inspirador', CAST(N'2025-04-06T20:43:13.493' AS DateTime))
INSERT [dbo].[LIKESHISTORIAS] ([Id], [IdHistoria], [IdUsuario], [TipoReaccion], [Fecha]) VALUES (9, 2, 5, N'Inspirador', CAST(N'2025-04-06T20:43:13.493' AS DateTime))
GO
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (1, N'Max', N'Perro', CAST(N'2020-06-15' AS Date), N'Mediano', N'Macho', 1, 1, 1, 1, 0, 1, 1, 1, N'Juguetón, Amigable', N'Perro rescatado en busca de un hogar', N'Disponible', 40.4168, -3.7038, 1, N'perro1.jpg', 7, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (2, N'Luna', N'Perro', CAST(N'2019-08-20' AS Date), N'Pequeño', N'Hembra', 1, 1, 1, 1, 1, 1, 1, 1, N'Tranquila, Cariñosa', N'Perra rescatada de la calle', N'Adoptado', 41.3851, 2.1734, 1, N'perro2.jpg', 8, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (3, N'Rocky', N'Perro', CAST(N'2021-01-10' AS Date), N'Grande', N'Macho', 1, 1, 1, 1, 1, 0, 1, 1, N'Enérgico, Protector', N'Necesita espacio amplio', N'Disponible', 39.4699, -0.3763, 2, N'perro3.jpg', 5, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (4, N'Nina', N'Perro', CAST(N'2022-05-25' AS Date), N'Pequeño', N'Hembra', 1, 1, 1, 1, 0, 1, 1, 1, N'Curiosa, Activa', N'Busca un hogar amoroso', N'Disponible', 42.3601, -8.4115, 2, N'perro4.jpg', 2, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (5, N'Bruno', N'Perro', CAST(N'2017-03-12' AS Date), N'Grande', N'Macho', 1, 1, 1, 1, 1, 1, 1, 1, N'Tranquilo, Fiel', N'Rescatado de una carretera', N'Disponible', 43.2645, -8.6169, 1, N'perro5.jpg', 5, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (6, N'Mila', N'Perro', CAST(N'2019-09-30' AS Date), N'Mediano', N'Hembra', 1, 1, 1, 1, 1, 1, 1, 1, N'Juguetona, Energética', N'Le encanta correr y jugar', N'Adoptado', 40.4637, -3.7492, 2, N'perro6.jpg', 5, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (7, N'Simba', N'Perro', CAST(N'2016-07-18' AS Date), N'Grande', N'Macho', 1, 1, 1, 1, 1, 1, 1, 1, N'Inteligente, Protector', N'Muy sociable con otros perros', N'Disponible', 41.3784, 2.1914, 1, N'perro7.jpg', 12, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (8, N'Mimi', N'Gato', CAST(N'2021-02-15' AS Date), N'Mediano', N'Hembra', 1, 1, 1, 1, 1, 1, 1, 1, N'Cariñosa, Independiente', N'Gata que busca un hogar acogedor', N'Disponible', 40.7315, -3.8985, 1, N'gato1.jpg', 6, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (9, N'Felix', N'Gato', CAST(N'2019-10-30' AS Date), N'Pequeño', N'Macho', 1, 1, 1, 1, 0, 1, 1, 1, N'Sociable, Activo', N'Gato juguetón y cariñoso', N'Disponible', 41.9232, 2.112, 2, N'gato2.jpg', 4, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (10, N'Whiskers', N'Gato', CAST(N'2020-03-05' AS Date), N'Mediano', N'Macho', 1, 1, 1, 1, 1, 1, 1, 1, N'Tranquilo, Cariñoso', N'Gato que disfruta de la compañía humana', N'Disponible', 40.438, -3.7097, 1, N'gato3.jpg', 7, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (11, N'Rocco', N'Conejo', CAST(N'2020-04-22' AS Date), N'Pequeño', N'Macho', 1, 1, 1, 1, 0, 1, 1, 1, N'Tímido, Dulce', N'Conejo rescatado de un jardín', N'Disponible', 40.462, -3.7, 1, N'conejo1.jpg', 3, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (12, N'Nina', N'Conejo', CAST(N'2021-05-18' AS Date), N'Mediano', N'Hembra', 1, 1, 1, 1, 1, 0, 1, 1, N'Curiosa, Alegre', N'Disfruta saltando por el jardín', N'Disponible', 41.8997, 1.0193, 2, N'conejo2.jpg', 4, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (13, N'Daisy', N'Conejo', CAST(N'2020-07-30' AS Date), N'Mediano', N'Hembra', 1, 1, 1, 1, 0, 1, 1, 1, N'Amistosa, Cariñosa', N'Le gusta estar acompañada', N'Disponible', 39.7747, -0.2465, 1, N'conejo3.jpg', 6, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (14, N'Toby', N'Hámster', CAST(N'2022-03-11' AS Date), N'Pequeño', N'Macho', 1, 1, 1, 1, 1, 0, 1, 1, N'Activo, Curioso', N'Disfruta de sus ruedas de ejercicio', N'Disponible', 40.965, -5.655, 1, N'hamster1.jpg', 6, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (15, N'Lola', N'Hámster', CAST(N'2022-08-05' AS Date), N'Pequeño', N'Hembra', 1, 1, 1, 1, 0, 1, 1, 1, N'Amistosa, Juguetona', N'Siempre está corriendo y explorando', N'Disponible', 41.4036, 2.1744, 2, N'hamster2.jpg', 5, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (16, N'Milo', N'Hámster', CAST(N'2021-11-03' AS Date), N'Pequeño', N'Macho', 1, 1, 1, 1, 0, 0, 1, 1, N'Tímido, Sociable', N'Le gusta correr en su rueda', N'Disponible', 41.8774, -0.4211, 1, N'hamster3.jpg', 4, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (17, N'Kiko', N'Hurón', CAST(N'2019-11-20' AS Date), N'Mediano', N'Macho', 1, 1, 1, 1, 0, 1, 1, 1, N'Divertido, Inquieto', N'Disfruta de los espacios pequeños para explorar', N'Disponible', 40.4105, -3.7248, 1, N'huron1.jpg', 4, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (18, N'Maya', N'Hurón', CAST(N'2020-02-03' AS Date), N'Pequeño', N'Hembra', 1, 1, 1, 1, 1, 1, 1, 1, N'Cariñosa, Inteligente', N'Le encanta jugar con otros animales', N'Disponible', 42.8762, -8.5448, 2, N'huron2.jpg', 3, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (19, N'Juno', N'Hurón', CAST(N'2021-09-07' AS Date), N'Mediano', N'Macho', 1, 1, 1, 1, 0, 1, 1, 1, N'Curioso, Energético', N'Le encanta explorar su entorno', N'Disponible', 41.679, -0.907, 1, N'huron3.jpg', 5, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (20, N'Rocky', N'Rata', CAST(N'2021-12-15' AS Date), N'Pequeño', N'Macho', 1, 1, 1, 1, 0, 1, 1, 1, N'Sociable, Activo', N'Rata que busca un hogar cálido', N'Disponible', 40.4555, -3.5761, 1, N'rata1.jpg', 5, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (21, N'Sasha', N'Rata', CAST(N'2021-11-10' AS Date), N'Pequeño', N'Hembra', 1, 1, 1, 1, 1, 1, 1, 1, N'Tranquila, Cariñosa', N'Le gusta estar en su jaula', N'Disponible', 42.2641, -8.722, 2, N'rata2.jpg', 7, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (22, N'Gizmo', N'Rata', CAST(N'2022-06-22' AS Date), N'Pequeño', N'Macho', 1, 1, 1, 1, 0, 1, 1, 1, N'Activo, Juguetón', N'Rata sociable que disfruta de los mimos', N'Disponible', 41.4205, 2.1819, 1, N'rata3.jpg', 6, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (23, N'Duna', N'Erizo', CAST(N'2020-10-12' AS Date), N'Pequeño', N'Hembra', 1, 1, 1, 1, 0, 1, 1, 1, N'Curiosa, Tímida', N'Eriza en busca de un hogar tranquilo', N'Disponible', 40.4168, -3.7038, 1, N'erizo1.jpg', 4, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (24, N'Pip', N'Erizo', CAST(N'2021-04-05' AS Date), N'Pequeño', N'Macho', 1, 1, 1, 1, 0, 0, 1, 1, N'Inquieto, Alegre', N'Disfruta de explorar su entorno', N'Disponible', 40.7306, -3.9352, 2, N'erizo2.jpg', 3, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (25, N'Pico', N'Erizo', CAST(N'2021-02-15' AS Date), N'Pequeño', N'Macho', 1, 1, 1, 1, 1, 1, 1, 1, N'Alegre, Activo', N'Busca una casa con jardín', N'Disponible', 39.9042, -0.4074, 1, N'erizo3.jpg', 5, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (26, N'Chester', N'Ardilla', CAST(N'2021-03-25' AS Date), N'Pequeño', N'Macho', 1, 1, 1, 1, 0, 1, 1, 1, N'Curioso, Rápido', N'Ardilla muy activa, le encanta trepar árboles', N'Disponible', 40.7128, -3.7038, 1, N'ardilla1.jpg', 4, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (27, N'Bella', N'Ardilla', CAST(N'2020-06-17' AS Date), N'Pequeña', N'Hembra', 1, 1, 1, 1, 0, 1, 1, 1, N'Juguetona, Sociable', N'Le encanta saltar y jugar con otros animales', N'Disponible', 41.9028, -3.7038, 2, N'ardilla2.jpg', 5, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (28, N'Rocky', N'Ardilla', CAST(N'2020-09-05' AS Date), N'Mediana', N'Macho', 1, 1, 1, 1, 0, 1, 1, 1, N'Inquieto, Explorador', N'Busca un hogar con árboles y espacio', N'Disponible', 40.4168, -3.7038, 1, N'ardilla3.jpg', 3, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (29, N'Nutty', N'Ardilla', CAST(N'2022-02-10' AS Date), N'Pequeña', N'Hembra', 1, 1, 1, 1, 0, 1, 1, 1, N'Tímida, Activa', N'Le encanta esconder nueces en su guarida', N'Disponible', 40.7306, -3.7038, 1, N'ardilla4.jpg', 4, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
INSERT [dbo].[MASCOTAS] ([Id], [Nombre], [Especie], [FechaNacimiento], [Tamano], [Sexo], [Castrado], [Vacunado], [Desparasitado], [Sano], [Microchip], [CompatibleConNinos], [CompatibleConAdultos], [CompatibleConOtrosAnimales], [Personalidad], [Descripcion], [Estado], [Latitud], [Longitud], [IdRefugio], [Foto], [Vistas], [FechaRegistro]) VALUES (30, N'Zippy', N'Ardilla', CAST(N'2021-08-18' AS Date), N'Mediana', N'Macho', 1, 1, 1, 1, 0, 1, 1, 1, N'Ágil, Rápido', N'Le gusta saltar de árbol en árbol', N'Disponible', 40.7831, -3.7038, 2, N'ardilla5.jpg', 6, CAST(N'2025-04-06T20:43:13.470' AS DateTime))
GO
INSERT [dbo].[MENSAJES] ([Id], [IdEmisor], [IdReceptor], [Contenido], [Fecha], [Leido]) VALUES (1, 1, 4, N'Hola, estoy interesado en adoptar a Max.', CAST(N'2025-04-06T20:43:13.500' AS DateTime), 1)
INSERT [dbo].[MENSAJES] ([Id], [IdEmisor], [IdReceptor], [Contenido], [Fecha], [Leido]) VALUES (2, 4, 1, N'¡Claro! Podemos agendar una visita.', CAST(N'2025-04-06T20:43:13.500' AS DateTime), 0)
GO
INSERT [dbo].[NOTIFICACIONES] ([Id], [IdUsuario], [Mensaje], [Tipo], [Url], [Fecha], [Leido]) VALUES (1, 1, N'Tu solicitud de adopción está pendiente', N'Solicitud', NULL, CAST(N'2025-04-06T20:43:13.497' AS DateTime), 1)
INSERT [dbo].[NOTIFICACIONES] ([Id], [IdUsuario], [Mensaje], [Tipo], [Url], [Fecha], [Leido]) VALUES (2, 2, N'Tu inscripción al evento ha sido confirmada', N'Aprobación', NULL, CAST(N'2025-04-06T20:43:13.497' AS DateTime), 0)
INSERT [dbo].[NOTIFICACIONES] ([Id], [IdUsuario], [Mensaje], [Tipo], [Url], [Fecha], [Leido]) VALUES (3, 6, N'¡Felicidades! Tu solicitud para adoptar a Mila ha sido aprobada.', N'Aprobación', N'/Adoptante/MisAdopciones', CAST(N'2025-04-06T20:43:13.497' AS DateTime), 0)
GO
INSERT [dbo].[PERFIL_USUARIO] ([Id], [IdUsuario], [FotoPerfil], [Descripcion]) VALUES (1, 1, N'foto_juan.jpg', N'Soy un amante de los animales, busco adoptar un perro o gato.')
INSERT [dbo].[PERFIL_USUARIO] ([Id], [IdUsuario], [FotoPerfil], [Descripcion]) VALUES (2, 2, N'foto_maria.jpg', N'Me encanta cuidar a los animales y busco un compañero peludo.')
INSERT [dbo].[PERFIL_USUARIO] ([Id], [IdUsuario], [FotoPerfil], [Descripcion]) VALUES (3, 3, N'foto_carlos.jpg', N'Tengo experiencia con animales, quiero adoptar un gato.')
INSERT [dbo].[PERFIL_USUARIO] ([Id], [IdUsuario], [FotoPerfil], [Descripcion]) VALUES (4, 4, N'foto_refugio1.jpg', N'Refugio con años de experiencia en el rescate de animales.')
INSERT [dbo].[PERFIL_USUARIO] ([Id], [IdUsuario], [FotoPerfil], [Descripcion]) VALUES (5, 5, N'foto_refugio2.jpg', N'Hogar para animales abandonados, buscamos un buen hogar para ellos.')
INSERT [dbo].[PERFIL_USUARIO] ([Id], [IdUsuario], [FotoPerfil], [Descripcion]) VALUES (6, 6, N'foto_mario.jpg', N'¡Bienvenido a tu perfil! Edita la descripción a tu gusto.')
GO
INSERT [dbo].[REFUGIOS] ([Id], [IdUsuario], [NombreRefugio], [ContactoRefugio], [CantidadAnimales], [CapacidadMaxima], [Latitud], [Longitud]) VALUES (1, 4, N'Refugio Vida', N'642630675', 19, 50, 40.416775, -3.70379)
INSERT [dbo].[REFUGIOS] ([Id], [IdUsuario], [NombreRefugio], [ContactoRefugio], [CantidadAnimales], [CapacidadMaxima], [Latitud], [Longitud]) VALUES (2, 5, N'Hogar Animal', N'640241325', 11, 60, 41.385064, 2.173404)
GO
INSERT [dbo].[SOLICITUDESADOPCION] ([Id], [IdAdoptante], [IdMascota], [Estado], [ExperienciaPrevia], [TipoVivienda], [OtrosAnimales], [Recursos], [TiempoEnCasa], [FechaSolicitud], [FechaRespuesta]) VALUES (1, 1, 1, N'Pendiente', 1, N'Casa', 1, N'["Jardín"]', N'4-8 horas', CAST(N'2025-04-06T20:43:13.483' AS DateTime), NULL)
INSERT [dbo].[SOLICITUDESADOPCION] ([Id], [IdAdoptante], [IdMascota], [Estado], [ExperienciaPrevia], [TipoVivienda], [OtrosAnimales], [Recursos], [TiempoEnCasa], [FechaSolicitud], [FechaRespuesta]) VALUES (2, 2, 2, N'Aprobada', 1, N'Departamento', 0, N'["Tiempo parcial"]', N'4-8 horas', CAST(N'2025-04-06T20:43:13.483' AS DateTime), CAST(N'2024-03-25T17:30:00.000' AS DateTime))
INSERT [dbo].[SOLICITUDESADOPCION] ([Id], [IdAdoptante], [IdMascota], [Estado], [ExperienciaPrevia], [TipoVivienda], [OtrosAnimales], [Recursos], [TiempoEnCasa], [FechaSolicitud], [FechaRespuesta]) VALUES (3, 3, 3, N'Rechazada', 0, N'Casa', 1, N'["Espacio amplio"]', N'4-8 horas', CAST(N'2025-04-06T20:43:13.483' AS DateTime), NULL)
INSERT [dbo].[SOLICITUDESADOPCION] ([Id], [IdAdoptante], [IdMascota], [Estado], [ExperienciaPrevia], [TipoVivienda], [OtrosAnimales], [Recursos], [TiempoEnCasa], [FechaSolicitud], [FechaRespuesta]) VALUES (4, 4, 6, N'Aprobada', 1, N'Piso', 1, N'["Estilo de vida adecuado","Compromiso emocional"]', N'4-8 horas', CAST(N'2025-04-06T20:43:13.483' AS DateTime), CAST(N'2025-03-13T21:18:16.000' AS DateTime))
GO
INSERT [dbo].[USUARIOS] ([Id], [NombreUsuario], [Email], [ContrasenaLimpia], [ContrasenaEncriptada], [Salt], [TipoUsuario], [FechaRegistro]) VALUES (1, N'juanperez', N'juan@example.com', N'123', 0x5688636BA1D36F898A327189B6AF0731AF8F9C46C52B627001A7CF8226808F8D26026B5387C73EAA87A5E7213168C78A287728E0AA3B76E11EA19595038EA8A9, N'S5C6mZA1vdO+c/3tarND6Rl0bBYIvwRA3tJZFzSayLs=', N'Adoptante', CAST(N'2025-04-06T20:43:13.427' AS DateTime))
INSERT [dbo].[USUARIOS] ([Id], [NombreUsuario], [Email], [ContrasenaLimpia], [ContrasenaEncriptada], [Salt], [TipoUsuario], [FechaRegistro]) VALUES (2, N'maria123', N'maria@example.com', N'321', 0x536659CF5AB46E9CE4E7AD57A4F60096BEB8B7889088C3441552F4EEEA0B2C844670AA3AC64487096D5A95E7D69939F8D32C6527DD7963FC6F5FDB443FA5660B, N'n0qcuDcOqDxBI/25hnHWk3nmWHkEp0RnBispdRkQHqw=', N'Adoptante', CAST(N'2025-04-06T20:43:13.427' AS DateTime))
INSERT [dbo].[USUARIOS] ([Id], [NombreUsuario], [Email], [ContrasenaLimpia], [ContrasenaEncriptada], [Salt], [TipoUsuario], [FechaRegistro]) VALUES (3, N'carlos789', N'carlos@example.com', N'098', 0x2CFB89CF614BD21996FC781A764BBA0E6537E43DB47F5CC706158302BB5B7DBE18F5DB1A40BD8C84D811880E7CBC4789CE3F5778E676973B687ECDEAA0162167, N'0fpKvyG4kAhAJKw2y6yaCHhdZrLgzYqyLBJ0ZrDQq3A=', N'Adoptante', CAST(N'2025-04-06T20:43:13.427' AS DateTime))
INSERT [dbo].[USUARIOS] ([Id], [NombreUsuario], [Email], [ContrasenaLimpia], [ContrasenaEncriptada], [Salt], [TipoUsuario], [FechaRegistro]) VALUES (4, N'refugio_vida', N'contacto@refugiovida.com', N'890', 0x5AE819DAB5B9A0D257CD4B862AF4D13B4E5FEA0095A13D8DD493D943396565F47605B0826B32F125BAA55E876D0ECC826E55F5F532A56270C33E9F1663723D09, N'oTneW+0XKLwI0JIrNN7Pzxxer6mzAA5XCn819pDAg/o=', N'Refugio', CAST(N'2025-04-06T20:43:13.427' AS DateTime))
INSERT [dbo].[USUARIOS] ([Id], [NombreUsuario], [Email], [ContrasenaLimpia], [ContrasenaEncriptada], [Salt], [TipoUsuario], [FechaRegistro]) VALUES (5, N'hogar_animal', N'info@hogaranimal.com', N'345', 0xCD848AF824CD985B0386DC87D808ED5920ED29EBD90FF27498E5E3CD348EE2E8DA4AE60D24F07AB613294BBE723D50E364FA039625C5930244F8180035FBFDBD, N'fb9JMUlulKbFeZBJ3BdUHDcze17YSB9YCBuGq3Kki48=', N'Refugio', CAST(N'2025-04-06T20:43:13.427' AS DateTime))
INSERT [dbo].[USUARIOS] ([Id], [NombreUsuario], [Email], [ContrasenaLimpia], [ContrasenaEncriptada], [Salt], [TipoUsuario], [FechaRegistro]) VALUES (6, N'mario', N'mariojimenez@gmail.com', N'contrasenamario', 0x7638DE15FB9FF71E2B986F58EC9886EEF15E602396866A282E4B3EF4828EB19EEAAD731455AB2E713AADA2D349878242F453D89F420F9D7E90845ED0BD353509, N'SGA4TxFmqSbsPcjPB1u3H5bLmhQRlIn3EPyIaLQYlGw=', N'Adoptante', CAST(N'2025-04-06T20:43:13.427' AS DateTime))
GO
/****** Object:  Index [UQ__ADOPTANT__5B65BF96993C8EBA]    Script Date: 06/04/2025 20:44:10 ******/
ALTER TABLE [dbo].[ADOPTANTES] ADD UNIQUE NONCLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__FAVORITO__8D6F94AF9F41A4A1]    Script Date: 06/04/2025 20:44:10 ******/
ALTER TABLE [dbo].[FAVORITOS] ADD UNIQUE NONCLUSTERED 
(
	[IdAdoptante] ASC,
	[IdMascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LIKESHIS__3CB1D43867874A9F]    Script Date: 06/04/2025 20:44:10 ******/
ALTER TABLE [dbo].[LIKESHISTORIAS] ADD UNIQUE NONCLUSTERED 
(
	[IdHistoria] ASC,
	[IdUsuario] ASC,
	[TipoReaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__PERFIL_U__5B65BF96D0B7C637]    Script Date: 06/04/2025 20:44:10 ******/
ALTER TABLE [dbo].[PERFIL_USUARIO] ADD UNIQUE NONCLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__REFUGIOS__5B65BF96C66C4EA4]    Script Date: 06/04/2025 20:44:10 ******/
ALTER TABLE [dbo].[REFUGIOS] ADD UNIQUE NONCLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__USUARIOS__6B0F5AE0325DFE06]    Script Date: 06/04/2025 20:44:10 ******/
ALTER TABLE [dbo].[USUARIOS] ADD UNIQUE NONCLUSTERED 
(
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__USUARIOS__A9D1053485101420]    Script Date: 06/04/2025 20:44:10 ******/
ALTER TABLE [dbo].[USUARIOS] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADOPTANTES] ADD  DEFAULT ((0)) FOR [TieneJardin]
GO
ALTER TABLE [dbo].[ADOPTANTES] ADD  DEFAULT ((0)) FOR [OtrosAnimales]
GO
ALTER TABLE [dbo].[FAVORITOS] ADD  DEFAULT (getdate()) FOR [FechaAgregado]
GO
ALTER TABLE [dbo].[HISTORIASEXITO] ADD  DEFAULT (getdate()) FOR [FechaPublicacion]
GO
ALTER TABLE [dbo].[HISTORIASEXITO] ADD  DEFAULT ('Pendiente') FOR [Estado]
GO
ALTER TABLE [dbo].[LIKESHISTORIAS] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[MASCOTAS] ADD  DEFAULT ((0)) FOR [Castrado]
GO
ALTER TABLE [dbo].[MASCOTAS] ADD  DEFAULT ((0)) FOR [Vacunado]
GO
ALTER TABLE [dbo].[MASCOTAS] ADD  DEFAULT ((0)) FOR [Desparasitado]
GO
ALTER TABLE [dbo].[MASCOTAS] ADD  DEFAULT ((1)) FOR [Sano]
GO
ALTER TABLE [dbo].[MASCOTAS] ADD  DEFAULT ((0)) FOR [Microchip]
GO
ALTER TABLE [dbo].[MASCOTAS] ADD  DEFAULT ((0)) FOR [CompatibleConNinos]
GO
ALTER TABLE [dbo].[MASCOTAS] ADD  DEFAULT ((0)) FOR [CompatibleConAdultos]
GO
ALTER TABLE [dbo].[MASCOTAS] ADD  DEFAULT ((0)) FOR [CompatibleConOtrosAnimales]
GO
ALTER TABLE [dbo].[MASCOTAS] ADD  DEFAULT ('Disponible') FOR [Estado]
GO
ALTER TABLE [dbo].[MASCOTAS] ADD  DEFAULT ((0)) FOR [Vistas]
GO
ALTER TABLE [dbo].[MASCOTAS] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[MENSAJES] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[MENSAJES] ADD  DEFAULT ((0)) FOR [Leido]
GO
ALTER TABLE [dbo].[NOTIFICACIONES] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[NOTIFICACIONES] ADD  DEFAULT ((0)) FOR [Leido]
GO
ALTER TABLE [dbo].[SOLICITUDESADOPCION] ADD  DEFAULT ('Pendiente') FOR [Estado]
GO
ALTER TABLE [dbo].[SOLICITUDESADOPCION] ADD  DEFAULT (getdate()) FOR [FechaSolicitud]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[ADOPTANTES]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIOS] ([Id])
GO
ALTER TABLE [dbo].[FAVORITOS]  WITH CHECK ADD FOREIGN KEY([IdAdoptante])
REFERENCES [dbo].[ADOPTANTES] ([Id])
GO
ALTER TABLE [dbo].[FAVORITOS]  WITH CHECK ADD FOREIGN KEY([IdMascota])
REFERENCES [dbo].[MASCOTAS] ([Id])
GO
ALTER TABLE [dbo].[HISTORIASEXITO]  WITH CHECK ADD FOREIGN KEY([IdAdoptante])
REFERENCES [dbo].[ADOPTANTES] ([Id])
GO
ALTER TABLE [dbo].[HISTORIASEXITO]  WITH CHECK ADD FOREIGN KEY([IdMascota])
REFERENCES [dbo].[MASCOTAS] ([Id])
GO
ALTER TABLE [dbo].[LIKESHISTORIAS]  WITH CHECK ADD FOREIGN KEY([IdHistoria])
REFERENCES [dbo].[HISTORIASEXITO] ([Id])
GO
ALTER TABLE [dbo].[LIKESHISTORIAS]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIOS] ([Id])
GO
ALTER TABLE [dbo].[MASCOTAS]  WITH CHECK ADD FOREIGN KEY([IdRefugio])
REFERENCES [dbo].[USUARIOS] ([Id])
GO
ALTER TABLE [dbo].[MENSAJES]  WITH CHECK ADD FOREIGN KEY([IdEmisor])
REFERENCES [dbo].[USUARIOS] ([Id])
GO
ALTER TABLE [dbo].[MENSAJES]  WITH CHECK ADD FOREIGN KEY([IdReceptor])
REFERENCES [dbo].[USUARIOS] ([Id])
GO
ALTER TABLE [dbo].[NOTIFICACIONES]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIOS] ([Id])
GO
ALTER TABLE [dbo].[PERFIL_USUARIO]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIOS] ([Id])
GO
ALTER TABLE [dbo].[REFUGIOS]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIOS] ([Id])
GO
ALTER TABLE [dbo].[SOLICITUDESADOPCION]  WITH CHECK ADD FOREIGN KEY([IdAdoptante])
REFERENCES [dbo].[ADOPTANTES] ([Id])
GO
ALTER TABLE [dbo].[SOLICITUDESADOPCION]  WITH CHECK ADD FOREIGN KEY([IdMascota])
REFERENCES [dbo].[MASCOTAS] ([Id])
GO
ALTER TABLE [dbo].[HISTORIASEXITO]  WITH CHECK ADD CHECK  (([Estado]='Rechazada' OR [Estado]='Aprobada' OR [Estado]='Pendiente'))
GO
ALTER TABLE [dbo].[LIKESHISTORIAS]  WITH CHECK ADD CHECK  (([TipoReaccion]='Asombroso' OR [TipoReaccion]='Solidario' OR [TipoReaccion]='Inspirador' OR [TipoReaccion]='MeEncanta' OR [TipoReaccion]='MeGusta'))
GO
ALTER TABLE [dbo].[MASCOTAS]  WITH CHECK ADD CHECK  (([Estado]='Adoptado' OR [Estado]='Disponible'))
GO
ALTER TABLE [dbo].[MASCOTAS]  WITH CHECK ADD CHECK  (([Sexo]='Hembra' OR [Sexo]='Macho'))
GO
ALTER TABLE [dbo].[NOTIFICACIONES]  WITH CHECK ADD CHECK  (([Tipo]='Sistema' OR [Tipo]='Mensaje' OR [Tipo]='Aprobación' OR [Tipo]='Solicitud'))
GO
ALTER TABLE [dbo].[SOLICITUDESADOPCION]  WITH CHECK ADD CHECK  (([Estado]='Rechazada' OR [Estado]='Aprobada' OR [Estado]='Pendiente'))
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD CHECK  (([TipoUsuario]='Refugio' OR [TipoUsuario]='Adoptante'))
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENERMASCOTASADOPTADAS]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_OBTENERMASCOTASADOPTADAS]
    (@idadoptante int)
AS
    SELECT * FROM V_MascotasAdoptadas
    WHERE IdAdoptante = @idadoptante
    ORDER BY FechaAdopcion DESC
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENERMASCOTASFAVORITAS]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[SP_OBTENERMASCOTASFAVORITAS]
 (@idadoptante int)
 as
	select * from V_MascotasFavoritas
	where IdAdoptante = @idadoptante
	order by FechaAgregado desc
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENERSOLICITUDESREFUGIO]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Creación del Procedimiento Almacenado
CREATE   PROCEDURE [dbo].[SP_OBTENERSOLICITUDESREFUGIO]
    @idusuario INT
AS
BEGIN
    -- Obtenemos el ID del refugio a partir del ID de usuario
    DECLARE @idrefugio INT
    SELECT @idrefugio = Id FROM REFUGIOS WHERE IdUsuario = @idusuario

    -- Seleccionamos las solicitudes relacionadas con mascotas de este refugio
    SELECT *
    FROM V_SolicitudesRefugio
    WHERE IdRefugio = @idrefugio
    ORDER BY FechaSolicitud DESC
END

GO
/****** Object:  StoredProcedure [dbo].[SP_PERFILADOPTANTE]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_PERFILADOPTANTE]
(@idusuario int)
as
	select * from V_AdoptantePerfil
	where IdUsuario = @idusuario;
GO
/****** Object:  StoredProcedure [dbo].[SP_PERFILREFUGIO]    Script Date: 06/04/2025 20:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_PERFILREFUGIO]
(@idusuario int)
as
	select * from V_RefugioPerfil
	where IdUsuario = @idusuario;
GO
USE [master]
GO
ALTER DATABASE [ZUVOPET] SET  READ_WRITE 
GO
