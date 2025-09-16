package com.erpx.entity.controller;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dme.base.interfaces.IQueryDao;
import com.dme.bean.to.DaoTO;
import com.erpx.entity.bean.Entity;
import com.erpx.entity.command.ListEntity;
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
		return super.listBase(null);		
	}

	@Override
	public IQueryDao<Entity, Entity> buildQueryDao(Entity criteria) throws Exception {
        return new ListEntity();
	}

	@Override
	public void setSystemData(DaoTO daoTO) throws RestException {
		// TODO Auto-generated method stub
		
	}

}
