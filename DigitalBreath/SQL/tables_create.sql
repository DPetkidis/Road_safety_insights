USE ProDigitalBreath;


-- table Digital Breath
CREATE TABLE Digital_Breath (

	id INT IDENTITY(1,1) PRIMARY KEY,
	Reason varchar(30) CHECK (Reason <> 'Unknown'),
	Month varchar(4),
	Year varchar(4),
	WeekType varchar(8) CHECK (WeekType IN ('Weekday', 'Weekend')), 
	TimeBand varchar(10) CHECK (TimeBand <> 'Unknown'),
	BreathAlcoholLevel INT,
	AgeBand varchar(6) CHECK(AgeBand NOT IN ('Other', 'Unknown')),
	Gender varchar(6) CHECK(Gender IN ('Female', 'Male'))
);