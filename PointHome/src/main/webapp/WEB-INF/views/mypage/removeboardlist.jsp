<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	 <h4><i class="bi bi-pencil-square"></i> 내가 쓴 글 내역</h4>
	<hr id="line">
	
	<table class="table table-hover table-sm text-center checkbox-table">
		  <thead>
            <tr>
           		<th><input id="allCheck" type="checkbox" name="allCheck" class="form-check-input" /></th>	
               <th>제목</th>
               <th>작성일</th>
            </tr>
         </thead>
			<c:forEach var="list" items="${boardList}">
			<tr>
				<td class="checkbox"><input name="RowCheck" type="checkbox" value="${list.freeboardNo}"/></td>
				<td><h5 style=" font-size: 16px;"><a href="/freeboard/view?freeboardNo=${list.freeboardNo}">${list.freeboardTitle }</a>
					<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
					<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
					<fmt:parseNumber value="${list.freeboardDate.time / (1000*60*60*24)}" integerOnly="true" var="boardDate" /><!-- 게시글 작성날짜를 숫자로 -->
					<c:if test="${today - boardDate le 2}">
					<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
					</c:if>
				</h5></td>
				<td><h6 style=" font-size: 10px;"><fmt:formatDate value="${list.freeboardDate }" pattern="yy/MM/dd hh:mm" /></h6></td>		
			</tr>
			</c:forEach>
	</table>
	
	<div class="float-end mx-3">
       <label for="delete"><i class="bi bi-trash" ></i></label>
       <input type="button"  id="delete" style="display: none;" value="삭제" class="btn btn-outline-info" onclick="deleteValue();">
	</div>
	
	
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



</body>
</html>