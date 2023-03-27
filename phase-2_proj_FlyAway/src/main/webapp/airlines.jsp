<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" name="un" value="${username}"/>
	<table border=1>
			<tr>
				<th>AIRLINES</th>
			</tr>
	<c:forEach var="al" items="${als}">
			<tr>
				<td>${al.company}</td>				
			</tr>
		</c:forEach>
	</table>
	
	<a href="backPassing?un=${username}&pass=${pwd}"> Back to Features </a>

</body>
</html>