package com.flyaway.customer.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.hibernate.mapping.Index;

import com.flyaway.customer.model.Flights_details;
import com.flyaway.customer.util.FlightDataUtil;

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
		List<Flights_details> fds = new ArrayList<>();
		
		PrintWriter out=response.getWriter();
//		long date = Long.parseLong(request.getParameter("date"));
//		System.out.println("date ="+date);
		String date = request.getParameter("d");
//		System.out.println(request.getParameter("d"));
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String numpeople=request.getParameter("numpeople");
		int nop=Integer.parseInt(numpeople);
//		System.out.println(date +" "+source +" "+destination +" "+nop);
		
		fds= flightdatautil.search(date,source,destination,nop);
		if(fds.isEmpty()) {
//			System.out.println("is empty");
			response.setContentType("text/html");
			out.println("<div style='position: relative; left: 30%; top: 45%;' ><h1 >No Flights Available for Entered Data</h1> <br><a href='input_details.jsp' style='position: relative; left: 10%; bottom:15'>Try another dates or locations</a></div>");
//			out.print(";");
//			out.("<a href="Index.html">Try another dates or locations</a>");
		}else {
		request.setAttribute("avail_flights",fds);
		request.setAttribute("nop", nop);
		RequestDispatcher rd= request.getRequestDispatcher("/avail_flights.jsp");
		rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
