DROP TABLE BSST_USE_USER_SESSION;
DROP TABLE BSST_USR_USER;

DROP TABLE BSST_PER_PERSON;
CREATE TABLE BSST_PER_PERSON (
	PER_N_PERSON_ID 		INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	PER_S_CODE				VARCHAR(10) NOT NULL,
	PER_S_FIRST_NAME		VARCHAR(30) NOT NULL,
	PER_S_SECOND_NAME		VARCHAR(30) NOT NULL,
	PER_S_ADDRESS			VARCHAR(60),
	CIT_N_CITY_ID			INTEGER UNSIGNED,
	PER_S_FISCAL_CODE		VARCHAR(30),
	PER_D_BIRTH_DAY			DATE,
	CIT_N_BIRTH_CITY_ID		INTEGER UNSIGNED,
	UNIQUE(PER_S_CODE),
	PRIMARY KEY(PER_N_PERSON_ID),
	CONSTRAINT BSST_PER_PERSON_FK1 FOREIGN KEY(CIT_N_CITY_ID) REFERENCES BSST_CIT_CITY(CIT_N_CITY_ID),
	CONSTRAINT BSST_PER_PERSON_FK2 FOREIGN KEY(CIT_N_BIRTH_CITY_ID) REFERENCES BSST_CIT_CITY(CIT_N_CITY_ID)
);
