<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
			<h2> details to Search</h2>
			</th>
		</tr>
		<tr></tr>
		<tr>
			<td> Date of Travel:</td>
			<td><input type="date" name="d"/></td>
		</tr>
		<tr>
			<td>Source:</td>
			<td><input type="text" name="source"/></td>
		</tr>
		<tr>
			<td>Destination:</td>
			<td><input type="text" name="destination"/></td>
		</tr>
		<tr>
			<td>Number of Persons:</td>
			<td><input type="text" name="numpeople"/></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="search"/></td>
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