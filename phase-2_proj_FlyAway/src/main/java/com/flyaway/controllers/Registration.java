package com.flyaway.controllers;

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

import com.flyaway.util.FlightDataUtil;


@WebServlet("/registrationservlet")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/phases")
	private DataSource datasource;
	
	public FlightDataUtil flightdatautil;
	
	
	public void init(ServletConfig servletconfig)  {
		
		flightdatautil = new FlightDataUtil(datasource);
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idnum = request.getParameter("Idnum");
		int ID= Integer.parseInt(idnum);
		int nop=Integer.parseInt(request.getParameter("np"));
		
		request.setAttribute("nop", nop);
		request.setAttribute("flight_details", flightdatautil.getFlightDetails(ID));
		
		RequestDispatcher dispatch= request.getRequestDispatcher("/registration.jsp");
		dispatch.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
