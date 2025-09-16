package com.erpx.entity.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dme.bean.to.DaoTO;
import com.erpx.entity.bean.Entity;
import com.erpx.general.ERPConstants;
import com.viewengine.annotation.ControllerMetadata;
import com.viewengine.annotation.ControllerPrimaryKeyField;
import com.viewengine.controller.base.ModelDrivenController;
import com.viewengine.controller.interfaces.IManttoController;
import com.viewengine.exception.RestException;

@RestController
@RequestMapping("/Entity")
@ControllerMetadata(domains=ERPConstants.ERP_DOMAIN, directory="entity", primaryKeyFields={	
	@ControllerPrimaryKeyField(name="id", path="id")	
})
public class EntityController extends ModelDrivenController<Entity> implements IManttoController<Entity>{	
	
	public EntityController() {
		super();
	}

	
	@Override
	public Entity create(Entity parametro) throws RestException {
        setDefaultInsertData(parametro);
        return super.create(parametro);
	}
	
	@Override
	public Entity update(Entity parametro) throws RestException {	
		setDefaultUpdateData(parametro);
		return super.update(parametro);
	}

	
	@Override
	public Entity detail(long correlativo) throws RestException {
		return super.detail(correlativo);
	}

	@Override
	public void remove(long id, int rowVersion) throws RestException{
		// TODO Auto-generated method stub
		super.remove(id, rowVersion);
	}

	@Override
	public void setDefaultInsertData(Entity parametro) throws RestException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setDefaultUpdateData(Entity parametro) throws RestException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setSystemData(DaoTO daoTO) throws RestException {
		// TODO Auto-generated method stub
		
	}


	@Override
	public Class<Entity> getModelClass() {
		// TODO Auto-generated method stub
		return Entity.class;
	}


	

}
