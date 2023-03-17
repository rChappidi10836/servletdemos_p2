package com.studentweb.utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.studentweb.model.Student;

public class StudentDataUtil {
	
	List<Student> students = new ArrayList<>();
	
//	private DataSource datasource;
	
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs   = null;
	
	public StudentDataUtil(Connection con) {
		this.con=con;
	}
	
	public List<Student> getStudents(){
		try {
//			con = this.datasource.getConnection();
			stmt = con.createStatement();
			ResultSet resultSet = stmt.executeQuery("select * from student order by id");
			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String fname = resultSet.getString("first_name");
				String lname = resultSet.getString("last_name");
				String email = resultSet.getString("email");
				Student student = new Student(id, fname, lname, email);
				students.add(student);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(con, stmt, rs);
		}
		return students;
	}

	private void close(Connection con2, Statement stmt2, ResultSet rs2) {
		
		try {
			if(rs!=null)
				rs.close();
			if(stmt!=null)
				stmt.close();
			if(con!=null)
				con.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
