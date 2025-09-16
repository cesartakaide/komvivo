package com.erpx.entity.command;

import com.dme.base.annotations.ComplexMapping;
import com.dme.base.annotations.Parameter;
import com.erpx.base.command.BaseManttoCommand;
import com.erpx.entity.bean.Entity;

public class ManttoCommand extends BaseManttoCommand{

	private static final long serialVersionUID = -7699813873243346401L;

	@ComplexMapping(
		parameters = {
			@Parameter(parameterName = "defaultIdentifier")
			,@Parameter(parameterName = "type")
		    ,@Parameter(parameterName = "birthDate")
		    ,@Parameter(parameterName = "foundationDate")
		    ,@Parameter(parameterName = "surname1")
		    ,@Parameter(parameterName = "surname2")
		    ,@Parameter(parameterName = "guid")
		    ,@Parameter(parameterName = "taxExtent")
		    ,@Parameter(parameterName = "name2")
		    ,@Parameter(parameterName = "name1")
		    ,@Parameter(parameterName = "defaultAddress")	   
		    ,@Parameter(parameterName = "user_creator", path = "userCreator")		                    		       
			,@Parameter(parameterName = "rowVersion", isOutput = true)
			,@Parameter(parameterName = "id", isOutput = true)
		})
	private Entity parameter = null;

	public Entity getParameter() {
		return parameter;
	}

	public void setParameter(Entity parameter) {
		this.parameter = parameter;
	}
	
	

}
