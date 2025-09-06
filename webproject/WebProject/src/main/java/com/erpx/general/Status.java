package com.erpx.general;

import com.dme.base.interfaces.INemonicEnum;

public enum Status implements INemonicEnum{
	ACTIVE("A","Activo"), INACTIVE("I","Inactivo");
	
	
	private Status(String s, String desc){
		this.nemonic = s;
		this.description = desc;
	}
	
	private String description = null;
	private String nemonic = null;


	
	public static Status busquedaNemonico(String nemonic) throws Exception{
		Status[] arr= Status.values();
		for (Status estado : arr) {
			if (estado.getNemonic().equals(nemonic)){
				return estado;
			}
		}
		throw new Exception("NEMONICO (" + nemonic + ") NO ENCONTRADO");
	}

	@Override
	public String getNemonic() {		
		return nemonic;
	}

	public String getDescription() {
		return description;
	}

	public void setNemonic(String nemonic) {
		this.nemonic = nemonic;
	}
}
