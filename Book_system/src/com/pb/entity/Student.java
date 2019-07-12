package com.pb.entity;

public class Student extends User{
	private String state;
	private float amountDue;
	private String fatherName;
	private String fatherTel;
	private String motherName;
	private String motherTel;
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public float getAmountDue() {
		return amountDue;
	}
	
	public void setAmountDue(float amountDue) {
		this.amountDue = amountDue;
	}
	
	public String getFatherName() {
		return fatherName;
	}
	
	public void setFatherName(String fa) {
		this.fatherName = fa;
	}
	
	public String getFatherTel() {
		return fatherTel;
	}
	
	public void setFatherTel(String ft) {
		this.fatherTel = ft;
	}
	
	public String getMotherTel() {
		return motherTel;
	}
	
	public void setMotherTel(String mt) {
		this.motherTel = mt;
	}
	
	public String getMotherName() {
		return motherName;
	}
	
	public void setMotherName(String mn) {
		this.motherName = mn;
	}
}
