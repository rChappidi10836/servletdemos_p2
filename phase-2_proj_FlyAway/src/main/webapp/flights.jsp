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
				<th>SOURCE</th>
				<th>DESTINATION</th>
				<th>AIR LINES</th>
				<th>TICKET PRICE</th>
			</tr>
	<c:forEach var="fl" items="${fls}">
			<tr>
				
				<td>${fl.source}</td>
				<td>${fl.destination}</td>
				<td>${fl.company}</td>
				<td>${fl.price}</td>
				
			</tr>
		</c:forEach>
	</table>
	
	<a href="backPassing?un=${username}&pass=${pwd}"> Back to Features </a>
	
</body>
</html>