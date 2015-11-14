DROP TABLE BSST_USE_USER_SESSION;
DROP TABLE BSST_TTR_TICKET_TRACE;
DROP TABLE BSST_TIC_TICKET;
DROP TABLE BSST_UAP_USER_APP;
DROP TABLE BSST_USR_USER;

DROP TABLE BSST_PER_PERSON;

DROP TABLE BSST_COM_COMPANY;

DROP TABLE BSST_LDE_LOCATION_DESC;
DROP TABLE BSST_LOC_LOCATION;
DROP TABLE BSST_CIT_CITY;
DROP TABLE BSST_GRE_GEO_REGION_COUNTRY;

DROP TABLE BSST_CON_COUNTRY;
CREATE TABLE BSST_CON_COUNTRY (
	CON_N_COUNTRY_ID 		INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	CON_S_CODE				VARCHAR(10) NOT NULL,
	CON_S_NAME				VARCHAR(50) NOT NULL,				
	UNIQUE(CON_S_CODE),
	PRIMARY KEY(CON_N_COUNTRY_ID)
);

DROP TABLE BSST_AME_APP_MESSAGE;
DROP TABLE BSST_LAN_LANGUAGE;
CREATE TABLE BSST_LAN_LANGUAGE (
	LAN_N_LANG_ID 		INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	LAN_S_CODE			VARCHAR(6) NOT NULL,
	LAN_S_NAME			VARCHAR(30) NOT NULL,
	PRIMARY KEY(LAN_N_LANG_ID),
	UNIQUE(LAN_S_CODE)
);


CREATE TABLE BSST_CIT_CITY (
	CIT_N_CITY_ID 			INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	CIT_S_NAME	 			VARCHAR(50) NOT NULL,
	CIT_S_CODE				VARCHAR(10),
	CIT_S_STATE_REGION		VARCHAR(50),
	CIT_D_LOC_LAT 			DOUBLE,  
  	CIT_D_LOC_LNG 			DOUBLE,
  	CIT_S_ZIP				VARCHAR(15),
  	CON_N_COUNTRY_ID		INTEGER UNSIGNED NOT NULL,
	PRIMARY KEY(CIT_N_CITY_ID),
	CONSTRAINT BSST_CIT_CITY_FK1 FOREIGN KEY(CON_N_COUNTRY_ID) REFERENCES BSST_CON_COUNTRY(CON_N_COUNTRY_ID)
);



CREATE TABLE BSST_LOC_LOCATION(
	LOC_N_LOCATION_ID 		INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	CIT_D_LOC_LAT 			DOUBLE NOT NULL,  
  	CIT_D_LOC_LNG 			DOUBLE NOT NULL,
	CIT_N_CITY_ID 			INTEGER UNSIGNED,
	PRIMARY KEY(LOC_N_LOCATION_ID),
	CONSTRAINT BSST_LOC_LOCATION_FK1 FOREIGN KEY(CIT_N_CITY_ID) REFERENCES BSST_CIT_CITY(CIT_N_CITY_ID)
);


CREATE TABLE BSST_LDE_LOCATION_DESC(
	LOC_N_LOCATION_ID 		INTEGER UNSIGNED NOT NULL,
	LAN_N_LANG_ID 			INTEGER UNSIGNED NOT NULL,
	LDE_S_DESC				VARCHAR(2500) NOT NULL,
	PRIMARY KEY(LOC_N_LOCATION_ID,LAN_N_LANG_ID),
	CONSTRAINT BSST_LDE_LOCATION_DESC_FK1 FOREIGN KEY(LAN_N_LANG_ID) REFERENCES BSST_LAN_LANGUAGE(LAN_N_LANG_ID)
);


DROP TABLE BSST_GRE_GEO_REGION;
CREATE TABLE BSST_GRE_GEO_REGION (
	GRE_N_REGION_ID 		INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	GRE_S_CODE				VARCHAR(10) NOT NULL,
	GRE_S_NAME				VARCHAR(50) NOT NULL,
	GRE_N_PARENT_ID			INTEGER UNSIGNED,
	UNIQUE(GRE_S_CODE),
	PRIMARY KEY(GRE_N_REGION_ID),
	CONSTRAINT BSST_GRE_GEO_REGION_FK1 FOREIGN KEY(GRE_N_PARENT_ID) REFERENCES BSST_GRE_GEO_REGION(GRE_N_REGION_ID)
);

CREATE TABLE BSST_GRE_GEO_REGION_COUNTRY(
	GRE_N_REGION_ID 		INTEGER UNSIGNED NOT NULL,
	CON_N_COUNTRY_ID 		INTEGER UNSIGNED NOT NULL,
	PRIMARY KEY(GRE_N_REGION_ID,CON_N_COUNTRY_ID),
	CONSTRAINT BSST_GRE_GEO_REGION_COUNTRY_FK1 FOREIGN KEY(GRE_N_REGION_ID) REFERENCES BSST_GRE_GEO_REGION(GRE_N_REGION_ID),
	CONSTRAINT BSST_GRE_GEO_REGION_COUNTRY_FK2 FOREIGN KEY(CON_N_COUNTRY_ID) REFERENCES BSST_CON_COUNTRY(CON_N_COUNTRY_ID)
);
