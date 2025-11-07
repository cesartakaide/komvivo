package com.erpx.persona.controller;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dme.base.interfaces.IQueryDao;
import com.dme.bean.to.DaoTO;
import com.erpx.general.ERPConstants;
import com.erpx.persona.bean.PersonTO;
import com.erpx.persona.command.ListPerson;
import com.viewengine.annotation.ControllerMetadata;
import com.viewengine.controller.base.QueryController;
import com.viewengine.exception.RestException;

@RestController
@RequestMapping("/PersonList")
@ControllerMetadata(domains=ERPConstants.ERP_DOMAIN, directory="person")
public class PersonListController extends QueryController<PersonTO, PersonTO>{

	
	@RequestMapping( method = RequestMethod.GET)
	public @ResponseBody List<PersonTO> list(@RequestParam(name = "company") int company
			,@RequestParam(name = "name1") String name1
			,@RequestParam(name = "name2") String name2
			,@RequestParam(name = "name3") String name3) throws RestException {
		PersonTO criteria = new PersonTO();
		criteria.setName1(name1);
		criteria.setName2(name2);
		criteria.setName3(name3);
		criteria.setCompany(company);
		return super.listBase(criteria);		
	}
	
	@Override
	public IQueryDao<PersonTO, PersonTO> buildQueryDao(PersonTO criteria) throws Exception {
		// TODO Auto-generated method stub
		return new ListPerson();
	}
	
	@Override
	public void setSystemData(DaoTO daoTO) throws RestException {
		// TODO Auto-generated method stub
		
	}
}
