package com.erpx.persona.command;

import java.util.List;

import com.dme.base.annotations.ComplexMapping;
import com.dme.base.annotations.Parameter;
import com.dme.base.annotations.Procedure;
import com.dme.base.interfaces.IQueryDao;
import com.dme.bean.to.DaoTO;
import com.erpx.persona.bean.PersonTO;

@Procedure(spName = "sp_list_Person")
public class ListPerson extends DaoTO implements IQueryDao<PersonTO, PersonTO>{

	private static final long serialVersionUID = -1596050146553496070L;
	
	@ComplexMapping(parameters = {
		@Parameter (parameterName = "@i_company", path = "company")
		,@Parameter (parameterName = "@i_identification", path = "identification")
		,@Parameter (parameterName = "@i_name1", path = "name1")
	    ,@Parameter (parameterName = "@i_name2", path = "name2")
		,@Parameter (parameterName = "@i_name3", path = "name3")
		,@Parameter (parameterName = "@i_surname1", path = "surname1")
		,@Parameter (parameterName = "@i_surname2", path = "surname2")			
	})
	private PersonTO criteria = null;
	
	@ComplexMapping(queryNumber = 1
	  , parameters = {	    		
		@Parameter(parameterName = "identificationType")
		,@Parameter(parameterName = "identification")
		,@Parameter(parameterName = "tax_code", path = "taxCode")
		,@Parameter(parameterName = "name1")
		,@Parameter(parameterName = "name2")
		,@Parameter(parameterName = "name3")
		,@Parameter(parameterName = "surname1")
		,@Parameter(parameterName = "surname2")
		,@Parameter(parameterName = "married_surname", path = "marriedSurname")
		,@Parameter(parameterName = "long_name", path = "longName")
		,@Parameter(parameterName = "gender")
		,@Parameter(parameterName = "birthdate")
		,@Parameter(parameterName = "occupation")
		,@Parameter(parameterName = "marital_status", path = "maritalStatus")
		,@Parameter(parameterName = "accept_publicity", path = "acceptPublicity")
		,@Parameter(parameterName = "work_place", path = "workplace")
		,@Parameter(parameterName = "study_place", path = "studyPlace")
		,@Parameter(parameterName = "study_degree", path = "studyDegree")
		,@Parameter(parameterName = "company_position", path = "companyPosition")
		,@Parameter(parameterName = "university_career", path = "universityCareer")
		,@Parameter(parameterName = "occupation_description", path = "occupationDescription")
	})	
	private List<PersonTO> list = null;

	@Override
	public void setCriteria(PersonTO criterio) {
		// TODO Auto-generated method stub
		this.criteria = criterio;
	}

	@Override
	public PersonTO getCriteria() {
		// TODO Auto-generated method stub
		return this.criteria;
	}

	@Override
	public List<PersonTO> getList() {
		// TODO Auto-generated method stub
		return this.list;
	}

}
