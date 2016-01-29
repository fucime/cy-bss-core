package org.cysoft.bss.core.model;

public class Company {
	
	private long id;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	private String code="";
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	private String name="";
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	private String address="";
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	private long cityId;
	public long getCityId() {
		return cityId;
	}
	public void setCityId(long cityId) {
		this.cityId = cityId;
	}

	private String city="";
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	private String zipCode="";
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	
	private String fiscalCode="";
	public String getFiscalCode() {
		return fiscalCode;
	}
	public void setFiscalCode(String fiscalCode) {
		this.fiscalCode = fiscalCode;
	}
	
	private String vatCode="";
	public String getVatCode() {
		return vatCode;
	}
	public void setVatCode(String vatCode) {
		this.vatCode = vatCode;
	}
	
	private long headDeptId;
	public long getHeadDeptId() {
		return headDeptId;
	}
	public void setHeadDeptId(long headDeptId) {
		this.headDeptId = headDeptId;
	}
	@Override
	public String toString() {
		return "Company [id=" + id + ", code=" + code + ", name=" + name + ", address=" + address + ", cityId=" + cityId
				+ ", city=" + city + ", zipCode=" + zipCode + ", fiscalCode=" + fiscalCode + ", vatCode=" + vatCode
				+ ", headDeptId=" + headDeptId + "]";
	}
	
	
	
}
