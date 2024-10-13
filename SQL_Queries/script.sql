USE [master]
GO
/****** Object:  Database [SetMeetingDb]    Script Date: 6/3/2024 4:38:49 PM ******/
CREATE DATABASE [SetMeetingDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SetMeetingDb', FILENAME = N'E:\SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SetMeetingDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SetMeetingDb_log', FILENAME = N'E:\SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SetMeetingDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [SetMeetingDb] SET RECOVERY FULL 
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
EXEC sys.sp_db_vardecimal_storage_format N'SetMeetingDb', N'ON'
GO
ALTER DATABASE [SetMeetingDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [SetMeetingDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SetMeetingDb]
GO
/****** Object:  Table [dbo].[Corporate_Customer_Tbl]    Script Date: 6/3/2024 4:38:49 PM ******/
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
/****** Object:  Table [dbo].[Individual_Customer_Tbl]    Script Date: 6/3/2024 4:38:49 PM ******/
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
/****** Object:  Table [dbo].[Meeting_Minutes_Details_Tbl]    Script Date: 6/3/2024 4:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meeting_Minutes_Details_Tbl](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Unit] [varchar](50) NULL,
	[ProductName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meeting_Minutes_Master_Tbl]    Script Date: 6/3/2024 4:38:49 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[MeetingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_Service_Tbl]    Script Date: 6/3/2024 4:38:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Meeting_Minutes_Details_Delete]    Script Date: 6/3/2024 4:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Meeting_Minutes_Details_Delete]
    @DetailId INT
AS
BEGIN
    DELETE FROM Meeting_Minutes_Details_Tbl WHERE DetailId = @DetailId;
END;
GO
/****** Object:  StoredProcedure [dbo].[Meeting_Minutes_Details_GetById]    Script Date: 6/3/2024 4:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Meeting_Minutes_Details_GetById]
    @DetailId INT
AS
BEGIN
    SELECT * FROM Meeting_Minutes_Details_Tbl WHERE DetailId = @DetailId;
END;
GO
/****** Object:  StoredProcedure [dbo].[Meeting_Minutes_Details_Insert]    Script Date: 6/3/2024 4:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Meeting_Minutes_Details_Insert]
    @MeetingId INT,
    @ProductId INT,
    @Quantity INT,
    @Unit VARCHAR(50)
AS
BEGIN
    INSERT INTO Meeting_Minutes_Details_Tbl (MeetingId, ProductId, Quantity, Unit)
    VALUES (@MeetingId, @ProductId, @Quantity, @Unit);
END;
GO
/****** Object:  StoredProcedure [dbo].[Meeting_Minutes_Details_Save_SP]    Script Date: 6/3/2024 4:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Meeting_Minutes_Details_Save_SP]
   
    
    @Quantity INT,
    @Unit VARCHAR(50),
	@ProductName VARCHAR(100)
AS
BEGIN
    INSERT INTO Meeting_Minutes_Details_Tbl 
        ( Quantity, Unit, ProductName)
    VALUES 
        (  @Quantity, @Unit, @ProductName);
END;
GO
/****** Object:  StoredProcedure [dbo].[Meeting_Minutes_Details_Update]    Script Date: 6/3/2024 4:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Meeting_Minutes_Details_Update]
    @DetailId INT,
    @MeetingId INT,
    @ProductId INT,
    @Quantity INT,
    @Unit VARCHAR(50)
AS
BEGIN
    UPDATE Meeting_Minutes_Details_Tbl 
    SET MeetingId = @MeetingId,
        ProductId = @ProductId,
        Quantity = @Quantity,
        Unit = @Unit
    WHERE DetailId = @DetailId;
END;
GO
/****** Object:  StoredProcedure [dbo].[Meeting_Minutes_Master_Save_SP]    Script Date: 6/3/2024 4:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Meeting_Minutes_Master_Save_SP]
    @MeetingDate DATETIME,
    @MeetingPlace VARCHAR(50),
    @AttendsClient VARCHAR(150),
    @AttendsHost VARCHAR(150),
    @Agenda VARCHAR(150),
    @Discussion VARCHAR(MAX),
    @Decision VARCHAR(MAX)
AS
BEGIN
    INSERT INTO Meeting_Minutes_Master_Tbl 
        (MeetingDate, MeetingPlace, AttendsClient, AttendsHost, Agenda, Discussion, Decision)
    VALUES 
        (@MeetingDate, @MeetingPlace, @AttendsClient, @AttendsHost, @Agenda, @Discussion, @Decision);

    -- Return the ID of the newly inserted record
    SELECT SCOPE_IDENTITY() AS NewMeetingId;
END;
GO
/****** Object:  StoredProcedure [dbo].[View_Meeting_Minutes_Details_Save_SP]    Script Date: 6/3/2024 4:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[View_Meeting_Minutes_Details_Save_SP]  
as    
Begin    
    select *    
    from Meeting_Minutes_Details_Tbl       
End
GO
USE [master]
GO
ALTER DATABASE [SetMeetingDb] SET  READ_WRITE 
GO
