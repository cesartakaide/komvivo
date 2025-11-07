package com.erpx.persona.command;

import com.dme.base.annotations.Procedure;
import com.dme.base.interfaces.ICommandContext;
import com.dme.base.modeldriven.interfaces.ICreateCommand;
import com.dme.core.exceptions.DaoPreprocessException;
import com.dme.core.interfaces.IDaoPreprocess;
import com.erpx.persona.bean.PersonTO;

@Procedure(spName = "sp_mantto_person")
public class CreatePerson extends ManttoPersonDao implements ICreateCommand<PersonTO>, IDaoPreprocess{

	private static final long serialVersionUID = -715727683490969980L;

	@Override
	public void preprocess(ICommandContext cmdTX) throws DaoPreprocessException {
		// TODO Auto-generated method stub
		this.setOperation("I");
	}

}
