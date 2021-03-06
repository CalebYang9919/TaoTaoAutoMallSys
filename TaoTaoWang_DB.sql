USE [master]
GO
/****** Object:  Database [taotaowang]    Script Date: 2021/4/2 星期五 23:45:23 ******/
CREATE DATABASE [taotaowang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'taotaowang', FILENAME = N'E:\淘淘网最终版\taotaowang.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'taotaowang_log', FILENAME = N'E:\淘淘网最终版\taotaowang_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [taotaowang] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [taotaowang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [taotaowang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [taotaowang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [taotaowang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [taotaowang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [taotaowang] SET ARITHABORT OFF 
GO
ALTER DATABASE [taotaowang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [taotaowang] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [taotaowang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [taotaowang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [taotaowang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [taotaowang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [taotaowang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [taotaowang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [taotaowang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [taotaowang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [taotaowang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [taotaowang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [taotaowang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [taotaowang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [taotaowang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [taotaowang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [taotaowang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [taotaowang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [taotaowang] SET RECOVERY FULL 
GO
ALTER DATABASE [taotaowang] SET  MULTI_USER 
GO
ALTER DATABASE [taotaowang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [taotaowang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [taotaowang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [taotaowang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [taotaowang]
GO
/****** Object:  Table [dbo].[advertisings]    Script Date: 2021/4/2 星期五 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advertisings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[urls] [nvarchar](50) NOT NULL,
	[classid] [int] NULL,
	[shows] [int] NOT NULL,
 CONSTRAINT [PK_advertisings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 2021/4/2 星期五 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[productid] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comments]    Script Date: 2021/4/2 星期五 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[contents] [text] NULL,
	[audit] [int] NULL,
	[stars] [int] NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contect]    Script Date: 2021/4/2 星期五 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contect](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[mobile] [nvarchar](50) NULL,
	[contact_flag] [int] NULL,
	[province] [nvarchar](300) NULL,
	[city] [nvarchar](50) NULL,
	[area] [nvarchar](50) NULL,
	[town] [nvarchar](50) NULL,
	[address] [nvarchar](100) NULL,
 CONSTRAINT [PK_contect] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderinfo]    Script Date: 2021/4/2 星期五 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderinfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [nvarchar](300) NULL,
	[productid] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_orderinfo_2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 2021/4/2 星期五 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [nvarchar](300) NULL,
	[userid] [int] NULL,
	[contectid] [int] NULL,
	[time] [datetime] NULL,
	[ordertype] [nvarchar](50) NULL,
 CONSTRAINT [PK_orderinfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 2021/4/2 星期五 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(101,1) NOT NULL,
	[productname] [nvarchar](50) NULL,
	[classid] [int] NULL,
	[productprice] [float] NULL,
	[quantity] [int] NULL,
	[hot] [int] NULL,
	[productpic] [nvarchar](50) NULL,
	[addtime] [datetime] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[productlist]    Script Date: 2021/4/2 星期五 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productlist](
	[classid] [int] IDENTITY(1,1) NOT NULL,
	[classname] [nvarchar](50) NULL,
 CONSTRAINT [PK_product-category] PRIMARY KEY CLUSTERED 
(
	[classid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 2021/4/2 星期五 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1001,1) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[pwd] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[mobile] [nvarchar](50) NOT NULL,
	[user_type] [int] NOT NULL,
	[userimg] [nvarchar](50) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wallets]    Script Date: 2021/4/2 星期五 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wallets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[amount] [int] NOT NULL,
 CONSTRAINT [PK_wallets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wishlist]    Script Date: 2021/4/2 星期五 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wishlist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_wishlist] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF_orders_time]  DEFAULT (getdate()) FOR [time]
GO
USE [master]
GO
ALTER DATABASE [taotaowang] SET  READ_WRITE 
GO
