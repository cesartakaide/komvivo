package com.erpx.persona.command;

import com.dme.base.annotations.ComplexMapping;
import com.dme.base.annotations.Parameter;
import com.dme.base.modeldriven.interfaces.IGetCommand;
import com.dme.bean.to.DaoTO;
import com.erpx.persona.bean.PersonTO;

public class GetPerson extends DaoTO implements IGetCommand<PersonTO>{

	private static final long serialVersionUID = 4858671687627008019L;
	
	@Parameter (parameterName = "@i_id")
	private Long id = null;
	
	

	@ComplexMapping (queryNumber = 1
		,mapToOne = true
	    ,parameters = {
	    	@Parameter (parameterName = "accept_publicity",  path = "acceptPublicity")   	    
	       ,@Parameter (parameterName = "university_career",  path = "universityCareer")      
	       ,@Parameter (parameterName = "birthdate")   
	       ,@Parameter (parameterName = "occupation")     
	       ,@Parameter (parameterName = "gender")   
	       ,@Parameter (parameterName = "identificationType")   
	       ,@Parameter (parameterName = "long_name",  path = "longName")   
	       ,@Parameter (parameterName = "work_place",  path = "workplace")   
	       ,@Parameter (parameterName = "surname1")   
	       ,@Parameter (parameterName = "identification")   
	       ,@Parameter (parameterName = "surname2")   
	       ,@Parameter (parameterName = "married_surname",  path = "marriedSurname")   
	       ,@Parameter (parameterName = "study_place", path = "studyPlace")      
	       ,@Parameter (parameterName = "tax_code", path = "taxCode")   
	       ,@Parameter (parameterName = "marital_status", path = "maritalStatus")   
	       ,@Parameter (parameterName = "name3")
	       ,@Parameter (parameterName = "company_position", path = "companyPosition")   
	       ,@Parameter (parameterName = "name2")   
	       ,@Parameter (parameterName = "name1")   
	       ,@Parameter (parameterName = "study_degree", path = "studyDegree")   
	       ,@Parameter (parameterName = "occupation_description", path = "occupationDescription")   
	})
	private PersonTO parameter = null;

	@Override
	public void setId(Long id) {
		// TODO Auto-generated method stub
		this.id = id;
	}

	@Override
	public Long getId() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public void setParameter(PersonTO parametro) {
		// TODO Auto-generated method stub
		this.parameter = parametro;
	}

	@Override
	public PersonTO getParameter() {
		// TODO Auto-generated method stub
		return this.parameter;
	}

}
