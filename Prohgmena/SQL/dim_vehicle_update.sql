SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dim_vehicle_update
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO DIM_VEHICLE(id, veh_id, veh_type, veh_engine, veh_age) 
	SELECT v.acc_id, v.veh_id, vtl.val, v.engine_cc, v.veh_age  FROM Vehicles as v
	INNER JOIN Vehicle_Type_Lookup as vtl ON vtl.id = v.veh_type;
END
GO