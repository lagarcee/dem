USE [master]
GO
/****** Object:  Database [user_PB]    Script Date: 22.03.2024 9:21:19 ******/
CREATE DATABASE [user_PB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user_PB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\user_PB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'user_PB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\user_PB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [user_PB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [user_PB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [user_PB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [user_PB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [user_PB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [user_PB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [user_PB] SET ARITHABORT OFF 
GO
ALTER DATABASE [user_PB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [user_PB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [user_PB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [user_PB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [user_PB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [user_PB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [user_PB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [user_PB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [user_PB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [user_PB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [user_PB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [user_PB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [user_PB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [user_PB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [user_PB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [user_PB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [user_PB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [user_PB] SET RECOVERY FULL 
GO
ALTER DATABASE [user_PB] SET  MULTI_USER 
GO
ALTER DATABASE [user_PB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [user_PB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [user_PB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [user_PB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [user_PB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [user_PB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'user_PB', N'ON'
GO
ALTER DATABASE [user_PB] SET QUERY_STORE = OFF
GO
USE [user_PB]
GO
/****** Object:  Table [dbo].[category_product]    Script Date: 22.03.2024 9:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_product](
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_category_product] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 22.03.2024 9:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[sum_order] [money] NULL,
	[payment_id] [int] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 22.03.2024 9:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[payment_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[payment_method] [nvarchar](50) NOT NULL,
	[order_id] [int] NOT NULL,
	[sum_order] [money] NOT NULL,
 CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 22.03.2024 9:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_name] [nvarchar](100) NOT NULL,
	[product_category] [int] NOT NULL,
	[product_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_products1] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 22.03.2024 9:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] NOT NULL,
	[famely_name] [nvarchar](50) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[patronymic] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_products]    Script Date: 22.03.2024 9:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_products](
	[product_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[price] [money] NOT NULL,
	[count] [int] NOT NULL,
	[sum] [money] NOT NULL,
	[order_id] [int] NOT NULL,
 CONSTRAINT [PK_users_products] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_products_i]    Script Date: 22.03.2024 9:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_products_i](
	[product_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[price] [money] NOT NULL,
	[count] [int] NOT NULL,
	[sum] [money] NOT NULL,
	[order_id] [int] NOT NULL,
 CONSTRAINT [PK_users_products_i] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_payment] FOREIGN KEY([payment_id])
REFERENCES [dbo].[payment] ([payment_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_payment]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_products]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_users_products] FOREIGN KEY([order_id])
REFERENCES [dbo].[users_products] ([order_id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_users_products]
GO
ALTER TABLE [dbo].[users_products]  WITH CHECK ADD  CONSTRAINT [FK_users_products_category_product] FOREIGN KEY([category_id])
REFERENCES [dbo].[category_product] ([category_id])
GO
ALTER TABLE [dbo].[users_products] CHECK CONSTRAINT [FK_users_products_category_product]
GO
ALTER TABLE [dbo].[users_products]  WITH CHECK ADD  CONSTRAINT [FK_users_products_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[users_products] CHECK CONSTRAINT [FK_users_products_products]
GO
USE [master]
GO
ALTER DATABASE [user_PB] SET  READ_WRITE 
GO
