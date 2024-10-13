CREATE PROCEDURE [dbo].[Meeting_Minutes_Master_Save_SP]
    @CustomerId INT,
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
        (CustomerId, MeetingDate, MeetingPlace, AttendsClient, AttendsHost, Agenda, Discussion, Decision)
    VALUES 
        (@CustomerId, @MeetingDate, @MeetingPlace, @AttendsClient, @AttendsHost, @Agenda, @Discussion, @Decision);

    -- Return the ID of the newly inserted record
    SELECT SCOPE_IDENTITY() AS NewMeetingId;
END;


