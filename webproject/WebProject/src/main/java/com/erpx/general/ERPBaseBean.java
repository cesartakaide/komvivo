package com.erpx.general;

import java.util.Date;

import com.dme.base.constants.Constants;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.viewengine.beans.BaseBean;



public abstract class ERPBaseBean extends BaseBean{
	

	
	private int company=0;	
	private String usuarioing =null;
	private String usuariomod=null;
	private String maquinaing = null;
	private String maquinamod = null;
	
	@JsonFormat(pattern=Constants.DATE_FORMAT, timezone="GMT-6")
	private Date creationDate=null;
	
	@JsonFormat(pattern=Constants.DATE_FORMAT, timezone="GMT-6")	
	private Date modifyDate = null;
	private String terminal=null;
	
	public int getCompany() {
		return company;
	}
	public void setCompany(int company) {
		this.company = company;
	}
	public String getUsuarioing() {
		return usuarioing;
	}
	public void setUsuarioing(String usuarioing) {
		this.usuarioing = usuarioing;
	}
	public String getUsuariomod() {
		return usuariomod;
	}
	public void setUsuariomod(String usuariomod) {
		this.usuariomod = usuariomod;
	}
	public String getMaquinaing() {
		return maquinaing;
	}
	public void setMaquinaing(String maquinaing) {
		this.maquinaing = maquinaing;
	}
	public String getMaquinamod() {
		return maquinamod;
	}
	public void setMaquinamod(String maquinamod) {
		this.maquinamod = maquinamod;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getTerminal() {
		return terminal;
	}
	public void setTerminal(String terminal) {
		this.terminal = terminal;
	}
	
	
	
}
