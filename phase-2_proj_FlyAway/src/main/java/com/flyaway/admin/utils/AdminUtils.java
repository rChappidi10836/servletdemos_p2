package com.flyaway.admin.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.flyaway.customer.model.Flights_details;

public class AdminUtils {
	
	private DataSource datasource;

	public AdminUtils(DataSource datasource) {
		this.datasource = datasource;
	}

	public boolean authadmin(String un, String pwd)  {
		
		Connection con=null;
		PreparedStatement ps=null;
		
		ResultSet k;
		try {
			con=this.datasource.getConnection();
			ps=con.prepareStatement("select * from admin where username = ? and password = ? ");
//			System.out.println("un ="+un+" pwd="+pwd);
			ps.setString(1, un);
			ps.setString(2, pwd);
			k = ps.executeQuery();
			if (k.next()) {
				return true;
			}else
			 {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con, ps);
		}
		return false;
	}

	public List<Flights_details> getsd() {
		List<Flights_details> sd = new ArrayList<Flights_details>();
		
		
		Connection con = null;
		Statement stmt = null;
		
		try {
			con = this.datasource.getConnection();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select source, destination from flights");
			while(rs.next()) {
				String source = rs.getString("source");
				String dest = rs.getString("destination");
				
				Flights_details fd = new Flights_details(source,dest);
				sd.add(fd);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(con, stmt);
		}
		return sd;
		
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

	public List<Flights_details> getal() {
		List<Flights_details> sd = new ArrayList<Flights_details>();
		
		
		Connection con = null;
		Statement stmt = null;
		
		try {
			con = this.datasource.getConnection();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select company from flights");
			while(rs.next()) {
				String company = rs.getString("company");
				Flights_details fd = new Flights_details(company);
				sd.add(fd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(con, stmt);
		}
		return sd;
		
	}

	public List<Flights_details> getfl() {
		List<Flights_details> sd = new ArrayList<Flights_details>();
		
		
		Connection con = null;
		Statement stmt = null;
		
		try {
			con = this.datasource.getConnection();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select source,destination,company,price from flights");
			while(rs.next()) {
				String source = rs.getString("source");
				String dest = rs.getString("destination");
				String company = rs.getString("company");
				int ticket = rs.getInt("price");
				
				Flights_details fd = new Flights_details(source,dest,company,ticket);
				sd.add(fd);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(con, stmt);
		}
		return sd;
		
	}

	public boolean pwd_update(String username,String pwd, String npwd) {
		
		Connection con = null;
		PreparedStatement stmt = null;
		int k = 0 ;
//		System.out.println(studentId);
		try {
			// get connection from connection pool
			con = this.datasource.getConnection();
//			System.out.println(npwd +" "+username+ " "+pwd);
			String sql = "update admin set password=? where username=? and password=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, npwd);
			stmt.setString(2, username);
			stmt.setString(3, pwd);
			k=stmt.executeUpdate();
//			System.out.println("utils k ="+k);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, stmt);
		
		
	}
		if(k==1)
			return true;
		else
			return false;
	}
}
	
	
	

