package com.erpx.entity.command;

import com.dme.base.annotations.ComplexMapping;
import com.dme.base.annotations.Parameter;
import com.dme.base.annotations.Procedure;
import com.dme.base.modeldriven.interfaces.IGetCommand;
import com.dme.bean.to.DaoTO;
import com.erpx.entity.bean.Entity;

@Procedure(spName = "sp_get_entity")
public class GetEntity extends DaoTO implements IGetCommand<Entity>{

	private static final long serialVersionUID = 7961898235781244005L;
	
	@Parameter(parameterName = "param_id")
	private long id = 0;
	
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
	private Entity parameter = null;

	@Override
	public void setParameter(Entity parametro) {
		// TODO Auto-generated method stub
		this.parameter = parametro;
	}

	@Override
	public Entity getParameter() {
		// TODO Auto-generated method stub
		return parameter;
	}

	@Override
	public void setId(Long id) {
		// TODO Auto-generated method stub
		this.id = id;
	}

	@Override
	public Long getId() {
		// TODO Auto-generated method stub
		return this.id;
	}

}
