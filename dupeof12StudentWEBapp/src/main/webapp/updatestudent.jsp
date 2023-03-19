<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<form action="Updatestudent" method="get">
		<input type="hidden" name="studentId" value="${STUDENT.id}"/>
			Enter email to update:
			<input type="text" name="email" value="${STUDENT.email}"/>
			<input type="submit" name="submit"/>
		</form>
		<a href="index.html">back to list</a>
	
</body>
</html>