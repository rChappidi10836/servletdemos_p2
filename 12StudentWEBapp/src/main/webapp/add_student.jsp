<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>
<body>

	<form action="Addstudent" method="get">
		
		
		
		<table>
			<tr>
				<td>First Name</td>
				<td><input name="firstName" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input name="lastName"/></td>
			</tr>
			<tr>
				<td>E Mail</td>
				<td><input name="emailID" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Save"/></td>
			</tr>
		</table>
		
		
	</form>
	<a href="index.html">Back of List</a>

</body>
</html>