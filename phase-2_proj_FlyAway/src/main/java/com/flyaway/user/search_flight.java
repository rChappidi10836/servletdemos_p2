package com.flyaway.user;

import java.io.IOException;
import java.sql.Date;

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

@WebServlet("/search_flight")
public class search_flight extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/phases")
	private DataSource datasource;
	
	public FlightDataUtil flightdatautil;
	
	
	public void init(ServletConfig servletconfig)  {
		
		flightdatautil = new FlightDataUtil(datasource);
		
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		long date = Long.parseLong(request.getParameter("date"));
//		System.out.println("date ="+date);
		String date = request.getParameter("date");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		int nop=Integer.parseInt(request.getParameter("numpeople"));;
		
		request.setAttribute("avail_flights", flightdatautil.search(date,source,destination,nop));
		
		RequestDispatcher rd= request.getRequestDispatcher("/avail_flights.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
