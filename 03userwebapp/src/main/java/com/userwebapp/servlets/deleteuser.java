package com.userwebapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/deleteUserServlet")
public class deleteuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
public Connection connection;

	
	public void init() {
		// To Create connection
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/mydb", "root", "@MobVishnu1596");
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String emailID = request.getParameter("emailID");

		try (Statement statement = connection.createStatement();
				) {

			int result = statement.executeUpdate("Delete from user where email ='"+emailID+"'");
			PrintWriter out = response.getWriter();
			
			if (result > 0) {
				out.println("<h1> User Deleted in DB </h1>");
			} else {
				out.println("<h1> Error in deletion of user</h1>");
			}
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
