SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dim_age_update
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO DIM_AGE_SEX_DRIVER(id, veh_id, dr_sex, dr_age, dr_age_band) 
	SELECT v.acc_id, v.veh_id, sl.val, v.dr_age, CONCAT((dr_age/10)*10, '-', (dr_age/10 + 1)*10) FROM Vehicles as v
	INNER JOIN Sex_Lookup as sl ON sl.id = v.dr_sex;
END
GO