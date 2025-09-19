package com.erpx.entity.command;

import com.dme.base.annotations.ComplexMapping;
import com.dme.base.annotations.Parameter;
import com.erpx.base.command.BaseManttoCommand;
import com.erpx.entity.bean.Entity;

public class ManttoCommand extends BaseManttoCommand{

	private static final long serialVersionUID = -7699813873243346401L;

	@ComplexMapping(
		parameters = {
			@Parameter(parameterName = "i_defaultIdentifier", path = "defaultIdentifier")
			,@Parameter(parameterName = "i_type", path = "type")
		    ,@Parameter(parameterName = "i_birthDate", path = "birthDate")
		    ,@Parameter(parameterName = "i_foundationDate", path = "foundationDate")
		    ,@Parameter(parameterName = "i_surname1", path = "surname1")
		    ,@Parameter(parameterName = "i_surname2", path = "surname2")
		    ,@Parameter(parameterName = "i_guid", path = "guid")
		    ,@Parameter(parameterName = "i_taxExtent", path = "taxExtent")
		    ,@Parameter(parameterName = "i_name2", path = "name2")
		    ,@Parameter(parameterName = "i_name1", path = "name1")
		    ,@Parameter(parameterName = "i_defaultAddress", path = "defaultAddress")	   
		    ,@Parameter(parameterName = "i_user_creator", path = "userCreator")		                    		       
			,@Parameter(parameterName = "o_rowVersion", path = "rowVersion", isOutput = true)
			,@Parameter(parameterName = "o_id", path="id", isOutput = true)
		})
	private Entity parameter = null;

	public Entity getParameter() {
		return parameter;
	}

	public void setParameter(Entity parameter) {
		this.parameter = parameter;
	}
	
	

}
