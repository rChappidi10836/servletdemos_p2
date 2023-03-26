package com.flyaway.admin.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

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
		}
		return false;
	}
	
	
	
}
