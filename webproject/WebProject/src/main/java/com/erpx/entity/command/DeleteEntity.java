package com.erpx.entity.command;


import com.dme.base.annotations.Procedure;
import com.dme.base.modeldriven.interfaces.IDeleteCommand;
import com.erpx.entity.bean.Entity;
import com.erpx.general.ERPConstants;

@Procedure(spName = "sp_mantto_entity")
public class DeleteEntity extends ManttoCommand implements IDeleteCommand<Entity>{

	private static final long serialVersionUID = 6725355571793846448L;

	public DeleteEntity() {
		this.setOperation(ERPConstants.DELETE_OPERATION);
	}
}
