package com.erpx.entity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
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
	
	@Autowired
	private JmsTemplate jmsTemplate=null;
	
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
		Entity ent = super.detail(correlativo);				
		this.jmsTemplate.convertAndSend("myQueue", ent);
		return ent;
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


	public JmsTemplate getJmsTemplate() {
		return jmsTemplate;
	}


	public void setJmsTemplate(JmsTemplate jmsTemplate) {
		this.jmsTemplate = jmsTemplate;
	}


	

}
