<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Available Flights</title>
</head>
<body>
	<div style='position: relative;left: 30%;bottom: -200px;' >
	<table border=1 style="text-align : center">
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
			<td><a href="registrationservlet?Idnum=${d.id}&np=${nop}"><button name="req_flight">select</button></a></td><!--  &np=${nop}-->
		</tr>
		</c:forEach>
		<tr>
			
		</tr>
		
	
	</table>
	
	<a href="input_details.jsp" style='position: relative; left: 20%; top:30px'>Search for other flights</a>
	</div>
</body>
</html>