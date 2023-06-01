<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
#container {
	margin-left: 20%;
}
</style>
<c:import url="/WEB-INF/views/layout/partnerLayout/header.jsp"/>
<div id="container">
	<div class="table table-hover table-sm text-center pt-5" >
	<table >
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성일</th>
		</tr>
	<c:forEach var="notice" items="${noticelist }">	
		<tr>
			<td>${notice.partnerNoticeNo }</td>
			<td>${notice.partnerNoticeTitle }</td>
			<td>${notice.partnerNoticeDate }</td>
		</tr>
	</c:forEach>
	</table>
	</div>
	<a href="/partner/writenotice"><button>공지사항 작성</button></a>
</div>

	

</body>
</html>