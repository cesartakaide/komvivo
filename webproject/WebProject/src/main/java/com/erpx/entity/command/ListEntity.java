package com.erpx.entity.command;

import java.util.List;

import com.dme.base.annotations.ComplexMapping;
import com.dme.base.annotations.Parameter;
import com.dme.base.annotations.Procedure;
import com.dme.base.interfaces.IQueryDao;
import com.dme.bean.to.DaoTO;
import com.erpx.entity.bean.Entity;

@Procedure(spName = "sp_list_entity")
public class ListEntity extends DaoTO implements IQueryDao<Entity, Entity>{

	private static final long serialVersionUID = -1179818822520405920L;
	
	private Entity criteria = null;
	
	@ComplexMapping(
		queryNumber = 1	
	    ,mapToOne = true
		,parameters = {
			@Parameter(parameterName = "id")
			,@Parameter(parameterName = "rowVersion")
			,@Parameter(parameterName = "eliminated", path="deleted")
			,@Parameter(parameterName = "user_creator", path = "userCreator")
			,@Parameter(parameterName = "user_update", path = "userUpdate")
			,@Parameter(parameterName = "creation_date", path = "insdate")
			,@Parameter(parameterName = "last_modify_date", path = "upddate")
			,@Parameter(parameterName = "guid")
			,@Parameter(parameterName = "name1")
			,@Parameter(parameterName = "name2")
			,@Parameter(parameterName = "surname1")
			,@Parameter(parameterName = "surname2")
			,@Parameter(parameterName = "defaultAddress")
			,@Parameter(parameterName = "type")
			,@Parameter(parameterName = "birthDate")
			,@Parameter(parameterName = "foundationDate")
			,@Parameter(parameterName = "taxExtent")
			,@Parameter(parameterName = "defaultIdentifier")				  									   
		}
	)
	private List<Entity> list = null;


	public List<Entity> getList() {
		return list;
	}


	public void setList(List<Entity> list) {
		this.list = list;
	}


	public Entity getCriteria() {
		return criteria;
	}


	public void setCriteria(Entity criteria) {
		this.criteria = criteria;
	}

	
	
	
}
