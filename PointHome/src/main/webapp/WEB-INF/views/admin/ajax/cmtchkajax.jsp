<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">


</script>


</head>
<body>
<table>
	<tr>
		<th>글 번호</th>
		<th>댓글 번호</th>
		<th>댓글 내용</th>
		<th>작성 날짜</th>
		
	</tr>
<c:forEach var="cmtlist" items="${cmtList }">
	<tr>
		<td>${cmtlist.freeboardNo }</td>
		<td>${cmtlist.commNo }</td>
		<td style="word-break: break-all">${cmtlist.commContent }</td>
		<td><fmt:formatDate value="${cmtlist.commDate }" pattern="yyyy/MM-dd"/> </td>
		
	</tr>
</c:forEach>
</table>


</body>
</html>