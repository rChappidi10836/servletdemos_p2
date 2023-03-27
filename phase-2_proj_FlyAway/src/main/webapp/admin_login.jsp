<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="Admin_Athenticate" method="post">

		<br>
		<br>
		<center>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>Username <input type="text" name="un" required/> <br>
			<br>
			<br> Password <input type="text" name="password" required/><br>
			<br> <input type="submit" value="login" />
			<br>
			<br>
			<br>
			${msg}
		</center>
	</form>
</body>
</html>