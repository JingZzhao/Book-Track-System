package com.pb.entity;

public class User {
	String userId;
	String Id;
	String name;
	int accessLevel;
	String type;
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId ) {
		this.userId = userId;
	}
	
	public String getId() {
		return Id;
	}
	
	public void setId(String Id) {
		this.Id = Id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public int getAccessLevel() {
		return accessLevel;
	}
	
	public void setAccessLevel(int accessLevel) {
		this.accessLevel = accessLevel;
	}
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
}
