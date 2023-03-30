package com.hibernatehelloworld.domain;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Person {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private Long id;
	
	@Column
	private String name;
	
	@Embedded
	private Address address;

	public Person(String name, Address address) {
		this.name = name;
		this.address = address;
	}
	
	
	
}
