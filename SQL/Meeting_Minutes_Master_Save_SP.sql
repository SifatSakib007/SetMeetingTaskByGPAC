USE [SetMeetingDb]
GO
/****** Object:  StoredProcedure [dbo].[Meeting_Minutes_Master_Save_SP]    Script Date: 10/13/2024 12:55:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Meeting_Minutes_Master_Save_SP]
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
