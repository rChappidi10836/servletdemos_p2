package com.studentweb.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studentweb.utils.StudentDataUtil;


@WebServlet("/mvcdemo")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	private StudentDataUtil studentDataUtil;
	private Connection connection;
	
	public void init(ServletConfig config) {
		// To Create connection
		try {
			ServletContext context = config.getServletContext();
			String dburl = context.getInitParameter("dburl");
			String dbuser = context.getInitParameter("dbuser");
			String dbpassword = context.getInitParameter("dbpassword");
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(dburl, dbuser, dbpassword);
			studentDataUtil = new StudentDataUtil(connection);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setAttribute("student_list", studentDataUtil.getStudents());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view_users.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
