package com.erpx.persona.command;

import com.dme.base.annotations.Procedure;
import com.dme.base.interfaces.ICommandContext;
import com.dme.base.modeldriven.interfaces.IDeleteCommand;
import com.dme.core.exceptions.DaoPreprocessException;
import com.dme.core.interfaces.IDaoPreprocess;
import com.erpx.persona.bean.PersonTO;

@Procedure(spName = "sp_mantto_person")
public class DeletePerson  extends ManttoPersonDao implements IDeleteCommand<PersonTO>, IDaoPreprocess{

	private static final long serialVersionUID = -3025356200929661873L;

	@Override
	public void preprocess(ICommandContext cmdTX) throws DaoPreprocessException {
		// TODO Auto-generated method stub
		this.setOperation("D");
	}

}
