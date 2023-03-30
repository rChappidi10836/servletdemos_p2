<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adding Book</title>
</head>
<body>
	
	<form action="AddBook" method="get">
		
		
		
		<table>
			<tr>
				<td>ISBN Name</td>
				<td><input name="isbn" /></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input name="name"/></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><input name="price" /></td>
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