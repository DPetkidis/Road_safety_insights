Use Prohgmena;

-- table dimmension date
CREATE TABLE DIM_DATE (

	id char(14) NOT NULL,
	Date date NOT NULL,
	Day_of_Week VARCHAR(25) NOT NULL,
	Time int NOT NULL,

	PRIMARY KEY(id)
);

-- table dimmension police
CREATE TABLE DIM_POLICE (

	id char(14) NOT NULL,
	Police_force varchar(50) NOT NULL,
	Police_attend varchar(4) NOT NULL,
	Severity varchar(25) NOT NULL,

	PRIMARY KEY(id)
);

-- table dimmension driver
CREATE TABLE DIM_AGE_SEX_DRIVER (

	id char(14) NOT NULL,
	veh_id TINYINT NOT NULL,

	dr_sex VARCHAR(15) NOT NULL,
	dr_age SMALLINT NOT NULL,
	dr_age_band VARCHAR(15) NOT NULL,

	PRIMARY KEY(id, veh_id)
);

-- table dimmension vehicle
CREATE TABLE DIM_VEHICLE (

	id char(14) NOT NULL,
	veh_id TINYINT NOT NULL,

	veh_type VARCHAR(100) NOT NULL,
	veh_engine INT NOT NULL,
	veh_age SMALLINT NOT NULL,

	PRIMARY KEY(id, veh_id)
);

-- table dimmension vehicle
CREATE TABLE DIM_LOCATION (

	id char(14) NOT NULL,

	weather_cond VARCHAR(50) NOT NULL,
	road_type VARCHAR(30) NOT NULL,
	road_surf VARCHAR(50) NOT NULL,
	district VARCHAR(50) NOT NULL,

	PRIMARY KEY(id)
);


CREATE TABLE DIM_CASUALTIES (

	id char(14) NOT NULL,
	veh_id TINYINT NOT NULL,
	cas_ref TINYINT NOT NULL,

	cas_sex VARCHAR(15) NOT NULL,
	cas_sev VARCHAR(25) NOT NULL,
	
	PRIMARY KEY (id, veh_id, cas_ref),
	CONSTRAINT fk_dcas_veh FOREIGN KEY (id, veh_id) REFERENCES DIM_VEHICLE(id, veh_id)
);


CREATE TABLE FACT_TABLE (

	id char(14) NOT NULL,
	veh_id TINYINT NOT NULL,
	cas_ref TINYINT NOT NULL,

	PRIMARY KEY (id, veh_id, cas_ref),
	CONSTRAINT fk_date FOREIGN KEY (id) REFERENCES DIM_DATE(id),
	CONSTRAINT fk_dim_age_sex FOREIGN KEY (id, veh_id) REFERENCES DIM_AGE_SEX_DRIVER(id, veh_id),
	CONSTRAINT fk_location FOREIGN KEY (id) REFERENCES DIM_LOCATION(id),
	CONSTRAINT fk_casualities FOREIGN KEY (id, veh_id, cas_ref) REFERENCES DIM_CASUALTIES(id, veh_id, cas_ref),
	CONSTRAINT fk_police FOREIGN KEY (id) REFERENCES DIM_POLICE(id),
	CONSTRAINT fk_veh FOREIGN KEY (id, veh_id) REFERENCES DIM_VEHICLE(id, veh_id),
		
);
