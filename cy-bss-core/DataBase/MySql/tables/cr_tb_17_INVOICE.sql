DROP TABLE BSST_BIS_SELF_BILLABLE;
DROP TABLE BSST_BIL_BILLABLE;
DROP TABLE BSST_INV_INVOICE;
DROP TABLE BSST_SIN_SELF_INVOICE;


CREATE TABLE BSST_INV_INVOICE (
	INV_N_INVOICE_ID			INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	
	INV_D_DATE					DATE,
	INV_N_NUMBER				INTEGER,
	MNC_N_COMPANY_ID			INTEGER UNSIGNED NOT NULL,
	COM_N_COMPANY_ID 			INTEGER UNSIGNED,
	PER_N_PERSON_ID 			INTEGER UNSIGNED,
	INV_N_AMOUNT				DOUBLE UNSIGNED NOT NULL,
	CUR_N_CURRENCY_ID			INTEGER UNSIGNED NOT NULL,
	INV_N_VAT					DOUBLE UNSIGNED NOT NULL,
	INV_N_AMOUNT_VAT			DOUBLE UNSIGNED NOT NULL,
	INV_N_AMOUNT_TOT			DOUBLE UNSIGNED NOT NULL,
	PRIMARY KEY(INV_N_INVOICE_ID),
	CONSTRAINT BSST_INV_INVOICE_FK1 FOREIGN KEY(CUR_N_CURRENCY_ID) 
			REFERENCES BSST_CUR_CURRENCY(CUR_N_CURRENCY_ID),
	CONSTRAINT BSST_INV_INVOICE_FK2 FOREIGN KEY(COM_N_COMPANY_ID) 
			REFERENCES BSST_COM_COMPANY(COM_N_COMPANY_ID),
	CONSTRAINT BSST_INV_INVOICE_FK3 FOREIGN KEY(PER_N_PERSON_ID) 
			REFERENCES BSST_PER_PERSON(PER_N_PERSON_ID),
	CONSTRAINT BSST_INV_INVOICE_FK4 FOREIGN KEY(MNC_N_COMPANY_ID) 
			REFERENCES BSST_MNC_MANAGED_COMPANY(MNC_N_COMPANY_ID)
);


CREATE TABLE BSST_BIL_BILLABLE (
	BIL_N_BILLABLE_ID			INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	
	SAL_N_SALES_ID 				INTEGER UNSIGNED NOT NULL,
	BIL_N_QUANTITY				DOUBLE UNSIGNED NOT NULL,
	MES_N_METRIC_SCALE_ID   	INTEGER UNSIGNED NOT NULL,
	BIL_N_AMOUNT				DOUBLE UNSIGNED NOT NULL,
	CUR_N_CURRENCY_ID			INTEGER UNSIGNED NOT NULL,
	BIL_N_PRICE					DOUBLE UNSIGNED NOT NULL,
	BIL_N_VAT					DOUBLE UNSIGNED NOT NULL,
	BIL_N_AMOUNT_VAT			DOUBLE UNSIGNED NOT NULL,
	BIL_N_AMOUNT_TOT			DOUBLE UNSIGNED NOT NULL,
	BIL_D_DATE					DATE NOT NULL,
	BIL_D_DATE_START			DATE,
	BIL_D_DATE_END				DATE,
	INV_N_INVOICE_ID			INTEGER,
	PRIMARY KEY(BIL_N_BILLABLE_ID),
	CONSTRAINT BIL_N_BILLABLE_FK1 FOREIGN KEY(SAL_N_SALES_ID) 
			REFERENCES BSST_SAL_SALES(SAL_N_SALES_ID),
	CONSTRAINT BIL_N_BILLABLE_FK2 FOREIGN KEY(MES_N_METRIC_SCALE_ID) 
			REFERENCES BSST_MES_METRIC_SCALE(MES_N_METRIC_SCALE_ID),
	CONSTRAINT BIL_N_BILLABLE_FK3 FOREIGN KEY(CUR_N_CURRENCY_ID) 
			REFERENCES BSST_CUR_CURRENCY(CUR_N_CURRENCY_ID)
);

CREATE TABLE BSST_SIN_SELF_INVOICE (
	SIN_N_INVOICE_ID			INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	
	SIN_D_DATE					DATE,
	SIN_N_NUMBER				INTEGER,
	MNC_N_COMPANY_ID			INTEGER UNSIGNED NOT NULL,
	COM_N_COMPANY_ID 			INTEGER UNSIGNED,
	PER_N_PERSON_ID 			INTEGER UNSIGNED,
	SIN_N_AMOUNT				DOUBLE UNSIGNED NOT NULL,
	CUR_N_CURRENCY_ID			INTEGER UNSIGNED NOT NULL,
	SIN_N_VAT					DOUBLE UNSIGNED NOT NULL,
	SIN_N_AMOUNT_VAT			DOUBLE UNSIGNED NOT NULL,
	SIN_N_AMOUNT_TOT			DOUBLE UNSIGNED NOT NULL,
	PRIMARY KEY(SIN_N_INVOICE_ID),
	CONSTRAINT BSST_SIN_SELF_INVOICE_FK1 FOREIGN KEY(CUR_N_CURRENCY_ID) 
			REFERENCES BSST_CUR_CURRENCY(CUR_N_CURRENCY_ID),
	CONSTRAINT BSST_SIN_SELF_INVOICE_FK2 FOREIGN KEY(COM_N_COMPANY_ID) 
			REFERENCES BSST_COM_COMPANY(COM_N_COMPANY_ID),
	CONSTRAINT BSST_SIN_SELF_INVOICE_FK3 FOREIGN KEY(PER_N_PERSON_ID) 
			REFERENCES BSST_PER_PERSON(PER_N_PERSON_ID),
	CONSTRAINT BSST_SIN_SELF_INVOICE_FK4 FOREIGN KEY(MNC_N_COMPANY_ID) 
			REFERENCES BSST_MNC_MANAGED_COMPANY(MNC_N_COMPANY_ID)		
);

CREATE TABLE BSST_BIS_SELF_BILLABLE (
	BIS_N_BILLABLE_ID			INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	
	SHO_N_SHOPPING_ID 			INTEGER UNSIGNED NOT NULL,
	BIS_N_QUANTITY				DOUBLE UNSIGNED NOT NULL,
	MES_N_METRIC_SCALE_ID   	INTEGER UNSIGNED NOT NULL,
	BIS_N_AMOUNT				DOUBLE UNSIGNED NOT NULL,
	CUR_N_CURRENCY_ID			INTEGER UNSIGNED NOT NULL,
	BIS_N_PRICE					DOUBLE UNSIGNED NOT NULL,
	BIS_N_VAT					DOUBLE UNSIGNED NOT NULL,
	BIS_N_AMOUNT_VAT			DOUBLE UNSIGNED NOT NULL,
	BIS_N_AMOUNT_TOT			DOUBLE UNSIGNED NOT NULL,
	BIS_D_DATE					DATE NOT NULL,
	BIS_D_DATE_START			DATE,
	BIL_D_DATE_END				DATE,
	SIN_N_INVOICE_ID			INTEGER,
	PRIMARY KEY(BIS_N_BILLABLE_ID),
	CONSTRAINT BSST_BIS_SELF_BILLABLE_FK1 FOREIGN KEY(SHO_N_SHOPPING_ID) 
			REFERENCES BSST_SHO_SHOPPING(SHO_N_SHOPPING_ID),
	CONSTRAINT BSST_BIS_SELF_BILLABLE_FK2 FOREIGN KEY(MES_N_METRIC_SCALE_ID) 
			REFERENCES BSST_MES_METRIC_SCALE(MES_N_METRIC_SCALE_ID),
	CONSTRAINT BSST_BIS_SELF_BILLABLE_FK3 FOREIGN KEY(CUR_N_CURRENCY_ID) 
			REFERENCES BSST_CUR_CURRENCY(CUR_N_CURRENCY_ID)
);