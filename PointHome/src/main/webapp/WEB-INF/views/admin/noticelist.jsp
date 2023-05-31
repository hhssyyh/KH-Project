<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
function filterSelect() {
	console.log("click")

	console.log( $("#filter").val() )

	var filter = $("#filter").val();
	location.href = "?filter=" + filter
}
</script>

<style type="text/css">
#container {
	margin-left: 20%;
}
</style>
<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp"/>
<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp"/>
<div id="container">
	<div class="table table-hover table-sm text-center pt-5" >
<select class ="mt-5"id="filter" name="filter" onchange="filterSelect()">
	<c:choose>
		<c:when test="${filter eq 'p'.charAt(0) }">
			<option value="a">전체</option>
			<option value="p" selected>제휴사</option>
			<option value="u">유저</option>
		</c:when>
		<c:when test="${filter eq 'u'.charAt(0) }">
			<option value="a">전체</option>
			<option value="p" >제휴사</option>
			<option value="u" selected>유저</option>
		</c:when>
		<c:otherwise>
			<option value="a" selected>전체</option>
			<option value="p" >제휴사</option>
			<option value="u" >유저</option>
		</c:otherwise>
		
		
	</c:choose>

</select>
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
	<a href="/admin/writenotice"><button>공지사항 작성</button></a>
</div>

	

</body>
</html>