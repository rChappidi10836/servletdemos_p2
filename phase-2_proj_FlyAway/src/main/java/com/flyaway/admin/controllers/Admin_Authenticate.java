package com.flyaway.admin.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.flyaway.admin.utils.AdminUtils;

@WebServlet("/Admin_Athenticate")
public class Admin_Authenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/phases")
	private DataSource datasource;
	
	public AdminUtils adminutils;
	
	public void init(ServletConfig servletconfig) {
		adminutils = new AdminUtils(datasource);
	}
	
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String un=request.getParameter("un");
		String pwd=request.getParameter("password");
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		boolean test = adminutils.authadmin(un,pwd);
		if(test) {
			out.print(un+" in admin_authen");
			request.setAttribute("un", un);
			request.setAttribute("pwd", pwd);
			RequestDispatcher rs=request.getRequestDispatcher("admin_features.jsp");
			rs.forward(request, response);
		}else {
			out.println("<html>\r\n"
					+ "<body align=\"center\" style=\"margin-top:20%\">\r\n"
					+ "<p><font size=\"5\">Admin failed to login. Plz check the login credentials and re-enter properly</font><p>\r\n"
					+ "<font size=\"5\"><a href='admin_login.jsp'>Try Again</a></font>\r\n"
					+ "</body>\r\n"
					+ "</html>\r\n"
					+ "");
		}
		

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
