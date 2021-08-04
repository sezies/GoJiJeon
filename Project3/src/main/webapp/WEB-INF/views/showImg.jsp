<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "cpath" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>


<c:forEach var = "vo" items="${list}">
	
	<tr>
		<td><img src = "${cpath}/resources/img/${vo.img}"></td>
	</tr>

</c:forEach>



</body>
</html>