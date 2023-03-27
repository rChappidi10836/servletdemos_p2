<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Logged IN as</h3>${un}
	
			<form id="foo2" method="post" action="Handle_Admin_Features"><input type="hidden" name="id" value=2 /><input type="hidden" name="un" value="${un}"/><input type="hidden" name="pass" value="${pwd}"/></form>
			<form id="foo3" method="post" action="Handle_Admin_Features"><input type="hidden" name="id" value=3 /><input type="hidden" name="un" value="${un}"/><input type="hidden" name="pass" value="${pwd}"/></form>
			<form id="foo4" method="post" action="Handle_Admin_Features"><input type="hidden" name="id" value=4 /><input type="hidden" name="un" value="${un}"/><input type="hidden" name="pass" value="${pwd}"/></form>
		<table align="center" style="margin-top: 180px;">
			<th><font size="10">Admin Features</font></th>
			<tbody>
			<tr><td><a href="Passing?un=${un}&pwd=${pwd}">Password Change</a></td></tr>
			<tr><td><a href="#" onclick="document.getElementById('foo2').submit(); return false;">Print Master List of Source and Destination</a></td></tr>
			<tr><td><a href="#" onclick="document.getElementById('foo3').submit(); return false;">Print Master List of AirLines</a></td></tr>
			<tr><td><a href="#" onclick="document.getElementById('foo4').submit(); return false;">Print List of Flights with details</a></td></tr></tbody>
		</table>
		<br><br><br><br><br><br><br><br>
		<p>${msg}</p>
	<font size="8"><a href="Index.html" style="margin-left:80%">Log Out></a></font>
	
</body>
</html>