package com.hibernatehelloworld;

import org.hibernate.Session;

import com.hibernatehelloworld.domain.Address;
import com.hibernatehelloworld.domain.Person;
import com.hibernatehelloworld.utils.HibernateUtil;

public class HibernateDemo {
	
	public static void main(String[] args) {
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		session.beginTransaction();
		
		Address address = new Address("1234 Main street","dholapur","500049");
		
		Person person = new Person("John",address);
		
		session.save(person);
		
		session.getTransaction().commit();
		
		session.close();
	}

}
