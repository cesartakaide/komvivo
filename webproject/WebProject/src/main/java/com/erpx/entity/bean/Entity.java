package com.erpx.entity.bean;

import java.util.Date;

import com.dme.base.annotations.Model;
import com.dme.base.to.BaseModelTO;
import com.erpx.general.ERPConstants;
import com.fasterxml.jackson.annotation.JsonFormat;

@Model
public class Entity extends BaseModelTO{

	private static final long serialVersionUID = 6730861202497917013L;

	private String name1 = null;
	private String name2 = null;
	private String surname1 = null;
	private String surname2 = null;
	private String defaultAddress = null;
	private String type = null;
	@JsonFormat(pattern="yyyy-MM-dd", timezone = ERPConstants.TIMEZONE)
	private Date birthDate = null;
	@JsonFormat(pattern="yyyy-MM-dd", timezone = ERPConstants.TIMEZONE)
	private Date foundationDate = null;
	private boolean taxExtent = false;
	private String defaultIdentifier = null;
	private String guid = null;
	
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getSurname1() {
		return surname1;
	}
	public void setSurname1(String surname1) {
		this.surname1 = surname1;
	}
	public String getSurname2() {
		return surname2;
	}
	public void setSurname2(String surname2) {
		this.surname2 = surname2;
	}
	public String getDefaultAddress() {
		return defaultAddress;
	}
	public void setDefaultAddress(String defaultAddress) {
		this.defaultAddress = defaultAddress;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}	
	public boolean isTaxExtent() {
		return taxExtent;
	}
	public void setTaxExtent(boolean taxExtent) {
		this.taxExtent = taxExtent;
	}
	public String getDefaultIdentifier() {
		return defaultIdentifier;
	}
	public void setDefaultIdentifier(String defaultIdentifier) {
		this.defaultIdentifier = defaultIdentifier;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public Date getFoundationDate() {
		return foundationDate;
	}
	public void setFoundationDate(Date foundationDate) {
		this.foundationDate = foundationDate;
	}
	public String getGuid() {
		return guid;
	}
	public void setGuid(String guid) {
		this.guid = guid;
	}
	

}
