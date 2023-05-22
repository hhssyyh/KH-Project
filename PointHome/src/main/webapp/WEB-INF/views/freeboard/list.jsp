<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
#header, #footer {
	text-align: center;
}

#header h1 {
	line-height: 3em;
}

#footer {
	margin-top: 30px;
}

#header a {
	text-decoration: none;
}
</style>
</head>
<body>

<div id="header">
<h1><a class="text-info" href="/">HEADER</a></h1>
</div>
<div class="container text-center">

<h1 style="text-align: center">자유게시판</h1>
<div style="text-align: right">
<i class="bi bi-bar-chart-steps"></i>정렬기준
<select class="array">
	<option value="a">조회순</option>
	<option value="b">댓글순</option>
	<option value="c">추천순</option>
	<option value="d">날짜순</option>
</select>
</div>
<hr>

<table class="table table-hover table-sm">
<thead>
<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>닉네임</th>
	<th>조회수</th>
	<th>작성일</th>
	<th>댓글수</th>
	<th>추천수</th>
</tr>
</thead>
<c:forEach var="board" items="${list }">
<tr>
	<td>${board.freeboardNo }</td>
	<td class="text-start"><a href="./view?freeboardNo=${board.freeboardNo }">${board.freeboardTitle }</a></td>
	<td>${id }</td>
	<td>${nick}</td>
	<td>${board.freeboardHit }</td>
	<td><fmt:formatDate value="${board.freeboardDate }" pattern="yy/MM/dd hh:mm:ss"/>
	<td>23</td>
	<td>8</td>
</tr>
</c:forEach>

</table>


<!-- 작성 버튼 -->
<div class="float-end mb-3">
	<a href="./write"><button id="btnWrite">글쓰기</button></a>
</div>
<div class="clearfix"></div>

</div><!-- div.container -->

<!-- 페이징 -->
<div><!-- href로 링크만 넣어주면 됨 -->
<ul class="pagination justify-content-center">

	<%--첫 페이지로 이동 --%>
	<!--1번이 아닐때 = ne  -->
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item"><a class="page-link" href="./list">&larr; 처음</a></li>
	</c:if>
	<c:if test="${paging.curPage eq 1 }">
		<li class="page-item disabled"><a class="page-link" href="./list">&larr; 처음</a></li>
	</c:if>

	<%--이전 페이징 리스트로 이동 --%>
<%-- 	<li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
<%-- 	<li class="page-item"><a class="page-link" href="./list?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

	<c:if test="${paging.startPage ne 1 }">
		<li class="page-item"><a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
	</c:if> 

	<c:if test="${paging.startPage eq 1 }">
		<li class="page-item disabled"><a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
	</c:if> 



	<%--이전 페이지로 이동 --%>
	<c:if test="${paging.curPage gt 1 }">
	<li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage -1 }">&lt;</a></li>
	</c:if>

	<%--페이징 번호 리스트 --%>
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	<c:if test="${paging.curPage eq i }">
		<li class="page-item active">
			<a class="page-link" href="./list?curPage=${i }">${i }</a>
		</li>
	</c:if>
		
	<c:if test="${paging.curPage ne i }">
		<li class="page-item ">
			<a class="page-link" href="./list?curPage=${i }">${i }</a>
		</li>
	</c:if>
	
	</c:forEach>
	
	<%--다음 페이지로 이동 --%>
	<c:if test="${paging.curPage lt paging.totalPage }">
	<li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage +1 }">&gt;</a></li>
	</c:if>
	
	<%--다음 페이징 리스트로 이동 --%>
	<c:if test="${paging.endPage ne paging.totalPage}">
		<li class="page-item"><a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
	</c:if> 

	<c:if test="${paging.endPage eq paging.totalPage }">
		<li class="page-item disabled"><a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
	</c:if> 
	
	<%--마지막 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item"><a class="page-link" href="./list?curPage=${paging.totalPage }">마지막&rarr; </a></li>
	</c:if>
	<c:if test="${paging.curPage eq paging.totalPage }">
		<li class="page-item "><a class="page-link" > 마지막&rarr; </a></li>
	</c:if>	
</ul>

</div>

<hr>
<div id="footer">
<h1><a class="text-info" href="/">FOOTER</a></h1>
</div>
</body>
</html>