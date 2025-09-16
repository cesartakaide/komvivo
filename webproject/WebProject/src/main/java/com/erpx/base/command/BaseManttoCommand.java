package com.erpx.base.command;

import com.dme.base.annotations.Parameter;
import com.dme.bean.to.DaoTO;

public abstract class BaseManttoCommand extends DaoTO{

	@Parameter(parameterName = "operacion")
	private String operation = null;
	
	@Parameter(parameterName = "messageError", isOutput = true)
	private String messageError = null;
	
	@Parameter(parameterName = "executionError", isOutput = true)	
	private boolean executionError = false;

	public String getMessageError() {
		return messageError;
	}

	public void setMessageError(String messageError) {
		this.messageError = messageError;
	}

	public boolean isExecutionError() {
		return executionError;
	}

	public void setExecutionError(boolean executionError) {
		this.executionError = executionError;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}
}
