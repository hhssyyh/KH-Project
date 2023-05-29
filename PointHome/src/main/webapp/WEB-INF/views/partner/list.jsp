<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
 #header, #footer {
   text-align: center;

#header h1 {
   line-height: 3em;
}
</style>

<div style="margin:10px;"></div>

	<div style="display:flex;">

		<div><p style="font-size:30px;">인기상담사</p></div>
		<div><a href="./main" style="font-size:20px; margin-left: 10px" >TOP10</a></div>
		
	</div>

<div class="justify-content-center" style="display:flex;">
		<!-- img -->
		<div class="card" style="width: 300px;">
		  <img src="../resources/dog.jpeg" class="card-img-top" height="200px" alt="ex">
		<!-- img end  -->
		  <div class="card-body">
		    <h5 class="card-title">제휴사 이름</h5>
		    <p class="card-text">가격</p>
		    <p class="card-text">별점</p>
		    <p class="card-text">후기(?)</p>
		    <a href="#" class="btn btn-primary">상세페이지</a>
		  </div>
		</div>
		
		<div style="margin-right:10px"></div>
		
		<!-- img -->
		<div class="card" style="width: 300px;">
		  <img src="" class="card-img-top" alt="ex">
		<!-- img end  -->
		  <div class="card-body">
		    <h5 class="card-title">title</h5>
		    <p class="card-text">text</p>
		    <a href="#" class="btn btn-primary">상세페이지</a>
		  </div>
		</div>
		
		<div style="margin-right:10px"></div>
		
		<!-- img -->
		<div class="card" style="width: 300px;">
		  <img src="" class="card-img-top" alt="ex">
		<!-- img end  -->
		  <div class="card-body">
		    <h5 class="card-title">title</h5>
		    <p class="card-text">text</p>
		    <a href="#" class="btn btn-primary">상세페이지</a>
		  </div>
		</div>

		<!-- img -->
		<div class="card" style="width: 300px;">
		  <img src="" class="card-img-top" alt="ex">
		<!-- img end  -->
		  <div class="card-body">
		    <h5 class="card-title">title</h5>
		    <p class="card-text">text</p>
		    <a href="#" class="btn btn-primary">상세페이지</a>
		  </div>
		</div>		
	</div>

<div style="margin:20px;"></div>

	<div style="display:flex;">

		<div><p style="font-size:30px;">신규상담사</p></div>
		<div><a href="./main" style="font-size:20px; margin-left: 10px" >NEW</a></div>
		
	</div>

<table id="listTable" class="table table-hover table-sm text-center "  style="margin-top: 60px; margin-bottom: 80px;" >
<thead>
<tr>
   <th>제휴사번호</th>
   <th>제휴사상호이름</th>

</tr>
</thead>
<c:forEach var="board" items="${list }">
<tr>
   <td>${board.partnerNo }</td>
   <td>${board.partnerShopname}</td>

</tr>
</c:forEach>
</table>

<!-- 페이징 -->
<div style="margin-bottom: 200px;"><!-- href로 링크만 넣어주면 됨 -->
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
<%--    <li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
<%--    <li class="page-item"><a class="page-link" href="./list?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

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

</div>



<c:import url="/WEB-INF/views/layout/footer.jsp" />