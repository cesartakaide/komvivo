package com.erpx.entity.controller;

import java.util.Calendar;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dme.base.modeldriven.interfaces.ICreateCommand;
import com.dme.base.modeldriven.interfaces.IDeleteCommand;
import com.dme.base.modeldriven.interfaces.IGetCommand;
import com.dme.base.modeldriven.interfaces.IUpdateCommand;
import com.dme.bean.to.DaoTO;
import com.erpx.entity.bean.Entity;
import com.erpx.general.ERPConstants;
import com.viewengine.annotation.ControllerMetadata;
import com.viewengine.annotation.ControllerPrimaryKeyField;
import com.viewengine.controller.base.ManttoController;
import com.viewengine.controller.interfaces.IManttoController;
import com.viewengine.exception.RestException;

@RestController
@RequestMapping("/Entity")
@ControllerMetadata(domains=ERPConstants.ERP_DOMAIN, directory="entity", primaryKeyFields={	
	@ControllerPrimaryKeyField(name="id", path="id")	
})
public class EntityController extends ManttoController<Entity> implements IManttoController<Entity>{	
	
	public EntityController() {
		super();
	}

	
	@Override
	public Entity create(Entity parametro) throws RestException {
		// TODO Auto-generated method stub
		//return super.create(parametro);
		return detail(1);
	}
	
	@Override
	public Entity update(Entity parametro) throws RestException {
		//return super.update(parametro);
		parametro.setName1("NEW NAME (test)");		
		return parametro;		
	}

	
	@Override
	public Entity detail(long correlativo) throws RestException {
		Entity en = new Entity();
		en.setId(222);
		en.setName1("1111");				
		en.setName2("name2");
		en.setSurname1("sur");
		en.setSurname2("sur1");
		en.setInsdate(Calendar.getInstance());
		en.setBirthDate(Calendar.getInstance());
		en.setTaxExtent(true);
		en.setDefaultIdentifier("DEFAULT");
		en.setFoundationDate(Calendar.getInstance());
		return en;
	}

	@Override
	public void remove(long id, int rowVersion) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setDefaultInsertData(Entity parametro) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setDefaultUpdateData(Entity parametro) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setSystemData(DaoTO daoTO) throws RestException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ICreateCommand<Entity> buildCreateDao() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public IUpdateCommand<Entity> buildUpdateDao() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public IDeleteCommand<Entity> buildDeleteDao() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public IGetCommand<Entity> buildDetailDao() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	

}
