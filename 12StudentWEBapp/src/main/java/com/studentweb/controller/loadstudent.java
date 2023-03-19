package com.studentweb.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.studentweb.model.Student;
import com.studentweb.utils.StudentDataUtil;


@WebServlet("/loadstudent")
public class loadstudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/studentweb")
	private DataSource datasource;
  
	private StudentDataUtil studentDataUtil;
	
	public void init(ServletConfig config) throws ServletException {
		// To Create connection
		try {
			
			studentDataUtil = new StudentDataUtil(datasource);
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String studentId = request.getParameter("studentId");
		int id =Integer.parseInt(studentId);
//		Student student =studentDataUtil.getStudent(id);
		request.setAttribute("STUDENT", studentDataUtil.getStudent(id));
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/updatestudent.jsp");
		dispatcher.forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
