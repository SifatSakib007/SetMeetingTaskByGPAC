USE [SetMeetingDb]
GO
/****** Object:  StoredProcedure [dbo].[Meeting_Minutes_Details_Save_SP]    Script Date: 10/13/2024 12:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Meeting_Minutes_Details_Save_SP]
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

