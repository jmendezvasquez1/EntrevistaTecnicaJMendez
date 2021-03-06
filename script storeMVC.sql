USE [master]
GO
/****** Object:  Database [store]    Script Date: 2/12/2020 20:20:57 ******/
CREATE DATABASE [store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [store] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [store] SET ARITHABORT OFF 
GO
ALTER DATABASE [store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [store] SET  ENABLE_BROKER 
GO
ALTER DATABASE [store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [store] SET RECOVERY FULL 
GO
ALTER DATABASE [store] SET  MULTI_USER 
GO
ALTER DATABASE [store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [store] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'store', N'ON'
GO
ALTER DATABASE [store] SET QUERY_STORE = OFF
GO
USE [store]
GO
/****** Object:  Table [dbo].[costumers]    Script Date: 2/12/2020 20:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[costumers](
	[idCostumer] [int] IDENTITY(1,1) NOT NULL,
	[costumerName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCostumer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetails]    Script Date: 2/12/2020 20:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetails](
	[idDetail] [int] IDENTITY(1,1) NOT NULL,
	[idOrder] [int] NULL,
	[product] [int] NULL,
	[quantity] [int] NULL,
	[price] [decimal](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2/12/2020 20:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[idOrder] [int] IDENTITY(1,1) NOT NULL,
	[costumer] [int] NULL,
	[dateRegister] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 2/12/2020 20:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[idProduct] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](255) NOT NULL,
	[price] [decimal](7, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[costumers] ON 

INSERT [dbo].[costumers] ([idCostumer], [costumerName]) VALUES (1, N'Jairo Mendez')
INSERT [dbo].[costumers] ([idCostumer], [costumerName]) VALUES (2, N'Gabriela guerra')
SET IDENTITY_INSERT [dbo].[costumers] OFF
GO
SET IDENTITY_INSERT [dbo].[orderDetails] ON 

INSERT [dbo].[orderDetails] ([idDetail], [idOrder], [product], [quantity], [price]) VALUES (1, 1, 1, 2, CAST(2.50 AS Decimal(8, 2)))
INSERT [dbo].[orderDetails] ([idDetail], [idOrder], [product], [quantity], [price]) VALUES (2, 1, 2, 5, CAST(2.50 AS Decimal(8, 2)))
INSERT [dbo].[orderDetails] ([idDetail], [idOrder], [product], [quantity], [price]) VALUES (3, 1, 3, 4, CAST(2.50 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[orderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([idOrder], [costumer], [dateRegister]) VALUES (1, 1, CAST(N'2020-12-02' AS Date))
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([idProduct], [productName], [price]) VALUES (1, N'Bread', NULL)
INSERT [dbo].[products] ([idProduct], [productName], [price]) VALUES (2, N'Milk', NULL)
INSERT [dbo].[products] ([idProduct], [productName], [price]) VALUES (3, N'Juice', NULL)
INSERT [dbo].[products] ([idProduct], [productName], [price]) VALUES (4, N'ball', NULL)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD FOREIGN KEY([idOrder])
REFERENCES [dbo].[orders] ([idOrder])
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD FOREIGN KEY([product])
REFERENCES [dbo].[products] ([idProduct])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([costumer])
REFERENCES [dbo].[costumers] ([idCostumer])
GO
USE [master]
GO
ALTER DATABASE [store] SET  READ_WRITE 
GO
