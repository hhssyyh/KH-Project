<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp"/>
<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp"/>

<link href="/resources/mypage/userInfo.css" rel="stylesheet">

<style>
      .modal {
        position: fixed;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

.modal__content {
  position: fixed;
  top: 50%;
  left: 50%;

  width: 600px;
  height: 600px;

  padding: 40px;

  text-align: center;

  background-color: rgb(255, 255, 255);
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
}

 </style> 


<div id="userInfo"
	style="margin: 0 auto; margin-top: 30px; padding: 30px;">
	<h4>예약관리</h4>
	<hr id="line">
	
	
<table class="table">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제휴사 이름</th>
      <th scope="col">예약시간</th>
      <th scope="col">예약번호</th>
      <th scope="col">예약현황</th>
    </tr>
  </thead>
  


  
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm" var="today" />

    <tbody class="table-group-divider">
     <c:forEach var="list" items="${userReserveList}">
		<fmt:parseDate value="${RESERVE_TIME}" var="resDate" pattern="yyyy-MM-dd HH:mm"/>
		<c:choose>

			<c:when test="${list.RESERVE_TIME < today && list.ISREVIEW eq 0}">
				 <tr>
			      <th scope="row">${list.RNUM}</th>
			      <td>${list.PARTNER_SHOPNAME}</td>
			      <td>${list.RESERVE_TIME}</td>
			     <td> <a href="./partreserve?partnerNo=${list.RES_RESERVENO }">${list.RES_RESERVENO }</a></td>
				 </tr>     
			</c:when>	 

			<c:when test="${list.RESERVE_TIME < today}">
				 <tr>
			      <th scope="row">${list.RNUM}</th>
			      <td>${list.PARTNER_SHOPNAME}</td>
			      <td>${list.RESERVE_TIME}</td>
			      <td>${list.RES_RESERVENO }</td>
				 </tr>     
			</c:when>	 

			<c:otherwise>
				<tr>
			      <th scope="row">${list.RNUM}</th>
			      <td>${list.PARTNER_SHOPNAME}</td>
			      <td>${list.RESERVE_TIME}</td>
			      <td>${list.RES_RESERVENO }</td>
			      <td>예약완료</td>
			     </tr>
			</c:otherwise>
		
		</c:choose>
  	</c:forEach>
  </tbody>
</table>




</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />











