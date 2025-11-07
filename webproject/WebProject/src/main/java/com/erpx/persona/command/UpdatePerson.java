package com.erpx.persona.command;

import com.dme.base.annotations.Procedure;
import com.dme.base.interfaces.ICommandContext;
import com.dme.base.modeldriven.interfaces.IUpdateCommand;
import com.dme.core.exceptions.DaoPreprocessException;
import com.dme.core.interfaces.IDaoPreprocess;
import com.erpx.persona.bean.PersonTO;

@Procedure(spName = "sp_mantto_person")
public class UpdatePerson extends ManttoPersonDao implements IUpdateCommand<PersonTO>, IDaoPreprocess{

	

	private static final long serialVersionUID = -1859259950320792300L;

	@Override
	public void preprocess(ICommandContext cmdTX) throws DaoPreprocessException {
		// TODO Auto-generated method stub
		this.setOperation("U");
	}

}
