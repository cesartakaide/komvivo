package com.erpx.entity.command;

import com.dme.base.annotations.Procedure;
import com.dme.base.modeldriven.interfaces.ICreateCommand;
import com.erpx.entity.bean.Entity;
import com.erpx.general.ERPConstants;

@Procedure(spName = "sp_mantto_entity")
public class CreateEntity extends ManttoCommand implements ICreateCommand<Entity>{

	private static final long serialVersionUID = 6725355571793846448L;

	public CreateEntity() {
		this.setOperation(ERPConstants.CREATE_OPERATION);
	}
}
