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
	
	
	<%
		//traditional approach
		String[] cities = {"Mumbai", "Singapore","Malaysia","Chennai"};
		pageContext.setAttribute("places", cities);
	%>
	
	<%
	
		for(String place:cities){
			out.println(place);
		}
	%>
	
	<p>using tags</p>
	
	<!-- Short approach -->
	<c:forEach var="place" items="${places}">
		-->${place} <br/>
	</c:forEach>
	
</body>
</html>