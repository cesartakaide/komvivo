package com.erpx.base.command;

import com.dme.base.annotations.Parameter;
import com.dme.base.interfaces.ICommandContext;
import com.dme.bean.to.DaoTO;
import com.dme.core.exceptions.DaoPostprocessException;
import com.dme.core.interfaces.IDaoPostProcess;

public abstract class BaseManttoCommand extends DaoTO implements IDaoPostProcess{

	@Parameter(parameterName = "i_operacion")
	private String operation = null;
	
	@Parameter(parameterName = "o_messageError", isOutput = true)
	private String messageError = null;
	
	@Parameter(parameterName = "o_executionError", isOutput = true)	
	private int executionError = 0;
	
	@Override
	public void postprocess(ICommandContext cmdTX) throws DaoPostprocessException {
		// TODO Auto-generated method stub
		if (executionError > 0 || (messageError != null && !messageError.trim().equals(""))) {
			throw new DaoPostprocessException("ERROR IN PROC:" + messageError + ": CODE" + executionError);
		}
	}

	public String getMessageError() {
		return messageError;
	}

	public void setMessageError(String messageError) {
		this.messageError = messageError;
	}



	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public int getExecutionError() {
		return executionError;
	}

	public void setExecutionError(int executionError) {
		this.executionError = executionError;
	}
}
