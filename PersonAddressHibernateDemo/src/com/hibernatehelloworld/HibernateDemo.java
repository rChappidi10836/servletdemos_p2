package com.hibernatehelloworld;

import org.hibernate.Session;

import com.hibernatehelloworld.domain.Address;
import com.hibernatehelloworld.domain.Person;
import com.hibernatehelloworld.utils.HibernateUtil;

public class HibernateDemo {
	
	public static void main(String[] args) {
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		session.beginTransaction();
		
		Address address1 = new Address("1234 home street","dholapur","500049");
		
		Address address2 = new Address("4321 bill street","dholgapan","500049");

		
		Person person = new Person("max",address1,address2);
		
		session.save(person);
		
		session.getTransaction().commit();
		
		session.close();
	}

}
