<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />

<link href="/resources/mypage/userInfo.css" rel="stylesheet">


<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />



<div id="userInfo"
	style="margin: 0 auto; margin-top: 200px; padding: 30px;">
	<h4>예약관리</h4>
	<hr id="line">
	
	
<table class="table">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제휴사 이름</th>
      <th scope="col">날짜</th>
      <th scope="col">예약번호</th>
      <th scope="col">예약현황</th>
    </tr>
  </thead>
  


  
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
  
  <tbody class="table-group-divider">
     <c:forEach var="list" items="${reservelist}">
		<fmt:parseDate value="${RES_DATE}" var="resDate" pattern="yyyy-MM-dd"/>
<%-- 		<c:choose> --%>
<%-- 			<c:if test="${resDate > today }"> --%>
<!-- 				 <tr> -->
<%-- 			      <th scope="row">${list.RES_NO}</th> --%>
<%-- 			      <td>${list.PARTNER_SHOPNAME}</td> --%>
<%-- 			      <td>${list.RES_DATE }</td> --%>
<%-- 			      <td>${list.RES_RESERVENO }</td> --%>
<!-- 			      <td>예약완료</td> -->
<!-- 			      </tr> -->
<%-- 			</c:if> --%>

<%-- 			<c:if test="${resDate < today }"> --%>
				 <tr>
			      <th scope="row">${list.RES_NO}</th>
			      <td>${list.PARTNER_SHOPNAME}</td>
			      <td>${list.RES_DATE }</td>
			      <td>${list.RES_RESERVENO }</td>
			      <td><button>리뷰쓰기</button></td>
			      </tr>
<%-- 			</c:if> --%>
			
<%-- 			<c:otherwise> --%>
<!-- 				<tr> -->
<%-- 			      <th scope="row">${list.RES_NO}</th> --%>
<%-- 			      <td>${list.PARTNER_SHOPNAME}</td> --%>
<%-- 			      <td>${list.RES_DATE }</td> --%>
<%-- 			      <td>${list.RES_RESERVENO }</td> --%>
<!-- 			      <td><button>리뷰쓰기</button></td> -->
<!-- 			     </tr> -->
			
<%-- 			</c:otherwise> --%>
		
<%-- 		</c:choose> --%>
  	</c:forEach>

  </tbody>
</table>




</div>

</div>

</body>
</html>
















