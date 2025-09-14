package com.erpx.entity.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dme.base.interfaces.IQueryDao;
import com.dme.bean.to.DaoTO;
import com.erpx.entity.bean.Entity;
import com.erpx.general.ERPConstants;
import com.viewengine.annotation.ControllerMetadata;
import com.viewengine.controller.base.QueryController;
import com.viewengine.exception.RestException;

@RestController
@RequestMapping("/EntityList")
@ControllerMetadata(domains=ERPConstants.ERP_DOMAIN, directory="entity")
public class EntityListController extends QueryController<Entity, Entity>{

	@RequestMapping( method = RequestMethod.GET)
	public @ResponseBody List<Entity> list() throws RestException {
		
		List<Entity> v = new ArrayList<Entity>();
		
		Entity en = new Entity();
		en.setId(222);
		en.setName1("1111");
		en.setName2("1111");
		en.setSurname1("sur");
		en.setSurname2("sur1");
		en.setInsdate(Calendar.getInstance());
		en.setBirthDate(Calendar.getInstance().getTime());
		v.add(en);
		
		Entity en1 = new Entity();
		en1.setId(1);
		en1.setName1("name1");
		en1.setName2("name2");
		en1.setSurname1("sur");
		en1.setSurname2("sur1");
		en1.setInsdate(Calendar.getInstance());
		en1.setBirthDate(Calendar.getInstance().getTime());
		v.add(en1);
		
		Entity en2 = new Entity();
		en2.setId(2);
		en2.setName1("name2");
		en2.setName2("name2");
		en2.setSurname1("sur");
		en2.setSurname2("sur1");
		en2.setInsdate(Calendar.getInstance());
		en2.setBirthDate(Calendar.getInstance().getTime());
		v.add(en2);
		
		Entity en3 = new Entity();
		en3.setId(444);
		en3.setName1("1111");
		en3.setName2("1111");
		en3.setSurname1("sur");
		en3.setSurname2("sur1");
		en3.setInsdate(Calendar.getInstance());
		en3.setBirthDate(Calendar.getInstance().getTime());
		v.add(en3);
		
		return v;
	}
	
	
	
	public Entity detail(long correlativo) throws RestException {
		Entity en = new Entity();
		en.setId(222);
		en.setName1("1111");		
		return en;
	}	

	@Override
	public IQueryDao<Entity, Entity> buildQueryDao(Entity criteria) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setSystemData(DaoTO daoTO) throws RestException {
		// TODO Auto-generated method stub
		
	}

}
