package com.bookstorewebapp.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.bookstorewebapp.domain.Book;
import com.bookstorewebapp.utils.HibernateUtil;

@WebServlet("/readbooks")
public class readbooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		List<Book> books = session.createQuery("from Book").list();
		
		Criteria cr = session.createCriteria(Book.class);
		cr.add(Restrictions.eqProperty("name","sapiens"));
		List<Book> books2 =cr.list();
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
