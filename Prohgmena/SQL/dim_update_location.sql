SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dim_location_update
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO DIM_LOCATION(id, weather_cond, road_type, road_surf, district) 
	SELECT acc.id, wl.val, rl.val, rsl.val, dl.val FROM Accidents as acc
	INNER JOIN Weather_Lookup as wl ON wl.id = acc.Weather_cond
	INNER JOIN Road_Type_Lookup as rl ON rl.id = acc.Road_type
	INNER JOIN Road_Surface_Lookup as rsl ON rsl.id = acc.Road_surface
	INNER JOIN District_Lookup as dl ON dl.id = acc.District;
END
GO