package com.flyaway.admin.controllers;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/Handle_Admin_Features")
public class Handle_Admin_Features extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/phases")
	private DataSource datasource;
	
	public AdminUtils adminutils;
	
	public void init(ServletConfig servletconfig) {
		adminutils=new AdminUtils(datasource);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
		RequestDispatcher rd; 
		
		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("un");
		String ppwd = request.getParameter("pass");
		
		switch(id) {
		case 1: 
				String pwd = request.getParameter("pwd");
				if(ppwd.equals(pwd)) {
					
					String npwd=request.getParameter("newpwd");
					String cnpwd=request.getParameter("confirmpwd");				 
				        if (pwd.equals(npwd)) {
				            request.setAttribute("pwd", ppwd);
				            request.setAttribute("un", username);
				            request.setAttribute("msg", "New password should be different from current");
				            rd=request.getRequestDispatcher("handle_password_update.jsp");
				            rd.forward(request, response);
				        }
				        else if (!npwd.equals(cnpwd)) {
				        	request.setAttribute("pwd", ppwd);
				        	request.setAttribute("un", username);
				        	
				            request.setAttribute("msg", "New password and confirmation new password are not matching");
				            rd=request.getRequestDispatcher("handle_password_update.jsp");
				            rd.forward(request, response);
				        }else {
		    	
						    	boolean r = adminutils.pwd_update(username,pwd,npwd);
						    	if(r) {
						    		String suc = "Password Updated, Login again";
									request.setAttribute("msg", suc);
						    		rd=request.getRequestDispatcher("admin_login.jsp");
							    	rd.forward(request, response);
						    	   }
						    	else {
						    	request.setAttribute("un", username);
						    	request.setAttribute("pwd", ppwd);
						    	String obst = "Invalid Password Update Try entering again";
								request.setAttribute("msg", obst);
						    	rd = request.getRequestDispatcher("admin_features.jsp");
						    	rd.forward(request, response);}
						    	   }
					}
				else {
						request.setAttribute("pwd", ppwd);
						request.setAttribute("un", username);
			            request.setAttribute("msg", "Entered Current password is invalid, Check and Re-Enter it");
			            rd=request.getRequestDispatcher("handle_password_update.jsp");
			            rd.forward(request, response);
					}
				break;
		case 2: 
				request.setAttribute("sds",  adminutils.getsd());
				request.setAttribute("username", username);
				request.setAttribute("pwd", ppwd);
				rd=request.getRequestDispatcher("source-dest.jsp");
				rd.forward(request, response);
				break;
		case 3: request.setAttribute("als",  adminutils.getal());
				request.setAttribute("username", username);
				request.setAttribute("pwd", ppwd);
				rd=request.getRequestDispatcher("airlines.jsp");
				rd.forward(request, response);
				break;
		case 4: request.setAttribute("fls",  adminutils.getfl());
				request.setAttribute("username", username);
				request.setAttribute("pwd", ppwd);
				rd=request.getRequestDispatcher("flights.jsp");
				rd.forward(request, response);
				break;
		
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
