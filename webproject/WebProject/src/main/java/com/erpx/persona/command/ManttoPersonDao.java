package com.erpx.persona.command;

import com.dme.base.annotations.ComplexMapping;
import com.dme.base.annotations.Parameter;
import com.dme.base.annotations.Procedure;
import com.dme.bean.to.DaoTO;
import com.erpx.persona.bean.PersonTO;

@Procedure(spName = "sp_mantto_Person")
public class ManttoPersonDao extends DaoTO{

	private static final long serialVersionUID = 6299437995865806745L;
	@Parameter (parameterName = "@i_operation")//      char(1)   --tipo de operacion
	private String operation = null;

	@ComplexMapping(parameters = { 
			@Parameter(parameterName = "@i_accept_publicity", path = "acceptPublicity")// bit = null
			, @Parameter(parameterName = "@i_university_career", path = "universityCareer")// varchar (10) = null
			, @Parameter(parameterName = "@i_birthdate", path = "birthdate")// datetime = null
			, @Parameter(parameterName = "@i_occupation", path = "occupation")// char (10) = null
			, @Parameter(parameterName = "@i_gender", path = "gender")// char (1) = null
			, @Parameter(parameterName = "@i_identificationType", path = "identificationType")// char (10) = null
			, @Parameter(parameterName = "@i_long_name", path = "longName")// nvarchar (500) = null
			, @Parameter(parameterName = "@i_work_place", path = "workplace")// varchar (50) = null
			, @Parameter(parameterName = "@i_surname1", path = "surname1")// nvarchar (100) = null
			, @Parameter(parameterName = "@i_identification", path = "identification")// nvarchar (100) = null
			, @Parameter(parameterName = "@i_surname2", path = "surname2")// nvarchar (100) = null
			, @Parameter(parameterName = "@i_married_surname", path = "marriedSurname")// nvarchar (100) = null
			, @Parameter(parameterName = "@i_study_place", path = "studyPlace")// varchar (50) = null
			, @Parameter(parameterName = "@i_tax_code", path = "taxCode")// nvarchar (100) = null
			, @Parameter(parameterName = "@i_marital_status", path = "maritalStatus")// char (10) = null
			, @Parameter(parameterName = "@i_name3", path = "name3")// nvarchar (100) = null
			, @Parameter(parameterName = "@i_company_position", path = "companyPosition")// varchar (10) = null
			, @Parameter(parameterName = "@i_name2", path = "name2")// nvarchar (100) = null
			, @Parameter(parameterName = "@i_name1", path = "name1")// nvarchar (100) = null
			, @Parameter(parameterName = "@i_study_degree", path = "studyDegree")// varchar (10) = null
			, @Parameter(parameterName = "@i_occupation_description", path = "occupationDescription")// varchar (100) = null */
	})
	private PersonTO parameter = null;

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public PersonTO getParameter() {
		return parameter;
	}

	public void setParameter(PersonTO parameter) {
		this.parameter = parameter;
	}


	   
}
