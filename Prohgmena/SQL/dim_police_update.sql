SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dim_police_update
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO DIM_POLICE (id, Police_force, Police_attend, Severity) 
	SELECT  acc.id, 
			pl.val, 
			CASE Police_attend 
				WHEN 1 THEN 'YES' 
			ELSE 'NO'
			END,
			sv.val
	FROM Accidents as acc
	INNER JOIN Police_force_Lookup as pl ON acc.Police_force = pl.id
	INNER JOIN Severity_Lookup as sv ON sv.id = acc.Severity;
END
GO
