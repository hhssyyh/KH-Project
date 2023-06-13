<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
body {
	padding: 0;
	margin: 0;
}

#userInfo {
	width: 1000px;
	background-color: white;
}

#reservedetail {
	height: 340px; 
	width: 800px;
	background-color: white;
}

#line {
	border-top: 3px solid;
}

.nickBtn2 {
	width: 150px;
	font-size: 18px;
	margin-top: 24px;
	margin-right: 145px;
}

#profileImg2{
	width: 60px;
	margin-left:20px;
	
}

* {
 	font-family: 'SBAggroM';
}

.pagination {
	margin-top : 50px;
	margin-bottom : -150px;
}

.page-link {
  color: #483D8B; 
  background-color: white;
  border-color: #D2D2FF;
}

.page-item.active .page-link {
 z-index: 1;
 color: #483D8B;
 font-weight:bold;
 background-color: #A696CD;
  border-color: #CBB8EE;
 
}

.page-link:focus, .page-link:hover {
  color: #483D8B;
  background-color: #A696CD; 
  border-color: #CBB8EE;
}


</style>

<script>
function deleteRow(th){
	console.log("되는데?")
	 $(th).parents(".del").find("i").toggleClass("bi bi-check-square")
	 $(th).parents(".del").find("i").addClass("bi bi-check-square-fill")
	 
	
// 	$(th).parents(".del").find("i").addStyle ("bi bi-check2-square" style="font-size: 2rem; color: cornflowerblue;")
}



</script>


<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />


<div id="userInfo" class="container" style="padding: 30px; border-radius: 30px; border: 1px solid;">
	 <h4><i class="bi bi-pencil-square"></i> 내가 쓴 글 내역</h4>
	<hr id="line">
	
	<c:forEach var="list" items="${boardList}">
<%-- 		<span><a href="/main/detail?partNo=${list.freeboardTitle}"><img id="profileImg2" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></a></span> --%>
			
<!-- 			<div class="del"> -->
<!-- 				<button type="button" id= "button" onclick="deleteRow(this);" style ="display: none;"></button> -->
<!-- 				<label for="button"><i class="bi bi-check-square"></i></label> -->
<!-- 			</div> -->
			<a href="/freeboard/view?freeboardNo=${list.freeboardNo}"><h5 style="margin: 20px; margin-left: 103px; margin-bottom: 60px;">${list.freeboardTitle }</h5></a>
			<h6 style="margin: 20px; margin-left: 103px; margin-top: -52px;"><fmt:formatDate value="${list.freeboardDate }" pattern="yy/MM/dd hh:mm" /></h6>
			<hr>
		
		
	</c:forEach>

<!-- 페이징 -->
<div style="margin-bottom: 200px;"><!-- href로 링크만 넣어주면 됨 -->
<ul class="pagination justify-content-center">

   <%--첫 페이지로 이동 --%>
   <!--1번이 아닐때 = ne  -->
   <c:if test="${paging.curPage ne 1 }">
      <li class="page-item"><a class="page-link" href="./myboardList">&larr; 처음</a></li>
   </c:if>
   <c:if test="${paging.curPage eq 1 }">
      <li class="page-item disabled"><a class="page-link" href="./myboardList">&larr; 처음</a></li>
   </c:if>

   <%--이전 페이징 리스트로 이동 --%>
<%--    <li class="page-item"><a class="page-link" href="./myboardList?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
<%--    <li class="page-item"><a class="page-link" href="./myboardList?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

   <c:if test="${paging.startPage ne 1 }">
      <li class="page-item"><a class="page-link" href="./myboardList?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
   </c:if> 

   <c:if test="${paging.startPage eq 1 }">
      <li class="page-item disabled"><a class="page-link" href="./myboardList?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
   </c:if> 



   <%--이전 페이지로 이동 --%>
   <c:if test="${paging.curPage gt 1 }">
   <li class="page-item"><a class="page-link" href="./myboardList?curPage=${paging.curPage -1 }">&lt;</a></li>
   </c:if>

   <%--페이징 번호 리스트 --%>
   <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
   <c:if test="${paging.curPage eq i }">
      <li class="page-item active">
         <a class="page-link" href="./myboardList?curPage=${i }">${i }</a>
      </li>
   </c:if>
      
   <c:if test="${paging.curPage ne i }">
      <li class="page-item ">
         <a class="page-link" href="./myboardList?curPage=${i }">${i }</a>
      </li>
   </c:if>
   
   </c:forEach>
   
   <%--다음 페이지로 이동 --%>
   <c:if test="${paging.curPage lt paging.totalPage }">
   <li class="page-item"><a class="page-link" href="./myboardList?curPage=${paging.curPage +1 }">&gt;</a></li>
   </c:if>
   
   <%--다음 페이징 리스트로 이동 --%>
   <c:if test="${paging.endPage ne paging.totalPage}">
      <li class="page-item"><a class="page-link" href="./myboardList?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
   </c:if> 

   <c:if test="${paging.endPage eq paging.totalPage }">
      <li class="page-item disabled"><a class="page-link" href="./myboardList?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
   </c:if> 
   
   <%--마지막 페이지로 이동 --%>
   <c:if test="${paging.curPage ne paging.totalPage }">
      <li class="page-item"><a class="page-link" href="./myboardList?curPage=${paging.totalPage }">마지막&rarr; </a></li>
   </c:if>
   <c:if test="${paging.curPage eq paging.totalPage }">
      <li class="page-item "><a class="page-link" > 마지막&rarr; </a></li>
   </c:if>   
</ul>

</div>

</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

