<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<c:set var="data" value="helloworld"/>
	Value of variable = <b>${data}</b><br/>
	
	Length of variable = ${fn:length(data)}<br>
	
	value of the variable in uppercase = ${fn:toUpperCase(data)}
	
</body>
</html>