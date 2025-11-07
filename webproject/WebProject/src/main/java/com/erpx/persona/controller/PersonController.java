package com.erpx.persona.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dme.base.to.BaseModelTO;
import com.dme.bean.to.DaoTO;
import com.erpx.general.ERPConstants;
import com.erpx.persona.bean.PersonTO;
import com.viewengine.annotation.ControllerMetadata;
import com.viewengine.annotation.ControllerPrimaryKeyField;
import com.viewengine.controller.base.ModelDrivenController;
import com.viewengine.controller.interfaces.IManttoController;
import com.viewengine.exception.RestException;


@RestController
@RequestMapping("/Person")
@ControllerMetadata(domains=ERPConstants.ERP_DOMAIN, directory="person", primaryKeyFields={	
	@ControllerPrimaryKeyField(name="id", path="id")	
})
public class PersonController extends ModelDrivenController<PersonTO> implements IManttoController<PersonTO>{

	@Override
	public PersonTO detail(long id) throws RestException {
		// TODO Auto-generated method stub
		return super.get(id);
	}

	@Override
	public void remove(long id, int rowVersion) throws RestException {
		// TODO Auto-generated method stub
		PersonTO person = super.get(id);
		super.delete(person);
	}
	
	@Override
	public PersonTO create(PersonTO parameter) throws RestException {
		// TODO Auto-generated method stub
		return super.create(parameter);
	}
	
	@Override
	public PersonTO update(PersonTO parameter) throws RestException {
		// TODO Auto-generated method stub
		return super.update(parameter);
	}

	@Override
	public Class<PersonTO> getModelClass() {
		// TODO Auto-generated method stub
		return PersonTO.class;
	}

	@Override
	public void setSystemData(BaseModelTO parameter) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setSystemData(DaoTO command) throws RestException {
		// TODO Auto-generated method stub
		
	}

}
