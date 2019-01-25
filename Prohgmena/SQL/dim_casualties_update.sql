SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dim_casualties_update
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO DIM_CASUALTIES(id, veh_id, cas_ref, cas_sex, cas_sev) 
	SELECT c.acc_id, c.veh_id, c.cas_id, sl.val, svl.val FROM Casualties as c
	INNER JOIN Sex_Lookup as sl ON sl.id = c.cas_sex
	INNER JOIN Severity_Lookup as svl ON svl.id = c.cas_sev;
END
GO