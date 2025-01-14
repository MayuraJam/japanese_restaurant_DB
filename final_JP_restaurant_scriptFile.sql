USE [master]
GO
/****** Object:  Database [DB_restaurant]    Script Date: 31-Oct-24 06:11:33 ******/
CREATE DATABASE [DB_restaurant]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_restaurant', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_restaurant.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_restaurant_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_restaurant_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_restaurant] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_restaurant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_restaurant] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_restaurant] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_restaurant] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_restaurant] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_restaurant] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_restaurant] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_restaurant] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_restaurant] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_restaurant] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_restaurant] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_restaurant] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_restaurant] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_restaurant] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_restaurant] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_restaurant] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_restaurant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_restaurant] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_restaurant] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_restaurant] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_restaurant] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_restaurant] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_restaurant] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_restaurant] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_restaurant] SET  MULTI_USER 
GO
ALTER DATABASE [DB_restaurant] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_restaurant] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_restaurant] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_restaurant] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_restaurant] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_restaurant] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_restaurant', N'ON'
GO
ALTER DATABASE [DB_restaurant] SET QUERY_STORE = OFF
GO
USE [DB_restaurant]
GO
/****** Object:  Table [dbo].[Authentication_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authentication_tb](
	[userID] [uniqueidentifier] NOT NULL,
	[email] [nvarchar](30) NULL,
	[password] [nvarchar](20) NULL,
	[roleName] [nvarchar](20) NULL,
 CONSTRAINT [PK_Authentication_tb] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_tb](
	[cartID] [uniqueidentifier] NOT NULL,
	[menuID] [nvarchar](100) NULL,
	[tableID] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[optionValue] [nvarchar](100) NULL,
	[netprice] [decimal](18, 0) NULL,
	[customerID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cart_tb] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_tb](
	[customerID] [nvarchar](50) NOT NULL,
	[customerStatus] [nvarchar](50) NULL,
	[logInDate] [datetime] NULL,
	[logOutDate] [datetime] NULL,
 CONSTRAINT [PK_customer_tb] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member_tb](
	[memberID] [uniqueidentifier] NOT NULL,
	[firstName] [nvarchar](100) NULL,
	[lastName] [nvarchar](100) NULL,
	[phone] [nvarchar](100) NULL,
	[userID] [uniqueidentifier] NULL,
	[email] [nvarchar](30) NULL,
	[password] [nvarchar](20) NULL,
	[roleName] [nvarchar](20) NULL,
	[totalPoint] [decimal](18, 0) NULL,
 CONSTRAINT [PK_member_tb] PRIMARY KEY CLUSTERED 
(
	[memberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menu_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu_tb](
	[menuID] [nvarchar](100) NOT NULL,
	[menuName] [nvarchar](100) NULL,
	[menuDescription] [nvarchar](300) NULL,
	[unitPrice] [decimal](18, 0) NULL,
	[categoryName] [nvarchar](100) NULL,
	[optionID] [nvarchar](50) NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[rating] [float] NULL,
	[imageName] [nvarchar](300) NULL,
	[stockQuantity] [int] NULL,
 CONSTRAINT [PK_menu_tb_1] PRIMARY KEY CLUSTERED 
(
	[menuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_tb](
	[notificationID] [nvarchar](50) NOT NULL,
	[title] [nvarchar](50) NULL,
	[message] [nvarchar](100) NULL,
	[createDate] [datetime] NULL,
	[tableID] [nvarchar](50) NULL,
	[isRead] [nvarchar](20) NULL,
	[sentBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_notification_tb] PRIMARY KEY CLUSTERED 
(
	[notificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[option_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[option_tb](
	[optionID] [nvarchar](50) NOT NULL,
	[optionName] [nvarchar](100) NULL,
	[value] [nvarchar](max) NULL,
 CONSTRAINT [PK_option_tb] PRIMARY KEY CLUSTERED 
(
	[optionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_tb](
	[orderID] [nvarchar](50) NOT NULL,
	[tableID] [nvarchar](50) NULL,
	[staftID] [nvarchar](50) NULL,
	[orderStatus] [nvarchar](100) NULL,
	[orderDate] [datetime] NULL,
	[totalPrice] [decimal](18, 0) NULL,
	[confirmOrder] [nvarchar](50) NULL,
	[paymentStatus] [nvarchar](50) NULL,
	[customerID] [nvarchar](50) NULL,
	[Q] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_order_tb] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetail_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetail_tb](
	[orderID] [nvarchar](50) NULL,
	[menuID] [nvarchar](100) NULL,
	[orderDetailStatus] [nvarchar](100) NULL,
	[quantity] [int] NULL,
	[optionValue] [nvarchar](100) NULL,
	[netprice] [decimal](18, 0) NULL,
	[addReview] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[point_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[point_tb](
	[pointID] [nvarchar](50) NOT NULL,
	[currentPoint] [decimal](18, 0) NULL,
	[description] [nvarchar](400) NULL,
	[createDate] [datetime] NULL,
	[memberID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_point_tb] PRIMARY KEY CLUSTERED 
(
	[pointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[receipt_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receipt_tb](
	[receiptID] [nvarchar](50) NOT NULL,
	[tableID] [nvarchar](50) NULL,
	[paymentStatus] [nvarchar](50) NULL,
	[paymentType] [nvarchar](50) NULL,
	[totalAmount] [decimal](18, 0) NULL,
	[totalTax] [decimal](18, 0) NULL,
	[cash] [decimal](18, 0) NULL,
	[change] [decimal](18, 0) NULL,
	[staffID] [nvarchar](50) NULL,
	[orderID] [nvarchar](50) NULL,
	[netTotalAmount] [decimal](18, 0) NULL,
	[payDatetime] [datetime] NULL,
	[customerID] [nvarchar](50) NULL,
 CONSTRAINT [PK_receipt_tb] PRIMARY KEY CLUSTERED 
(
	[receiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[revenue_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[revenue_tb](
	[revenueID] [nvarchar](50) NOT NULL,
	[createDate] [datetime] NULL,
	[revenueDescritption] [nvarchar](100) NULL,
	[orderID] [nvarchar](50) NULL,
	[totalAmount] [decimal](18, 0) NULL,
	[tax] [decimal](18, 0) NULL,
	[netAmount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_revenue_tb] PRIMARY KEY CLUSTERED 
(
	[revenueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review_tb](
	[reviewID] [nvarchar](50) NOT NULL,
	[rate] [int] NULL,
	[menuID] [nvarchar](100) NULL,
	[isReview] [nvarchar](50) NULL,
	[customerID] [nvarchar](50) NULL,
	[massage] [nvarchar](200) NULL,
 CONSTRAINT [PK_Review_tb] PRIMARY KEY CLUSTERED 
(
	[reviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staft_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staft_tb](
	[staftID] [nvarchar](50) NOT NULL,
	[firstName] [nvarchar](20) NULL,
	[lastName] [nvarchar](20) NULL,
	[phone] [nvarchar](10) NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[userID] [uniqueidentifier] NULL,
	[email] [nvarchar](30) NULL,
	[password] [nvarchar](20) NULL,
	[roleName] [nvarchar](20) NULL,
	[accountStatus] [nvarchar](20) NULL,
	[jobType] [nvarchar](20) NULL,
 CONSTRAINT [PK_staft_tb] PRIMARY KEY CLUSTERED 
(
	[staftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[table_tb]    Script Date: 31-Oct-24 06:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_tb](
	[tableID] [nvarchar](50) NOT NULL,
	[tableStatus] [nvarchar](20) NULL,
	[seat] [int] NULL,
	[seatType] [nvarchar](50) NULL,
	[customerID] [nvarchar](50) NULL,
 CONSTRAINT [PK_table_tb] PRIMARY KEY CLUSTERED 
(
	[tableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Authentication_tb] ([userID], [email], [password], [roleName]) VALUES (N'eb1f3094-c1c6-4c8d-a2c9-0444acbdf806', N'dennapa.t@gmail.com', N'Dennapa@20', N'ลูกค้า')
INSERT [dbo].[Authentication_tb] ([userID], [email], [password], [roleName]) VALUES (N'17dcbe56-27ac-4dac-9116-045f123dfcb1', N'gluta_story@gmail.com', N'glutaDoggo', N'ลูกค้า')
INSERT [dbo].[Authentication_tb] ([userID], [email], [password], [roleName]) VALUES (N'8a3ca411-e89b-42db-8f87-097dd37f0a87', N'maitaka@gmail.com', N'Maitaka@32', N'ลูกค้า')
INSERT [dbo].[Authentication_tb] ([userID], [email], [password], [roleName]) VALUES (N'e9ab8f1e-4215-47c3-b420-64a72a437c23', N'moo_deng@gmail.com', N'moodeng', N'ลูกค้า')
INSERT [dbo].[Authentication_tb] ([userID], [email], [password], [roleName]) VALUES (N'03fd3b94-312d-4aa4-89c6-6f62812c79c6', N'smorn@ku.th', N'smorn3434', N'พนักงาน')
INSERT [dbo].[Authentication_tb] ([userID], [email], [password], [roleName]) VALUES (N'7548b33f-5b75-4d2f-9017-6ff0b9d0b536', N'nobiTa@gmail.com', N'Nobita@364', N'ลูกค้า')
INSERT [dbo].[Authentication_tb] ([userID], [email], [password], [roleName]) VALUES (N'1757dd49-9e48-4c9f-9f49-752ee5f57a57', N'gluta_story@gmail.com', N'glutaDoggo', N'ลูกค้า')
INSERT [dbo].[Authentication_tb] ([userID], [email], [password], [roleName]) VALUES (N'9107f703-4bf0-4a92-ae1b-8e5aeb17f56b', N'mayurin@gmail.com', N'mayurin@22', N'พนักงาน')
INSERT [dbo].[Authentication_tb] ([userID], [email], [password], [roleName]) VALUES (N'71374046-11e6-4562-8fce-9cd837aec65b', N'mai.tanaka@gmail.com', N'maiTanaka@#123', N'ลูกค้า')
INSERT [dbo].[Authentication_tb] ([userID], [email], [password], [roleName]) VALUES (N'6beecbb8-c0c8-47d9-8080-d3c0fc2d3a81', N'dennapa.t@gmail.com', N'Dennapa@21', N'พนักงาน')
INSERT [dbo].[Authentication_tb] ([userID], [email], [password], [roleName]) VALUES (N'e084c57b-8e75-4a73-ba9a-d43a9f6ae937', N'Malika@gmail.com', N'MaliCa@64', N'ลูกค้า')
INSERT [dbo].[Authentication_tb] ([userID], [email], [password], [roleName]) VALUES (N'1a476ad0-409a-48f6-89db-f2015e4714c2', N'smorn@ku.th', N'smorn1234', N'ลูกค้า')
GO
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS000001', N'กำลังดำเนินรายการ', CAST(N'2024-09-19T16:11:42.030' AS DateTime), CAST(N'2024-09-19T16:11:42.030' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS000002', N'กำลังดำเนินรายการ', CAST(N'2024-09-19T16:11:42.030' AS DateTime), CAST(N'2024-09-19T16:11:42.030' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS000003', N'กำลังดำเนินรายการ', CAST(N'2024-09-19T16:11:42.030' AS DateTime), CAST(N'2024-09-19T16:11:42.030' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS000004', N'กำลังดำเนินรายการ', CAST(N'2024-09-19T16:11:42.030' AS DateTime), CAST(N'2024-09-19T16:11:42.030' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS123384', N'ออกจากระบบแล้ว', CAST(N'2024-10-16T13:06:10.617' AS DateTime), CAST(N'2024-10-16T13:43:51.380' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS197203', N'ออกจากระบบแล้ว', CAST(N'2024-10-15T22:47:41.187' AS DateTime), CAST(N'2024-10-15T22:47:48.810' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS238588', N'ออกจากระบบแล้ว', CAST(N'2024-10-20T17:00:38.953' AS DateTime), CAST(N'2024-10-20T17:45:50.040' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS25934', N'ออกจากระบบแล้ว', CAST(N'2024-10-15T20:58:36.733' AS DateTime), CAST(N'2024-10-15T20:58:36.747' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS269252', N'ออกจากระบบแล้ว', CAST(N'2024-10-18T05:17:14.740' AS DateTime), CAST(N'2024-10-18T10:11:45.310' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS304126', N'ออกจากระบบแล้ว', CAST(N'2024-10-15T21:29:38.730' AS DateTime), CAST(N'2024-10-15T22:43:51.940' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS321413', N'ออกจากระบบแล้ว', CAST(N'2024-10-15T22:53:27.870' AS DateTime), CAST(N'2024-10-15T22:59:27.197' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS324753', N'ออกจากระบบแล้ว', CAST(N'2024-10-25T03:48:36.053' AS DateTime), CAST(N'2024-10-25T04:39:25.453' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS357618', N'ออกจากระบบแล้ว', CAST(N'2024-10-29T02:03:11.330' AS DateTime), CAST(N'2024-10-29T04:19:31.220' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS518021', N'ออกจากระบบแล้ว', CAST(N'2024-10-25T06:55:32.153' AS DateTime), CAST(N'2024-10-25T06:58:34.717' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS524185', N'ออกจากระบบแล้ว', CAST(N'2024-10-15T20:28:26.763' AS DateTime), CAST(N'2024-10-15T20:30:14.710' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS563481', N'ออกจากระบบแล้ว', CAST(N'2024-10-16T10:38:21.087' AS DateTime), CAST(N'2024-10-16T10:47:16.817' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS702933', N'ออกจากระบบแล้ว', CAST(N'2024-10-15T22:45:51.813' AS DateTime), CAST(N'2024-10-15T22:47:22.573' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS769099', N'ออกจากระบบแล้ว', CAST(N'2024-10-20T15:51:49.057' AS DateTime), CAST(N'2024-10-20T16:35:26.453' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS876844', N'ออกจากระบบแล้ว', CAST(N'2024-10-15T20:49:03.613' AS DateTime), CAST(N'2024-10-15T20:49:03.613' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS943738', N'ออกจากระบบแล้ว', CAST(N'2024-10-18T10:16:02.613' AS DateTime), CAST(N'2024-10-18T10:18:13.373' AS DateTime))
INSERT [dbo].[customer_tb] ([customerID], [customerStatus], [logInDate], [logOutDate]) VALUES (N'CUS989538', N'ออกจากระบบแล้ว', CAST(N'2024-10-15T22:47:51.943' AS DateTime), CAST(N'2024-10-15T22:53:24.817' AS DateTime))
GO
INSERT [dbo].[member_tb] ([memberID], [firstName], [lastName], [phone], [userID], [email], [password], [roleName], [totalPoint]) VALUES (N'75103b10-1d96-4438-9af0-440e6aff21e2', N'Mai ', N'tanaka', N'0987876542', N'71374046-11e6-4562-8fce-9cd837aec65b', N'mai.tanaka@gmail.com', N'maiTanaka@#123', N'ลูกค้า', CAST(480 AS Decimal(18, 0)))
INSERT [dbo].[member_tb] ([memberID], [firstName], [lastName], [phone], [userID], [email], [password], [roleName], [totalPoint]) VALUES (N'49e5d90a-abe8-45e8-9227-bf035832287a', N'มะลิกา', N'ทองมะลิ', N'0986754567', N'e084c57b-8e75-4a73-ba9a-d43a9f6ae937', N'Malika@gmail.com', N'MaliCa@64', N'ลูกค้า', CAST(207 AS Decimal(18, 0)))
INSERT [dbo].[member_tb] ([memberID], [firstName], [lastName], [phone], [userID], [email], [password], [roleName], [totalPoint]) VALUES (N'45042483-3c9e-43e8-b3eb-df03598cc654', N'เด่นนภา', N'ทองเอม', N'0945342356', N'eb1f3094-c1c6-4c8d-a2c9-0444acbdf806', N'dennapa.t@gmail.com', N'Dennapa@20', N'ลูกค้า', CAST(195 AS Decimal(18, 0)))
INSERT [dbo].[member_tb] ([memberID], [firstName], [lastName], [phone], [userID], [email], [password], [roleName], [totalPoint]) VALUES (N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f', N'สมร', N'คุง', N'0987676543', N'1a476ad0-409a-48f6-89db-f2015e4714c2', N'smorn@ku.th', N'smorn1234', N'ลูกค้า', CAST(115 AS Decimal(18, 0)))
INSERT [dbo].[member_tb] ([memberID], [firstName], [lastName], [phone], [userID], [email], [password], [roleName], [totalPoint]) VALUES (N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4', N'moo', N'deng', N'0987675434', N'e9ab8f1e-4215-47c3-b420-64a72a437c23', N'moo_deng@gmail.com', N'moodeng', N'ลูกค้า', CAST(702 AS Decimal(18, 0)))
GO
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M00001', N'ข้าวไก่ราดซอส', N'ข้าวไก่ราดซอสญี่ปุ่นเป็นอาหารจานเดียวที่ได้รับความนิยม ซึ่งมีส่วนประกอบหลักคือข้าวสวยและไก่ทอดหรือย่าง ที่ราดด้วยซอสสไตล์ญี่ปุ่น ซอสนี้มักจะมีรสชาติหวาน เค็ม และหอมกลิ่นโชยุ (ซีอิ๊วญี่ปุ่น) ', CAST(100 AS Decimal(18, 0)), N'เมนูข้าว', NULL, CAST(N'2024-09-05T00:27:48.400' AS DateTime), CAST(N'2024-10-01T12:32:16.450' AS DateTime), 3.7142857142857144, N'16aba539-bbd5-472d-bd14-31ab4227c4ec_food.jpg', 62)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M00002', N'ทงคตสึราเมง', N'หนึ่งในประเภทของราเมงที่มีเอกลักษณ์และเป็นที่นิยมอย่างมากในญี่ปุ่น โดยมีจุดเด่นที่น้ำซุปข้นที่ทำจากกระดูกหมูต้มนานหลายชั่วโมงจนกลายเป็นซุปที่มีรสชาติกลมกล่อมและเข้มข้น', CAST(97 AS Decimal(18, 0)), N'เมนูเส้น', N'OP00004', CAST(N'2024-09-11T11:54:42.257' AS DateTime), CAST(N'2024-09-11T11:54:42.257' AS DateTime), 4, N'11586b33-f638-4bb1-8f5d-f68e88b537bb_Tonkotsu_Ramen.png', 32)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M00004', N'ชาเขียว', N'เป็นเครื่องดื่มยอดนิยมที่มีต้นกำเนิดจากประเทศจีนและญี่ปุ่น และได้รับความนิยมแพร่หลายไปทั่วโลก เนื่องจากมีประโยชน์ต่อสุขภาพและรสชาติที่สดชื่น อีกทั้งชาเขียวเป็นเครื่องดื่มที่ได้รับความนิยมไม่เพียงแต่ในด้านรสชาติ แต่ยังเป็นทางเลือกที่ดีต่อสุขภาพ', CAST(15 AS Decimal(18, 0)), N'เครื่องดื่มชา', NULL, CAST(N'2024-09-05T00:07:24.580' AS DateTime), CAST(N'2024-10-14T12:25:18.350' AS DateTime), 0, N'a3ff723e-7509-4830-91ec-1cd0b4111bb4_23d7159c86112d8a5c2f53ab7aa3acb1.jpg', 35)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M10259', N'โฮตาเตะ ซาซิมิ', N'โฮตาเตะ ซาซิมิ', CAST(400 AS Decimal(18, 0)), N'เมนูอาหารทะเล', N'OP13507', CAST(N'2024-10-03T10:26:09.790' AS DateTime), CAST(N'2024-10-03T10:26:09.790' AS DateTime), 0, N'46ede311-2d99-4607-8097-4f956e3d7ebb_hotate-sashimi.jpg', 39)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M10795', N'คุชิคาซึ', N'คุชิคาซึ', CAST(30 AS Decimal(18, 0)), N'เมนูทานเล่น', NULL, CAST(N'2024-10-03T10:38:00.723' AS DateTime), CAST(N'2024-10-03T10:38:00.723' AS DateTime), 4, N'87424f64-4407-4e7d-a614-8fc6494677ee_kushikatsu.jpg', 97)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M12330', N' ฮิยะยาโกะ (เต้าหู้เย็น)', N' ฮิยะยาโกะ (เต้าหู้เย็น)
', CAST(100 AS Decimal(18, 0)), N'เมนูทานเล่น', NULL, CAST(N'2024-10-03T12:08:43.310' AS DateTime), CAST(N'2024-10-03T12:08:43.310' AS DateTime), 4.666666666666667, N'03e7cc9e-e48e-4451-8542-dc79f0d986b4_hiyayakko.jpg', 86)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M12493', N'Orion The Draft Beer 500ml', N'Orion The Draft Beer 500ml', CAST(120 AS Decimal(18, 0)), N'เครื่องดื่มแอลกอฮอร์', N'OP00001', CAST(N'2024-10-03T14:14:35.687' AS DateTime), CAST(N'2024-10-03T14:14:35.687' AS DateTime), 4, N'053ad8c2-36d7-4a0a-9c7e-a49ffd6b5658_OrionTheDraftBeer500ml.jpg', 99)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M14393', N'แซลม่อนย่างเกลือ', N'แซลม่อนย่างเกลือ', CAST(100 AS Decimal(18, 0)), N'เมนูอาหารทะเล', NULL, CAST(N'2024-10-03T09:47:40.917' AS DateTime), CAST(N'2024-10-03T09:47:40.917' AS DateTime), 0, N'c0ff4efd-2c81-4293-9ae6-2b915d8268d8_Teriyaki-Salmon.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M14587', N'เทมปุระโซเมง', N'เทมปุระโซเมง', CAST(175 AS Decimal(18, 0)), N'เมนูเส้น', NULL, CAST(N'2024-10-03T08:39:34.847' AS DateTime), CAST(N'2024-10-03T08:39:34.847' AS DateTime), 0, N'ddedea1d-8ae7-4ba6-89eb-405309782f90_Tempura-Somen.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M15580', N'ทสึเคเมง', N'ทสึเคเมง', CAST(175 AS Decimal(18, 0)), N'เมนูเส้น', N'OP00003', CAST(N'2024-10-03T08:57:16.393' AS DateTime), CAST(N'2024-10-03T08:57:16.393' AS DateTime), 4.5, N'd6ae8494-80ff-4b61-ac27-931eae919e96_tsukemen-ramen-noodles.jpg', 96)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M1673', N'ปลาซาบะย่างเกลือ', N'เป็นเมนูอาหารญี่ปุ่นยอดนิยมที่ใช้ปลาซาบะ (หรือที่เรียกว่าปลาแมคเคอเรล) ซึ่งมีรสชาติที่เข้มข้นและเนื้อปลาที่มีความมัน ปรุงรสอย่างง่ายดายด้วยเกลือ และนำไปย่างจนหนังปลากรอบและหอม', CAST(60 AS Decimal(18, 0)), N'เมนูอาหารทะเล', NULL, CAST(N'2024-09-16T16:35:41.960' AS DateTime), CAST(N'2024-10-27T10:15:42.967' AS DateTime), 0, N'1b3cfadb-04ac-42ae-b781-63b8717a44cd_sabaFood.jpg', 59)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M17056', N'เกี๊ยวซ่า', N'เกี๊ยวซ่า', CAST(60 AS Decimal(18, 0)), N'เมนูทานเล่น', NULL, CAST(N'2024-10-03T11:38:40.543' AS DateTime), CAST(N'2024-10-03T11:38:40.543' AS DateTime), 0, N'1e769bf0-4df2-4451-8273-5ba1c0f1ee22_Gyuza.jpg', 99)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M18406', N'ยากิโซบะ', N'ยากิโซบะ
', CAST(149 AS Decimal(18, 0)), N'เมนูเส้น', N'OP00003', CAST(N'2024-10-03T08:50:50.827' AS DateTime), CAST(N'2024-10-03T08:50:50.827' AS DateTime), 0, N'33484ae9-34f3-4efb-b0ae-75a4127422bf_k_Edit_2023-01-Yakisoba_yakisoba-3.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M19059', N'ข้าวราดแกงกะหรี่ทงคัตสึทอด', N'เป็นเมนูอาหารญี่ปุ่นที่ประกอบด้วยข้าวสวยร้อนๆ ราดด้วยซอสแกงกะหรี่ที่มีรสชาติหอมหวานและเผ็ดเล็กน้อย เสิร์ฟพร้อมกับ ทงคัตสึ ซึ่งเป็นหมูชุบเกล็ดขนมปังทอดกรอบจนสุกได้ที่ ทำให้ได้เนื้อหมูที่นุ่มภายในและกรอบนอก', CAST(150 AS Decimal(18, 0)), N'เมนูข้าว', N'OP00002', CAST(N'2024-10-01T07:41:22.713' AS DateTime), CAST(N'2024-10-03T03:15:17.350' AS DateTime), 4.75, N'dbd00ff0-03d2-448c-987f-91d4c324a737_568ef32bb28815f8183143eef4adcfa3.jpg', 92)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M20514', N'แซลมอน ซาซิมิ', N'แซลมอน ซาซิมิ', CAST(60 AS Decimal(18, 0)), N'เมนูอาหารทะเล', N'OP13507', CAST(N'2024-10-03T10:14:56.207' AS DateTime), CAST(N'2024-10-03T10:14:56.207' AS DateTime), 0, N'64e383db-4e1e-4696-9285-a51691f420f2_salmonSashimi.jpg', 99)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M21296', N'น้ำอัดลม', N'น้ำอัดลม', CAST(20 AS Decimal(18, 0)), N'เครื่องดื่มทั่วไป', N'OP00001', CAST(N'2024-10-03T14:01:39.803' AS DateTime), CAST(N'2024-10-03T14:01:39.803' AS DateTime), 0, N'e1d43f8a-7f35-496d-a3fe-dbe4879b2a27_Coke_can_325ml.jpg', 99)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M22942', N'Houjicha', N'Houjicha', CAST(55 AS Decimal(18, 0)), N'เครื่องดื่มชา', NULL, CAST(N'2024-10-03T14:55:02.130' AS DateTime), CAST(N'2024-10-03T14:55:02.130' AS DateTime), 0, N'9a7e0b70-351c-4faa-9cf8-9e4102dea623_houjicha.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M23069', N'Tiger beer 330ml', N'Tiger beer 330ml', CAST(110 AS Decimal(18, 0)), N'เครื่องดื่มแอลกอฮอร์', N'OP00001', CAST(N'2024-10-03T14:39:09.997' AS DateTime), CAST(N'2024-10-03T14:39:09.997' AS DateTime), 0, N'863f2263-edd0-44a3-81f7-39d7c4782d54_tiger-330-ml.png', 96)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M23169', N'เซตเทมปุระรวม', N'เมนูสำหรับคนรักเทมปุระ', CAST(100 AS Decimal(18, 0)), N'เมนูเซต', NULL, CAST(N'2024-10-03T02:12:45.720' AS DateTime), CAST(N'2024-10-03T02:12:45.720' AS DateTime), 4.25, N'93077dae-7197-4854-bfb3-b7536e1f6280_setTempura.jpg', 94)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M24486', N'Yebisu Premium All Malt Beer', N'Yebisu Premium All Malt Beer', CAST(160 AS Decimal(18, 0)), N'เครื่องดื่มแอลกอฮอร์', N'OP00001', CAST(N'2024-10-03T14:15:29.220' AS DateTime), CAST(N'2024-10-03T14:15:29.220' AS DateTime), 0, N'e1d566ff-b2e0-462c-aec5-6d2b06635b8c_yebisu-premium-all-malt-beer.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M26367', N'ข้าวหน้าสเต็กเนื้อ', N'ข้าวหน้าสเต็กเนื้อ', CAST(150 AS Decimal(18, 0)), N'เมนูข้าว', NULL, CAST(N'2024-10-03T09:40:55.523' AS DateTime), CAST(N'2024-10-03T09:40:55.523' AS DateTime), 0, N'5d475b77-43f3-4ead-9e31-9ec81fba88d1_stackBeefRice.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M26542', N'พุดดิ้ง', N'พุดดิ้ง', CAST(40 AS Decimal(18, 0)), N'เมนูของหวาน', NULL, CAST(N'2024-10-03T12:21:43.850' AS DateTime), CAST(N'2024-10-03T12:21:43.850' AS DateTime), 4.4, N'b9719c17-a847-4f70-8d7d-bbd32a23c6f1_JPPudding.jpg', 44)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M27127', N'เค้กโรลชาเขียว', N'เค้กโรลชาเขียว', CAST(50 AS Decimal(18, 0)), N'เมนูของหวาน', NULL, CAST(N'2024-10-03T12:15:40.857' AS DateTime), CAST(N'2024-10-03T12:15:40.857' AS DateTime), 0, N'7965010e-5b6f-4f26-b84d-26c4a72df8c3_matcharollcake.jpg', 50)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M27553', N'มะนาวโซดา', N'มะนาวโซดา', CAST(50 AS Decimal(18, 0)), N'เครื่องดื่มทั่วไป', N'OP00001', CAST(N'2024-10-03T14:07:00.043' AS DateTime), CAST(N'2024-10-03T14:07:00.043' AS DateTime), 0, N'2e881e21-7f12-4591-a9f6-ec0d1a2d6849_lemon-soda.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M28327', N'Singha lager beer', N'Singha lager beer', CAST(50 AS Decimal(18, 0)), N'เครื่องดื่มแอลกอฮอร์', N'OP00001', CAST(N'2024-10-03T14:51:21.717' AS DateTime), CAST(N'2024-10-03T14:51:21.717' AS DateTime), 0, N'9092f74f-cc99-41b3-9308-d410dc80acba_singBeer320ml.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M31699', N'sencha', N'sencha
', CAST(60 AS Decimal(18, 0)), N'เครื่องดื่มชา', NULL, CAST(N'2024-10-03T14:56:54.307' AS DateTime), CAST(N'2024-10-03T14:56:54.307' AS DateTime), 0, N'9f17fd95-ea15-4fd8-be09-b1dfb511c7c6_sencha.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M31751', N'ขนมปังสปาเก็ตตี๋', N'ขนมปังสปาเก็ตตี๋', CAST(60 AS Decimal(18, 0)), N'เมนูทานเล่น', NULL, CAST(N'2024-10-03T11:37:30.060' AS DateTime), CAST(N'2024-10-03T11:37:30.060' AS DateTime), 0, N'20d438de-f24b-4eef-98aa-ef1b4242ec2f_spaghettiBun.jpg', 99)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M32986', N'โซเมง', N'โซเมง', CAST(175 AS Decimal(18, 0)), N'เมนูเส้น', NULL, CAST(N'2024-10-03T08:38:15.590' AS DateTime), CAST(N'2024-10-03T08:38:15.590' AS DateTime), 0, N'1bc761a0-ff02-4caa-ad9f-3c9a36e1f9cc_somen.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M33153', N'แซลมอนและทูน่า ซาซิมิ', N'แซลมอนและทูน่าซาซิมิ', CAST(299 AS Decimal(18, 0)), N'เมนูอาหารทะเล', N'OP13507', CAST(N'2024-10-03T10:15:38.223' AS DateTime), CAST(N'2024-10-03T10:17:51.357' AS DateTime), 4.5, N'b8e0a2a6-8090-4d17-b3b7-19980b84b0f4_salmonAndTunaSashimi.jpg', 96)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M36322', N'Asahi Super Dry 330ml can', N'Asahi Super Dry 330ml can', CAST(50 AS Decimal(18, 0)), N'เครื่องดื่มแอลกอฮอร์', N'OP00001', CAST(N'2024-10-03T14:10:06.133' AS DateTime), CAST(N'2024-10-03T14:10:06.133' AS DateTime), 0, N'c20cc785-27b6-4ed7-9bde-96f0ee60585c_Asahi-330ml-Can.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M37476', N'ข้าวหน้าเนื้อ', N'ข้าวหน้าเนื้อ', CAST(120 AS Decimal(18, 0)), N'เมนูข้าว', NULL, CAST(N'2024-10-03T09:27:53.793' AS DateTime), CAST(N'2024-10-03T09:27:53.793' AS DateTime), 0, N'7b36ab10-473d-4758-a4f0-24c1b8bc92aa_BeefRice.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M39712', N'อุด้งเย็น', N'อุด้งเย็น', CAST(100 AS Decimal(18, 0)), N'เมนูเส้น', NULL, CAST(N'2024-10-03T08:33:10.970' AS DateTime), CAST(N'2024-10-03T08:33:10.970' AS DateTime), 0, N'1b5d8bd5-2978-4163-8caa-b9a0d0285ac0_UdonCool.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M39841', N'โยกังถั่วแดง', N'โยกังถั่วแดง', CAST(50 AS Decimal(18, 0)), N'เมนูของหวาน', NULL, CAST(N'2024-10-03T12:18:43.623' AS DateTime), CAST(N'2024-10-03T12:18:43.623' AS DateTime), 3.5, N'720e78fd-d6be-42b6-8c57-72d8deb84265_Yokan.jpg', 47)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M40879', N'ไก่คาราเกะ', N'ไก่คาราเกะ', CAST(50 AS Decimal(18, 0)), N'เมนูทานเล่น', NULL, CAST(N'2024-10-03T11:39:29.387' AS DateTime), CAST(N'2024-10-03T11:39:29.387' AS DateTime), 0, N'554a958e-4252-4aff-a7b6-01452e50febc_karake.jpg', 98)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M44966', N'ข้าวหน้าแฮมเบิร์ก ไข่ดาว', N'ข้าวหน้าแฮมเบิร์ก ไข่ดาว
', CAST(120 AS Decimal(18, 0)), N'เมนูข้าว', N'OP25015', CAST(N'2024-10-03T09:29:13.637' AS DateTime), CAST(N'2024-10-03T09:29:13.637' AS DateTime), 0, N'ae560758-17fc-45ca-9b66-d2213c2ad786_HamburgRice.png', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M45128', N'Matcha', N'Matcha
', CAST(40 AS Decimal(18, 0)), N'เครื่องดื่มชา', NULL, CAST(N'2024-10-03T14:54:20.760' AS DateTime), CAST(N'2024-10-03T14:54:20.760' AS DateTime), 0, N'3ef52e46-dbb2-407b-bdfa-b5b041362a0a_MatchaTea.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M45480', N'ขนมปังยากิโซบะ', N'ขนมปังยากิโซบะ', CAST(60 AS Decimal(18, 0)), N'เมนูทานเล่น', NULL, CAST(N'2024-10-03T11:36:50.937' AS DateTime), CAST(N'2024-10-03T11:36:50.937' AS DateTime), 4.25, N'd82f4cb0-246a-493c-8afd-c83237f9b7a2_yakisobapan.jpg', 93)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M47112', N'ไทยากิ', N'ไทยากิ', CAST(40 AS Decimal(18, 0)), N'เมนูของหวาน', NULL, CAST(N'2024-10-03T12:26:46.473' AS DateTime), CAST(N'2024-10-03T12:26:46.473' AS DateTime), 0, N'7f084afc-fc96-482f-be42-18398b6810db_taiyaki.jpg', 48)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M4714', N'ข้าวหน้าไก่และไข่', N'ข้าวหน้าไก่และไข่', CAST(130 AS Decimal(18, 0)), N'เมนูข้าว', NULL, CAST(N'2024-10-03T09:41:58.303' AS DateTime), CAST(N'2024-10-03T09:41:58.303' AS DateTime), 0, N'5c46eb24-328e-43df-8ec9-14153e69c6f6_ChickAndEggRice.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M489', N'อุด้งเทมปุระ', N'อุด้งเทมปุระ
', CAST(160 AS Decimal(18, 0)), N'เมนูเส้น', NULL, CAST(N'2024-10-03T08:46:50.273' AS DateTime), CAST(N'2024-10-03T08:46:50.273' AS DateTime), 0, N'3a6be5ff-4baa-41cb-b61e-61a5e1e06d9c_tempura-udon.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M51014', N'พาเฟ่ร์ชาเขียว', N'พาเฟ่ร์ชาเขียว', CAST(60 AS Decimal(18, 0)), N'เมนูของหวาน', NULL, CAST(N'2024-10-03T12:24:04.347' AS DateTime), CAST(N'2024-10-03T12:24:04.347' AS DateTime), 0, N'd0ddfda6-0842-4098-926d-d5df62e0532a_parfeiMatcha.jpg', 49)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M52155', N'เซมเบ้', N'เซมเบ้', CAST(30 AS Decimal(18, 0)), N'เมนูทานเล่น', NULL, CAST(N'2024-10-03T12:26:09.547' AS DateTime), CAST(N'2024-10-03T12:26:09.547' AS DateTime), 0, N'8af2150a-642d-4c8f-b36d-dd2791cacc82_senbei.jpg', 99)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M53413', N'เทมปุระ', N'เทมปุระ', CAST(50 AS Decimal(18, 0)), N'เมนูทานเล่น', NULL, CAST(N'2024-10-03T12:07:39.043' AS DateTime), CAST(N'2024-10-03T12:07:39.043' AS DateTime), 0, N'cb5d55fe-d318-4ee5-ade1-6964c9b14ffe_tempura2.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M54163', N'โซบะเย็น', N'โซบะเย็น', CAST(100 AS Decimal(18, 0)), N'เมนูเส้น', N'OP00003', CAST(N'2024-10-03T08:32:33.380' AS DateTime), CAST(N'2024-10-03T08:32:33.380' AS DateTime), 0, N'3af200d2-5b81-42b3-a690-109cda46c4fd_Zaru-Soba.jpg', 98)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M5444', N'คุรุเมะ ราเมง', N'คุรุเมะ ราเมง', CAST(120 AS Decimal(18, 0)), N'เมนูเส้น', N'OP00003', CAST(N'2024-10-03T08:58:01.870' AS DateTime), CAST(N'2024-10-03T08:58:01.870' AS DateTime), 0, N'55658a3b-00f5-450f-909e-f801d429981b_kurume-ramen.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M54639', N'ข้าวหน้าทูน่าเบิร์นไฟ', N'ข้าวหน้าทูน่าเบิร์นไฟ', CAST(130 AS Decimal(18, 0)), N'เมนูข้าว', NULL, CAST(N'2024-10-03T09:37:25.757' AS DateTime), CAST(N'2024-10-03T09:37:25.757' AS DateTime), 0, N'dfcaa8db-2469-4d1c-95d2-e6f08ac4fbe2_TunaBernRice.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M55785', N'Kirin Ichiban (กระป๋อง)', N'Kirin Ichiban (กระป๋อง)', CAST(110 AS Decimal(18, 0)), N'เครื่องดื่มแอลกอฮอร์', N'OP00001', CAST(N'2024-10-03T14:12:52.163' AS DateTime), CAST(N'2024-10-03T14:12:52.163' AS DateTime), 0, N'5a137b8b-4450-4601-98e2-6249281078fe_KirinIchibanCan.jpg', 98)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M56237', N'เนกิโรโตะ ซูชิ', N'เนกิโรโตะ ซูชิ', CAST(200 AS Decimal(18, 0)), N'เมนูทานเล่น', N'OP13507', CAST(N'2024-10-03T10:36:27.780' AS DateTime), CAST(N'2024-10-03T10:36:27.780' AS DateTime), 0, N'e3487a4c-d124-47f3-b34f-0364bc0bbef3_negitoro_sushi.jpg', 40)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M57582', N'Mugicha', N'Mugicha', CAST(60 AS Decimal(18, 0)), N'เครื่องดื่มชา', NULL, CAST(N'2024-10-03T14:56:21.970' AS DateTime), CAST(N'2024-10-03T14:56:21.970' AS DateTime), 0, N'b3d1e6d1-e000-4da2-add3-2e5fa690d542_Mugicha.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M58413', N'ข้าวหน้าหมูปั้นเทอริยากิ', N'ข้าวหน้าหมูปั้นเทอริยากิ', CAST(100 AS Decimal(18, 0)), N'เมนูข้าว', NULL, CAST(N'2024-10-03T09:36:21.650' AS DateTime), CAST(N'2024-10-03T09:36:21.650' AS DateTime), 0, N'a3566a74-da0b-4355-951a-e8910e86a6f0_PorkBallTeriyakiRIce.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M5901', N'ข้าวหน้าหมู', N'ข้าวหน้าหมู', CAST(100 AS Decimal(18, 0)), N'เมนูข้าว', NULL, CAST(N'2024-10-03T09:27:06.307' AS DateTime), CAST(N'2024-10-03T09:27:06.307' AS DateTime), 0, N'6939ea29-ffea-437b-a4c3-abcfbac775c7_porkRice.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M59248', N'แดงมะนาวโซดา', N'แดงมะนาวโซดา', CAST(40 AS Decimal(18, 0)), N'เครื่องดื่มทั่วไป', N'OP00001', CAST(N'2024-10-03T14:06:26.317' AS DateTime), CAST(N'2024-10-03T14:06:26.317' AS DateTime), 0, N'b3506184-80f4-4c02-b8df-7d3110503887_redLemonSoda.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M61717', N'ข้าวแกงกะหรี่ไก่ทอด', N'ข้าวแกงกะหรี่ไก่ทอด', CAST(120 AS Decimal(18, 0)), N'เมนูข้าว', N'OP00002', CAST(N'2024-10-03T09:42:39.527' AS DateTime), CAST(N'2024-10-03T09:42:39.527' AS DateTime), 0, N'ac5f87ad-679c-4f31-a36e-fbf9f678c2fc_CurryChickenRice.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M6243', N'ไดฟูกุสตอเบอร์รี่', N'ไดฟูกุสตอเบอร์รี่', CAST(30 AS Decimal(18, 0)), N'เมนูของหวาน', NULL, CAST(N'2024-10-03T12:17:01.547' AS DateTime), CAST(N'2024-10-03T12:17:01.547' AS DateTime), 0, N'f090213c-af1b-4683-ad3a-e03513cd8b35_Daifuku.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M62992', N'พาเฟ่ร์สตอเบอร์รี่', N'พาเฟ่ร์สตอเบอร์รี่', CAST(60 AS Decimal(18, 0)), N'เมนูของหวาน', NULL, CAST(N'2024-10-03T12:22:14.310' AS DateTime), CAST(N'2024-10-03T12:22:14.310' AS DateTime), 0, N'287ff741-ba00-4bc6-9f48-99f2ea4f2899_Strawberry-Parfait.jpg', 40)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M63126', N'ข้าวแกงกะหรี่สเต็กเนื้อ', N'ข้าวแกงกะหรี่สเต็กเนื้อ', CAST(180 AS Decimal(18, 0)), N'เมนูข้าว', N'OP00002', CAST(N'2024-10-03T09:43:13.943' AS DateTime), CAST(N'2024-10-03T09:43:13.943' AS DateTime), 0, N'0ce23f43-86e6-477f-8de8-56ea84782d1e_CurryStackRice.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M63498', N'ชาไทย', N'ชาไทย', CAST(50 AS Decimal(18, 0)), N'เครื่องดื่มชา', NULL, CAST(N'2024-10-03T14:57:29.950' AS DateTime), CAST(N'2024-10-03T14:57:29.950' AS DateTime), 0, N'f6e9def9-9113-490d-a137-2620b8f04708_thaitea.jpg', 99)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M64616', N'อรุบะ โซบะ', N'อรุบะ โซบะ', CAST(200 AS Decimal(18, 0)), N'เมนูเส้น', N'OP00003', CAST(N'2024-10-03T09:14:33.560' AS DateTime), CAST(N'2024-10-03T09:14:33.560' AS DateTime), 0, N'a8fa781f-9e0a-4b5b-9d74-996a4e25cffd_abura-soba.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M64620', N'ซุปมิโซะ', N'ซุปมิโซะ', CAST(30 AS Decimal(18, 0)), N'เมนูทานเล่น', N'OP00004', CAST(N'2024-10-03T12:09:57.477' AS DateTime), CAST(N'2024-10-03T12:09:57.477' AS DateTime), 0, N'2b66a91d-f05c-45ac-903f-92e2e4415e3f_Miso-Soup.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M66076', N'อิตาเลียนโซดา', N'อิตาเลียนโซดา', CAST(55 AS Decimal(18, 0)), N'เครื่องดื่มทั่วไป', N'OP00001', CAST(N'2024-10-03T14:03:59.637' AS DateTime), CAST(N'2024-10-03T14:03:59.637' AS DateTime), 0, N'cf1bb1f7-26d4-4ef3-a89f-20d59949f13f_italian-soda.jpg', 99)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M66684', N'มากิ ไข่หวาน', N'มากิ ไข่หวาน', CAST(100 AS Decimal(18, 0)), N'เมนูทานเล่น', N'OP13507', CAST(N'2024-10-03T10:23:17.980' AS DateTime), CAST(N'2024-10-03T10:23:17.980' AS DateTime), 4, N'0eab7e4f-cd15-47cd-bc15-58009e42ddfb_tamakoMaki.jpg', 97)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M67301', N'โคโรเกะชีส', N'โคโรเกะชีส', CAST(40 AS Decimal(18, 0)), N'เมนูทานเล่น', NULL, CAST(N'2024-10-03T12:12:08.280' AS DateTime), CAST(N'2024-10-03T12:12:08.280' AS DateTime), 0, N'07c99bfd-7c74-4e07-aea8-cdd725bc0754_korokeCheese.jpg', 99)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M68553', N'ยูซุ ราเมง', N'ยูซุ ราเมง', CAST(200 AS Decimal(18, 0)), N'เมนูเส้น', N'OP00003', CAST(N'2024-10-03T08:53:55.810' AS DateTime), CAST(N'2024-10-03T08:55:40.323' AS DateTime), 0, N'd84c18ea-2019-457f-acb2-3bfb593c8e9f_yuzu_ramen.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M69675', N'ถั่วเอดะมาเมะคลุกเกลือ', N'ถั่วเอดะมาเมะคลุกเกลือ', CAST(30 AS Decimal(18, 0)), N'เมนูทานเล่น', NULL, CAST(N'2024-10-03T12:09:16.800' AS DateTime), CAST(N'2024-10-03T12:09:16.800' AS DateTime), 0, N'2c7d94ec-afa6-4e67-92e5-dd613d1357a6_edamame.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M70710', N'เนื้อแฮมเบิร์ก', N'เนื้อแฮมเบิร์ก', CAST(60 AS Decimal(18, 0)), N'เมนูทานเล่น', N'OP25015', CAST(N'2024-10-03T12:12:53.180' AS DateTime), CAST(N'2024-10-03T12:12:53.180' AS DateTime), 0, N'd93ec1f4-704d-4a17-94b1-52dec379a231_Hamburg.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M73743', N'ข้าวห่อไข่', N'เป็นอาหารญี่ปุ่นที่ได้รับอิทธิพลจากอาหารตะวันตก โดยคำว่า "โอมุ" (Omu) มาจากคำว่า "Omelette" และ "ไรซ์" (Rice) มาจากคำว่า "ข้าว" ซึ่งรวมกันเป็นเมนูที่มีลักษณะเป็นข้าวผัดห่อด้วยไข่เจียว', CAST(60 AS Decimal(18, 0)), N'เมนูข้าว', NULL, CAST(N'2024-10-01T07:48:48.257' AS DateTime), CAST(N'2024-10-01T07:48:48.257' AS DateTime), 0, N'8ce40b66-0a97-4270-92e4-dded255cabb6_4f4a1b304f1dc8f37e0723b0aea0826a.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M75330', N'ฮากะตะ ราเมง', N'ฮากะตะ ราเมง', CAST(200 AS Decimal(18, 0)), N'เมนูเส้น', N'OP00004', CAST(N'2024-10-03T08:50:01.613' AS DateTime), CAST(N'2024-10-03T08:50:01.613' AS DateTime), 0, N'cddd9a56-8bb6-430d-a9e2-2caf38afa353_hakata-ramen.jpg', 99)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M76097', N' ข้าวหน้าปลาไหลญี่ปุ่นย่างซีอิ๊ว', N' ข้าวหน้าปลาไหลญี่ปุ่นย่างซีอิ๊ว', CAST(300 AS Decimal(18, 0)), N'เมนูข้าว', NULL, CAST(N'2024-10-03T09:43:52.143' AS DateTime), CAST(N'2024-10-03T09:43:52.143' AS DateTime), 0, N'81689e17-386c-4522-8202-20879b1e9731_Unadon-Eel-Rice.jpg', 99)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M77645', N'คิทซึเนะ อุด้ง', N'คิทซึเนะ อุด้ง', CAST(175 AS Decimal(18, 0)), N'เมนูเส้น', N'OP00004', CAST(N'2024-10-03T09:12:08.563' AS DateTime), CAST(N'2024-10-03T09:12:08.563' AS DateTime), 0, N'3f7e2f99-8df5-4da7-8a3d-847dd8436ee5_Kitsune-Udon.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M8043', N'แซลมอนโทโร่ ซาซิมิ', N'แซลมอนโทโร่ ซาซิมิ', CAST(239 AS Decimal(18, 0)), N'เมนูอาหารทะเล', N'OP13507', CAST(N'2024-10-03T10:16:17.293' AS DateTime), CAST(N'2024-10-03T10:16:59.260' AS DateTime), 0, N'58e74870-213d-4bf2-a5d1-5310eca0235f_salmonToroSashimi.png', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M81127', N'ข้าวหน้าปลาดิบภูเขาไฟ', N'ข้าวหน้าปลาดิบภูเขาไฟ', CAST(150 AS Decimal(18, 0)), N'เมนูข้าว', N'OP13507', CAST(N'2024-10-03T09:38:13.053' AS DateTime), CAST(N'2024-10-03T09:38:13.053' AS DateTime), 0, N'03c106d9-c2ee-42bf-8841-fd1c0e8aa0df_volcanoSashimiRice.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M82495', N'ข้าวหน้าเนื้อภูเขาไฟ', N'ข้าวหน้าเนื้อภูเขาไฟ', CAST(160 AS Decimal(18, 0)), N'เมนูข้าว', NULL, CAST(N'2024-10-03T09:36:52.250' AS DateTime), CAST(N'2024-10-03T09:36:52.250' AS DateTime), 0, N'9b3021a1-cc00-4c50-8f0c-77b89c02cdf6_valcanoBeefRice.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M84521', N'ข้าวไก่ทอดซอสนัมบัง', N'ข้าวไก่ทอดซอสนัมบัง', CAST(120 AS Decimal(18, 0)), N'เมนูข้าว', NULL, CAST(N'2024-10-03T09:28:19.337' AS DateTime), CAST(N'2024-10-03T09:28:19.337' AS DateTime), 0, N'e90d4fd3-a2d3-479e-93db-7f856c37ee6d_NumbangRice.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M84687', N'ราเมงแกงกะหรี่ทงคัทซึ', N'เป็นเมนูที่ประกอบไปด้วยราเมงผสมกับแกงกะหรี่', CAST(150 AS Decimal(18, 0)), N'เมนูเส้น', N'OP00002', CAST(N'2024-10-03T08:31:05.390' AS DateTime), CAST(N'2024-10-03T08:31:05.390' AS DateTime), 4, N'e2c32721-ec3f-4acb-8e71-617da8da45ba_kare-ramen.jpg', 96)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M84722', N'น้ำเปล่า', N'น้ำเปล่า', CAST(10 AS Decimal(18, 0)), N'เครื่องดื่มทั่วไป', N'OP00001', CAST(N'2024-10-03T14:08:56.063' AS DateTime), CAST(N'2024-10-03T14:08:56.063' AS DateTime), 4.5555555555555554, N'e0c547fa-a2f4-4ca4-8537-560dc8a7b24f_waterglass.jpg', 88)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M84736', N'เค้กคัสเตลา', N'เค้กคัสเตลา', CAST(50 AS Decimal(18, 0)), N'เมนูของหวาน', NULL, CAST(N'2024-10-03T12:16:30.423' AS DateTime), CAST(N'2024-10-03T12:16:30.423' AS DateTime), 0, N'c25257d0-07e1-4366-9fad-ae6046a7372b_CastellaCake.jpg', 60)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M84838', N'เบอร์เกอร์ข้าวทงคัตสึ', N'เบอร์เกอร์ข้าวทงคัตสึ', CAST(50 AS Decimal(18, 0)), N'เมนูทานเล่น', NULL, CAST(N'2024-10-03T12:11:21.560' AS DateTime), CAST(N'2024-10-03T12:11:21.560' AS DateTime), 0, N'2f50385b-0f61-43e0-9439-5ba0160f001f_TonkatsuBurger.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M84903', N'น้ำมะนาว', N'น้ำมะนาว', CAST(40 AS Decimal(18, 0)), N'เครื่องดื่มทั่วไป', N'OP00001', CAST(N'2024-10-03T14:07:33.910' AS DateTime), CAST(N'2024-10-03T14:07:33.910' AS DateTime), 0, N'3b130e4a-76f6-4271-bba8-01a431b68375_Lemon-juice.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M86200', N'ฮอกไกโด สไปซี่ ราเมง', N'ฮอกไกโด สไปซี่ ราเมง', CAST(175 AS Decimal(18, 0)), N'เมนูเส้น', N'OP00002', CAST(N'2024-10-03T08:49:13.463' AS DateTime), CAST(N'2024-10-03T08:49:13.463' AS DateTime), 0, N'b2e859e5-50f8-4915-a898-ee984aa50810_hokkaido_spicy_ramen.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M86241', N'ทาโกะ ซาซิมิ', N'ทาโกะ ซาซิมิ', CAST(350 AS Decimal(18, 0)), N'เมนูอาหารทะเล', N'OP13507', CAST(N'2024-10-03T10:30:52.167' AS DateTime), CAST(N'2024-10-03T10:30:52.167' AS DateTime), 0, N'115f7bb7-b171-4012-9686-48edb4156d6a_takoSashimi.jpg', 60)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M90272', N'โซบะร้อน', N'โซบะร้อน', CAST(100 AS Decimal(18, 0)), N'เมนูเส้น', NULL, CAST(N'2024-10-03T08:35:40.420' AS DateTime), CAST(N'2024-10-03T08:35:40.420' AS DateTime), 0, N'2adff96d-818d-4d39-8e20-95900bc60a55_hot-soba.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M91596', N'ซาซิมิเซทสเปเชี่ยล', N'ซาซิมิเซทสเปเชี่ยล', CAST(700 AS Decimal(18, 0)), N'เมนูอาหารทะเล', N'OP13507', CAST(N'2024-10-03T09:49:12.593' AS DateTime), CAST(N'2024-10-03T09:49:12.593' AS DateTime), 0, N'deba1bba-c4e8-40e8-bd60-be866b025ca9_sashimi-special.jpg', 40)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M93601', N'ทูน่า อุระมากิ', N'ทูน่า อุระมากิ', CAST(139 AS Decimal(18, 0)), N'เมนูทานเล่น', N'OP13507', CAST(N'2024-10-03T10:24:02.467' AS DateTime), CAST(N'2024-10-03T10:24:02.467' AS DateTime), 0, N'de735e74-2ad0-442f-97ed-1d30d72aaee3_tinaUramaki.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M94341', N'ซากุระโมจิ', N'ซากุระโมจิ', CAST(40 AS Decimal(18, 0)), N'เมนูของหวาน', NULL, CAST(N'2024-10-03T12:27:19.163' AS DateTime), CAST(N'2024-10-03T12:27:19.163' AS DateTime), 0, N'df8afa3f-48f2-4127-b6bb-5be984da4f54_sakuraMoji.jpg', 50)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M94550', N'ทาโกะยากิ', N'ทาโกะยากิ', CAST(30 AS Decimal(18, 0)), N'เมนูทานเล่น', NULL, CAST(N'2024-10-03T10:40:20.927' AS DateTime), CAST(N'2024-10-03T10:40:20.927' AS DateTime), 0, N'526a029a-86b9-4687-a3ea-d412e11dd627_Takoyaki-octopus.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M96050', N'สปาเกตตี๋ นโปเลียน', N'สปาเกตตี๋ นโปเลียน', CAST(150 AS Decimal(18, 0)), N'เมนูเส้น', NULL, CAST(N'2024-10-03T09:13:48.323' AS DateTime), CAST(N'2024-10-03T09:13:48.323' AS DateTime), 0, N'e4f4e35f-e08a-48ff-a028-077db8bde88f_Supagetti-Napolitan.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M96385', N'ข้าวหมูโชกุน', N'ข้าวหมูโชกุน', CAST(130 AS Decimal(18, 0)), N'เมนูข้าว', NULL, CAST(N'2024-10-03T09:41:25.123' AS DateTime), CAST(N'2024-10-03T09:41:25.123' AS DateTime), 0, N'c2166ea1-4b87-4336-99f9-83ae4af3c396_ShogunRice.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M97048', N'แซลมอน ฟูโตมากิ', N'แซลมอน ฟูโตมากิ', CAST(159 AS Decimal(18, 0)), N'เมนูทานเล่น', N'OP13507', CAST(N'2024-10-03T10:24:51.453' AS DateTime), CAST(N'2024-10-03T10:24:51.453' AS DateTime), 0, N'76999904-79a1-4860-97bf-eba407421b97_salmon_futomaki.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M98926', N'น้ำพั้นซ์', N'น้ำพั้นซ์
', CAST(30 AS Decimal(18, 0)), N'เครื่องดื่มทั่วไป', N'OP00001', CAST(N'2024-10-03T14:02:48.400' AS DateTime), CAST(N'2024-10-03T14:02:48.400' AS DateTime), 0, N'f6fcdf8e-7206-4807-8fe2-04be7e3fd839_punch.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M99153', N'Suntory Kinmugi Rich Malt 35cl', N'Suntory Kinmugi Rich Malt 35cl', CAST(100 AS Decimal(18, 0)), N'เครื่องดื่มแอลกอฮอร์', N'OP00001', CAST(N'2024-10-03T14:13:52.807' AS DateTime), CAST(N'2024-10-03T14:13:52.807' AS DateTime), 0, N'e9129a2a-0e99-4dbf-8d1f-ffade0647997_Suntory_kinmugi_35cl.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M99292', N'ไข่หวานม้วน', N'ไข่หวานม้วน
', CAST(40 AS Decimal(18, 0)), N'เมนูทานเล่น', NULL, CAST(N'2024-10-03T12:10:38.803' AS DateTime), CAST(N'2024-10-03T12:10:38.803' AS DateTime), 0, N'52d97c1b-26a8-471d-ad30-b1436b134774_KaiWan.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M99614', N'กล้ามปูหิมะ', N'กล้ามปูหิมะ', CAST(250 AS Decimal(18, 0)), N'เมนูอาหารทะเล', N'OP81697', CAST(N'2024-10-03T10:34:00.090' AS DateTime), CAST(N'2024-10-27T10:25:41.403' AS DateTime), 0, N'da95c1be-daf7-4546-964c-5ab17f5975f5_Zuwai_claws.jpg', 39)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M99738', N'ดังโกะ', N'ดังโกะ', CAST(15 AS Decimal(18, 0)), N'เมนูของหวาน', NULL, CAST(N'2024-10-03T12:25:23.547' AS DateTime), CAST(N'2024-10-03T12:25:23.547' AS DateTime), 0, N'9d162322-372c-4a13-bde8-86f58f1e9909_Dango.jpg', 100)
INSERT [dbo].[menu_tb] ([menuID], [menuName], [menuDescription], [unitPrice], [categoryName], [optionID], [createDate], [updateDate], [rating], [imageName], [stockQuantity]) VALUES (N'M99862', N'โดรายากิ', N'โดรายากิ', CAST(30 AS Decimal(18, 0)), N'เมนูของหวาน', NULL, CAST(N'2024-10-03T12:27:56.300' AS DateTime), CAST(N'2024-10-03T12:27:56.300' AS DateTime), 0, N'01edbf95-98f9-4304-a677-95c98f62116d_dorayaki.jpg', 60)
GO
INSERT [dbo].[notification_tb] ([notificationID], [title], [message], [createDate], [tableID], [isRead], [sentBy]) VALUES (N'NO21899', N'ยกเลิกรายการสั่ง', N'หมายเลข order ที่ทำการยกเลิกคือ : "OD24298"', CAST(N'2024-10-30T12:34:47.027' AS DateTime), N'T008', N'ยังไม่ได้อ่าน', N'ลูกค้า')
INSERT [dbo].[notification_tb] ([notificationID], [title], [message], [createDate], [tableID], [isRead], [sentBy]) VALUES (N'NO274987', N'ยกเลิกรายการสั่ง', N'หมายเลข order ที่ทำการยกเลิกคือ : "OD16694"', CAST(N'2024-10-23T18:46:54.520' AS DateTime), N'T008', N'ยังไม่ได้อ่าน', N'ลูกค้า')
INSERT [dbo].[notification_tb] ([notificationID], [title], [message], [createDate], [tableID], [isRead], [sentBy]) VALUES (N'NO38579', N'ยกเลิกรายการสั่ง', N'หมายเลข order ที่ทำการยกเลิกคือ : "OD9868"', CAST(N'2024-10-25T06:55:46.637' AS DateTime), N'T008', N'ยังไม่ได้อ่าน', N'ลูกค้า')
INSERT [dbo].[notification_tb] ([notificationID], [title], [message], [createDate], [tableID], [isRead], [sentBy]) VALUES (N'NO664562', N'ยกเลิกรายการสั่ง', N'หมายเลข order ที่ทำการยกเลิกคือ : "OD23312"', CAST(N'2024-10-25T03:58:30.357' AS DateTime), N'T008', N'ยังไม่ได้อ่าน', N'ลูกค้า')
INSERT [dbo].[notification_tb] ([notificationID], [title], [message], [createDate], [tableID], [isRead], [sentBy]) VALUES (N'NO735157', N'ต้องการชำระรายการด้วยเงินสด', N'ต้องการชำระเงินสด order : OD10307', CAST(N'2024-10-23T19:28:57.170' AS DateTime), N'T008', N'ยังไม่ได้อ่าน', N'ลูกค้า')
INSERT [dbo].[notification_tb] ([notificationID], [title], [message], [createDate], [tableID], [isRead], [sentBy]) VALUES (N'NO955808', N'ยกเลิกรายการสั่ง', N'หมายเลข order ที่ทำการยกเลิกคือ : "OD2940"', CAST(N'2024-10-25T04:36:39.307' AS DateTime), N'T008', N'ยังไม่ได้อ่าน', N'ลูกค้า')
GO
INSERT [dbo].[option_tb] ([optionID], [optionName], [value]) VALUES (N'OP00001', N'ใส่น้ำแข็ง', N'ใส่น้ำแข็ง,ไม่ใส่น้ำแข็ง')
INSERT [dbo].[option_tb] ([optionID], [optionName], [value]) VALUES (N'OP00002', N'เลือกระดับความเผ็ด', N'แกงเผ็ดน้อย ,แกงเผ็ดปานกลาง ,แกงเผ็ดมาก')
INSERT [dbo].[option_tb] ([optionID], [optionName], [value]) VALUES (N'OP00003', N'รูปแบบเส้น', N'ใส่เส้นราเมง,ใส่เส้นอุด้ง,ใส่เส้นบะหมี่,ใส่เส้นมาม่า')
INSERT [dbo].[option_tb] ([optionID], [optionName], [value]) VALUES (N'OP00004', N'เลือกระดับความเข้มข้นของซุป', N'น้ำซุปเข้มข้นน้อย,น้ำซุปเข้มข้นปานกลาง,น้ำซุปเข้มข้นมาก')
INSERT [dbo].[option_tb] ([optionID], [optionName], [value]) VALUES (N'OP13507', N'ใส่วาซาบิหรือไม่', N'ใส่วาซาบิ,ไม่ใส่วาซาบิ')
INSERT [dbo].[option_tb] ([optionID], [optionName], [value]) VALUES (N'OP25015', N'ชนิดของเนื้อสัตว์', N'หมู,เนื้อวัว,ไก่')
INSERT [dbo].[option_tb] ([optionID], [optionName], [value]) VALUES (N'OP81697', N'ซอสจิ้ม', N'ขอซอสโชยุ,ขอซอสยูซุ,ขอซอสเปรี้ยว')
GO
SET IDENTITY_INSERT [dbo].[order_tb] ON 

INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD10307', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-23T19:26:25.803' AS DateTime), CAST(300 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS123384', 76)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD11147', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-30T11:58:51.153' AS DateTime), CAST(100 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS304126', 86)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD11393', N'T001', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-09-19T16:52:12.690' AS DateTime), CAST(272 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000001', 1)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD14124', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-15T21:34:17.743' AS DateTime), CAST(197 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS304126', 42)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD14144', N'T001', N'STAFT00002', N'ดำเนินรายการสำเร็จ', CAST(N'2024-09-19T16:11:42.030' AS DateTime), CAST(45 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000001', 2)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD16694', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-23T18:37:09.573' AS DateTime), CAST(210 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ชำระเงินสำเร็จ', N'CUS123384', 75)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD20367', N'T001', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-09-30T04:16:45.777' AS DateTime), CAST(15 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000005', 3)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD20571', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-11T18:58:10.883' AS DateTime), CAST(50 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000004', 4)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD20913', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-25T04:29:05.673' AS DateTime), CAST(60 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ยังไม่ได้ชำระ', N'CUS324753', 82)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD21019', N'T008', N'STAFT00003', N'ไม่สำเร็จ', CAST(N'2024-10-15T13:44:14.990' AS DateTime), CAST(117 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ยังไม่ได้ชำระ', N'CUS000007', 36)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD21378', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-15T22:03:06.400' AS DateTime), CAST(275 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS304126', 47)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD2320', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-14T14:53:49.633' AS DateTime), CAST(50 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000007', 5)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD23312', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-25T03:58:05.937' AS DateTime), CAST(300 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ชำระเงินสำเร็จ', N'CUS324753', 79)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD24298', N'T008', N'STAFT00001', N'รายการถูกยกเลิก', CAST(N'2024-10-30T12:34:25.777' AS DateTime), CAST(150 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ชำระเงินสำเร็จ', N'CUS304126', 90)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD24554', N'T008', N'STAFT00003', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-16T10:44:55.780' AS DateTime), CAST(150 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS563481', 53)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD24679', N'T001', N'STAFT00001', N'ไม่สำเร็จ', CAST(N'2024-09-19T16:26:39.577' AS DateTime), CAST(60 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS000001', 6)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD27235', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-23T17:18:35.097' AS DateTime), CAST(50 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS123384', 74)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD27343', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-20T17:00:53.243' AS DateTime), CAST(110 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS238588', 65)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD27538', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-18T09:14:44.197' AS DateTime), CAST(275 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS269252', 60)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD28474', N'T001', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-09-19T16:14:03.570' AS DateTime), CAST(100 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000005', 7)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD28495', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-20T17:24:12.463' AS DateTime), CAST(100 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ชำระเงินสำเร็จ', N'CUS238588', 67)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD2940', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-25T04:35:53.410' AS DateTime), CAST(100 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ชำระเงินสำเร็จ', N'CUS324753', 83)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD29990', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-25T04:19:22.567' AS DateTime), CAST(439 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS324753', 81)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD30006', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-14T14:53:02.787' AS DateTime), CAST(285 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ยังไม่ได้ชำระ', N'CUS000007', 8)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD30664', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-15T22:53:05.703' AS DateTime), CAST(280 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS989538', 51)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD32481', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-18T10:16:19.180' AS DateTime), CAST(200 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS943738', 63)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD3267', N'T008', N'STAFT00003', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-15T21:30:04.610' AS DateTime), CAST(375 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS304126', 40)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD34155', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-20T17:33:49.960' AS DateTime), CAST(60 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ชำระเงินสำเร็จ', N'CUS238588', 69)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD34646', N'T001', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-05T21:15:01.613' AS DateTime), CAST(820 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000001', 9)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD35079', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-12T22:18:22.630' AS DateTime), CAST(300 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000004', 10)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD35866', N'T008', NULL, N'ไม่สำเร็จ', CAST(N'2024-10-15T21:27:05.817' AS DateTime), CAST(360 AS Decimal(18, 0)), N'ยังไม่อนุมัติ', N'ยังไม่ได้ชำระ', N'undefined', 38)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD36576', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-18T08:31:50.540' AS DateTime), CAST(100 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS269252', 58)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD39639', N'T008', N'STAFT00001', N'ไม่สำเร็จ', CAST(N'2024-10-15T21:49:03.177' AS DateTime), CAST(110 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS304126', 46)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD407', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-18T09:44:02.790' AS DateTime), CAST(110 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ชำระเงินสำเร็จ', N'CUS269252', 61)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD4300', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-15T21:40:42.287' AS DateTime), CAST(110 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS304126', 44)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD43773', N'T008', N'b511a88f-6b00-4c47-a17d-8816266e14b5', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-11T15:00:34.257' AS DateTime), CAST(365 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000004', 11)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD45208', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-15T21:37:26.957' AS DateTime), CAST(197 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS304126', 43)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD46457', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-30T12:24:28.010' AS DateTime), CAST(40 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS304126', 88)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD4755', N'T001', N'STAFT00001', N'ไม่สำเร็จ', CAST(N'2024-09-19T21:38:43.467' AS DateTime), CAST(212 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS000001', 12)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD47600', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-20T17:44:27.230' AS DateTime), CAST(250 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS238588', 72)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD48444', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-23T17:06:50.457' AS DateTime), CAST(399 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS123384', 73)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD48965', N'T001', N'STAFT00001', N'รายการถูกยกเลิก', CAST(N'2024-09-21T03:16:33.913' AS DateTime), CAST(394 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS000001', 13)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD49275', N'T001', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-09-30T08:05:29.820' AS DateTime), CAST(232 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000001', 14)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD50432', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-14T14:55:56.793' AS DateTime), CAST(200 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000007', 15)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD52642', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-20T15:57:16.737' AS DateTime), CAST(245 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS769099', 64)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD5295', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-18T05:19:00.960' AS DateTime), CAST(200 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS269252', 55)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD54046', N'T008', N'STAFT00003', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-16T13:07:41.533' AS DateTime), CAST(350 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS123384', 54)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD54158', N'T008', N'STAFT00001', N'รายการถูกยกเลิก', CAST(N'2024-10-20T17:43:20.500' AS DateTime), CAST(150 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ชำระเงินสำเร็จ', N'CUS238588', 71)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD54444', N'T008', N'STAFT00003', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-15T21:31:39.640' AS DateTime), CAST(97 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS304126', 41)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD55326', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-13T00:24:57.107' AS DateTime), CAST(50 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000004', 16)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD57168', N'T001', N'b511a88f-6b00-4c47-a17d-8816266e14b5', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-03T02:13:42.307' AS DateTime), CAST(100 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000001', 17)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD57269', N'T001', N'STAFT00001', N'ไม่สำเร็จ', CAST(N'2024-09-19T16:42:51.077' AS DateTime), CAST(175 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS000001', 18)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD57819', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-12T21:39:06.513' AS DateTime), CAST(100 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000004', 19)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD58595', N'T008', N'STAFT00003', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-16T10:38:59.427' AS DateTime), CAST(220 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS563481', 52)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD58898', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-25T04:05:17.323' AS DateTime), CAST(70 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS324753', 80)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD6016', N'T008', N'STAFT00001', N'รายการถูกยกเลิก', CAST(N'2024-10-20T17:27:04.113' AS DateTime), CAST(140 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ชำระเงินสำเร็จ', N'CUS238588', 68)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD60418', N'T008', N'STAFT00003', N'ไม่สำเร็จ', CAST(N'2024-10-15T22:22:56.680' AS DateTime), CAST(757 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS304126', 50)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD60846', N'T004      ', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-09-30T05:40:03.873' AS DateTime), CAST(15 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000003', 20)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD61482', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-15T12:57:44.487' AS DateTime), CAST(110 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS000007', 35)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD61845', N'T004      ', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-09-28T01:03:22.287' AS DateTime), CAST(300 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000003', 21)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD62578', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-30T12:17:15.977' AS DateTime), CAST(299 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS304126', 87)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD63670', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-15T21:44:17.773' AS DateTime), CAST(110 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS304126', 45)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD65894', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-15T22:06:56.850' AS DateTime), CAST(140 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS304126', 49)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD68244', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-18T06:43:21.180' AS DateTime), CAST(100 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS269252', 56)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD69543', N'T008', NULL, N'ไม่สำเร็จ', CAST(N'2024-10-15T21:28:25.507' AS DateTime), CAST(360 AS Decimal(18, 0)), N'ยังไม่อนุมัติ', N'ยังไม่ได้ชำระ', N'undefined', 39)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD70695', N'T001', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-09-18T01:16:56.653' AS DateTime), CAST(100 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000001', 22)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD72488', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-15T22:05:49.690' AS DateTime), CAST(100 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ยังไม่ได้ชำระ', N'CUS304126', 48)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD72519', N'T008', N'b511a88f-6b00-4c47-a17d-8816266e14b5', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-11T15:02:41.760' AS DateTime), CAST(60 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000004', 23)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD75247', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-29T02:10:16.610' AS DateTime), CAST(385 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS357618', 85)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD76606', N'T008', N'STAFT00003', N'ไม่สำเร็จ', CAST(N'2024-10-14T15:15:39.863' AS DateTime), CAST(447 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ยังไม่ได้ชำระ', N'CUS000007', 24)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD78275', N'T008', N'STAFT00001', N'รายการถูกยกเลิก', CAST(N'2024-10-20T17:38:35.260' AS DateTime), CAST(100 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ชำระเงินสำเร็จ', N'CUS238588', 70)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD79059', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-12T21:50:12.973' AS DateTime), CAST(190 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000004', 25)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD79393', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-11T15:31:49.187' AS DateTime), CAST(515 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000004', 26)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD80315', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-20T17:02:11.647' AS DateTime), CAST(10 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS238588', 66)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD80653', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-30T12:29:47.740' AS DateTime), CAST(100 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS304126', 89)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD83800', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-18T07:40:28.710' AS DateTime), CAST(210 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS269252', 57)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD83995', N'T008', N'STAFT00003', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-15T18:30:58.013' AS DateTime), CAST(360 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000007', 37)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD84552', N'T008', N'STAFT00001', N'รายการถูกยกเลิก', CAST(N'2024-10-18T10:09:14.360' AS DateTime), CAST(460 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ชำระเงินสำเร็จ', N'CUS269252', 62)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD85357', N'T001', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-09-19T16:58:01.890' AS DateTime), CAST(215 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000002', 27)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD86221', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-18T08:48:28.070' AS DateTime), CAST(110 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS269252', 59)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD88659', N'T008', N'b511a88f-6b00-4c47-a17d-8816266e14b5', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-11T15:04:12.140' AS DateTime), CAST(370 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000004', 28)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD89566', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-14T14:54:48.760' AS DateTime), CAST(530 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ยังไม่ได้ชำระ', N'CUS000007', 29)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD89599', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-11T15:32:22.450' AS DateTime), CAST(40 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000004', 30)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD90001', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-14T14:51:49.537' AS DateTime), CAST(155 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ยังไม่ได้ชำระ', N'CUS000007', 31)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD94246', N'T008', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-25T03:49:30.297' AS DateTime), CAST(299 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS324753', 78)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD95437', N'T001', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-09-19T21:37:22.057' AS DateTime), CAST(97 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000002', 32)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD97012', N'T008', N'STAFT00001', N'ไม่สำเร็จ', CAST(N'2024-10-23T19:54:07.177' AS DateTime), CAST(299 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ยังไม่ได้ชำระ', N'CUS123384', 77)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD97045', N'T001', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-10-01T02:06:48.260' AS DateTime), CAST(280 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000001', 33)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD9868', N'T008', NULL, N'รายการถูกยกเลิก', CAST(N'2024-10-25T06:55:43.147' AS DateTime), CAST(150 AS Decimal(18, 0)), N'ยกเลิกรายการสั่งนี้', N'ชำระเงินสำเร็จ', N'CUS518021', 84)
INSERT [dbo].[order_tb] ([orderID], [tableID], [staftID], [orderStatus], [orderDate], [totalPrice], [confirmOrder], [paymentStatus], [customerID], [Q]) VALUES (N'OD99631', N'T001', N'STAFT00001', N'ดำเนินรายการสำเร็จ', CAST(N'2024-09-30T04:16:19.037' AS DateTime), CAST(265 AS Decimal(18, 0)), N'อนุญาติเรียบร้อย', N'ชำระเงินสำเร็จ', N'CUS000001', 34)
SET IDENTITY_INSERT [dbo].[order_tb] OFF
GO
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD14144', N'M00004', N'เสริฟแล้ว', 3, N'', CAST(45 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD24679', N'M1673', N'เมนูนี้ถูกยกเลิกโดยพนักงานเนื่องจาก มีบางอย่างผิดปกติ', 1, N'', CAST(60 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD28474', N'M00001', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD57269', N'M00001', N'เมนูนี้ถูกยกเลิกโดยพนักงานเนื่องจาก มีบางอย่างผิดปกติ', 1, N'', CAST(100 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD70695', N'M00001', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD57269', N'M00004', N'เมนูนี้ถูกยกเลิกโดยพนักงานเนื่องจาก มีบางอย่างผิดปกติ', 1, N'', CAST(15 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD57269', N'M1673', N'เมนูนี้ถูกยกเลิกโดยพนักงานเนื่องจาก มีบางอย่างผิดปกติ', 1, N'', CAST(60 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD11393', N'M00001', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD11393', N'M00002', N'เสริฟแล้ว', 1, N'น้ำซุปเข้มข้นน้อย', CAST(97 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD11393', N'M00004', N'เสริฟแล้ว', 1, N'', CAST(15 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD11393', N'M1673', N'เสริฟแล้ว', 1, N'', CAST(60 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD85357', N'M00001', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD85357', N'M00004', N'เสริฟแล้ว', 1, N'', CAST(15 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD95437', N'M00002', N'เสริฟแล้ว', 1, N'', CAST(97 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD4755', N'M00001', N'เมนูนี้ถูกยกเลิกโดยพนักงานเนื่องจาก มีบางอย่างผิดปกติ', 1, N'', CAST(100 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD4755', N'M00004', N'เมนูนี้ถูกยกเลิกโดยพนักงานเนื่องจาก มีบางอย่างผิดปกติ', 1, N'', CAST(15 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD4755', N'M00002', N'เมนูนี้ถูกยกเลิกโดยพนักงานเนื่องจาก มีบางอย่างผิดปกติ', 1, N'น้ำซุปเข้มข้นน้อย', CAST(97 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD48965', N'M00001', N'รายการถูกยกเลิก', 2, N'', CAST(200 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD48965', N'M00002', N'รายการถูกยกเลิก', 2, N'น้ำซุปเข้มข้นปานกลาง', CAST(194 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD61845', N'M00001', N'เสริฟแล้ว', 3, N'', CAST(300 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD99631', N'M00001', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD99631', N'M1673', N'เสริฟแล้ว', 2, N'', CAST(120 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD99631', N'M00004', N'เสริฟแล้ว', 3, N'', CAST(45 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD34646', N'M10795', N'เสริฟแล้ว', 1, N'', CAST(30 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD34646', N'M31751', N'เสริฟแล้ว', 1, N'', CAST(60 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD34646', N'M67301', N'เสริฟแล้ว', 1, N'', CAST(40 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD34646', N'M21296', N'เสริฟแล้ว', 1, N'ใส่น้ำแข็ง', CAST(20 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD34646', N'M55785', N'เสริฟแล้ว', 2, N'ไม่ใส่น้ำแข็ง', CAST(220 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD34646', N'M19059', N'เสริฟแล้ว', 1, N'แกงเผ็ดปานกลาง ', CAST(150 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD34646', N'M76097', N'เสริฟแล้ว', 1, N'', CAST(300 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD43773', N'M84722', N'เสริฟแล้ว', 4, N'ไม่ใส่น้ำแข็ง', CAST(40 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD43773', N'M1673', N'เสริฟแล้ว', 2, N'', CAST(120 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD43773', N'M10795', N'เสริฟแล้ว', 1, N'', CAST(30 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD43773', N'M15580', N'เสริฟแล้ว', 1, N'ใส่เส้นมาม่า', CAST(175 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD72519', N'M1673', N'เสริฟแล้ว', 1, N'', CAST(60 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD79059', N'M47112', N'เสริฟแล้ว', 1, N'', CAST(40 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD79059', N'M45480', N'เสริฟแล้ว', 1, N'', CAST(60 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD79059', N'M51014', N'เสริฟแล้ว', 1, N'', CAST(60 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD79059', N'M52155', N'เสริฟแล้ว', 1, N'', CAST(30 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD55326', N'M26542', N'เสริฟแล้ว', 1, N'', CAST(40 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD55326', N'M84722', N'เสริฟแล้ว', 1, N'ไม่ใส่น้ำแข็ง', CAST(10 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD2320', N'M40879', N'เสริฟแล้ว', 1, N'', CAST(50 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD61482', N'M12330', N'รายการถูกยกเลิก', 1, N'', CAST(100 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD61482', N'M84722', N'รายการถูกยกเลิก', 1, N'ไม่ใส่น้ำแข็ง', CAST(10 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD21019', N'M00002', N'เสริฟแล้ว', 1, N'น้ำซุปเข้มข้นน้อย', CAST(97 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD21019', N'M84722', N'กำลังเสริฟ', 2, N'ไม่ใส่น้ำแข็ง', CAST(20 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD83995', N'M23169', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD54444', N'M00002', N'เสริฟแล้ว', 1, N'', CAST(97 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD14124', N'M00002', N'รายการถูกยกเลิก', 1, N'', CAST(97 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD45208', N'M00002', N'รายการถูกยกเลิก', 1, N'', CAST(97 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD63670', N'M84722', N'รายการถูกยกเลิก', 1, N'ใส่น้ำแข็ง', CAST(10 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD39639', N'M84722', N'เมนูนี้ถูกยกเลิกโดยพนักงานเนื่องจาก มีบางอย่างผิดปกติ', 1, N'ใส่น้ำแข็ง', CAST(10 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD39639', N'M23169', N'เมนูนี้ถูกยกเลิกโดยพนักงานเนื่องจาก มีบางอย่างผิดปกติ', 1, N'', CAST(100 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD21378', N'M12330', N'รายการถูกยกเลิก', 1, N'', CAST(100 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD21378', N'M15580', N'รายการถูกยกเลิก', 1, N'ใส่เส้นราเมง', CAST(175 AS Decimal(18, 0)), N'ยังไม่ได้รีวิว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD72488', N'M12330', N'รายการถูกยกเลิก', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD65894', N'M23169', N'รายการถูกยกเลิก', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD65894', N'M26542', N'รายการถูกยกเลิก', 1, N'', CAST(40 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD30664', N'M12330', N'รายการถูกยกเลิก', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD30664', N'M1673', N'รายการถูกยกเลิก', 1, N'', CAST(60 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD30664', N'M12493', N'รายการถูกยกเลิก', 1, N'ใส่น้ำแข็ง', CAST(120 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD58595', N'M23169', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD58595', N'M1673', N'เสริฟแล้ว', 2, N'', CAST(120 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD54046', N'M10795', N'เสริฟแล้ว', 1, N'', CAST(30 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD54046', N'M45480', N'เสริฟแล้ว', 2, N'', CAST(120 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD54046', N'M66684', N'เสริฟแล้ว', 2, N'ใส่วาซาบิ', CAST(200 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD20367', N'M00004', N'เสริฟแล้ว', 1, N'', CAST(15 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD60846', N'M00004', N'เสริฟแล้ว', 1, N'', CAST(15 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD49275', N'M00002', N'เสริฟแล้ว', 1, N'น้ำซุปเข้มข้นน้อย', CAST(97 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD49275', N'M1673', N'เสริฟแล้ว', 2, N'', CAST(120 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD49275', N'M00004', N'เสริฟแล้ว', 1, N'', CAST(15 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD97045', N'M1673', N'เสริฟแล้ว', 3, NULL, CAST(180 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD97045', N'M00001', N'เสริฟแล้ว', 1, NULL, CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD57168', N'M23169', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD88659', N'M12330', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD88659', N'M12493', N'เสริฟแล้ว', 1, N'ใส่น้ำแข็ง', CAST(120 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD88659', N'M19059', N'เสริฟแล้ว', 1, N'แกงเผ็ดน้อย ', CAST(150 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD79393', N'M10259', N'เสริฟแล้ว', 1, N'', CAST(400 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD79393', N'M00004', N'เสริฟแล้ว', 1, N'', CAST(15 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD79393', N'M12330', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD89599', N'M26542', N'เสริฟแล้ว', 1, N'', CAST(40 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD20571', N'M39841', N'เสริฟแล้ว', 1, N'', CAST(50 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD57819', N'M00001', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD35079', N'M54163', N'เสริฟแล้ว', 1, N'ใส่เส้นอุด้ง', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD35079', N'M75330', N'เสริฟแล้ว', 1, N'น้ำซุปเข้มข้นน้อย', CAST(200 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD90001', N'M54163', N'เสริฟแล้ว', 1, N'ใส่เส้นราเมง', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD90001', N'M66076', N'เสริฟแล้ว', 1, N'ใส่น้ำแข็ง', CAST(55 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD30006', N'M12330', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD30006', N'M15580', N'เสริฟแล้ว', 1, N'ใส่เส้นบะหมี่', CAST(175 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD30006', N'M84722', N'เสริฟแล้ว', 1, N'ไม่ใส่น้ำแข็ง', CAST(10 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD89566', N'M99614', N'เสริฟแล้ว', 1, N'ขอซอสเปรี้ยว', CAST(250 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD89566', N'M20514', N'เสริฟแล้ว', 1, N'ใส่วาซาบิ', CAST(60 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD89566', N'M23069', N'เสริฟแล้ว', 2, N'ใส่น้ำแข็ง', CAST(220 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD50432', N'M84687', N'เสริฟแล้ว', 1, N'แกงเผ็ดปานกลาง ', CAST(150 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD50432', N'M63498', N'เสริฟแล้ว', 1, N'', CAST(50 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD76606', N'M00002', N'กำลังเสริฟ', 1, N'น้ำซุปเข้มข้นปานกลาง', CAST(97 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD76606', N'M26542', N'เสริฟแล้ว', 1, N'', CAST(40 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD76606', N'M47112', N'ปรุงสำเร็จ', 1, N'', CAST(40 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD76606', N'M39841', N'เสริฟแล้ว', 1, N'', CAST(50 AS Decimal(18, 0)), N'รีวิวแล้ว')
GO
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD76606', N'M23069', N'เสริฟแล้ว', 2, N'ไม่ใส่น้ำแข็ง', CAST(220 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD3267', N'M12330', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD4300', N'M84722', N'รายการถูกยกเลิก', 1, N'ใส่น้ำแข็ง', CAST(10 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD60418', N'M1673', N'เมนูนี้ถูกยกเลิกโดยพนักงานเนื่องจาก มีบางอย่างผิดปกติ', 1, N'', CAST(60 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD60418', N'M19059', N'เมนูนี้ถูกยกเลิกโดยพนักงานเนื่องจาก มีบางอย่างผิดปกติ', 2, N'แกงเผ็ดน้อย ', CAST(300 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD60418', N'M00002', N'เมนูนี้ถูกยกเลิกโดยพนักงานเนื่องจาก มีบางอย่างผิดปกติ', 1, N'น้ำซุปเข้มข้นน้อย', CAST(97 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD60418', N'M84687', N'เมนูนี้ถูกยกเลิกโดยพนักงานเนื่องจาก มีบางอย่างผิดปกติ', 2, N'แกงเผ็ดน้อย ', CAST(300 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD24554', N'M19059', N'เสริฟแล้ว', 1, N'แกงเผ็ดปานกลาง ', CAST(150 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD5295', N'M23169', N'เสริฟแล้ว', 2, N'', CAST(200 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD68244', N'M12330', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD83800', N'M45480', N'เสริฟแล้ว', 1, N'', CAST(60 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD83800', N'M12330', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD83800', N'M84722', N'เสริฟแล้ว', 1, N'ใส่น้ำแข็ง', CAST(10 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD83800', N'M26542', N'เสริฟแล้ว', 1, N'', CAST(40 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD36576', N'M12330', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD86221', N'M12330', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD86221', N'M84722', N'เสริฟแล้ว', 1, N'', CAST(10 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD84552', N'M10259', N'เสริฟแล้ว', 1, N'ใส่วาซาบิ', CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD84552', N'M1673', N'รายการถูกยกเลิก', 1, N'', CAST(60 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD32481', N'M12330', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD32481', N'M23169', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD28495', N'M12330', N'รายการถูกยกเลิก', 1, N'', CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD6016', N'M23169', N'รายการถูกยกเลิก', 1, N'', CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD6016', N'M26542', N'รายการถูกยกเลิก', 1, N'', CAST(40 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD34155', N'M45480', N'รายการถูกยกเลิก', 1, N'', CAST(60 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD78275', N'M26542', N'รายการถูกยกเลิก', 1, N'', CAST(40 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD78275', N'M1673', N'รายการถูกยกเลิก', 1, N'', CAST(60 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD47600', N'M12330', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD47600', N'M19059', N'เสริฟแล้ว', 1, N'', CAST(150 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD27235', N'M39841', N'เสริฟแล้ว', 1, N'', CAST(50 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD16694', N'M52155', N'รายการถูกยกเลิก', 1, N'', CAST(30 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD16694', N'M53413', N'รายการถูกยกเลิก', 2, N'', CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD16694', N'M67301', N'รายการถูกยกเลิก', 2, N'', CAST(80 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD10307', N'M19059', N'เสริฟแล้ว', 2, N'แกงเผ็ดน้อย ', CAST(300 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD97012', N'M33153', N'รายการถูกยกเลิก', 1, N'ใส่วาซาบิ', CAST(299 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD94246', N'M33153', N'เสริฟแล้ว', 1, N'ใส่วาซาบิ', CAST(299 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD58898', N'M84722', N'เสริฟแล้ว', 1, N'ไม่ใส่น้ำแข็ง', CAST(10 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD27538', N'M15580', N'เสริฟแล้ว', 1, N'', CAST(175 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD27538', N'M12330', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD407', N'M12330', N'รายการถูกยกเลิก', 1, N'', CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD407', N'M84722', N'รายการถูกยกเลิก', 1, N'', CAST(10 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD52642', N'M84722', N'เสริฟแล้ว', 1, N'', CAST(10 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD52642', N'M15580', N'เสริฟแล้ว', 1, N'', CAST(175 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD52642', N'M1673', N'เสริฟแล้ว', 1, N'', CAST(60 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD27343', N'M12330', N'รายการถูกยกเลิก', 1, N'', CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD27343', N'M84722', N'รายการถูกยกเลิก', 1, N'', CAST(10 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD80315', N'M84722', N'เสริฟแล้ว', 1, N'', CAST(10 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD48444', N'M12330', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD48444', N'M33153', N'เสริฟแล้ว', 1, N'ใส่วาซาบิ', CAST(299 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD58898', N'M45480', N'เสริฟแล้ว', 1, N'', CAST(60 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD29990', N'M33153', N'เสริฟแล้ว', 1, N'ใส่วาซาบิ', CAST(299 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD29990', N'M26542', N'เสริฟแล้ว', 1, N'', CAST(40 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD29990', N'M66684', N'เสริฟแล้ว', 1, N'ใส่วาซาบิ', CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD20913', N'M45480', N'เสริฟแล้ว', 1, N'', CAST(60 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD9868', N'M19059', N'รายการถูกยกเลิก', 1, N'แกงเผ็ดน้อย ', CAST(150 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD75247', N'M15580', N'เสริฟแล้ว', 1, N'ใส่เส้นราเมง', CAST(175 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD75247', N'M45480', N'เสริฟแล้ว', 1, N'', CAST(60 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD75247', N'M84687', N'เสริฟแล้ว', 1, N'แกงเผ็ดมาก', CAST(150 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD62578', N'M33153', N'เสริฟแล้ว', 1, N'ใส่วาซาบิ', CAST(299 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD80653', N'M12330', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD54158', N'M19059', N'รายการถูกยกเลิก', 1, N'แกงเผ็ดน้อย ', CAST(150 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD23312', N'M84687', N'รายการถูกยกเลิก', 2, N'แกงเผ็ดน้อย ', CAST(300 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD2940', N'M12330', N'รายการถูกยกเลิก', 1, N'', CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD11147', N'M12330', N'เสริฟแล้ว', 1, N'', CAST(100 AS Decimal(18, 0)), N'รีวิวแล้ว')
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD46457', N'M26542', N'เสริฟแล้ว', 1, N'', CAST(40 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD24298', N'M66684', N'รายการถูกยกเลิก', 1, N'ไม่ใส่วาซาบิ', CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[orderDetail_tb] ([orderID], [menuID], [orderDetailStatus], [quantity], [optionValue], [netprice], [addReview]) VALUES (N'OD24298', N'M39841', N'รายการถูกยกเลิก', 1, N'', CAST(50 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P00001', CAST(10 AS Decimal(18, 0)), N'ได้รับแต้ม เนื่องจากเป็นสมาชิกใหม่', CAST(N'2024-09-03T17:55:11.317' AS DateTime), N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P11777', CAST(16 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-09-30T06:33:23.137' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P11834', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-09-30T06:32:13.227' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P12571', CAST(75 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-10-25T04:13:46.717' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P13436', CAST(43 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-10-11T17:35:17.873' AS DateTime), N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P13735', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-11T13:56:19.197' AS DateTime), N'45042483-3c9e-43e8-b3eb-df03598cc654')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P14479', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-09-27T20:51:10.443' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P18325', CAST(5 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T05:28:07.373' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P18695', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-10T05:48:33.327' AS DateTime), N'49e5d90a-abe8-45e8-9227-bf035832287a')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P18747', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-11T13:30:13.740' AS DateTime), N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P18769', CAST(10 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-09-27T20:47:59.897' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P1878', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-09-30T06:32:09.247' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P18919', CAST(16 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-09-30T05:41:13.530' AS DateTime), N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P1942', CAST(23 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-16T10:43:43.087' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P20221', CAST(60 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T08:12:37.883' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P20402', CAST(16 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-30T12:35:26.393' AS DateTime), N'49e5d90a-abe8-45e8-9227-bf035832287a')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P22194', CAST(82 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-12T21:43:00.290' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P23038', CAST(60 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T08:12:38.207' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P23233', CAST(16 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-09-30T06:15:44.507' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P25358', CAST(21 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-11T17:30:15.000' AS DateTime), N'45042483-3c9e-43e8-b3eb-df03598cc654')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P26127', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-09-22T23:50:58.577' AS DateTime), N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P26903', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-10T06:29:27.903' AS DateTime), N'49e5d90a-abe8-45e8-9227-bf035832287a')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P26925', CAST(10 AS Decimal(18, 0)), N'ได้รับแต้ม เนื่องจากเป็นสมาชิกใหม่', CAST(N'2024-10-11T13:35:50.373' AS DateTime), N'45042483-3c9e-43e8-b3eb-df03598cc654')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P26975', CAST(61 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-29T02:53:47.373' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P27045', CAST(10 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-09-27T20:50:10.047' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P27665', CAST(56 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-16T13:30:45.863' AS DateTime), N'45042483-3c9e-43e8-b3eb-df03598cc654')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P28578', CAST(70 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-25T04:22:42.997' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P29559', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-09-30T06:32:14.393' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P31492', CAST(60 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T10:04:33.163' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P32368', CAST(60 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T08:12:37.327' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P34378', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-11T14:04:36.533' AS DateTime), N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P34549', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-09-30T06:32:14.563' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P3460', CAST(5 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T06:04:03.103' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P35643', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-10T05:35:38.013' AS DateTime), N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P37015', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-10T05:53:04.750' AS DateTime), N'49e5d90a-abe8-45e8-9227-bf035832287a')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P37526', CAST(16 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-09-30T06:34:44.087' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P39119', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-09-27T19:50:30.617' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P39796', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-09-30T06:32:13.653' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P40992', CAST(5 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T06:57:16.313' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P41938', CAST(16 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-09-30T07:30:40.677' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P43861', CAST(60 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T09:03:45.797' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P44353', CAST(60 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T08:12:38.207' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P44463', CAST(21 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-15T18:35:31.333' AS DateTime), N'45042483-3c9e-43e8-b3eb-df03598cc654')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P45963', CAST(60 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T08:12:37.760' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P48654', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-10T16:02:34.857' AS DateTime), N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P49533', CAST(0 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-11T17:35:49.510' AS DateTime), N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P52858', CAST(0 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-12T19:34:48.737' AS DateTime), N'45042483-3c9e-43e8-b3eb-df03598cc654')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P53923', CAST(5 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T05:16:57.210' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P54200', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-09-30T06:32:12.620' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P56655', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-10T05:43:49.353' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P5894', CAST(5 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T07:37:19.223' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P59224', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-10T05:35:42.063' AS DateTime), N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P60286', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-11T13:57:43.357' AS DateTime), N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P60798', CAST(10 AS Decimal(18, 0)), N'ได้รับแต้ม เนื่องจากเป็นสมาชิกใหม่', CAST(N'2024-10-03T15:28:01.717' AS DateTime), N'49e5d90a-abe8-45e8-9227-bf035832287a')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P62228', CAST(5 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-12T21:44:53.480' AS DateTime), N'45042483-3c9e-43e8-b3eb-df03598cc654')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P63972', CAST(10 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-09-28T06:07:31.640' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P64395', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-11T12:01:55.170' AS DateTime), N'49e5d90a-abe8-45e8-9227-bf035832287a')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P64773', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-09-27T20:51:21.537' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P66364', CAST(16 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-09-30T05:05:55.577' AS DateTime), N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P70669', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-09-27T19:49:34.380' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P70778', CAST(5 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-15T21:32:49.623' AS DateTime), N'45042483-3c9e-43e8-b3eb-df03598cc654')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P71552', CAST(10 AS Decimal(18, 0)), N'ได้รับแต้ม เนื่องจากเป็นสมาชิกใหม่', CAST(N'2024-10-25T04:22:04.167' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P72384', CAST(16 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-09-30T06:21:59.180' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P72914', CAST(60 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T08:12:38.440' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P73451', CAST(107 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-10-12T21:43:59.853' AS DateTime), N'45042483-3c9e-43e8-b3eb-df03598cc654')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P73670', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-11T11:22:13.557' AS DateTime), N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P75214', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-10T05:47:43.430' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P75467', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-10T05:36:06.257' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P76108', CAST(60 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T08:40:11.333' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P76384', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-11T11:49:25.013' AS DateTime), N'49e5d90a-abe8-45e8-9227-bf035832287a')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P76811', CAST(10 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-09-27T20:50:28.167' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P76987', CAST(57 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-16T07:46:26.677' AS DateTime), N'45042483-3c9e-43e8-b3eb-df03598cc654')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P77954', CAST(5 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T07:56:44.883' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P78026', CAST(60 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T10:05:43.997' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P79188', CAST(29 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-18T09:16:37.053' AS DateTime), N'45042483-3c9e-43e8-b3eb-df03598cc654')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P81597', CAST(5 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T06:41:52.437' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P82613', CAST(10 AS Decimal(18, 0)), N'ได้รับแต้ม เนื่องจากเป็นสมาชิกใหม่', CAST(N'2024-09-23T00:08:39.730' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P84303', CAST(60 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T09:09:53.447' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P85076', CAST(60 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T08:12:37.327' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P86364', CAST(64 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-10-11T15:31:14.370' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P87080', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-09-27T20:56:24.870' AS DateTime), N'7c4da678-541d-49fe-b5a8-e60d9d1ba33f')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P88175', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-11T11:27:22.090' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P89734', CAST(21 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-18T10:17:19.580' AS DateTime), N'49e5d90a-abe8-45e8-9227-bf035832287a')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P9238', CAST(60 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T09:11:00.633' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P92557', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-09-30T06:32:14.157' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P93015', CAST(60 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T08:12:37.327' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P93422', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-10T05:52:06.600' AS DateTime), N'49e5d90a-abe8-45e8-9227-bf035832287a')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P94782', CAST(5 AS Decimal(18, 0)), N'ใช้แต้มในการชำระสินค้า', CAST(N'2024-09-30T06:12:10.970' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P94829', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-11T13:36:24.583' AS DateTime), N'45042483-3c9e-43e8-b3eb-df03598cc654')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P94950', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-10T06:10:45.230' AS DateTime), N'49e5d90a-abe8-45e8-9227-bf035832287a')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P95057', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-10T06:18:51.007' AS DateTime), N'b5a1ad69-0889-4673-b99c-f248c9e9bdd4')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P95798', CAST(58 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-12T18:49:59.320' AS DateTime), N'45042483-3c9e-43e8-b3eb-df03598cc654')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P97783', CAST(5 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-27T06:04:40.493' AS DateTime), N'75103b10-1d96-4438-9af0-440e6aff21e2')
INSERT [dbo].[point_tb] ([pointID], [currentPoint], [description], [createDate], [memberID]) VALUES (N'P99860', CAST(20 AS Decimal(18, 0)), N'ได้รับแต้ม', CAST(N'2024-10-10T06:08:43.093' AS DateTime), N'49e5d90a-abe8-45e8-9227-bf035832287a')
GO
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P105234', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD68244', CAST(107 AS Decimal(18, 0)), CAST(N'2024-10-18T06:43:47.060' AS DateTime), N'CUS269252')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P107165', N'T001', N'ชำระรายการแล้ว', N'QR code', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD28474', CAST(107 AS Decimal(18, 0)), CAST(N'2024-09-28T05:31:48.813' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P123289', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(140 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(75 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD6016', CAST(75 AS Decimal(18, 0)), CAST(N'2024-10-20T17:28:03.630' AS DateTime), N'CUS238588')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P125738', N'T001', N'ชำระรายการแล้ว', N'QR code', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD57168', CAST(107 AS Decimal(18, 0)), CAST(N'2024-10-03T02:16:17.757' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P128686', N'T008', N'ชำระรายการแล้ว', N'เงินสด', CAST(365 AS Decimal(18, 0)), CAST(26 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'STAFT00001', N'OD43773', CAST(391 AS Decimal(18, 0)), CAST(N'2024-10-12T18:36:54.760' AS DateTime), N'CUS000004')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P132566', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD78275', CAST(54 AS Decimal(18, 0)), CAST(N'2024-10-20T17:39:22.107' AS DateTime), N'CUS238588')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P14981', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(299 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(320 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD62578', CAST(320 AS Decimal(18, 0)), CAST(N'2024-10-30T12:18:21.437' AS DateTime), N'CUS304126')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P157794', N'T001', N'ชำระรายการแล้ว', N'QR code', CAST(300 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(321 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD61845', CAST(321 AS Decimal(18, 0)), CAST(N'2024-09-30T05:39:29.353' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P157928', N'T008', N'ชำระรายการแล้ว', N'แต้มคะแนน', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', N'OD57819', CAST(107 AS Decimal(18, 0)), CAST(N'2024-10-12T21:44:15.650' AS DateTime), N'CUS000004')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P195744', N'T008', N'ชำระรายการแล้ว', N'แต้มคะแนน', CAST(40 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(43 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', N'OD89599', CAST(43 AS Decimal(18, 0)), CAST(N'2024-10-11T17:35:30.740' AS DateTime), N'CUS000004')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P243917', N'T001', N'ชำระรายการแล้ว', N'แต้มคะแนน', CAST(15 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', N'OD60846', CAST(16 AS Decimal(18, 0)), CAST(N'2024-09-30T07:29:32.660' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P261015', N'T001', N'ชำระรายการแล้ว', N'QR code', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD28474', CAST(107 AS Decimal(18, 0)), CAST(N'2024-09-28T05:29:48.923' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P276301', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(399 AS Decimal(18, 0)), CAST(28 AS Decimal(18, 0)), CAST(427 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD48444', CAST(427 AS Decimal(18, 0)), CAST(N'2024-10-23T17:16:58.707' AS DateTime), N'CUS123384')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P277519', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(375 AS Decimal(18, 0)), CAST(26 AS Decimal(18, 0)), CAST(401 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD3267', CAST(401 AS Decimal(18, 0)), CAST(N'2024-10-15T21:30:58.627' AS DateTime), N'CUS304126')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P283722', N'T008', N'ชำระรายการแล้ว', N'เงินสด', CAST(150 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(139 AS Decimal(18, 0)), N'STAFT00003', N'OD24554', CAST(161 AS Decimal(18, 0)), CAST(N'2024-10-16T10:46:07.823' AS DateTime), N'CUS563481')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P301436', N'T001', N'ชำระรายการแล้ว', N'เงินสด', CAST(280 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), N'STAFT00001', N'OD97045', CAST(300 AS Decimal(18, 0)), CAST(N'2024-10-12T19:24:16.603' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P302476', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(385 AS Decimal(18, 0)), CAST(27 AS Decimal(18, 0)), CAST(412 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD75247', CAST(412 AS Decimal(18, 0)), CAST(N'2024-10-29T02:48:22.777' AS DateTime), N'CUS357618')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P304655', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(515 AS Decimal(18, 0)), CAST(36 AS Decimal(18, 0)), CAST(551 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD79393', CAST(551 AS Decimal(18, 0)), CAST(N'2024-10-12T21:41:33.497' AS DateTime), N'CUS000004')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P327', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(10 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD80315', CAST(11 AS Decimal(18, 0)), CAST(N'2024-10-20T17:24:57.363' AS DateTime), N'CUS238588')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P33475', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD28495', CAST(54 AS Decimal(18, 0)), CAST(N'2024-10-20T17:24:39.247' AS DateTime), N'CUS238588')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P36435', N'T008', N'ชำระรายการแล้ว', N'เงินสด', CAST(50 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(80 AS Decimal(18, 0)), CAST(26 AS Decimal(18, 0)), N'STAFT00001', N'OD55326', CAST(54 AS Decimal(18, 0)), CAST(N'2024-10-14T10:19:39.660' AS DateTime), N'CUS000004')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P367588', N'T008', N'ชำระรายการแล้ว', N'เงินสด', CAST(50 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(60 AS Decimal(18, 0)), CAST(6 AS Decimal(18, 0)), N'STAFT00003', N'OD2320', CAST(54 AS Decimal(18, 0)), CAST(N'2024-10-15T19:55:09.190' AS DateTime), N'CUS000007')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P38231', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(150 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), CAST(80 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD24298', CAST(80 AS Decimal(18, 0)), CAST(N'2024-10-30T12:34:54.557' AS DateTime), N'CUS304126')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P436075', N'T008', N'ชำระรายการแล้ว', N'เงินสด', CAST(370 AS Decimal(18, 0)), CAST(26 AS Decimal(18, 0)), CAST(400 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), N'STAFT00001', N'OD88659', CAST(396 AS Decimal(18, 0)), CAST(N'2024-10-12T19:18:05.503' AS DateTime), N'CUS000004')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P44607', N'T008', N'ชำระรายการแล้ว', N'แต้มคะแนน', CAST(70 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), CAST(75 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', N'OD58898', CAST(75 AS Decimal(18, 0)), CAST(N'2024-10-25T04:13:57.120' AS DateTime), N'CUS324753')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P450022', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD80653', CAST(107 AS Decimal(18, 0)), CAST(N'2024-10-30T12:30:16.257' AS DateTime), N'CUS304126')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P453562', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(210 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(225 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD83800', CAST(225 AS Decimal(18, 0)), CAST(N'2024-10-18T07:42:16.950' AS DateTime), N'CUS269252')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P454832', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD11147', CAST(107 AS Decimal(18, 0)), CAST(N'2024-10-30T11:59:31.577' AS DateTime), N'CUS304126')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P455091', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(250 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)), CAST(268 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD47600', CAST(268 AS Decimal(18, 0)), CAST(N'2024-10-20T17:45:15.507' AS DateTime), N'CUS238588')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P460913', N'T001', N'ชำระรายการแล้ว', N'เงินสด', CAST(232 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(52 AS Decimal(18, 0)), N'STAFT00001', N'OD49275', CAST(248 AS Decimal(18, 0)), CAST(N'2024-10-12T19:00:20.273' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P463921', N'T001', N'ชำระรายการแล้ว', N'เงินสด', CAST(820 AS Decimal(18, 0)), CAST(57 AS Decimal(18, 0)), CAST(900 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), N'STAFT00001', N'OD34646', CAST(877 AS Decimal(18, 0)), CAST(N'2024-10-12T19:30:51.850' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P476322', N'T001', N'ชำระรายการแล้ว', N'QR code', CAST(215 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(230 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD85357', CAST(230 AS Decimal(18, 0)), CAST(N'2024-09-28T05:26:10.200' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P481731', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(97 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(104 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD54444', CAST(104 AS Decimal(18, 0)), CAST(N'2024-10-15T21:32:15.537' AS DateTime), N'CUS304126')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P510143', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(150 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), CAST(80 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD9868', CAST(80 AS Decimal(18, 0)), CAST(N'2024-10-25T06:58:09.610' AS DateTime), N'CUS518021')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P514808', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(299 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(320 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD94246', CAST(320 AS Decimal(18, 0)), CAST(N'2024-10-25T03:55:47.090' AS DateTime), N'CUS324753')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P532736', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(460 AS Decimal(18, 0)), CAST(32 AS Decimal(18, 0)), CAST(246 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD84552', CAST(246 AS Decimal(18, 0)), CAST(N'2024-10-18T10:09:54.280' AS DateTime), N'CUS269252')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P537545', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(50 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD27235', CAST(54 AS Decimal(18, 0)), CAST(N'2024-10-23T17:19:01.167' AS DateTime), N'CUS123384')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P545667', N'T008', N'ชำระรายการแล้ว', N'เงินสด', CAST(300 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(400 AS Decimal(18, 0)), CAST(79 AS Decimal(18, 0)), N'STAFT00001', N'OD10307', CAST(321 AS Decimal(18, 0)), CAST(N'2024-10-23T19:29:18.423' AS DateTime), N'CUS123384')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P549284', N'T001', N'ชำระรายการแล้ว', N'QR code', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD70695', CAST(107 AS Decimal(18, 0)), CAST(N'2024-09-28T06:50:13.363' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P581689', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(60 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(32 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD34155', CAST(32 AS Decimal(18, 0)), CAST(N'2024-10-20T17:34:26.787' AS DateTime), N'CUS238588')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P585888', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(220 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(235 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD58595', CAST(235 AS Decimal(18, 0)), CAST(N'2024-10-16T10:42:47.207' AS DateTime), N'CUS563481')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P602528', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(210 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(112 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD16694', CAST(112 AS Decimal(18, 0)), CAST(N'2024-10-23T18:47:11.950' AS DateTime), N'CUS123384')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P606730', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(110 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), CAST(118 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD86221', CAST(118 AS Decimal(18, 0)), CAST(N'2024-10-18T08:48:52.657' AS DateTime), N'CUS269252')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P614447', N'T008', N'ชำระรายการแล้ว', N'เงินสด', CAST(245 AS Decimal(18, 0)), CAST(17 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(38 AS Decimal(18, 0)), N'STAFT00001', N'OD52642', CAST(262 AS Decimal(18, 0)), CAST(N'2024-10-20T16:32:52.847' AS DateTime), N'CUS769099')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P622352', N'T001', N'ชำระรายการแล้ว', N'QR code', CAST(272 AS Decimal(18, 0)), CAST(19 AS Decimal(18, 0)), CAST(291 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD11393', CAST(291 AS Decimal(18, 0)), CAST(N'2024-09-28T05:17:44.950' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P637379', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(200 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), CAST(214 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD32481', CAST(214 AS Decimal(18, 0)), CAST(N'2024-10-18T10:16:52.970' AS DateTime), N'CUS943738')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P667629', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(110 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), CAST(59 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD407', CAST(59 AS Decimal(18, 0)), CAST(N'2024-10-18T09:57:50.420' AS DateTime), N'CUS269252')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P681587', N'T001', N'ชำระรายการแล้ว', N'QR code', CAST(265 AS Decimal(18, 0)), CAST(19 AS Decimal(18, 0)), CAST(284 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD99631', CAST(284 AS Decimal(18, 0)), CAST(N'2024-10-05T21:09:11.530' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P686237', N'T008', N'ชำระรายการแล้ว', N'เงินสด', CAST(190 AS Decimal(18, 0)), CAST(13 AS Decimal(18, 0)), CAST(400 AS Decimal(18, 0)), CAST(197 AS Decimal(18, 0)), N'STAFT00003', N'OD79059', CAST(203 AS Decimal(18, 0)), CAST(N'2024-10-12T22:06:53.477' AS DateTime), N'CUS000004')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P697491', N'T008', N'ชำระรายการแล้ว', N'เงินสด', CAST(350 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(400 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), N'STAFT00003', N'OD54046', CAST(375 AS Decimal(18, 0)), CAST(N'2024-10-16T13:25:50.613' AS DateTime), N'CUS123384')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P713215', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(200 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), CAST(214 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD50432', CAST(214 AS Decimal(18, 0)), CAST(N'2024-10-15T18:34:44.857' AS DateTime), N'CUS000007')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P721219', N'T001', N'ชำระรายการแล้ว', N'QRcode', CAST(15 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD20367', CAST(16 AS Decimal(18, 0)), CAST(N'2024-09-30T05:24:55.540' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P73236', N'T001', N'ชำระรายการแล้ว', N'เงินสด', CAST(45 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), N'STAFT00001', N'OD14144', CAST(48 AS Decimal(18, 0)), CAST(N'2024-10-12T18:51:36.813' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P734773', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(40 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(43 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD46457', CAST(43 AS Decimal(18, 0)), CAST(N'2024-10-30T12:24:52.967' AS DateTime), N'CUS304126')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P735256', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(200 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), CAST(214 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD5295', CAST(214 AS Decimal(18, 0)), CAST(N'2024-10-18T06:22:59.033' AS DateTime), N'CUS269252')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P785384', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(275 AS Decimal(18, 0)), CAST(19 AS Decimal(18, 0)), CAST(294 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD27538', CAST(294 AS Decimal(18, 0)), CAST(N'2024-10-18T09:15:29.130' AS DateTime), N'CUS269252')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P802733', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD36576', CAST(107 AS Decimal(18, 0)), CAST(N'2024-10-18T08:32:14.577' AS DateTime), N'CUS269252')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P817654', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(439 AS Decimal(18, 0)), CAST(31 AS Decimal(18, 0)), CAST(470 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD29990', CAST(470 AS Decimal(18, 0)), CAST(N'2024-10-25T04:20:51.707' AS DateTime), N'CUS324753')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P841946', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD2940', CAST(54 AS Decimal(18, 0)), CAST(N'2024-10-25T04:37:39.340' AS DateTime), N'CUS324753')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P857140', N'T008', N'ชำระรายการแล้ว', N'เงินสด', CAST(300 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(179 AS Decimal(18, 0)), N'STAFT00001', N'OD35079', CAST(321 AS Decimal(18, 0)), CAST(N'2024-10-13T14:50:00.220' AS DateTime), N'CUS000004')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P891487', N'T008', N'ชำระรายการแล้ว', N'เงินสด', CAST(50 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(60 AS Decimal(18, 0)), CAST(6 AS Decimal(18, 0)), N'STAFT00001', N'OD20571', CAST(54 AS Decimal(18, 0)), CAST(N'2024-10-12T19:13:27.153' AS DateTime), N'CUS000004')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P923616', N'T001', N'ชำระรายการแล้ว', N'QR code', CAST(97 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(104 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD95437', CAST(104 AS Decimal(18, 0)), CAST(N'2024-09-28T06:48:36.560' AS DateTime), N'CUS000001')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P932409', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(360 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(385 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD83995', CAST(385 AS Decimal(18, 0)), CAST(N'2024-10-16T07:45:48.033' AS DateTime), N'CUS000007')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P934167', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(300 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(161 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD23312', CAST(161 AS Decimal(18, 0)), CAST(N'2024-10-25T03:59:51.767' AS DateTime), N'CUS324753')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P959701', N'T008', N'ชำระรายการแล้ว', N'แต้มคะแนน', CAST(60 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(64 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', N'OD72519', CAST(64 AS Decimal(18, 0)), CAST(N'2024-10-11T15:31:22.977' AS DateTime), N'CUS000004')
INSERT [dbo].[receipt_tb] ([receiptID], [tableID], [paymentStatus], [paymentType], [totalAmount], [totalTax], [cash], [change], [staffID], [orderID], [netTotalAmount], [payDatetime], [customerID]) VALUES (N'P974082', N'T008', N'ชำระรายการแล้ว', N'QR code', CAST(150 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), CAST(80 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'STAFT00001', N'OD54158', CAST(80 AS Decimal(18, 0)), CAST(N'2024-10-20T17:44:03.790' AS DateTime), N'CUS238588')
GO
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R105234', CAST(N'2024-10-18T06:43:47.060' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD68244', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R123289', CAST(N'2024-10-20T17:28:03.630' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD6016', CAST(140 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(75 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R125738', CAST(N'2024-10-03T02:16:17.757' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD57168', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R128686', CAST(N'2024-10-12T18:36:55.893' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD43773', CAST(365 AS Decimal(18, 0)), CAST(26 AS Decimal(18, 0)), CAST(391 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R132566', CAST(N'2024-10-20T17:39:22.107' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD78275', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R14981', CAST(N'2024-10-30T12:18:21.437' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD62578', CAST(299 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(320 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R157794', CAST(N'2024-09-30T05:39:29.357' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD61845', CAST(300 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(321 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R157928', CAST(N'2024-10-12T21:44:15.650' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD57819', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R195744', CAST(N'2024-10-11T17:35:30.740' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD89599', CAST(40 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(43 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R243917', CAST(N'2024-09-30T07:29:32.663' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD60846', CAST(15 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R276301', CAST(N'2024-10-23T17:16:58.707' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD48444', CAST(399 AS Decimal(18, 0)), CAST(28 AS Decimal(18, 0)), CAST(427 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R277519', CAST(N'2024-10-15T21:30:58.627' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD3267', CAST(375 AS Decimal(18, 0)), CAST(26 AS Decimal(18, 0)), CAST(401 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R283722', CAST(N'2024-10-16T10:46:07.823' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD24554', CAST(150 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), CAST(161 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R301436', CAST(N'2024-10-12T19:24:16.603' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD97045', CAST(280 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R302476', CAST(N'2024-10-29T02:48:22.780' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD75247', CAST(385 AS Decimal(18, 0)), CAST(27 AS Decimal(18, 0)), CAST(412 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R304655', CAST(N'2024-10-12T21:41:33.497' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD79393', CAST(515 AS Decimal(18, 0)), CAST(36 AS Decimal(18, 0)), CAST(551 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R327', CAST(N'2024-10-20T17:24:57.363' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD80315', CAST(10 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R33475', CAST(N'2024-10-20T17:24:39.250' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD28495', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R36435', CAST(N'2024-10-14T10:19:39.660' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD55326', CAST(50 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R367588', CAST(N'2024-10-15T19:55:09.190' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD2320', CAST(50 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R38231', CAST(N'2024-10-30T12:34:54.557' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD24298', CAST(150 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), CAST(80 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R436075', CAST(N'2024-10-12T19:18:05.503' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD88659', CAST(370 AS Decimal(18, 0)), CAST(26 AS Decimal(18, 0)), CAST(396 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R44607', CAST(N'2024-10-25T04:13:57.120' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD58898', CAST(70 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), CAST(75 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R450022', CAST(N'2024-10-30T12:30:16.257' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD80653', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R453562', CAST(N'2024-10-18T07:42:16.950' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD83800', CAST(210 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(225 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R454832', CAST(N'2024-10-30T11:59:31.577' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD11147', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R455091', CAST(N'2024-10-20T17:45:15.507' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD47600', CAST(250 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)), CAST(268 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R460082', CAST(N'2024-10-03T02:16:17.750' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD57168', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R460913', CAST(N'2024-10-12T19:00:20.273' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD49275', CAST(232 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), CAST(248 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R463921', CAST(N'2024-10-12T19:30:51.850' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD34646', CAST(820 AS Decimal(18, 0)), CAST(57 AS Decimal(18, 0)), CAST(877 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R476322', CAST(N'2024-09-28T05:26:10.200' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD85357', CAST(215 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(230 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R481731', CAST(N'2024-10-15T21:32:15.537' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD54444', CAST(97 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(104 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R510143', CAST(N'2024-10-25T06:58:09.610' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD9868', CAST(150 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), CAST(80 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R514808', CAST(N'2024-10-25T03:55:47.090' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD94246', CAST(299 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(320 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R532736', CAST(N'2024-10-18T10:09:54.280' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD84552', CAST(460 AS Decimal(18, 0)), CAST(32 AS Decimal(18, 0)), CAST(246 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R537545', CAST(N'2024-10-23T17:19:01.167' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD27235', CAST(50 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R545667', CAST(N'2024-10-23T19:29:18.423' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD10307', CAST(300 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(321 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R549284', CAST(N'2024-09-28T06:50:13.363' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD70695', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R581689', CAST(N'2024-10-20T17:34:26.787' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD34155', CAST(60 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(32 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R585888', CAST(N'2024-10-16T10:42:47.207' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD58595', CAST(220 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(235 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R602528', CAST(N'2024-10-23T18:47:11.950' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD16694', CAST(210 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(112 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R606730', CAST(N'2024-10-18T08:48:52.657' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD86221', CAST(110 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), CAST(118 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R614447', CAST(N'2024-10-20T16:32:52.850' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD52642', CAST(245 AS Decimal(18, 0)), CAST(17 AS Decimal(18, 0)), CAST(262 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R622352', CAST(N'2024-09-28T05:17:44.950' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD11393', CAST(272 AS Decimal(18, 0)), CAST(19 AS Decimal(18, 0)), CAST(291 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R637379', CAST(N'2024-10-18T10:16:52.970' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD32481', CAST(200 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), CAST(214 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R667629', CAST(N'2024-10-18T09:57:50.420' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD407', CAST(110 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), CAST(59 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R681587', CAST(N'2024-10-05T21:09:11.530' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD99631', CAST(265 AS Decimal(18, 0)), CAST(19 AS Decimal(18, 0)), CAST(284 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R686237', CAST(N'2024-10-12T22:06:53.477' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD79059', CAST(190 AS Decimal(18, 0)), CAST(13 AS Decimal(18, 0)), CAST(203 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R697491', CAST(N'2024-10-16T13:25:50.613' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD54046', CAST(350 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(375 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R712860', CAST(N'2024-09-28T05:24:18.203' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD95437', CAST(97 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(104 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R713215', CAST(N'2024-10-15T18:34:44.857' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD50432', CAST(200 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), CAST(214 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R721219', CAST(N'2024-09-30T05:24:55.540' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD20367', CAST(15 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R73236', CAST(N'2024-10-12T18:51:36.813' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD14144', CAST(45 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(48 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R734773', CAST(N'2024-10-30T12:24:52.967' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD46457', CAST(40 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(43 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R735256', CAST(N'2024-10-18T06:22:59.033' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD5295', CAST(200 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), CAST(214 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R785384', CAST(N'2024-10-18T09:15:29.130' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD27538', CAST(275 AS Decimal(18, 0)), CAST(19 AS Decimal(18, 0)), CAST(294 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R802733', CAST(N'2024-10-18T08:32:14.607' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD36576', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R817654', CAST(N'2024-10-25T04:20:51.707' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD29990', CAST(439 AS Decimal(18, 0)), CAST(31 AS Decimal(18, 0)), CAST(470 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R841946', CAST(N'2024-10-25T04:37:39.340' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD2940', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R857140', CAST(N'2024-10-13T14:50:00.220' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD35079', CAST(300 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(321 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R889031', CAST(N'2024-10-03T02:16:17.717' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD57168', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R891487', CAST(N'2024-10-12T19:13:27.153' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD20571', CAST(50 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R917173', CAST(N'2024-09-28T05:01:26.743' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD28474', CAST(100 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(107 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R923616', CAST(N'2024-09-28T06:48:36.560' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD95437', CAST(97 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(104 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R932409', CAST(N'2024-10-16T07:45:48.093' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD83995', CAST(360 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(385 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R934167', CAST(N'2024-10-25T03:59:51.767' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD23312', CAST(300 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(161 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R959701', CAST(N'2024-10-11T15:31:22.977' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD72519', CAST(60 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(64 AS Decimal(18, 0)))
INSERT [dbo].[revenue_tb] ([revenueID], [createDate], [revenueDescritption], [orderID], [totalAmount], [tax], [netAmount]) VALUES (N'R974082', CAST(N'2024-10-20T17:44:03.790' AS DateTime), N'รายได้จากการชำระค่าอาหารและเครื่องดื่ม', N'OD54158', CAST(150 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), CAST(80 AS Decimal(18, 0)))
GO
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV104456', 3, N'M00004', N'รีวิวเรียบร้อยแล้ว', N'CUS000001', N'-')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV123572', 4, N'M84722', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV127113', 4, N'M26542', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV142713', 4, N'M10795', N'รีวิวเรียบร้อยแล้ว', N'CUS123384', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV144364', 5, N'M00001', N'รีวิวเรียบร้อยแล้ว', N'CUS000001', N'-')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV170939', 3, N'M45480', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV176599', 5, N'M1673', N'รีวิวเรียบร้อยแล้ว', N'CUS000001', N'อร่อยๆมากคับ เดียวกลับมาอุดหนุนไหมนะ')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV184905', 4, N'M45480', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV240299', 5, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV251402', 5, N'M26542', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV256251', 4, N'M26542', N'รีวิวเรียบร้อยแล้ว', N'CUS000004', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV26713', 3, N'M39841', N'รีวิวเรียบร้อยแล้ว', N'CUS000004', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV270655', 4, N'M84722', N'รีวิวเรียบร้อยแล้ว', N'CUS769099', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV290968', 4, N'M15580', N'รีวิวเรียบร้อยแล้ว', N'CUS357618', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV302243', 5, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS000004', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV30658', 5, N'M33153', N'รีวิวเรียบร้อยแล้ว', N'CUS123384', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV318980', 5, N'M84722', N'รีวิวเรียบร้อยแล้ว', N'CUS000004', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV324022', 4, N'M10795', N'รีวิวเรียบร้อยแล้ว', N'CUS000004', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV336189', 5, N'M15580', N'รีวิวเรียบร้อยแล้ว', N'CUS769099', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV344619', 4, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS304126', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV36405', 5, N'M00002', N'รีวิวเรียบร้อยแล้ว', N'CUS000001', N'อย่างแซบ')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV374256', 4, N'M39841', N'รีวิวเรียบร้อยแล้ว', N'CUS123384', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV37666', 5, N'M00002', N'รีวิวเรียบร้อยแล้ว', N'CUS000001', N'-')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV390129', 5, N'M84722', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV392506', 5, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV402371', 4, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS943738', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV422245', 3, N'M00004', N'รีวิวเรียบร้อยแล้ว', N'CUS000001', N'-')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV423166', 5, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS238588', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV443358', 5, N'M84722', N'รีวิวเรียบร้อยแล้ว', N'CUS000004', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV445635', 5, N'M26542', N'รีวิวเรียบร้อยแล้ว', N'CUS000004', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV447273', 4, N'M1673', N'รีวิวเรียบร้อยแล้ว', N'CUS000004', N'-')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV460349', 5, N'M45480', N'รีวิวเรียบร้อยแล้ว', N'CUS123384', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV469386', 4, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV483138', 4, N'M84687', N'รีวิวเรียบร้อยแล้ว', N'CUS000007', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV485160', 2, N'M00002', N'รีวิวเรียบร้อยแล้ว', N'CUS304126', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV495808', 1, N'M00001', N'รีวิวเรียบร้อยแล้ว', N'CUS000001', N'-')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV502907', 5, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV513820', 5, N'M00001', N'รีวิวเรียบร้อยแล้ว', N'CUS000001', N'-')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV536175', 5, N'M23169', N'รีวิวเรียบร้อยแล้ว', N'CUS563481', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV547922', 4, N'M00004', N'รีวิวเรียบร้อยแล้ว', N'CUS000001', N'Umai umai very good')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV547975', 3, N'M23169', N'รีวิวเรียบร้อยแล้ว', N'CUS943738', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV551745', 5, N'M15580', N'รีวิวเรียบร้อยแล้ว', N'CUS000004', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV556908', 5, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV569676', 4, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS123384', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV574379', 4, N'M23169', N'รีวิวเรียบร้อยแล้ว', N'CUS000007', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV589690', 5, N'M1673', N'รีวิวเรียบร้อยแล้ว', N'CUS563481', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV600639', 5, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV60463', 5, N'M45480', N'รีวิวเรียบร้อยแล้ว', N'CUS324753', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV611717', 5, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV613349', 4, N'M26542', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV681194', 5, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS304126', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV684194', 5, N'M19059', N'รีวิวเรียบร้อยแล้ว', N'CUS238588', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV6888', 4, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV701324', 4, N'M15580', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV711195', 3, N'M1673', N'รีวิวเรียบร้อยแล้ว', N'CUS769099', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV748969', 5, N'M00001', N'รีวิวเรียบร้อยแล้ว', N'CUS000001', N'-')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV761214', 4, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV772395', 5, N'M19059', N'รีวิวเรียบร้อยแล้ว', N'CUS123384', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV794512', 4, N'M84722', N'รีวิวเรียบร้อยแล้ว', N'CUS324753', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV795167', 4, N'M00001', N'รีวิวเรียบร้อยแล้ว', N'CUS000001', N'-')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV79870', 5, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV824565', 3, N'M00001', N'รีวิวเรียบร้อยแล้ว', N'CUS000001', N'อร่อยแต้ๆเจ้า')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV825775', 4, N'M33153', N'รีวิวเรียบร้อยแล้ว', N'CUS324753', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV826045', 4, N'M12493', N'รีวิวเรียบร้อยแล้ว', N'CUS000004', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV829960', 5, N'M84722', N'รีวิวเรียบร้อยแล้ว', N'CUS238588', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV841341', 5, N'M00004', N'รีวิวเรียบร้อยแล้ว', N'CUS000002', N'-')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV842090', 5, N'M23169', N'รีวิวเรียบร้อยแล้ว', N'CUS000001', N'-')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV863155', 4, N'M1673', N'รีวิวเรียบร้อยแล้ว', N'CUS000004', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV865120', 4, N'M19059', N'รีวิวเรียบร้อยแล้ว', N'CUS000004', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV866099', 4, N'M84722', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV866831', 5, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV877718', 5, N'M84722', N'รีวิวเรียบร้อยแล้ว', N'CUS269252', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV930154', 4, N'M66684', N'รีวิวเรียบร้อยแล้ว', N'CUS123384', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV955788', 5, N'M12330', N'รีวิวเรียบร้อยแล้ว', N'CUS304126', NULL)
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV958557', 3, N'M00001', N'รีวิวเรียบร้อยแล้ว', N'CUS000001', N'-')
INSERT [dbo].[review_tb] ([reviewID], [rate], [menuID], [isReview], [customerID], [massage]) VALUES (N'RV967760', 5, N'M19059', N'รีวิวเรียบร้อยแล้ว', N'CUS563481', NULL)
GO
INSERT [dbo].[staft_tb] ([staftID], [firstName], [lastName], [phone], [createDate], [updateDate], [userID], [email], [password], [roleName], [accountStatus], [jobType]) VALUES (N'STAFT00001', N'มยุรินา', N'ศรีจำปา', N'0989876543', CAST(N'2024-09-24T10:16:46.027' AS DateTime), CAST(N'2024-09-25T00:46:06.467' AS DateTime), N'9107f703-4bf0-4a92-ae1b-8e5aeb17f56b', N'mayurina@gmail.com', N'mayurin@22', N'พนักงาน', N'ออกจากระบบ', N'ประจำ')
INSERT [dbo].[staft_tb] ([staftID], [firstName], [lastName], [phone], [createDate], [updateDate], [userID], [email], [password], [roleName], [accountStatus], [jobType]) VALUES (N'STAFT00002', N'แพรทองทาน', N'ชินวัต', N'0909865456', CAST(N'2024-08-29T07:44:27.653' AS DateTime), CAST(N'2024-08-29T07:44:27.673' AS DateTime), N'bb9f48d0-8432-411c-85c0-e9fd42697583', N'pareTong@ku.th', N'IAMAPM', N'พนักงาน', N'ออกจากระบบ', N'ประจำ')
INSERT [dbo].[staft_tb] ([staftID], [firstName], [lastName], [phone], [createDate], [updateDate], [userID], [email], [password], [roleName], [accountStatus], [jobType]) VALUES (N'STAFT00003', N'จีน่านี้', N'ลาล่า', N'0987656543', CAST(N'2024-09-03T17:56:03.390' AS DateTime), CAST(N'2024-10-16T13:42:19.577' AS DateTime), N'03fd3b94-312d-4aa4-89c6-6f62812c79c6', N'Jina@gmail.com', N'smorn3434', N'พนักงาน', N'ออกจากระบบ', N'ชั่วคราว')
GO
INSERT [dbo].[table_tb] ([tableID], [tableStatus], [seat], [seatType], [customerID]) VALUES (N'T001      ', N'ว่าง', 2, N'โต๊ะเก้าอี้', NULL)
INSERT [dbo].[table_tb] ([tableID], [tableStatus], [seat], [seatType], [customerID]) VALUES (N'T002      ', N'มีลูกค้า', 2, N'โต๊ะเก้าอี้', N'CUS000005')
INSERT [dbo].[table_tb] ([tableID], [tableStatus], [seat], [seatType], [customerID]) VALUES (N'T003      ', N'มีลูกค้า', 2, N'โต๊ะเก้าอี้', N'CUS000002')
INSERT [dbo].[table_tb] ([tableID], [tableStatus], [seat], [seatType], [customerID]) VALUES (N'T004      ', N'มีลูกค้า', 2, N'โต๊ะเก้าอี้', N'CUS000003')
INSERT [dbo].[table_tb] ([tableID], [tableStatus], [seat], [seatType], [customerID]) VALUES (N'T005      ', N'มีลูกค้า', 4, N'โต๊ะเก้าอี้', N'CUS000006')
INSERT [dbo].[table_tb] ([tableID], [tableStatus], [seat], [seatType], [customerID]) VALUES (N'T006      ', N'มีลูกค้า', 4, N'โต๊ะเก้าอี้', N'CUS000008')
INSERT [dbo].[table_tb] ([tableID], [tableStatus], [seat], [seatType], [customerID]) VALUES (N'T007      ', N'ว่าง', 4, N'โต๊ะพื้นทาทามิ', NULL)
INSERT [dbo].[table_tb] ([tableID], [tableStatus], [seat], [seatType], [customerID]) VALUES (N'T008      ', N'ว่าง', 6, N'โต๊ะพื้นทาทามิ', NULL)
INSERT [dbo].[table_tb] ([tableID], [tableStatus], [seat], [seatType], [customerID]) VALUES (N'T009      ', N'ว่าง', 6, N'โต๊ะพื้นทาทามิ', NULL)
INSERT [dbo].[table_tb] ([tableID], [tableStatus], [seat], [seatType], [customerID]) VALUES (N'T010      ', N'ว่าง', 6, N'โต๊ะเก้าอี้', NULL)
GO
ALTER TABLE [dbo].[Cart_tb]  WITH CHECK ADD  CONSTRAINT [FK_Cart_tb_customer_tb] FOREIGN KEY([customerID])
REFERENCES [dbo].[customer_tb] ([customerID])
GO
ALTER TABLE [dbo].[Cart_tb] CHECK CONSTRAINT [FK_Cart_tb_customer_tb]
GO
ALTER TABLE [dbo].[Cart_tb]  WITH CHECK ADD  CONSTRAINT [FK_Cart_tb_menu_tb] FOREIGN KEY([menuID])
REFERENCES [dbo].[menu_tb] ([menuID])
GO
ALTER TABLE [dbo].[Cart_tb] CHECK CONSTRAINT [FK_Cart_tb_menu_tb]
GO
ALTER TABLE [dbo].[Cart_tb]  WITH CHECK ADD  CONSTRAINT [FK_Cart_tb_table_tb] FOREIGN KEY([tableID])
REFERENCES [dbo].[table_tb] ([tableID])
GO
ALTER TABLE [dbo].[Cart_tb] CHECK CONSTRAINT [FK_Cart_tb_table_tb]
GO
ALTER TABLE [dbo].[member_tb]  WITH CHECK ADD  CONSTRAINT [FK_member_tb_Authentication_tb] FOREIGN KEY([userID])
REFERENCES [dbo].[Authentication_tb] ([userID])
GO
ALTER TABLE [dbo].[member_tb] CHECK CONSTRAINT [FK_member_tb_Authentication_tb]
GO
ALTER TABLE [dbo].[menu_tb]  WITH CHECK ADD  CONSTRAINT [FK_menu_tb_option_tb] FOREIGN KEY([optionID])
REFERENCES [dbo].[option_tb] ([optionID])
GO
ALTER TABLE [dbo].[menu_tb] CHECK CONSTRAINT [FK_menu_tb_option_tb]
GO
ALTER TABLE [dbo].[notification_tb]  WITH CHECK ADD  CONSTRAINT [FK_notification_tb_table_tb] FOREIGN KEY([tableID])
REFERENCES [dbo].[table_tb] ([tableID])
GO
ALTER TABLE [dbo].[notification_tb] CHECK CONSTRAINT [FK_notification_tb_table_tb]
GO
ALTER TABLE [dbo].[orderDetail_tb]  WITH CHECK ADD  CONSTRAINT [FK_orderDetail_tb_menu_tb1] FOREIGN KEY([menuID])
REFERENCES [dbo].[menu_tb] ([menuID])
GO
ALTER TABLE [dbo].[orderDetail_tb] CHECK CONSTRAINT [FK_orderDetail_tb_menu_tb1]
GO
ALTER TABLE [dbo].[orderDetail_tb]  WITH CHECK ADD  CONSTRAINT [FK_orderDetail_tb_order_tb1] FOREIGN KEY([orderID])
REFERENCES [dbo].[order_tb] ([orderID])
GO
ALTER TABLE [dbo].[orderDetail_tb] CHECK CONSTRAINT [FK_orderDetail_tb_order_tb1]
GO
ALTER TABLE [dbo].[point_tb]  WITH CHECK ADD  CONSTRAINT [FK_point_tb_member_tb] FOREIGN KEY([memberID])
REFERENCES [dbo].[member_tb] ([memberID])
GO
ALTER TABLE [dbo].[point_tb] CHECK CONSTRAINT [FK_point_tb_member_tb]
GO
ALTER TABLE [dbo].[receipt_tb]  WITH CHECK ADD  CONSTRAINT [FK_receipt_tb_order_tb] FOREIGN KEY([orderID])
REFERENCES [dbo].[order_tb] ([orderID])
GO
ALTER TABLE [dbo].[receipt_tb] CHECK CONSTRAINT [FK_receipt_tb_order_tb]
GO
ALTER TABLE [dbo].[receipt_tb]  WITH CHECK ADD  CONSTRAINT [FK_receipt_tb_table_tb] FOREIGN KEY([tableID])
REFERENCES [dbo].[table_tb] ([tableID])
GO
ALTER TABLE [dbo].[receipt_tb] CHECK CONSTRAINT [FK_receipt_tb_table_tb]
GO
ALTER TABLE [dbo].[revenue_tb]  WITH CHECK ADD  CONSTRAINT [FK_revenue_tb_order_tb] FOREIGN KEY([orderID])
REFERENCES [dbo].[order_tb] ([orderID])
GO
ALTER TABLE [dbo].[revenue_tb] CHECK CONSTRAINT [FK_revenue_tb_order_tb]
GO
ALTER TABLE [dbo].[review_tb]  WITH CHECK ADD  CONSTRAINT [FK_review_tb_menu_tb] FOREIGN KEY([menuID])
REFERENCES [dbo].[menu_tb] ([menuID])
GO
ALTER TABLE [dbo].[review_tb] CHECK CONSTRAINT [FK_review_tb_menu_tb]
GO
USE [master]
GO
ALTER DATABASE [DB_restaurant] SET  READ_WRITE 
GO
