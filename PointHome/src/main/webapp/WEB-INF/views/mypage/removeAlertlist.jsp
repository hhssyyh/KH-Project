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

	 <div class="testImg">
<!-- 	 <button class="alert">4</button><i class="bi bi-bell"></i>  -->
	 <h4><img class="bell" src="../resources/bell.svg" style="width: 25px; height: 25px;"> 알림 내역</h4>
<!-- 	 <h4><img src="../resources/bell.svg"><button class="alert">4</button></h4> -->
	</div>
	<hr id="line">
	

<table class="table table-hover table-sm text-center checkbox-table">
  <thead>
          <tr>
         	<th><input id="allCheck" type="checkbox" name="allCheck" class="form-check-input" /></th>	
             <th></th>
          </tr>
       </thead>
	<c:forEach var="list" items="${alarmList}">	
		<tr>	
		<c:choose>
			<c:when test="${list.type eq 'N'}">
			<td class="checkbox"><input name="RowCheck" type="checkbox" value="${list.alertNo}"/></td>
			<td><a href="/partner/view?partnerNoticeNo=${list.num}"><h5 style="margin: 20px; margin-left: 103px; margin-bottom: 60px; font-size: 16px;">
			${list.content} 
			</a>
			<h6 style="margin: 20px; margin-left: 103px; margin-top: -52px; font-size: 10px;"><fmt:formatDate value="${list.alertDate }" pattern="yy/MM/dd HH:mm" /></h6>
			</td>
			</c:when>
			
			<c:when test="${list.type eq 'V'}">
			<td class="checkbox"><input name="RowCheck" type="checkbox" value="${list.alertNo}"/></td>
			<td><a href="/main/detail?partNo=${list.num}"><h5 style="margin: 20px; margin-left: 103px; margin-bottom: 60px; font-size: 16px;">
			${list.content} 
			</a>
			<h6 style="margin: 20px; margin-left: 103px; margin-top: -52px; font-size: 10px;"><fmt:formatDate value="${list.alertDate }" pattern="yy/MM/dd HH:mm" /></h6>
			</td>
			</c:when>
			
			<c:when test="${list.type eq 'P'}">
			<td class="checkbox"><input name="RowCheck" type="checkbox" value="${list.alertNo}"/></td>
			<td><a href="/mypage/myreserve"><h5 style="margin: 20px; margin-left: 103px; margin-bottom: 60px; font-size: 16px;">
			${list.content} 
			</a>
			<h6 style="margin: 20px; margin-left: 103px; margin-top: -52px; font-size: 10px;"><fmt:formatDate value="${list.alertDate }" pattern="yy/MM/dd HH:mm" /></h6>
			</td>
			</c:when>
			
			<c:otherwise>
			<td class="checkbox"><input name="RowCheck" type="checkbox" value="${list.alertNo}"/></td>
			<td><a href="/freeboard/view?freeboardNo=${list.num}"><h5 style="margin: 20px; margin-left: 103px; margin-bottom: 60px; font-size: 16px;">
			${list.content} 
			</a>
			<h6 style="margin: 20px; margin-left: 103px; margin-top: -52px; font-size: 10px;"><fmt:formatDate value="${list.alertDate }" pattern="yy/MM/dd HH:mm" /></h6>
			</td>
			</c:otherwise>
		</c:choose>
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
      <li class="page-item"><a class="page-link" href="./alertList">&larr; 처음</a></li>
   </c:if>
   <c:if test="${paging.curPage eq 1 }">
      <li class="page-item disabled"><a class="page-link" href="./alertList">&larr; 처음</a></li>
   </c:if>

   <%--이전 페이징 리스트로 이동 --%>
<%--    <li class="page-item"><a class="page-link" href="./alertList?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
<%--    <li class="page-item"><a class="page-link" href="./alertList?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

   <c:if test="${paging.startPage ne 1 }">
      <li class="page-item"><a class="page-link" href="./alertList?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
   </c:if> 

   <c:if test="${paging.startPage eq 1 }">
      <li class="page-item disabled"><a class="page-link" href="./alertList?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
   </c:if> 



   <%--이전 페이지로 이동 --%>
   <c:if test="${paging.curPage gt 1 }">
   <li class="page-item"><a class="page-link" href="./alertList?curPage=${paging.curPage -1 }">&lt;</a></li>
   </c:if>

   <%--페이징 번호 리스트 --%>
   <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
   <c:if test="${paging.curPage eq i }">
      <li class="page-item active">
         <a class="page-link" href="./alertList?curPage=${i }">${i }</a>
      </li>
   </c:if>
      
   <c:if test="${paging.curPage ne i }">
      <li class="page-item ">
         <a class="page-link" href="./alertList?curPage=${i }">${i }</a>
      </li>
   </c:if>
   
   </c:forEach>
   
   <%--다음 페이지로 이동 --%>
   <c:if test="${paging.curPage lt paging.totalPage }">
   <li class="page-item"><a class="page-link" href="./alertList?curPage=${paging.curPage +1 }">&gt;</a></li>
   </c:if>
   
   <%--다음 페이징 리스트로 이동 --%>
   <c:if test="${paging.endPage ne paging.totalPage}">
      <li class="page-item"><a class="page-link" href="./alertList?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
   </c:if> 

   <c:if test="${paging.endPage eq paging.totalPage }">
      <li class="page-item disabled"><a class="page-link" href="./alertList?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
   </c:if> 
   
   <%--마지막 페이지로 이동 --%>
   <c:if test="${paging.curPage ne paging.totalPage }">
      <li class="page-item"><a class="page-link" href="./alertList?curPage=${paging.totalPage }">마지막&rarr; </a></li>
   </c:if>
   <c:if test="${paging.curPage eq paging.totalPage }">
      <li class="page-item "><a class="page-link" > 마지막&rarr; </a></li>
   </c:if>   
</ul>

</div>




</body>
</html>