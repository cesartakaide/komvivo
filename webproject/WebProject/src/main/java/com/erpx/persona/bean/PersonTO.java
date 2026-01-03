package com.erpx.persona.bean;

import java.util.Calendar;

import com.dme.base.annotations.CatalogMapping;
import com.dme.base.annotations.FieldDescriptor;
import com.dme.base.constants.Constants;
import com.dme.base.to.BaseModelTO;
import com.dme.catalog.to.CatalogDetailTO;
import com.erpx.general.enums.Gender;
import com.fasterxml.jackson.annotation.JsonFormat;

public class PersonTO extends BaseModelTO {

	private static final long serialVersionUID = 3694348924730258432L;
	
	private boolean acceptPublicity = false; // bit = null
	private String universityCareer = null;// varchar (10) = null
	@JsonFormat(pattern=Constants.DATE_FORMAT, timezone="GMT-6")
	@FieldDescriptor(mandatory = true)
	private Calendar birthdate = null;// datetime = null
	private String occupation = null;// char (10) = null
	@FieldDescriptor(mandatory = true)
	private Gender gender = null;// char (1) = null
	@FieldDescriptor(mandatory = true)
	private String identificationType = null;// char (10) = null
	@FieldDescriptor(mandatory = true)
	private String longName = null;// nvarchar (500) = null
	private String workplace = null;// varchar (50) = null
	@FieldDescriptor(mandatory = true)
	private String surname1 = null;// nvarchar (100) = null
	@FieldDescriptor(mandatory = true)
	private String identification = null;// nvarchar (100) = null
	private String surname2 = null;// nvarchar (100) = null
	private String marriedSurname = null;// nvarchar (100) = null
	private String studyPlace = null;// varchar (50) = null
	private String taxCode = null;// nvarchar (100) = null
	@CatalogMapping(catalogDomain = "ERPX", catalogName = "marital_status")
	private CatalogDetailTO maritalStatus = null;// char (10) = null
	private String name3 = null;// nvarchar (100) = null
	@CatalogMapping(catalogDomain = "ERPX", catalogName = "company_position")
	private CatalogDetailTO companyPosition = null;// varchar (10) = null	
	private String name2 = null;// nvarchar (100) = null
	@FieldDescriptor(mandatory = true)
	private String name1 = null;// nvarchar (100) = null
	@CatalogMapping(catalogDomain = "ERPX", catalogName = "study_degree")
	private CatalogDetailTO studyDegree = null;// varchar (10) = null
	private String occupationDescription = null;// varchar (100) = null
	
	public boolean isAcceptPublicity() {
		return acceptPublicity;
	}
	public void setAcceptPublicity(boolean acceptPublicity) {
		this.acceptPublicity = acceptPublicity;
	}
	public String getUniversityCareer() {
		return universityCareer;
	}
	public void setUniversityCareer(String universityCareer) {
		this.universityCareer = universityCareer;
	}
	public Calendar getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Calendar birthdate) {
		this.birthdate = birthdate;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public Gender getGender() {
		return gender;
	}
	public void setGender(Gender gender) {
		this.gender = gender;
	}
	public String getIdentificationType() {
		return identificationType;
	}
	public void setIdentificationType(String identificationType) {
		this.identificationType = identificationType;
	}
	public String getLongName() {
		return longName;
	}
	public void setLongName(String longName) {
		this.longName = longName;
	}
	public String getWorkplace() {
		return workplace;
	}
	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}
	public String getSurname1() {
		return surname1;
	}
	public void setSurname1(String surname1) {
		this.surname1 = surname1;
	}
	public String getIdentification() {
		return identification;
	}
	public void setIdentification(String identification) {
		this.identification = identification;
	}
	public String getSurname2() {
		return surname2;
	}
	public void setSurname2(String surname2) {
		this.surname2 = surname2;
	}
	public String getMarriedSurname() {
		return marriedSurname;
	}
	public void setMarriedSurname(String marriedSurname) {
		this.marriedSurname = marriedSurname;
	}
	public String getStudyPlace() {
		return studyPlace;
	}
	public void setStudyPlace(String studyPlace) {
		this.studyPlace = studyPlace;
	}
	public String getTaxCode() {
		return taxCode;
	}
	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}
	public CatalogDetailTO getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(CatalogDetailTO maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getName3() {
		return name3;
	}
	public void setName3(String name3) {
		this.name3 = name3;
	}
	public CatalogDetailTO getCompanyPosition() {
		return companyPosition;
	}
	public void setCompanyPosition(CatalogDetailTO companyPosition) {
		this.companyPosition = companyPosition;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public CatalogDetailTO getStudyDegree() {
		return studyDegree;
	}
	public void setStudyDegree(CatalogDetailTO studyDegree) {
		this.studyDegree = studyDegree;
	}
	public String getOccupationDescription() {
		return occupationDescription;
	}
	public void setOccupationDescription(String occupationDescription) {
		this.occupationDescription = occupationDescription;
	}

}
