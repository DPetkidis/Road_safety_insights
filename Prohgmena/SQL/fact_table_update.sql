SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE fact_table_update
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO FACT_TABLE (id, veh_id, cas_ref) 
	SELECT acc_id, veh_id, cas_id FROM Casualties;
END
GO