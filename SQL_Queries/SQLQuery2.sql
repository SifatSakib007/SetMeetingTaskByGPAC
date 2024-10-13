CREATE TABLE [dbo].[Corporate_Customer_Tbl]
(
    [CustomerId] [int] NOT NULL Primary key identity(1,1),
    [CustomerName] [NVARCHAR](50) NOT NULL
);

CREATE TABLE [dbo].[Individual_Customer_Tbl]
(
    [CustomerId] [int] NOT NULL Primary key identity(1,1),
    [CustomerName] [NVARCHAR](50) NOT NULL
);

CREATE TABLE [dbo].[Products_Service_Tbl]
(
    [ProductId] [int] NOT NULL Primary key identity(1,1),
    [ProductName] [NVARCHAR](50) NOT NULL,
	[Unit] [VARCHAR](50) NOT NULL
);

CREATE TABLE [dbo].[Meeting_Minutes_Master_Tbl]
(
    [MeetingId] [int] NOT NULL Primary key identity(1,1),
    [CustomerId] [int] NOT NULL,
	[MeetingDate] [DATETIME],
	[MeetingPlace] [VARCHAR](50) NOT NULL,
	[AttendsClient] [VARCHAR](150) NOT NULL,
	[AttendsHost] [VARCHAR](150) NOT NULL,
	[Agenda] [VARCHAR](150) NOT NULL,
	[Discussion] [VARCHAR](MAX) NOT NULL,
	[Decision] [VARCHAR](MAX) NOT NULL,
	FOREIGN KEY (CustomerId) REFERENCES Corporate_Customer_Tbl(CustomerId)    
);

CREATE TABLE [dbo].[Meeting_Minutes_Details_Tbl]
(
    [DetailId] [int] NOT NULL Primary key identity(1,1),
    [MeetingId] [int],
	[ProductId] [int],
	[Quantity] [int] NOT NULL,
	[Unit] [VARCHAR] NOT NULL,
	FOREIGN KEY (MeetingId) REFERENCES Meeting_Minutes_Master_Tbl(MeetingId),
    FOREIGN KEY (ProductId) REFERENCES Products_Service_Tbl(ProductId)
);