USE [master]
GO
/****** Object:  Database [SetMeetingDb]    Script Date: 10/13/2024 12:53:51 PM ******/
CREATE DATABASE [SetMeetingDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SetMeetingDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SetMeetingDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SetMeetingDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SetMeetingDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SetMeetingDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SetMeetingDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SetMeetingDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SetMeetingDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SetMeetingDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SetMeetingDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SetMeetingDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SetMeetingDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SetMeetingDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SetMeetingDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SetMeetingDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SetMeetingDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SetMeetingDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SetMeetingDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SetMeetingDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SetMeetingDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SetMeetingDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SetMeetingDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SetMeetingDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SetMeetingDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SetMeetingDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SetMeetingDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SetMeetingDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SetMeetingDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SetMeetingDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SetMeetingDb] SET  MULTI_USER 
GO
ALTER DATABASE [SetMeetingDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SetMeetingDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SetMeetingDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SetMeetingDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SetMeetingDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SetMeetingDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SetMeetingDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [SetMeetingDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SetMeetingDb]
GO
/****** Object:  Table [dbo].[Corporate_Customer_Tbl]    Script Date: 10/13/2024 12:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Corporate_Customer_Tbl](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Individual_Customer_Tbl]    Script Date: 10/13/2024 12:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Individual_Customer_Tbl](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meeting_Minutes_Details_Tbl]    Script Date: 10/13/2024 12:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meeting_Minutes_Details_Tbl](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[MeetingId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Unit] [varchar](50) NOT NULL,
	[ProductName] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meeting_Minutes_Master_Tbl]    Script Date: 10/13/2024 12:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meeting_Minutes_Master_Tbl](
	[MeetingId] [int] IDENTITY(1,1) NOT NULL,
	[MeetingDate] [datetime] NULL,
	[MeetingPlace] [varchar](50) NOT NULL,
	[AttendsClient] [varchar](150) NOT NULL,
	[AttendsHost] [varchar](150) NOT NULL,
	[Agenda] [varchar](150) NOT NULL,
	[Discussion] [varchar](max) NOT NULL,
	[Decision] [varchar](max) NOT NULL,
	[CustomerName] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[MeetingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_Service_Tbl]    Script Date: 10/13/2024 12:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Service_Tbl](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Unit] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Corporate_Customer_Tbl] ON 

INSERT [dbo].[Corporate_Customer_Tbl] ([CustomerId], [CustomerName]) VALUES (1, N'ABC Corp')
INSERT [dbo].[Corporate_Customer_Tbl] ([CustomerId], [CustomerName]) VALUES (2, N'Global Tech Solutions')
INSERT [dbo].[Corporate_Customer_Tbl] ([CustomerId], [CustomerName]) VALUES (3, N'XYZ Enterprises')
INSERT [dbo].[Corporate_Customer_Tbl] ([CustomerId], [CustomerName]) VALUES (4, N'Infinity Group')
INSERT [dbo].[Corporate_Customer_Tbl] ([CustomerId], [CustomerName]) VALUES (5, N'Sigma Consulting')
SET IDENTITY_INSERT [dbo].[Corporate_Customer_Tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[Individual_Customer_Tbl] ON 

INSERT [dbo].[Individual_Customer_Tbl] ([CustomerId], [CustomerName]) VALUES (1, N'John Doe')
INSERT [dbo].[Individual_Customer_Tbl] ([CustomerId], [CustomerName]) VALUES (2, N'Jane Smith')
INSERT [dbo].[Individual_Customer_Tbl] ([CustomerId], [CustomerName]) VALUES (3, N'Michael Johnson')
INSERT [dbo].[Individual_Customer_Tbl] ([CustomerId], [CustomerName]) VALUES (4, N'Emily Davis')
INSERT [dbo].[Individual_Customer_Tbl] ([CustomerId], [CustomerName]) VALUES (5, N'Chris Evans')
SET IDENTITY_INSERT [dbo].[Individual_Customer_Tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[Meeting_Minutes_Details_Tbl] ON 

INSERT [dbo].[Meeting_Minutes_Details_Tbl] ([DetailId], [MeetingId], [Quantity], [Unit], [ProductName]) VALUES (11, 19, 3, N'Hours', N'Consulting Service')
INSERT [dbo].[Meeting_Minutes_Details_Tbl] ([DetailId], [MeetingId], [Quantity], [Unit], [ProductName]) VALUES (12, 20, 3, N'GB', N'Cloud Storage')
INSERT [dbo].[Meeting_Minutes_Details_Tbl] ([DetailId], [MeetingId], [Quantity], [Unit], [ProductName]) VALUES (13, 20, 6, N'Months', N'Maintenance Support')
INSERT [dbo].[Meeting_Minutes_Details_Tbl] ([DetailId], [MeetingId], [Quantity], [Unit], [ProductName]) VALUES (14, 21, 3, N'Hours', N'Consulting Service')
INSERT [dbo].[Meeting_Minutes_Details_Tbl] ([DetailId], [MeetingId], [Quantity], [Unit], [ProductName]) VALUES (15, 22, 3, N'Months', N'Maintenance Support')
SET IDENTITY_INSERT [dbo].[Meeting_Minutes_Details_Tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[Meeting_Minutes_Master_Tbl] ON 

INSERT [dbo].[Meeting_Minutes_Master_Tbl] ([MeetingId], [MeetingDate], [MeetingPlace], [AttendsClient], [AttendsHost], [Agenda], [Discussion], [Decision], [CustomerName]) VALUES (13, CAST(N'2024-10-14T00:00:00.000' AS DateTime), N'feaf', N'efae', N'faef', N'aefa', N'efaefae', N'faefa', N'Global Tech Solutions')
INSERT [dbo].[Meeting_Minutes_Master_Tbl] ([MeetingId], [MeetingDate], [MeetingPlace], [AttendsClient], [AttendsHost], [Agenda], [Discussion], [Decision], [CustomerName]) VALUES (14, CAST(N'2024-11-09T00:00:00.000' AS DateTime), N'eafe', N'faef', N'aefae', N'faf', N'fae', N'faef', N'John Doe')
INSERT [dbo].[Meeting_Minutes_Master_Tbl] ([MeetingId], [MeetingDate], [MeetingPlace], [AttendsClient], [AttendsHost], [Agenda], [Discussion], [Decision], [CustomerName]) VALUES (15, CAST(N'2024-10-09T00:00:00.000' AS DateTime), N'feaf', N'efa', N'efaef', N'aefa', N'efaef', N'aef', N'Global Tech Solutions')
INSERT [dbo].[Meeting_Minutes_Master_Tbl] ([MeetingId], [MeetingDate], [MeetingPlace], [AttendsClient], [AttendsHost], [Agenda], [Discussion], [Decision], [CustomerName]) VALUES (16, CAST(N'2024-10-15T00:00:00.000' AS DateTime), N'ef', N'fzef', N'zesdfzf', N'zef', N'zgfb', N'bxf', N'Global Tech Solutions')
INSERT [dbo].[Meeting_Minutes_Master_Tbl] ([MeetingId], [MeetingDate], [MeetingPlace], [AttendsClient], [AttendsHost], [Agenda], [Discussion], [Decision], [CustomerName]) VALUES (17, CAST(N'2024-10-17T00:00:00.000' AS DateTime), N'fef', N'faefae', N'fafe', N'f', N'aefa', N'efae', N'ABC Corp')
INSERT [dbo].[Meeting_Minutes_Master_Tbl] ([MeetingId], [MeetingDate], [MeetingPlace], [AttendsClient], [AttendsHost], [Agenda], [Discussion], [Decision], [CustomerName]) VALUES (18, CAST(N'2024-10-22T00:00:00.000' AS DateTime), N'grg', N'rgr', N'grg', N'rgrgr', N'gr', N'gr', N'Global Tech Solutions')
INSERT [dbo].[Meeting_Minutes_Master_Tbl] ([MeetingId], [MeetingDate], [MeetingPlace], [AttendsClient], [AttendsHost], [Agenda], [Discussion], [Decision], [CustomerName]) VALUES (19, CAST(N'2024-10-11T00:00:00.000' AS DateTime), N'rgs', N'rgsrgs', N'rgsrg', N'sr', N'gsrg', N'sg', N'XYZ Enterprises')
INSERT [dbo].[Meeting_Minutes_Master_Tbl] ([MeetingId], [MeetingDate], [MeetingPlace], [AttendsClient], [AttendsHost], [Agenda], [Discussion], [Decision], [CustomerName]) VALUES (20, CAST(N'2024-10-23T00:00:00.000' AS DateTime), N'Dhaka', N'Mr. Sohel', N'Mr. Salman', N'Plan to Cox''s Bazar.', N'Keep all the necessary things.', N'Going.', N'')
INSERT [dbo].[Meeting_Minutes_Master_Tbl] ([MeetingId], [MeetingDate], [MeetingPlace], [AttendsClient], [AttendsHost], [Agenda], [Discussion], [Decision], [CustomerName]) VALUES (21, CAST(N'2024-10-15T00:00:00.000' AS DateTime), N'Jatrabari', N'Mr. Akram', N'Mr. Shoaib', N'Nothing serious', N'we need to be serious about everything', N'We are serious now', N'XYZ Enterprises')
INSERT [dbo].[Meeting_Minutes_Master_Tbl] ([MeetingId], [MeetingDate], [MeetingPlace], [AttendsClient], [AttendsHost], [Agenda], [Discussion], [Decision], [CustomerName]) VALUES (22, CAST(N'2024-10-15T00:00:00.000' AS DateTime), N'Jatrabari', N'Mr. Akram', N'Mr. Shoaib', N'Nothing serious', N'we need to be serious about everything', N'We are serious now', N'Michael Johnson')
SET IDENTITY_INSERT [dbo].[Meeting_Minutes_Master_Tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[Products_Service_Tbl] ON 

INSERT [dbo].[Products_Service_Tbl] ([ProductId], [ProductName], [Unit]) VALUES (1, N'Consulting Service', N'Hours')
INSERT [dbo].[Products_Service_Tbl] ([ProductId], [ProductName], [Unit]) VALUES (2, N'Software Development', N'Project')
INSERT [dbo].[Products_Service_Tbl] ([ProductId], [ProductName], [Unit]) VALUES (3, N'Maintenance Support', N'Months')
INSERT [dbo].[Products_Service_Tbl] ([ProductId], [ProductName], [Unit]) VALUES (4, N'Cloud Storage', N'GB')
INSERT [dbo].[Products_Service_Tbl] ([ProductId], [ProductName], [Unit]) VALUES (5, N'Cybersecurity Service', N'Hours')
SET IDENTITY_INSERT [dbo].[Products_Service_Tbl] OFF
GO
ALTER TABLE [dbo].[Meeting_Minutes_Details_Tbl]  WITH CHECK ADD FOREIGN KEY([MeetingId])
REFERENCES [dbo].[Meeting_Minutes_Master_Tbl] ([MeetingId])
GO
/****** Object:  StoredProcedure [dbo].[Meeting_Minutes_Details_Save_SP]    Script Date: 10/13/2024 12:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Meeting_Minutes_Details_Save_SP]
    @MeetingId INT,
    @ProductName NVARCHAR(150),
    @Quantity INT,
    @Unit VARCHAR(50)
AS
BEGIN
    INSERT INTO Meeting_Minutes_Details_Tbl 
        (MeetingId, ProductName, Quantity, Unit)
    VALUES 
        (@MeetingId, @ProductName, @Quantity, @Unit);
END;

GO
/****** Object:  StoredProcedure [dbo].[Meeting_Minutes_Master_Save_SP]    Script Date: 10/13/2024 12:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Meeting_Minutes_Master_Save_SP]
    @CustomerName NVARCHAR(150),  -- New parameter for CustomerName
    @MeetingDate DATETIME,
    @MeetingPlace VARCHAR(50),
    @AttendsClient VARCHAR(150),
    @AttendsHost VARCHAR(150),
    @Agenda VARCHAR(150),
    @Discussion VARCHAR(MAX),
    @Decision VARCHAR(MAX)
	
AS
BEGIN
    -- Insert statement with CustomerName instead of CustomerId
    INSERT INTO Meeting_Minutes_Master_Tbl 
        (CustomerName, MeetingDate, MeetingPlace, AttendsClient, AttendsHost, Agenda, Discussion, Decision)
    VALUES 
        (@CustomerName, @MeetingDate, @MeetingPlace, @AttendsClient, @AttendsHost, @Agenda, @Discussion, @Decision);

    -- Return the ID of the newly inserted record
    SELECT SCOPE_IDENTITY() AS NewMeetingId;
END;
GO
USE [master]
GO
ALTER DATABASE [SetMeetingDb] SET  READ_WRITE 
GO
