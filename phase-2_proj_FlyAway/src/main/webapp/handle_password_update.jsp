<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body align="center" style="margin-top: 20%">


	<p>
		<font size="5">${msg}</font>
	<p>
		<input type="hidden" name="pwd" value="${pwd}"/>
		<input type="hidden" name="username" value="${un}"/>
		
		<font size="5"><a href='handle_pwd_to_apu?password=${pwd}&username=${un}'>Try Again</a></font>

</body>
</html>