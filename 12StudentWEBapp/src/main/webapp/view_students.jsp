<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>
<body>
	
	<table border="2">
		<tr>
			<th>Id</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>  
			<th>Delete</th>
		</tr>
		<c:forEach var="student" items="${student_list}">
			<tr>
				<td><a href="loadstudent?studentId=${student.id}">${student.id}</a></td>
				<td>${student.firstName}</td>
				<td>${student.lastName}</td>
				<td>${student.email}</td>
				<td><a href="deletestudent?studentId=${student.id}">Delete</a></td>
				
			</tr>
		</c:forEach>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr>
			<td></td>
			<td></td>
			<td><a href="add_student.jsp">ADD NEW STUDENT</a></td>
			<td></td>
			<td></td>
			
		</tr>
	</table>
	
	<a href="index.html"> Back to index </a>
	
</body>
</html>