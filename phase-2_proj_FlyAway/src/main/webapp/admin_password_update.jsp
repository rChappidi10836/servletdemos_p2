<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<form method="post" action="Handle_Admin_Features">
	<input type="hidden" name="id" value=1 />
	<input type="hidden" name="un" value="${username}"/>
	<input type="hidden" name="pass" value="${password}"/>
<%-- 	<% String password = request.getParameter("password"); %> --%>
		<h3> PASSWORD UPDATION </h3>
		<table>
			<tr>
				<td>Current Password:</td>
				<td><input type="text" name="pwd"  required></td>
			</tr>
			<tr>
				<td>New Password:</td>
				<td><input type="text" name="newpwd" required></td>
			</tr>
			<tr>
				<td>Confirm New Password:</td>
				<td><input type="text" name="confirmpwd" required></td>
			</tr>
		</table>
		
		<input type="submit" value="submit">
	</form>
	
	
</body>

</html>