package com.studentweb.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.studentweb.model.Student;

public class StudentDataUtil {

	List<Student> students = new ArrayList<>();

	private DataSource datasource;

	public StudentDataUtil(DataSource datasource) {
		this.datasource = datasource;
	}

	public List<Student> getStudents() {
		List<Student> students = new ArrayList<>();

		Connection con = null;
		Statement stmt = null;

		try {
			// get connection from connection pool
			con = this.datasource.getConnection();
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

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, stmt);
		}
		return students;
	}

	private void close(Connection con, Statement stmt) {

		try {

			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void deleteStudent(String studentId) {

		Connection con = null;
		PreparedStatement stmt = null;
//		System.out.println(studentId);
		try {
			// get connection from connection pool
			con = this.datasource.getConnection();
			String sql = "delete from student where id = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, studentId);
			stmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, stmt);
		}
	}

	public Student getStudent(int studentId) {
		Student student = null;
		Connection con = null;
		PreparedStatement stmt = null;

		try {
			// get connection from connection pool
			con = this.datasource.getConnection();
			
			String sql = "select * from student where id = ?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, studentId);
			ResultSet resultSet = stmt.executeQuery();
			
			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String fname = resultSet.getString("first_name");
				String lname = resultSet.getString("last_name");
				String email = resultSet.getString("email");
				student = new Student(id, fname, lname, email);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, stmt);
		}
		return student;
	}

	public void updateStudent(int studentId, String firstName, String lastName, String email) {

		Connection con = null;
		PreparedStatement stmt = null;
//		System.out.println(studentId);
		try {
			// get connection from connection pool
			con = this.datasource.getConnection();
			String sql = "update student set first_name = ?, last_name = ?, email = ? where id = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, firstName);
			stmt.setString(2, lastName);
			stmt.setString(3, email);
			stmt.setInt(4, studentId);

			stmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, stmt);
		}
	}

	public void addStudent(String firstName, String lastName, String email) {

		Connection con = null;
		PreparedStatement stmt = null;
//		System.out.println(studentId);
		try {
			// get connection from connection pool
			con = this.datasource.getConnection();
			String sql = "insert into student (first_name, last_name,email)values(?,?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, firstName);
			stmt.setString(2, lastName);
			stmt.setString(3, email);
			
			stmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, stmt);
		}
		
		
	}

}
