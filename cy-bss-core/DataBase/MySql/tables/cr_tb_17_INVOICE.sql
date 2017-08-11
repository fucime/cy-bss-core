DROP TABLE BSST_BIR_BILLABLE_REVENUE;
DROP TABLE BSST_BIC_BILLABLE_COST;
DROP TABLE BSST_INV_INVOICE;
DROP TABLE BSST_PIN_PASSIVE_INVOICE;

CREATE TABLE BSST_INV_INVOICE (
	INV_N_INVOICE_ID			INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	
	INV_D_DATE					DATE,
	INV_N_YEAR					INTEGER,
	INV_N_NUMBER				INTEGER,
	MNC_N_COMPANY_ID			INTEGER UNSIGNED NOT NULL,
	COM_N_COMPANY_ID 			INTEGER UNSIGNED,
	PER_N_PERSON_ID 			INTEGER UNSIGNED,
	INV_N_AMOUNT				DOUBLE NOT NULL default 0,
	CUR_N_CURRENCY_ID			INTEGER UNSIGNED,
	INV_N_VAT_AMOUNT			DOUBLE NOT NULL default 0,
	INV_N_TOT_AMOUNT			DOUBLE NOT NULL default 0,
	INV_C_CANCELLED				CHAR(1) NOT NULL default 'N',
	INV_S_NUMBER				VARCHAR(20),
	INV_S_NOTE					VARCHAR(500),
	PRIMARY KEY(INV_N_INVOICE_ID),
	UNIQUE(INV_S_NUMBER),
	CONSTRAINT BSST_INV_INVOICE_CK1 CHECK(INV_C_CANCELLED IN ('Y','N')),
	CONSTRAINT BSST_INV_INVOICE_FK1 FOREIGN KEY(CUR_N_CURRENCY_ID) 
			REFERENCES BSST_CUR_CURRENCY(CUR_N_CURRENCY_ID),
	CONSTRAINT BSST_INV_INVOICE_FK2 FOREIGN KEY(COM_N_COMPANY_ID) 
			REFERENCES BSST_COM_COMPANY(COM_N_COMPANY_ID),
	CONSTRAINT BSST_INV_INVOICE_FK3 FOREIGN KEY(PER_N_PERSON_ID) 
			REFERENCES BSST_PER_PERSON(PER_N_PERSON_ID),
	CONSTRAINT BSST_INV_INVOICE_FK4 FOREIGN KEY(MNC_N_COMPANY_ID) 
			REFERENCES BSST_MNC_MANAGED_COMPANY(MNC_N_COMPANY_ID)
);

CREATE TABLE BSST_BIR_BILLABLE_REVENUE (
	BIR_N_BILLABLE_ID			INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	
	SAL_N_SALE_ID				INTEGER UNSIGNED NOT NULL,
	MNC_N_COMPANY_ID			INTEGER UNSIGNED NOT NULL,
	PRO_N_PRODUCT_ID 			INTEGER UNSIGNED NOT NULL,
	COM_N_COMPANY_ID 			INTEGER UNSIGNED,
	PER_N_PERSON_ID 			INTEGER UNSIGNED,
	BIR_N_QUANTITY				DOUBLE UNSIGNED,
	MES_N_METRIC_SCALE_ID   	INTEGER UNSIGNED,
	BIR_N_PRICE					DOUBLE NOT NULL,
	BIR_N_AMOUNT				DOUBLE NOT NULL,
	CUR_N_CURRENCY_ID			INTEGER UNSIGNED NOT NULL,
	BIR_N_VAT					DOUBLE UNSIGNED NOT NULL,
	BIR_N_VAT_AMOUNT			DOUBLE NOT NULL,
	BIR_N_TOT_AMOUNT			DOUBLE NOT NULL,
	BIR_D_DATE_START			DATE,
	BIR_D_DATE_END				DATE,
	PRC_N_PRICE_COMPONENT_ID 	INTEGER UNSIGNED NOT NULL,
	BIR_D_DATE					DATE NOT NULL,
	BIR_C_TYPE					CHAR(1) NOT NULL default 'A',
	BIR_D_UPDATE_DATE			TIMESTAMP NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
	INV_N_INVOICE_ID			INTEGER,
	BIR_C_BILLED				CHAR(1) NOT NULL default 'N',
	PRIMARY KEY(BIR_N_BILLABLE_ID),
	CONSTRAINT BSST_BIR_BILLABLE_REVENUE_CK1 CHECK(BIR_C_TYPE IN ('A','C')),
	CONSTRAINT BSST_BIR_BILLABLE_REVENUE_CK2 CHECK(BIR_C_BILLED IN ('Y','N','C')),
	CONSTRAINT BSST_BIR_BILLABLE_REVENUE_FK1 FOREIGN KEY(PRO_N_PRODUCT_ID) 
			REFERENCES BSST_PRO_PRODUCT(PRO_N_PRODUCT_ID),
	CONSTRAINT BSST_BIR_BILLABLE_REVENUE_FK2 FOREIGN KEY(MES_N_METRIC_SCALE_ID) 
			REFERENCES BSST_MES_METRIC_SCALE(MES_N_METRIC_SCALE_ID),
	CONSTRAINT BSST_BIR_BILLABLE_REVENUE_FK3 FOREIGN KEY(CUR_N_CURRENCY_ID) 
			REFERENCES BSST_CUR_CURRENCY(CUR_N_CURRENCY_ID),
	CONSTRAINT BSST_BIR_BILLABLE_REVENUE_FK4 FOREIGN KEY(COM_N_COMPANY_ID) 
			REFERENCES BSST_COM_COMPANY(COM_N_COMPANY_ID),
	CONSTRAINT BSST_BIR_BILLABLE_REVENUE_FK5 FOREIGN KEY(PER_N_PERSON_ID) 
			REFERENCES BSST_PER_PERSON(PER_N_PERSON_ID),
	CONSTRAINT BSST_BIR_BILLABLE_REVENUE_FK6 FOREIGN KEY(PRC_N_PRICE_COMPONENT_ID) 
			REFERENCES BSST_PRC_PRICE_COMPONENT(PRC_N_PRICE_COMPONENT_ID),
	CONSTRAINT BSST_BIR_BILLABLE_REVENUE_FK7 FOREIGN KEY(MNC_N_COMPANY_ID) 
			REFERENCES BSST_MNC_MANAGED_COMPANY(MNC_N_COMPANY_ID),
	CONSTRAINT BSST_BIR_BILLABLE_REVENUE_FK8 FOREIGN KEY(SAL_N_SALE_ID) 
			REFERENCES BSST_SAL_SALE(SAL_N_SALE_ID)		
);

CREATE TABLE BSST_PIN_PASSIVE_INVOICE (
	PIN_N_INVOICE_ID			INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	
	PIN_D_DATE					DATE,
	PIN_N_YEAR					DATE,
	PIN_N_NUMBER				INTEGER,
	MNC_N_COMPANY_ID			INTEGER UNSIGNED NOT NULL,
	COM_N_COMPANY_ID 			INTEGER UNSIGNED,
	PER_N_PERSON_ID 			INTEGER UNSIGNED,
	PIN_N_AMOUNT				DOUBLE NOT NULL default 0,
	CUR_N_CURRENCY_ID			INTEGER UNSIGNED,
	PIN_N_VAT_AMOUNT			DOUBLE NOT NULL default 0,
	PIN_N_TOT_AMOUNT			DOUBLE NOT NULL default 0,
	PIN_C_CANCELLED				CHAR(1) NOT NULL default 'N',
	PIN_S_NUMBER				VARCHAR(20),
	PIN_S_NOTE					VARCHAR(500),
	PRIMARY KEY(PIN_N_INVOICE_ID),
	UNIQUE(PIN_S_NUMBER),
	CONSTRAINT BSST_PIN_PASSIVE_INVOICE_CK1 CHECK(PIN_C_CANCELLED IN ('Y','N')),
	CONSTRAINT BSST_PIN_PASSIVE_INVOICE_FK1 FOREIGN KEY(CUR_N_CURRENCY_ID) 
			REFERENCES BSST_CUR_CURRENCY(CUR_N_CURRENCY_ID),
	CONSTRAINT BSST_PIN_PASSIVE_INVOICE_FK2 FOREIGN KEY(COM_N_COMPANY_ID) 
			REFERENCES BSST_COM_COMPANY(COM_N_COMPANY_ID),
	CONSTRAINT BSST_PIN_PASSIVE_INVOICE_FK3 FOREIGN KEY(PER_N_PERSON_ID) 
			REFERENCES BSST_PER_PERSON(PER_N_PERSON_ID),
	CONSTRAINT BSST_PIN_PASSIVE_INVOICE_FK4 FOREIGN KEY(MNC_N_COMPANY_ID) 
			REFERENCES BSST_MNC_MANAGED_COMPANY(MNC_N_COMPANY_ID)		
);

CREATE TABLE BSST_BIC_BILLABLE_COST (
	BIC_N_BILLABLE_ID			INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	
	PUR_N_PURCHASE_ID			INTEGER UNSIGNED NOT NULL,
	MNC_N_COMPANY_ID			INTEGER UNSIGNED NOT NULL,
	PRO_N_PRODUCT_ID 			INTEGER UNSIGNED NOT NULL,
	COM_N_COMPANY_ID 			INTEGER UNSIGNED,
	PER_N_PERSON_ID 			INTEGER UNSIGNED,
	BIC_N_QUANTITY				DOUBLE UNSIGNED,
	MES_N_METRIC_SCALE_ID   	INTEGER UNSIGNED,
	BIC_N_PRICE					DOUBLE NOT NULL,
	BIC_N_AMOUNT				DOUBLE NOT NULL,
	CUR_N_CURRENCY_ID			INTEGER UNSIGNED NOT NULL,
	BIC_N_VAT					DOUBLE UNSIGNED NOT NULL,
	BIC_N_VAT_AMOUNT			DOUBLE NOT NULL,
	BIC_N_TOT_AMOUNT			DOUBLE NOT NULL,
	BIC_D_DATE_START			DATE,
	BIC_D_DATE_END				DATE,
	PRC_N_PRICE_COMPONENT_ID 	INTEGER UNSIGNED NOT NULL,
	BIC_D_DATE					DATE NOT NULL,
	BIC_C_TYPE					CHAR(1) NOT NULL default 'A',
	BIC_D_UPDATE_DATE			TIMESTAMP NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
	PIN_N_INVOICE_ID			INTEGER,
	BIC_C_BILLED				CHAR(1) NOT NULL default 'N',
	PRIMARY KEY(BIC_N_BILLABLE_ID),
	CONSTRAINT BSST_BIC_BILLABLE_COST_CK1 CHECK(BIR_C_TYPE IN ('A','C')),
	CONSTRAINT BSST_BIC_BILLABLE_COST_CK2 CHECK(BIR_C_BILLED IN ('Y','N','C')),
	CONSTRAINT BSST_BIC_BILLABLE_COST_FK1 FOREIGN KEY(PRO_N_PRODUCT_ID) 
			REFERENCES BSST_PRO_PRODUCT(PRO_N_PRODUCT_ID),
	CONSTRAINT BSST_BIC_BILLABLE_COST_FK2 FOREIGN KEY(MES_N_METRIC_SCALE_ID) 
			REFERENCES BSST_MES_METRIC_SCALE(MES_N_METRIC_SCALE_ID),
	CONSTRAINT BSST_BIC_BILLABLE_COST_FK3 FOREIGN KEY(CUR_N_CURRENCY_ID) 
			REFERENCES BSST_CUR_CURRENCY(CUR_N_CURRENCY_ID),
	CONSTRAINT BSST_BIC_BILLABLE_COST_FK4 FOREIGN KEY(COM_N_COMPANY_ID) 
			REFERENCES BSST_COM_COMPANY(COM_N_COMPANY_ID),
	CONSTRAINT BSST_BIC_BILLABLE_COST_FK5 FOREIGN KEY(PER_N_PERSON_ID) 
			REFERENCES BSST_PER_PERSON(PER_N_PERSON_ID),
	CONSTRAINT BSST_BIC_BILLABLE_COST_FK6 FOREIGN KEY(PRC_N_PRICE_COMPONENT_ID) 
			REFERENCES BSST_PRC_PRICE_COMPONENT(PRC_N_PRICE_COMPONENT_ID),
	CONSTRAINT BSST_BIC_BILLABLE_COST_FK7 FOREIGN KEY(MNC_N_COMPANY_ID) 
			REFERENCES BSST_MNC_MANAGED_COMPANY(MNC_N_COMPANY_ID),
	CONSTRAINT BSST_BIC_BILLABLE_COST_FK8 FOREIGN KEY(PUR_N_PURCHASE_ID) 
			REFERENCES BSST_PUR_PURCHASE(PUR_N_PURCHASE_ID)		
);
