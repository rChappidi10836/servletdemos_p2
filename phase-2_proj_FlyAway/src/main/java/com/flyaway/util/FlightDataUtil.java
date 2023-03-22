package com.flyaway.util;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.flyaway.model.Flights_details;

public class FlightDataUtil {

	private DataSource datasource;
	
	List<Flights_details> fds = new ArrayList<>();
	
	public FlightDataUtil(DataSource datasource) {
		this.datasource = datasource;
	}

	public List<Flights_details> search(String date, String source, String destination, int nop) {
		
		Connection con = null;
		PreparedStatement stmt = null;
		int k=0;
//		System.out.println(studentId);
		try {
			// get connection from connection pool
			con = this.datasource.getConnection();
			String sql = "select * from flights where dates =? and source = ? and destination = ? and seats > ? ";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, date);
			stmt.setString(2, source);
			stmt.setString(3, destination);
			stmt.setInt(4, nop);
			ResultSet rs=stmt.executeQuery();
			
			while(rs.next()) {
				
				int id=rs.getInt("id");
				String comp=rs.getString("company");
				String dt = rs.getString("dates");
				String sou = rs.getString("source");
				String dest = rs.getString("destination");
				int seats=rs.getInt("seats");
				int price=rs.getInt("price");
				
				Flights_details fd=new Flights_details(id,comp,dt,sou,dest,seats,price);
				fds.add(fd);
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return fds; 
		
	}
	
	

}
