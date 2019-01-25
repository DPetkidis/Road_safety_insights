SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dim_date_update
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO DIM_DATE (id, Date, Day_of_Week, Time) SELECT id, Date, DATENAME(dw, Date), DATEPART(hour, Time) FROM Accidents;
END
GO
