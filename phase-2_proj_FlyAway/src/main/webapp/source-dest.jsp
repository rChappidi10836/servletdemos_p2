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
<%-- 	<input type="hidden" name="un" value="${username}"/> --%>
<%-- 	<input type="hidden" name="pass" value="${password}"/> --%>
	<table border=1>
			<tr>
				<th>SOURCE</th>
				<th>DESTINATION</th>
			</tr>
	<c:forEach var="sd" items="${sds}">
			<tr>
				
				<td>${sd.source}</td>
				<td>${sd.destination}</td>
				
			</tr>
		</c:forEach>
	</table>
	
    <a href="backPassing?un=${username}&pass=${pwd}"> Back to Features </a>
</body>
</html>