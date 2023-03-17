package com.jsp.tagdemo;

public class Student {
	
	private String firstName;
	private String lastName;
	private boolean above90Percent;
	
	public Student(String firstName, String lastName, boolean above90) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.above90Percent=above90;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public boolean isAbove90Percent() {
		return above90Percent;
	}
	public void setAbove90Percent(boolean above90Percent) {
		this.above90Percent = above90Percent;
	}

}
