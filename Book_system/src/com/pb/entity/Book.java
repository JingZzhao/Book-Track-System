package com.pb.entity;

public class Book {

	private String ISBN_Number;
	private String school_Number;
	private String Name;
	
	public String getISBN_Number() {
		return ISBN_Number;
	}
	public void setISBN_Number(String iSBN_Number) {
		ISBN_Number = iSBN_Number;
	}
	public String getSchool_Number() {
		return school_Number;
	}
	public void setSchool_Number(String school_Number) {
		this.school_Number = school_Number;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
}
