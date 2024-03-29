package com.studentweb.model;
public class Student {
	
	
	private int id;
	private String firstName;
	private String lastName;
	private String email;
	
	public Student(String firstName, String lastName, String email) {
		super();
		this.setFirstName(firstName);
		this.setLastName(lastName);
		this.setEmail(email);
	}
	
	public Student(int id, String firstName, String lastName, String email) {
		super();
		this.setId(id);
		this.setFirstName(firstName);
		this.setLastName(lastName);
		this.setEmail(email);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
