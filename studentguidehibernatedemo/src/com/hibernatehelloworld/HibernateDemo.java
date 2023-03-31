package com.hibernatehelloworld;

import org.hibernate.Session;

import com.hibernatehelloworld.domain.Guide;
import com.hibernatehelloworld.domain.Student;
import com.hibernatehelloworld.utils.HibernateUtil;

public class HibernateDemo {
	
	public static void main(String[] args) {
		
//		demo1();
		
//		demo2();
		
//		demo3();
		
	}
	
	private static void demo3() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		session.beginTransaction();
		
		Guide guide = session.get(Guide.class, 1L);
		
		System.out.println("No of students = "+guide.getStudents().size());
		
		session.getTransaction().commit();
		
		session.close();
		
	}

	private static void demo2() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		session.beginTransaction();
		
		Guide guide = new Guide("A102","Variety", 4500);
		Student std1 = new Student("0527","Raja",guide);
		
		session.persist(std1);
		
		session.getTransaction().commit();
		
		session.close();
	}
	private static void demo1() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		session.beginTransaction();
		
		Guide guide = new Guide("A101","aDHI", 3000);
		Student std1 = new Student("0537","Raj",guide);
		Student std2 = new Student("0538","Mahi",guide);
		
		session.save(guide);
		session.save(std1);
		session.save(std2);
		
		session.getTransaction().commit();
		
		session.close();
	}

}
