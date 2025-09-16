
/*
insert into entity (
rowVersion
,eliminated
,user_creator
,guid
,name1
,name2
,surname1
,surname2
,defaultAddress
,type
,birthDate
,foundationDate
,taxExtent
,defaultIdentifier)
values (
1
,0
,'dd'
,UUID()
,'cas'
,'name1'
, 'name2'
, 'surname1'
, 'surname2'
,'P'
,now()
, now()
,0
,null
);
*/

/*select uuid();*/



SELECT COUNT(*)
FROM information_schema.innodb_trx
WHERE trx_mysql_thread_id = CONNECTION_ID();

SELECT * FROM information_schema.parameters where SPECIFIC_NAME = ? order by ORDINAL_POSITION;


