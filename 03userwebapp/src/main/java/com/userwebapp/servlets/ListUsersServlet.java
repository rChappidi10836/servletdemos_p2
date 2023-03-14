package com.userwebapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/listusers")
public class ListUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Connection connection;

	
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

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try(Statement statement = connection.createStatement();
			ResultSet rs= statement.executeQuery("Select * from user");) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			
			out.println("<table border=1>");
			out.println("<tr>");
			out.println("<th>First Name</th>");
			out.println("<th>Last  Name</th>");
			out.println("<th>EMail ID</th>");
			out.println("<tr>");
			while(rs.next()) {
				String firstname = rs.getString(1);
				String lastname = rs.getString(2);
				String emailID = rs.getString(3);
				out.println("<tr>");
				out.println("<td>"+firstname+  "</th>");
				out.println("<td>"+lastname+"</th>");
				out.println("<td>"+emailID+"</td>");
				out.println("<tr>"); 
//				out.print(firstname);
//				out.print(lastname);
//				out.print(emailID);
			} 
			out.println("</table>");
			out.println("<a href=\"INDEX.html\">HOME</a>");
		} catch (SQLException e) {
			e.printStackTrace();
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
