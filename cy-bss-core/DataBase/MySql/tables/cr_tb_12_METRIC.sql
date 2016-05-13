DROP TABLE BSST_MET_METRIC;
DROP TABLE BSST_MES_METRIC_SCALE;

CREATE TABLE BSST_MET_METRIC (
	MET_N_METRIC_ID 	INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	MET_S_NAME			VARCHAR(30) NOT NULL,
	UNIQUE(MET_S_NAME),
	PRIMARY KEY(MET_N_METRIC_ID)
);
	
CREATE TABLE BSST_MES_METRIC_SCALE (
	MET_N_METRIC_ID 	INTEGER UNSIGNED NOT NULL,
	MES_S_NAME			VARCHAR(30) NOT NULL,
	MES_S_SIMBOL		VARCHAR(15) NOT NULL,
	MES_N_FACTOR		DOUBLE NOT NULL,	
	PRIMARY KEY(MET_N_METRIC_ID,MES_S_NAME)
);




