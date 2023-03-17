package com.login.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Connection connection;
	private PreparedStatement preparedStatement;

	
	public void init(ServletConfig config) {
		// To Create connection
		try {
			ServletContext context = config.getServletContext();
			String dburl = context.getInitParameter("dburl");
			String dbuser = context.getInitParameter("dbuser");
			String dbpassword = context.getInitParameter("dbpassword");
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(dburl, dbuser, dbpassword);
//			connection = DriverManager.getConnection("jdbc:mysql://localhost/mydb", "root", "@MobVishnu1596");		
			preparedStatement = connection.prepareStatement("select * from user where email = ? and password = ?");
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		System.out.println(username);
		System.out.println(password);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		if(!isValidInput(username,false) || !isValidInput(password,false)) {
			out.println("<p>Invalid Input</p>");
			return;
		}
		try  {
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			ResultSet resultSet = null;

			boolean result = preparedStatement.execute();
			if (result)
				resultSet = preparedStatement.getResultSet();
			
//			System.out.println(resultSet.getFetchSize());
			
			if (resultSet.next()) {
				// now navigate to home page
				out.println("<h1> Successfully logged in</h1>");
				RequestDispatcher rd = request.getRequestDispatcher("homeservlet");
				String wlcummessage = "Welocm to Servlet Communication demo -"+username+"!!";
				request.setAttribute("message", wlcummessage);
				
				rd.include(request, response);
			}else {
				//navigate to login.html
				out.println("<p> User not found</p>");
				RequestDispatcher rd = request.getRequestDispatcher("Login.html");
				rd.include(request, response);
		}} catch (SQLException e) {
			out.println("Product Not Created. Error Occurred.\n Error message = "+e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	private boolean isValidInput(String inputValue, boolean isNumber) {
		if(inputValue == null || inputValue.isBlank() || inputValue.isEmpty()) {
			return false;
		}else if(isNumber) {
			try {
				Integer.parseInt(inputValue);
				return true;
			}catch(NumberFormatException nfe) {
				return false;
			}
		}else {
			return true;
		}
		
	}

	public void destroy() {
		// To destroy connection
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
