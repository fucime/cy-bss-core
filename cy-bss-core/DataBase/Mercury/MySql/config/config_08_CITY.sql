delete from BSST_OPE_OPERATION_GRANT
	where BSO_N_OPERATION_ID in 
	(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION
	where BSV_N_SERVICE_ID in (select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME 
	in ('City')));

delete from BSST_BOP_OPERATION_PARAM
	where BSO_N_OPERATION_ID in 
	(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION
	where BSV_N_SERVICE_ID in (select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME 
	in ('City')));

delete from BSST_BSO_SERVICE_OPERATION
	where BSV_N_SERVICE_ID in (select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME 
	in ('City'));
	
delete from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME 
	in ('City');
	
insert into BSST_BSV_SERVICE(BSV_S_SERVICE_NAME,BSV_S_SERVICE_URL)
	values ('City','/city');
	
-- getCityAll @ City
insert into BSST_BSO_SERVICE_OPERATION (BSV_N_SERVICE_ID,BSO_S_METHOD,BSO_S_NAME,BSO_S_OPERATION_URL,BSO_S_DESCRIPTION)
	values ((select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'),'GET','getCityAll','/getCityAll','Return all cities');
	
-- add @ City
insert into BSST_BSO_SERVICE_OPERATION (BSV_N_SERVICE_ID,BSO_S_METHOD,BSO_S_NAME,BSO_S_OPERATION_URL,BSO_S_DESCRIPTION)
	values ((select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'),'POST','add','/add','Create city');
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER)
		values ('name',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='add' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','Y','name',1);
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER,BOP_S_TYPE)
		values ('countryId',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='add' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','Y','CountryId',2,'number');
		
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER)
		values ('code',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='add' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','N','Code',3);
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER)
		values ('stateRegion',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='add' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','N','State Region',4);
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER,BOP_S_TYPE)
		values ('latitude',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='add' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','N','Latitute',5,'text');
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER,BOP_S_TYPE)
		values ('longitude',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='add' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','N','Longitude',6,'text');
	
		
	insert into BSST_OPE_OPERATION_GRANT(BSO_N_OPERATION_ID,URO_N_ROLE_ID)
		values(
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='add' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City')),
		(select URO_N_ROLE_ID from BSST_URO_ROLE where URO_S_NAME='User')
		);
	
-- update @ City
insert into BSST_BSO_SERVICE_OPERATION (BSV_N_SERVICE_ID,BSO_S_METHOD,BSO_S_NAME,BSO_S_OPERATION_URL,BSO_S_DESCRIPTION)
	values ((select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'),'POST','update','/{id}/update','Update city');
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER,BOP_S_TYPE)
		values ('id',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='update' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','Y','id',1,'number');
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER)
		values ('name',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='update' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','Y','name',2);
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER,BOP_S_TYPE)
		values ('countryId',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='update' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','Y','CountryId',3,'number');
		
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER)
		values ('code',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='update' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','N','Code',4);
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER)
		values ('stateRegion',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='update' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','N','State Region',5);
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER,BOP_S_TYPE)
		values ('latitude',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='update' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','N','Latitute',6,'text');
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER,BOP_S_TYPE)
		values ('longitude',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='update' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','N','Longitude',7,'text');
		
	insert into BSST_OPE_OPERATION_GRANT(BSO_N_OPERATION_ID,URO_N_ROLE_ID)
		values(
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='update' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City')),
		(select URO_N_ROLE_ID from BSST_URO_ROLE where URO_S_NAME='User')
		);

-- get @ City
insert into BSST_BSO_SERVICE_OPERATION (BSV_N_SERVICE_ID,BSO_S_METHOD,BSO_S_NAME,BSO_S_OPERATION_URL,BSO_S_DESCRIPTION)
	values ((select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'),'GET','get','/{id}/get','Get City');
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER,BOP_S_TYPE)
		values ('id',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='get' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','Y','id',1,'number');
		
	
-- remove @ City
insert into BSST_BSO_SERVICE_OPERATION (BSV_N_SERVICE_ID,BSO_S_METHOD,BSO_S_NAME,BSO_S_OPERATION_URL,BSO_S_DESCRIPTION)
	values ((select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'),'GET','remove','/{id}/remove','Remove city');
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER,BOP_S_TYPE)
		values ('id',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='remove' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'Y','Y','id',1,'number');
		
	insert into BSST_OPE_OPERATION_GRANT(BSO_N_OPERATION_ID,URO_N_ROLE_ID)
		values(
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='remove' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City')),
		(select URO_N_ROLE_ID from BSST_URO_ROLE where URO_S_NAME='User')
		);

		
-- find @ City
insert into BSST_BSO_SERVICE_OPERATION (BSV_N_SERVICE_ID,BSO_S_METHOD,BSO_S_NAME,BSO_S_OPERATION_URL,BSO_S_DESCRIPTION)
	values ((select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'),'GET','find','/find','Find cities');
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER)
		values ('name',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='find' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'N','N','name',1);
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER)
		values ('stateRegion',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='find' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'N','N','stateRegion',2);
	
	insert into BSST_BOP_OPERATION_PARAM(BOP_PARAM_NAME,BSO_N_OPERATION_ID,BOP_C_FLG_URL,BOP_C_REQUIRED,BOP_S_DESCRIPTION,BOP_N_SHOW_ORDER,BOP_S_TYPE)
		values ('countryId',
		(select BSO_N_OPERATION_ID from BSST_BSO_SERVICE_OPERATION where BSO_S_NAME='find' and BSV_N_SERVICE_ID=(select BSV_N_SERVICE_ID from BSST_BSV_SERVICE where BSV_S_SERVICE_NAME='City'))
		,'N','N','countryId',3,'number');
	