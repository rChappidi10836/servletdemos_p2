<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Find Flights</title>
</head>
<body>
	<!-- date of travel, source, destination, and the number of persons -->
	<form action="search_flight" method="" style="margin-top: 200px;">
		<table align="center">
			<tr>
				<th>
					<h2>Enter required flight</h2>
				</th>
				<th>
					<h2>details to Search</h2>
				</th>
			</tr>
			<tr></tr>
			<tr>
				<td>Date of Travel:</td>
				<td><input type="date" name="d" /></td>
			</tr>
			<tr>
				<td>Source:</td>
				<td><input list="cityname" type="text" name="source" /> 
				<datalist id="cityname">
						<option value="Hyderabad">
						<option value="Pune">
						<option value="Delhi">
						<option value="Kolkata">
						<option value="Mumbai">
					</datalist></td>
			</tr>
			<tr>
				<td>Destination:</td>
				<td><input list="cityname" type="text" name="destination" /> 
				<datalist id="cityname">
						<option value="Hyderabad">
						<option value="Pune">
						<option value="Delhi">
						<option value="Kolkata">
						<option value="Mumbai">
					</datalist></td>
			</tr>
			<tr>
				
				<td>Number of Persons:</td>
				<td><input type="text" name="numpeople" /></td>
				<!--<c:set var="nop" scope="session" value="${input_details.numpeople}"></c:set>
				<c:out value="${nop}"/>-->
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="search" /></td>
				
			</tr>
		</table>
	</form>
</body>
<style>
.center {
	margin-bottom: auto;
	margin-left: auto;
	margin-right: auto;
}
</style>

</html>