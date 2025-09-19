package com.erpx.entity.command;

import java.util.UUID;

import com.dme.base.annotations.Procedure;
import com.dme.base.interfaces.ICommandContext;
import com.dme.base.modeldriven.interfaces.ICreateCommand;
import com.dme.core.exceptions.DaoPreprocessException;
import com.dme.core.interfaces.IDaoPreprocess;
import com.erpx.entity.bean.Entity;
import com.erpx.general.ERPConstants;

@Procedure(spName = "sp_mantto_entity")
public class CreateEntity extends ManttoCommand implements ICreateCommand<Entity>, IDaoPreprocess{

	private static final long serialVersionUID = 6725355571793846448L;

	public CreateEntity() {
		this.setOperation(ERPConstants.CREATE_OPERATION);	
	}
	
	@Override
	public void preprocess(ICommandContext cmdTX) throws DaoPreprocessException {
		this.getParameter().setGuid(UUID.randomUUID().toString());
		this.getParameter().setUserCreator("CAS");	
	}
}
