<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<span class="pick" > 
<input class="partNo" type="hidden" value="${partNo}">
	<c:if test="${isPick eq 0}">
		<button type="button" onclick="pickPart(this)" class="btn btn-primary"><i class="bi bi-heart"></i></button>
	</c:if>
	<c:if test="${isPick eq 1}">
		<button type="button" onclick="pickPart(this)" class="btn btn-primary"><i class="bi bi-heart-fill"></i></button>
	</c:if>
</span>

</body>
</html>