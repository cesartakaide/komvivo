
/*select * from entity;*/

delete from entity where id is not null;

set @rowVersion =5;
set @id=20;
set @messageError= '';
set @executionError=0;

/*        select  @rowVersion = rowVersion
               , @eliminated = eliminated   #solo eliminacion logica.
         from entity
        where id = 1 ;
        
select  @rowVersion as rowversion
 ,@id as id
 ,@messageError as messageerror
 ,@executionError as exec;    */    
 
call sp_mantto_entity (
 "D" -- PATH=operation
, "DKDKDK new"
, "P"-- PATH=parameter/type
, "2025-09-17"-- PATH=parameter/birthDate
, "2025-09-17"-- PATH=parameter/foundationDate
, "kkkj" -- PATH=parameter/surname1
,"jjjjj"-- PATH=parameter/surname2
, "d716a94d-910b-11f0-849d-d8eb97ea5ebd"-- PATH=parameter/guid
, 0-- PATH=parameter/taxExtent
, "hhhj new"-- PATH=parameter/name2
, "CAS2 new "  -- PATH=parameter/name1
, "surname2"-- PATH=parameter/defaultAddress
, "dd"-- PATH=parameter/userCreator
,NULL 
, @rowVersion -- PATH=parameter/rowVersion
,@id  -- PATH=parameter/id
,@messageError
, @executionError
);  -- PATH=executionError

select  @rowVersion as rowversion
 ,@id as id
 ,@messageError as messageerror
 ,@executionError as exec;
 

 