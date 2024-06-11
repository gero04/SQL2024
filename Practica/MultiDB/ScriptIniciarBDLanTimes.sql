/*
Script creacion de tablas del modelo del libro Lan Times Guide to SQL, James Groff and Paul Weinberg, ed Osborne-McGraw-Hill.
v1.0 creacion del script- Estudiante: Ariel Franco-2011
v1.1 adaptaci�n de formato de fechas- Ing. Mat�as Bueno-2011
*/

/*
Al momento de crear la BD es necesario ejecutar s�lo la l�nea del CREATE DATABASE.
Una vez ejecutada, debe ser comentada para despu�s continuar con las creaciones
*/

--CREATE DATABASE LANTIMES;
USE LANTIMES;
GO

/*SET LANGUAGE 'us_english'
*/

/****** Object:  ForeignKey [FK_clientes_repventas]    Script Date: 06/05/2011 21:24:00 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_clientes_repventas]') AND parent_object_id = OBJECT_ID(N'[dbo].[clientes]'))
ALTER TABLE [dbo].[clientes] DROP CONSTRAINT [FK_clientes_repventas]
GO
/****** Object:  ForeignKey [FK_oficinas_repventas]    Script Date: 06/05/2011 21:24:00 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_oficinas_repventas]') AND parent_object_id = OBJECT_ID(N'[dbo].[oficinas]'))
ALTER TABLE [dbo].[oficinas] DROP CONSTRAINT [FK_oficinas_repventas]
GO
/****** Object:  ForeignKey [FK_pedidos_clientes]    Script Date: 06/05/2011 21:24:00 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_pedidos_clientes]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedidos]'))
ALTER TABLE [dbo].[pedidos] DROP CONSTRAINT [FK_pedidos_clientes]
GO
/****** Object:  ForeignKey [FK_pedidos_productos]    Script Date: 06/05/2011 21:24:00 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_pedidos_productos]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedidos]'))
ALTER TABLE [dbo].[pedidos] DROP CONSTRAINT [FK_pedidos_productos]
GO
/****** Object:  ForeignKey [FK_pedidos_repventas]    Script Date: 06/05/2011 21:24:00 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_pedidos_repventas]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedidos]'))
ALTER TABLE [dbo].[pedidos] DROP CONSTRAINT [FK_pedidos_repventas]
GO
/****** Object:  ForeignKey [FK_repventas_oficinas]    Script Date: 06/05/2011 21:24:01 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_repventas_oficinas]') AND parent_object_id = OBJECT_ID(N'[dbo].[repventas]'))
ALTER TABLE [dbo].[repventas] DROP CONSTRAINT [FK_repventas_oficinas]
GO
/****** Object:  Table [dbo].[pedidos]    Script Date: 06/05/2011 21:24:00 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_pedidos_clientes]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedidos]'))
ALTER TABLE [dbo].[pedidos] DROP CONSTRAINT [FK_pedidos_clientes]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_pedidos_productos]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedidos]'))
ALTER TABLE [dbo].[pedidos] DROP CONSTRAINT [FK_pedidos_productos]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_pedidos_repventas]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedidos]'))
ALTER TABLE [dbo].[pedidos] DROP CONSTRAINT [FK_pedidos_repventas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pedidos]') AND type in (N'U'))
DROP TABLE [dbo].[pedidos]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 06/05/2011 21:24:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[productos]') AND type in (N'U'))
DROP TABLE [dbo].[productos]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 06/05/2011 21:24:00 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_clientes_repventas]') AND parent_object_id = OBJECT_ID(N'[dbo].[clientes]'))
ALTER TABLE [dbo].[clientes] DROP CONSTRAINT [FK_clientes_repventas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[clientes]') AND type in (N'U'))
DROP TABLE [dbo].[clientes]
GO
/****** Object:  Table [dbo].[repventas]    Script Date: 06/05/2011 21:24:01 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_repventas_oficinas]') AND parent_object_id = OBJECT_ID(N'[dbo].[repventas]'))
ALTER TABLE [dbo].[repventas] DROP CONSTRAINT [FK_repventas_oficinas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[repventas]') AND type in (N'U'))
DROP TABLE [dbo].[repventas]
GO
/****** Object:  Table [dbo].[oficinas]    Script Date: 06/05/2011 21:24:00 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_oficinas_repventas]') AND parent_object_id = OBJECT_ID(N'[dbo].[oficinas]'))
ALTER TABLE [dbo].[oficinas] DROP CONSTRAINT [FK_oficinas_repventas]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[oficinas]') AND type in (N'U'))
DROP TABLE [dbo].[oficinas]
GO
/****** Object:  Table [dbo].[oficinas]    Script Date: 06/05/2011 21:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[oficinas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[oficinas](
	[oficina] [int] NOT NULL,
	[ciudad] [varchar](15) NOT NULL,
	[region] [varchar](10) NOT NULL,
	[dir] [int] NULL,
	[objetivo] [money] NULL,
	[ventas] [money] NOT NULL,
 CONSTRAINT [PK_oficinas] PRIMARY KEY CLUSTERED 
(
	[oficina] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[oficinas] ([oficina], [ciudad], [region], [dir], [objetivo], [ventas]) VALUES (11, N'New York', N'Este', 106, 575000.0000, 692637.0000)
INSERT [dbo].[oficinas] ([oficina], [ciudad], [region], [dir], [objetivo], [ventas]) VALUES (12, N'Chicago', N'Este', 104, 800000.0000, 735042.0000)
INSERT [dbo].[oficinas] ([oficina], [ciudad], [region], [dir], [objetivo], [ventas]) VALUES (13, N'Atlanta', N'Este', 105, 350000.0000, 367911.0000)
INSERT [dbo].[oficinas] ([oficina], [ciudad], [region], [dir], [objetivo], [ventas]) VALUES (21, N'Los Angeles', N'Oeste', 108, 725000.0000, 835915.0000)
INSERT [dbo].[oficinas] ([oficina], [ciudad], [region], [dir], [objetivo], [ventas]) VALUES (22, N'Denver', N'Oeste', 108, 300000.0000, 186042.0000)
/****** Object:  Table [dbo].[repventas]    Script Date: 06/05/2011 21:24:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[repventas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[repventas](
	[num_empl] [int] NOT NULL,
	[nombre] [varchar](15) NOT NULL,
	[edad] [int] NULL,
	[oficina_rep] [int] NULL,
	[titulo] [varchar](10) NULL,
	[contrato] [date] NOT NULL,
	[director] [int] NULL,
	[cuota] [money] NULL,
	[ventas] [money] NOT NULL,
 CONSTRAINT [PK_repventas] PRIMARY KEY CLUSTERED 
(
	[num_empl] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[repventas] ([num_empl], [nombre], [edad], [oficina_rep], [titulo], [contrato], [director], [cuota], [ventas]) VALUES (101, N'Dan Roberts', 45, 12, N'Rep Ventas', CAST('1986-10-20' AS Date), 104, 300000.0000, 305673.0000)
INSERT [dbo].[repventas] ([num_empl], [nombre], [edad], [oficina_rep], [titulo], [contrato], [director], [cuota], [ventas]) VALUES (102, N'Sue Smith', 48, 21, N'Rep Ventas', CAST('1986-12-10' AS Date), 108, 350000.0000, 474050.0000)
INSERT [dbo].[repventas] ([num_empl], [nombre], [edad], [oficina_rep], [titulo], [contrato], [director], [cuota], [ventas]) VALUES (103, N'Paul Cruz', 29, 12, N'Rep Ventas', CAST('1987-03-01' AS Date), 104, 275000.0000, 286775.0000)
INSERT [dbo].[repventas] ([num_empl], [nombre], [edad], [oficina_rep], [titulo], [contrato], [director], [cuota], [ventas]) VALUES (104, N'Bob Smith', 33, 12, N'Dir Ventas', CAST('1987-05-19' AS Date), 106, 200000.0000, 142594.0000)
INSERT [dbo].[repventas] ([num_empl], [nombre], [edad], [oficina_rep], [titulo], [contrato], [director], [cuota], [ventas]) VALUES (105, N'Bill Adams', 37, 13, N'Rep Ventas', CAST('1988-02-12' AS Date), 104, 350000.0000, 367911.0000)
INSERT [dbo].[repventas] ([num_empl], [nombre], [edad], [oficina_rep], [titulo], [contrato], [director], [cuota], [ventas]) VALUES (106, N'Sam Clark', 52, 11, N'VP ventas', CAST('1988-06-14' AS Date), NULL, 275000.0000, 299912.0000)
INSERT [dbo].[repventas] ([num_empl], [nombre], [edad], [oficina_rep], [titulo], [contrato], [director], [cuota], [ventas]) VALUES (107, N'Nancy Angelli', 49, 22, N'Rep Ventas', CAST('1988-11-14' AS Date), 108, 300000.0000, 186042.0000)
INSERT [dbo].[repventas] ([num_empl], [nombre], [edad], [oficina_rep], [titulo], [contrato], [director], [cuota], [ventas]) VALUES (108, N'Larry Fitch', 62, 21, N'Dir Ventas', CAST('1989-10-12' AS Date), 106, 350000.0000, 361865.0000)
INSERT [dbo].[repventas] ([num_empl], [nombre], [edad], [oficina_rep], [titulo], [contrato], [director], [cuota], [ventas]) VALUES (109, N'Mary Jones', 31, 11, N'Rep Ventas', CAST('1999-10-12' AS Date), 106, 300000.0000, 392725.0000)
INSERT [dbo].[repventas] ([num_empl], [nombre], [edad], [oficina_rep], [titulo], [contrato], [director], [cuota], [ventas]) VALUES (110, N'Tom Snyder', 41, NULL, N'Rep Ventas', CAST('1990-01-13' AS Date), 101, NULL, 75985.0000)
/****** Object:  Table [dbo].[clientes]    Script Date: 06/05/2011 21:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[clientes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[clientes](
	[num_clie] [int] NOT NULL,
	[empresa] [varchar](20) NOT NULL,
	[rep_clie] [int] NULL,
	[limite_credito] [money] NULL,
 CONSTRAINT [PK_clientes_1] PRIMARY KEY CLUSTERED 
(
	[num_clie] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2101, N'Jones Mfg.', 106, 65000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2102, N'First Corp.', 101, 65000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2103, N'Acme Mfg.', 105, 50000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2105, N'AAA Investments', 101, 45000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2106, N'Fred Lewis Corp.', 102, 65000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2107, N'Ace International', 110, 35000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2108, N'Holm & Landis', 109, 55000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2109, N'Chen Associates', 103, 25000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2111, N'JCP Inc.', 103, 50000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2112, N'Zetacorp', 108, 50000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2113, N'Ian & Schmidt', 104, 20000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2114, N'Orion Corp.', 102, 20000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2115, N'Smithson Corp.', 101, 20000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2117, N'J.P. Sinclair', 106, 35000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2118, N'Midwest Systems', 108, 60000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2119, N'Solomon Inc.', 109, 25000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2120, N'Rico Enterprises', 102, 50000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2121, N'QMA Assoc.', 103, 45000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2122, N'Three-Way Lines', 105, 30000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2123, N'Carter & Sons', 102, 40000.0000)
INSERT [dbo].[clientes] ([num_clie], [empresa], [rep_clie], [limite_credito]) VALUES (2124, N'Peter Brothers', 107, 40000.0000)
/****** Object:  Table [dbo].[productos]    Script Date: 06/05/2011 21:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[productos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[productos](
	[id_fab] [char](3) NOT NULL,
	[id_producto] [char](5) NOT NULL,
	[descripcion] [varchar](20) NOT NULL,
	[precio] [money] NOT NULL,
	[existencias] [int] NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[id_fab] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'ACI', N'41001', N'Art�culo Tipo 1', 55.0000, 277)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'ACI', N'41002', N'Art�culo Tipo 2', 76.0000, 167)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'ACI', N'41003', N'Art�culo Tipo 3 ', 107.0000, 207)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'ACI', N'41004', N'Art�culo Tipo 4', 117.0000, 139)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'ACI', N'4100X', N'Ajustador', 25.0000, 37)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'ACI', N'4100Y', N'Desmontador', 2750.0000, 25)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'ACI', N'4100Z', N'Montador', 2500.0000, 28)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'BIC', N'41003', N'Tirador', 652.0000, 3)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'BIC', N'41089', N'Ret�n', 225.0000, 78)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'BIC', N'41672', N'Placa', 180.0000, 0)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'FEA', N'112  ', N'Cubierta', 148.0000, 115)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'FEA', N'114  ', N'Bancada Motor', 243.0000, 15)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'IMM', N'773C ', N'Abrazadera 300-lb', 975.0000, 28)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'IMM', N'775C ', N'Abrazadera 500-lb', 1425.0000, 5)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'IMM', N'779C ', N'Abrazadera 900-lb', 1875.0000, 9)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'IMM', N'887H ', N'Soporte Abrazadera', 54.0000, 223)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'IMM', N'887P ', N'Perno Abrazadera', 250.0000, 24)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'IMM', N'887X ', N'Ret�n Abrazadera', 475.0000, 32)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'QSA', N'XK47 ', N'Reductor', 355.0000, 38)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'QSA', N'XK48 ', N'Reductor', 134.0000, 203)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'QSA', N'XK48A', N'Reductor', 117.0000, 37)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'REI', N'2A44G', N'Pasador Bisagra', 350.0000, 14)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'REI', N'2A44L', N'Bisagra Izqda.', 4500.0000, 12)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'REI', N'2A44R', N'Bisagra Dcha.', 4500.0000, 12)
INSERT [dbo].[productos] ([id_fab], [id_producto], [descripcion], [precio], [existencias]) VALUES (N'REI', N'2A45C', N'Uni�n Trinquete', 79.0000, 210)
/****** Object:  Table [dbo].[pedidos]    Script Date: 06/05/2011 21:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pedidos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[pedidos](
	[num_pedido] [int] NOT NULL,
	[fecha_pedido] [date] NOT NULL,
	[clie] [int] NOT NULL,
	[rep] [int] NULL,
	[fab] [char](3) NOT NULL,
	[producto] [char](5) NOT NULL,
	[cant] [int] NOT NULL,
	[importe] [money] NOT NULL,
 CONSTRAINT [PK_pedidos] PRIMARY KEY CLUSTERED 
(
	[num_pedido] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (110036, CAST('1990-01-30' AS Date), 2107, 110, N'ACI', N'4100Z', 9, 22500.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (112961, CAST('1989-12-17' AS Date), 2117, 106, N'REI', N'2A44L', 7, 31500.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (112963, CAST('1989-12-17' AS Date), 2103, 105, N'ACI', N'41004', 28, 3276.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (112975, CAST('1989-10-12' AS Date), 2111, 103, N'REI', N'2A44G', 6, 2100.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (112979, CAST('1989-10-12' AS Date), 2114, 102, N'ACI', N'4100Z', 6, 15000.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (112983, CAST('1989-12-27' AS Date), 2103, 105, N'ACI', N'41004', 6, 702.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (112987, CAST('1989-12-31' AS Date), 2103, 105, N'ACI', N'4100X', 24, 600.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (112989, CAST('1990-01-03' AS Date), 2101, 106, N'FEA', N'114  ', 6, 1458.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (112992, CAST('1989-11-04' AS Date), 2118, 108, N'ACI', N'41002', 10, 760.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (112993, CAST('1989-01-04' AS Date), 2106, 102, N'REI', N'2A45C', 24, 1896.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (112997, CAST('1990-01-08' AS Date), 2124, 107, N'BIC', N'41003', 1, 652.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113003, CAST('1990-01-25' AS Date), 2108, 109, N'IMM', N'779C ', 3, 5625.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113007, CAST('1990-01-08' AS Date), 2112, 108, N'IMM', N'773C ', 3, 2925.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113012, CAST('1990-01-11' AS Date), 2111, 105, N'ACI', N'41003', 35, 3745.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113013, CAST('1990-01-14' AS Date), 2118, 108, N'BIC', N'41003', 1, 652.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113024, CAST('1990-01-20' AS Date), 2114, 108, N'QSA', N'XK47 ', 20, 7100.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113027, CAST('1990-01-22' AS Date), 2103, 105, N'ACI', N'41002', 54, 4104.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113034, CAST('1990-01-29' AS Date), 2107, 110, N'REI', N'2A45C', 8, 632.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113042, CAST('1990-02-02' AS Date), 2113, 101, N'REI', N'2A44R', 5, 22500.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113045, CAST('1990-02-02' AS Date), 2112, 108, N'REI', N'2A44R', 10, 45000.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113048, CAST('1990-02-10' AS Date), 2120, 102, N'IMM', N'779C ', 2, 3750.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113049, CAST('1990-02-10' AS Date), 2118, 108, N'QSA', N'XK47 ', 2, 776.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113051, CAST('1990-02-10' AS Date), 2118, 108, N'QSA', N'XK47 ', 4, 1420.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113055, CAST('1990-02-15' AS Date), 2108, 101, N'ACI', N'4100X', 6, 150.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113058, CAST('1990-02-23' AS Date), 2108, 109, N'FEA', N'112  ', 10, 1480.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113062, CAST('1990-01-24' AS Date), 2124, 107, N'FEA', N'114  ', 10, 2430.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113065, CAST('1990-02-27' AS Date), 2106, 102, N'QSA', N'XK47 ', 6, 2130.0000)
INSERT [dbo].[pedidos] ([num_pedido], [fecha_pedido], [clie], [rep], [fab], [producto], [cant], [importe]) VALUES (113069, CAST('1990-03-02' AS Date), 2109, 107, N'IMM', N'775C ', 22, 31350.0000)
/****** Object:  ForeignKey [FK_clientes_repventas]    Script Date: 06/05/2011 21:24:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_clientes_repventas]') AND parent_object_id = OBJECT_ID(N'[dbo].[clientes]'))
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [FK_clientes_repventas] FOREIGN KEY([rep_clie])
REFERENCES [dbo].[repventas] ([num_empl])
ON DELETE SET NULL
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_clientes_repventas]') AND parent_object_id = OBJECT_ID(N'[dbo].[clientes]'))
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [FK_clientes_repventas]
GO
/****** Object:  ForeignKey [FK_oficinas_repventas]    Script Date: 06/05/2011 21:24:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_oficinas_repventas]') AND parent_object_id = OBJECT_ID(N'[dbo].[oficinas]'))
ALTER TABLE [dbo].[oficinas]  WITH CHECK ADD  CONSTRAINT [FK_oficinas_repventas] FOREIGN KEY([dir])
REFERENCES [dbo].[repventas] ([num_empl])
ON DELETE SET NULL
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_oficinas_repventas]') AND parent_object_id = OBJECT_ID(N'[dbo].[oficinas]'))
ALTER TABLE [dbo].[oficinas] CHECK CONSTRAINT [FK_oficinas_repventas]
GO
/****** Object:  ForeignKey [FK_pedidos_clientes]    Script Date: 06/05/2011 21:24:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_pedidos_clientes]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedidos]'))
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD  CONSTRAINT [FK_pedidos_clientes] FOREIGN KEY([clie])
REFERENCES [dbo].[clientes] ([num_clie])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_pedidos_clientes]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedidos]'))
ALTER TABLE [dbo].[pedidos] CHECK CONSTRAINT [FK_pedidos_clientes]
GO
/****** Object:  ForeignKey [FK_pedidos_productos]    Script Date: 06/05/2011 21:24:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_pedidos_productos]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedidos]'))
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD  CONSTRAINT [FK_pedidos_productos] FOREIGN KEY([fab], [producto])
REFERENCES [dbo].[productos] ([id_fab], [id_producto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_pedidos_productos]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedidos]'))
ALTER TABLE [dbo].[pedidos] CHECK CONSTRAINT [FK_pedidos_productos]
GO
/****** Object:  ForeignKey [FK_pedidos_repventas]    Script Date: 06/05/2011 21:24:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_pedidos_repventas]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedidos]'))
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD  CONSTRAINT [FK_pedidos_repventas] FOREIGN KEY([rep])
REFERENCES [dbo].[repventas] ([num_empl])
ON DELETE SET NULL
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_pedidos_repventas]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedidos]'))
ALTER TABLE [dbo].[pedidos] CHECK CONSTRAINT [FK_pedidos_repventas]
GO
/****** Object:  ForeignKey [FK_repventas_oficinas]    Script Date: 06/05/2011 21:24:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_repventas_oficinas]') AND parent_object_id = OBJECT_ID(N'[dbo].[repventas]'))
ALTER TABLE [dbo].[repventas]  WITH CHECK ADD  CONSTRAINT [FK_repventas_oficinas] FOREIGN KEY([oficina_rep])
REFERENCES [dbo].[oficinas] ([oficina])
ON DELETE SET NULL
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_repventas_oficinas]') AND parent_object_id = OBJECT_ID(N'[dbo].[repventas]'))
ALTER TABLE [dbo].[repventas] CHECK CONSTRAINT [FK_repventas_oficinas]
GO
