<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	$(function() {
	console.log("#ajax click");


	})
</script>
</head>
<body>
<table>
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>추천수</th>
		<th>작성일</th>
	</tr>
		
<c:forEach var="fblist" items="${fbList}">
	<tr>
		<td>${fblist.freeboardNo}</td>
	 	<td>${fblist.freeboardTitle}</td>
		<td>${fblist.freeboardHit}</td>
		<td>${fblist.freeboardDate}</td>
	</tr>
</c:forEach>
</table>
</body>
</html>