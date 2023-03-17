<%@ page import="java.util.*, com.jsp.tagdemo.Student" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
List<Student> students = new ArrayList<>();
students.add(new Student("Marine", "army",false));
students.add(new Student("Buddy", "clown",true));
students.add(new Student("MOM", "big",false));
pageContext.setAttribute("mystudents", students);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<table border="2">
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Discount</th>
		</tr>
		<c:forEach var="student" items="${mystudents}">
			<tr>
				<td>${student.firstName}</td>
				<td>${student.lastName}</td>
				<td>
					<c:if test="${student.above90Percent }">
						Yes
					</c:if>
					<c:if test="${not student.above90Percent }">
						N.A.
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>