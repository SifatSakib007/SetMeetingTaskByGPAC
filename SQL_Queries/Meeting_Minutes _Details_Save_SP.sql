CREATE PROCEDURE [dbo].[Meeting_Minutes_Details_Save_SP]
    @MeetingId INT,
    @ProductId INT,
    @Quantity INT,
    @Unit VARCHAR(50)
AS
BEGIN
    INSERT INTO Meeting_Minutes_Details_Tbl 
        (MeetingId, ProductId, Quantity, Unit)
    VALUES 
        (@MeetingId, @ProductId, @Quantity, @Unit);
END;

