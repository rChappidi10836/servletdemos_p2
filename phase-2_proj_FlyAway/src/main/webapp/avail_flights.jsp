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
	<div style='position: relative;left: 30%;bottom: -200px;' >
	<table border=1>
		<tr>
			<th>Id</th>
			<th>Company</th>
			<th>Date</th>
			<th>Source</th>
			<th>Destination</th>
			<th>Available Seats</th>
			<th>Ticket Price</th>
			<th>Select Flight</th>
		</tr>
		
		<c:forEach var="d" items="${avail_flights}">
		<tr>
			<td>${d.id}</td>
			<td>${d.company}</td>
			<td>${d.dates}</td>
			<td>${d.source}</td>
			<td>${d.destination}</td>
			<td>${d.seats}</td>
			<td>${d.price}</td>
			<td><a href="registration?${d.id}"><button type=radio name="req_flight">select</button></a></td>
		</tr>
		</c:forEach>
		<tr>
			
		</tr>
		
	
	</table>
	
	<a href="Index.html" style='position: relative; left: 20%; top:30px'>Back to index</a>
	</div>
</body>
</html>