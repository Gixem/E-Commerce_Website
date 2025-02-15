USE [master]
GO
/****** Object:  Database [EcommerceDB]    Script Date: 14.05.2024 10:57:30 ******/
CREATE DATABASE [EcommerceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EcommerceDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EcommerceDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EcommerceDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EcommerceDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EcommerceDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EcommerceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EcommerceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EcommerceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EcommerceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EcommerceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EcommerceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EcommerceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EcommerceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EcommerceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EcommerceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EcommerceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EcommerceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EcommerceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EcommerceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EcommerceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EcommerceDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EcommerceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EcommerceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EcommerceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EcommerceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EcommerceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EcommerceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EcommerceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EcommerceDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EcommerceDB] SET  MULTI_USER 
GO
ALTER DATABASE [EcommerceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EcommerceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EcommerceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EcommerceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EcommerceDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EcommerceDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EcommerceDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [EcommerceDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EcommerceDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 14.05.2024 10:57:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_id] [int] IDENTITY(1,1) NOT NULL,
	[Admin_name] [nvarchar](50) NULL,
	[Admin_pssw] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 14.05.2024 10:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_id] [int] IDENTITY(1,1) NOT NULL,
	[Category_name] [nvarchar](50) NULL,
	[Category_image] [nvarchar](50) NULL,
	[Category_Desc] [nvarchar](max) NULL,
	[Category_admin_id] [int] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 14.05.2024 10:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[Coupon_id] [int] IDENTITY(1,1) NOT NULL,
	[Coupon_Code] [nvarchar](50) NOT NULL,
	[Discount] [decimal](18, 0) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Admin_id] [int] NOT NULL,
 CONSTRAINT [PK_Coupons] PRIMARY KEY CLUSTERED 
(
	[Coupon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 14.05.2024 10:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Email] [nvarchar](50) NULL,
	[First_name] [nvarchar](50) NULL,
	[Last_name] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory_Table]    Script Date: 14.05.2024 10:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Table](
	[Inventory_id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Inventory_Table] PRIMARY KEY CLUSTERED 
(
	[Inventory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Cart_Table]    Script Date: 14.05.2024 10:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Cart_Table](
	[Order_Cart_id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_id] [int] NOT NULL,
	[Order_Total] [int] NULL,
	[Product_id] [int] NOT NULL,
	[Amount] [int] NULL,
	[size] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order_Cart_Table] PRIMARY KEY CLUSTERED 
(
	[Order_Cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Table]    Script Date: 14.05.2024 10:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Table](
	[Order_id] [int] IDENTITY(1,1) NOT NULL,
	[Order_Cart_id] [int] NOT NULL,
	[Product_id] [int] NOT NULL,
	[Customer_id] [int] NOT NULL,
	[Total] [int] NULL,
	[amount] [int] NULL,
	[Order_date] [datetime] NULL,
	[size] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order_Table] PRIMARY KEY CLUSTERED 
(
	[Order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14.05.2024 10:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Product_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_name] [nvarchar](50) NULL,
	[Product_Desc] [nvarchar](max) NULL,
	[price] [int] NULL,
	[image] [nvarchar](max) NULL,
	[Category_id] [int] NOT NULL,
	[Admin_id] [int] NOT NULL,
	[stock] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 14.05.2024 10:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Review_id] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Rating] [nvarchar](50) NULL,
	[User_id] [int] NOT NULL,
	[Product_id] [int] NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Admin_id], [Admin_name], [Admin_pssw]) VALUES (1, N'Admin', N'admin123')
INSERT [dbo].[Admin] ([Admin_id], [Admin_name], [Admin_pssw]) VALUES (2, N'Levi', N'levi123')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Category_id], [Category_name], [Category_image], [Category_Desc], [Category_admin_id]) VALUES (14, N'Dresses', N'Content/Images/696291348dress.png', N'Long,Silk,Short...Dresses', 1)
INSERT [dbo].[Category] ([Category_id], [Category_name], [Category_image], [Category_Desc], [Category_admin_id]) VALUES (15, N'Skirts', N'Content/Images/1660597862skirt.png', N'Long,Short,Summer...Skirts', 1)
INSERT [dbo].[Category] ([Category_id], [Category_name], [Category_image], [Category_Desc], [Category_admin_id]) VALUES (16, N'Bags', N'Content/Images/1528212918handbag.png', N'Backpack,Handbag,Suitcase...', 1)
INSERT [dbo].[Category] ([Category_id], [Category_name], [Category_image], [Category_Desc], [Category_admin_id]) VALUES (17, N'Jeans', N'Content/Images/407052304jeans.png', N'Skinny,ripped,Mom,Slim Fit,Womens,Men', 1)
INSERT [dbo].[Category] ([Category_id], [Category_name], [Category_image], [Category_Desc], [Category_admin_id]) VALUES (18, N'Shoes', N'Content/Images/884899166sneakers.png', N'Sneakers,Sandals,High Heels,Sports...', 1)
INSERT [dbo].[Category] ([Category_id], [Category_name], [Category_image], [Category_Desc], [Category_admin_id]) VALUES (19, N'Shirts', N'Content/Images/1492443374tshirt.png', N' Crew Neck style,V Neck style,Polo t-shirts...', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Coupons] ON 

INSERT [dbo].[Coupons] ([Coupon_id], [Coupon_Code], [Discount], [IsActive], [Admin_id]) VALUES (1, N'INDIRIM50', CAST(50 AS Decimal(18, 0)), 1, 1)
INSERT [dbo].[Coupons] ([Coupon_id], [Coupon_Code], [Discount], [IsActive], [Admin_id]) VALUES (2, N'INDIRIM5', CAST(5 AS Decimal(18, 0)), 0, 1)
INSERT [dbo].[Coupons] ([Coupon_id], [Coupon_Code], [Discount], [IsActive], [Admin_id]) VALUES (3, N'INDIRIM20', CAST(20 AS Decimal(18, 0)), 1, 1)
INSERT [dbo].[Coupons] ([Coupon_id], [Coupon_Code], [Discount], [IsActive], [Admin_id]) VALUES (4, N'INDIRIM25', CAST(25 AS Decimal(18, 0)), 1, 1)
INSERT [dbo].[Coupons] ([Coupon_id], [Coupon_Code], [Discount], [IsActive], [Admin_id]) VALUES (5, N'BLACKFRIDAY30', CAST(30 AS Decimal(18, 0)), 0, 1)
INSERT [dbo].[Coupons] ([Coupon_id], [Coupon_Code], [Discount], [IsActive], [Admin_id]) VALUES (6, N'SUPER100', CAST(100 AS Decimal(18, 0)), 1, 1)
SET IDENTITY_INSERT [dbo].[Coupons] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Customer_id], [Customer_Email], [First_name], [Last_name], [Password], [Address], [Phone]) VALUES (1, N'cs@hotmail.com', N'User', N'Deneme', N'user123', N'Adana', N'12345678901')
INSERT [dbo].[Customer] ([Customer_id], [Customer_Email], [First_name], [Last_name], [Password], [Address], [Phone]) VALUES (5, N'cs2@hotmail.com', N'User2', N'Last2', N'user1234', N'İstanbul', N'5555555555')
INSERT [dbo].[Customer] ([Customer_id], [Customer_Email], [First_name], [Last_name], [Password], [Address], [Phone]) VALUES (6, N'cs3@hotmail.com', N'User3', N'Last3', N'user3', N'Ankara', N'15151515151')
INSERT [dbo].[Customer] ([Customer_id], [Customer_Email], [First_name], [Last_name], [Password], [Address], [Phone]) VALUES (7, N'cs4@hotmail.com', N'User4', N'Last4', N'user1234', N'İzmir', N'1414141414')
INSERT [dbo].[Customer] ([Customer_id], [Customer_Email], [First_name], [Last_name], [Password], [Address], [Phone]) VALUES (8, N'cs5@hotmail.com', N'User5', N'Last5', N'user5', N'İstanbul', N'4545454545')
INSERT [dbo].[Customer] ([Customer_id], [Customer_Email], [First_name], [Last_name], [Password], [Address], [Phone]) VALUES (11, N'cs6@hotmail.com', N'User6', N'Last6', N'user6', N'İstanbul', N'4545454545')
INSERT [dbo].[Customer] ([Customer_id], [Customer_Email], [First_name], [Last_name], [Password], [Address], [Phone]) VALUES (12, N'cs7@hotmail.com', N'User7', N'Last7', N'user7', N'İstanbul', N'5326598427')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Cart_Table] ON 

INSERT [dbo].[Order_Cart_Table] ([Order_Cart_id], [Customer_id], [Order_Total], [Product_id], [Amount], [size]) VALUES (1, 1, 95, 55, 1, N'Small')
INSERT [dbo].[Order_Cart_Table] ([Order_Cart_id], [Customer_id], [Order_Total], [Product_id], [Amount], [size]) VALUES (2, 1, 87, 61, 1, N'34-30')
SET IDENTITY_INSERT [dbo].[Order_Cart_Table] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Table] ON 

INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (9, 70, 55, 1, 95, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (10, 71, 58, 1, 500, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (11, 70, 55, 1, 95, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (12, 71, 58, 1, 500, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (13, 76, 56, 1, 100, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (14, 77, 60, 1, 399, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (15, 78, 59, 1, 55, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (16, 86, 56, 1, 100, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (17, 93, 68, 1, 1000, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (18, 99, 56, 8, 100, 2, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (19, 100, 59, 8, 55, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (20, 102, 55, 1, 95, 2, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (21, 103, 55, 1, 95, 2, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (22, 104, 56, 1, 100, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (23, 105, 67, 1, 60, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (24, 117, 74, 1, 100, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (25, 117, 74, 1, 100, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (26, 117, 74, 1, 100, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (27, 119, 74, 1, 100, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (28, 121, 74, 1, 100, 1, NULL, NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (29, 122, 74, 1, 100, 1, CAST(N'2023-12-08T22:54:26.143' AS DateTime), NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (30, 136, 68, 1, 1000, 1, CAST(N'2023-12-10T15:04:37.190' AS DateTime), NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (31, 137, 66, 1, 35, 1, CAST(N'2023-12-10T15:09:48.543' AS DateTime), NULL)
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (32, 138, 55, 1, 95, 1, CAST(N'2023-12-10T15:26:28.477' AS DateTime), N'Medium')
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (33, 139, 56, 1, 100, 1, CAST(N'2023-12-10T15:34:05.833' AS DateTime), N'Medium')
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (34, 158, 56, 1, 100, 2, CAST(N'2024-01-03T13:32:51.433' AS DateTime), N'small')
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (35, 159, 56, 1, 100, 1, CAST(N'2024-01-03T13:32:51.460' AS DateTime), N'Medium')
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (36, 223, 56, 1, 100, 3, CAST(N'2024-01-12T11:53:26.003' AS DateTime), N'Small')
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (37, 226, 57, 1, 1450, 2, CAST(N'2024-01-12T12:18:44.930' AS DateTime), N'Small')
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (38, 228, 56, 1, 100, 1, CAST(N'2024-01-12T12:29:50.640' AS DateTime), N'Medium')
INSERT [dbo].[Order_Table] ([Order_id], [Order_Cart_id], [Product_id], [Customer_id], [Total], [amount], [Order_date], [size]) VALUES (39, 229, 62, 1, 459, 1, CAST(N'2024-01-12T12:29:50.653' AS DateTime), N'34-30')
SET IDENTITY_INSERT [dbo].[Order_Table] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (55, N'Long Skirt', N'Hot summer yellow long  skirt', 95, N'Content/Images/91029598image3.jpg', 15, 1, 99)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (56, N'Short Skirt', N'Black short skirt for womens', 100, N'Content/Images/2022199834image1.jpg', 15, 1, 92)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (57, N'Silk Dress ', N'Silk evening dress', 1450, N'Content/Images/1278244559image2.jpg', 14, 1, 78)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (58, N'Kanken Backpack', N'Fjallraven Kanken Backpack', 500, N'Content/Images/333164image.jpg', 16, 1, 150)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (59, N'Sweet Handbag', N'Girl pink handbag', 55, N'Content/Images/1546402223image15.jpg', 16, 1, 5)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (60, N'Suitcase ', N'Big pink suitcase for travel', 399, N'Content/Images/1066255523image12.jpg', 16, 1, 100)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (61, N'Men Jeans', N'Ripped men jeans', 87, N'Content/Images/372589843image16.jpg', 17, 1, 100)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (62, N'Butterfly Jeans', N'Butterfly mom jeans', 459, N'Content/Images/1730309507image17.jpg', 17, 1, 199)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (63, N'High Heels Shoes', N'Black High heels shoes', 1500, N'Content/Images/868360253image23.jpg', 18, 1, 150)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (64, N'Nike-Pro Sports', N'Nike sports shoes ', 986, N'Content/Images/989835030image8.jpg', 18, 1, 75)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (65, N'Black Boot', N'Black Long leather Boot', 1360, N'Content/Images/702428051image24.jpg', 18, 1, 25)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (66, N'Butterfly Crop', N'Butterfly  white crop', 35, N'Content/Images/822409199image20.jpeg', 19, 1, 29)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (67, N'Black Patterned Men T-Shirt', N' Brand : Buratti  Model : T-shirt  Season: Spring/Summer  Material : % 100 cotton  Collar info: Polo collar  Model: Weight : 83 kg / Height : 1.90 cm / Chest : 101 cm / Waist : 81 cm ', 60, N'Content/Images/1239574143image21.jpg', 19, 1, 44)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (68, N'White Dress', N'White night dress ', 1000, N'Content/Images/1813743130image6.jpg', 14, 1, 77)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (69, N'Men Shoes', N'Blue men Shoes', 75, N'Content/Images/1216225328image25.jpeg', 18, 1, 55)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (70, N'Black Dress', N'Black Short Dress', 500, N'Content/Images/124750748image26.jpg', 14, 1, 97)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (74, N'dress', N'deneme', 100, N'Content/Images/1440782349image2.jpg', 14, 1, 445)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (75, N'Blue Jeans', N'Blue jeans Levis', 150, N'Content/Images/2059949911image9.jpg', 17, 1, 150)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_Desc], [price], [image], [Category_id], [Admin_id], [stock]) VALUES (77, N'elbise', N'aaaaaa', 500, N'Content/Images/976557966image27.jpg', 14, 1, 450)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([Review_id], [Comment], [Rating], [User_id], [Product_id]) VALUES (1, N'çok güzel maşallah ', N'5', 1, 55)
INSERT [dbo].[Reviews] ([Review_id], [Comment], [Rating], [User_id], [Product_id]) VALUES (2, N'denemeee', N'4', 1, 55)
INSERT [dbo].[Reviews] ([Review_id], [Comment], [Rating], [User_id], [Product_id]) VALUES (3, N'denemee', N'5', 1, 55)
INSERT [dbo].[Reviews] ([Review_id], [Comment], [Rating], [User_id], [Product_id]) VALUES (4, N'denemeee', N'5', 1, 55)
INSERT [dbo].[Reviews] ([Review_id], [Comment], [Rating], [User_id], [Product_id]) VALUES (5, N'denemeee', N'4', 1, 55)
INSERT [dbo].[Reviews] ([Review_id], [Comment], [Rating], [User_id], [Product_id]) VALUES (7, N'bayıldım ', N'5', 1, 56)
INSERT [dbo].[Reviews] ([Review_id], [Comment], [Rating], [User_id], [Product_id]) VALUES (8, N'Kumaşı kalitesiz ama üzerimde güzel durdu ', N'3', 5, 56)
INSERT [dbo].[Reviews] ([Review_id], [Comment], [Rating], [User_id], [Product_id]) VALUES (9, N'Çok kullanışlı, kurtarıcı çanta ', N'5', 5, 58)
INSERT [dbo].[Reviews] ([Review_id], [Comment], [Rating], [User_id], [Product_id]) VALUES (10, N'Yırtıkları fazla yırtık ', N'4', 8, 61)
INSERT [dbo].[Reviews] ([Review_id], [Comment], [Rating], [User_id], [Product_id]) VALUES (11, N'Bir beden büyük almanızı öneririm ben M aldım küçük geldi ', N'3', 8, 57)
INSERT [dbo].[Reviews] ([Review_id], [Comment], [Rating], [User_id], [Product_id]) VALUES (12, N'çok güzel ', N'5', 1, 55)
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupons_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_admin_id] FOREIGN KEY([Category_admin_id])
REFERENCES [dbo].[Admin] ([Admin_id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_admin_id]
GO
ALTER TABLE [dbo].[Coupons]  WITH CHECK ADD  CONSTRAINT [FK_Coupons_AdminID] FOREIGN KEY([Admin_id])
REFERENCES [dbo].[Admin] ([Admin_id])
GO
ALTER TABLE [dbo].[Coupons] CHECK CONSTRAINT [FK_Coupons_AdminID]
GO
ALTER TABLE [dbo].[Order_Cart_Table]  WITH CHECK ADD  CONSTRAINT [FK_Order_Cart_Customer_id] FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Customer] ([Customer_id])
GO
ALTER TABLE [dbo].[Order_Cart_Table] CHECK CONSTRAINT [FK_Order_Cart_Customer_id]
GO
ALTER TABLE [dbo].[Order_Cart_Table]  WITH CHECK ADD  CONSTRAINT [FK_Product_id] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[Order_Cart_Table] CHECK CONSTRAINT [FK_Product_id]
GO
ALTER TABLE [dbo].[Order_Table]  WITH CHECK ADD  CONSTRAINT [FK_Order_Table_Customer_id] FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Customer] ([Customer_id])
GO
ALTER TABLE [dbo].[Order_Table] CHECK CONSTRAINT [FK_Order_Table_Customer_id]
GO
ALTER TABLE [dbo].[Order_Table]  WITH CHECK ADD  CONSTRAINT [FK_Order_Table_Product_id] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[Order_Table] CHECK CONSTRAINT [FK_Order_Table_Product_id]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Admin_id] FOREIGN KEY([Admin_id])
REFERENCES [dbo].[Admin] ([Admin_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Admin_id]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Category_id] FOREIGN KEY([Category_id])
REFERENCES [dbo].[Category] ([Category_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Category_id]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Customer_UserID] FOREIGN KEY([User_id])
REFERENCES [dbo].[Customer] ([Customer_id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Customer_UserID]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductID] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Product_ProductID]
GO
USE [master]
GO
ALTER DATABASE [EcommerceDB] SET  READ_WRITE 
GO
