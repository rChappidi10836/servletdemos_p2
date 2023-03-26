package com.flyaway.customer.controllers;

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

import com.flyaway.customer.util.FlightDataUtil;

@WebServlet("/complete_registration")
public class complete_registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/phases")
	private DataSource datasource;
	
	public FlightDataUtil flightdatautil;
	
	
	public void init(ServletConfig servletconfig)  {
		
		flightdatautil = new FlightDataUtil(datasource);
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("Name");
		long phno=Long.parseLong(request.getParameter("Number"));
		int paid=Integer.parseInt(request.getParameter("paid"));
		
		flightdatautil.addcustomer(name,phno,id,paid);
		
		RequestDispatcher rd= request.getRequestDispatcher("/confirmation.html");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
