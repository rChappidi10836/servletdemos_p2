package com.mvc.demo.utils;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;

import com.mvc.demo.model.User;

public class UserDatatUtil extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	
	
	public static List<User> getUsers(){
		
		
		
		List<User> users= new ArrayList<>();
		users.add(new User("no3","friend","n3@crock.com","ship"));
		users.add(new User("no0","fri&foe","n0@crock.com","mix"));
		users.add(new User("no2","candy","n2@crock.com","bar"));
		users.add(new User("no1","ROBIN","n1@crock.com","crewmate"));
		return users;

	}
}
