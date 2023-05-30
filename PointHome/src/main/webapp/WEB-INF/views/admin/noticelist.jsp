<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
#container {
	margin-top: 120px;
	margin-left: 20%;
}
</style>
<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp"/>
<div id="container">
	<div class="table table-hover table-sm text-center">
	<table >
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성일</th>
		</tr>
	<c:forEach var="notice" items="${noticelist }">	
		<tr>
			<td>${notice.noticeNo }</td>
			<td>${notice.noticeTitle }</td>
			<td>${notice.noticeDate }</td>
		</tr>
	</c:forEach>
	</table>
	</div>
	<a href="/admin/write"><button>글쓰기</button></a>
</div>
	

</body>
</html>