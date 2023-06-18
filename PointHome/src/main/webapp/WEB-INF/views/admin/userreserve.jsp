<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp"/>
<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp"/>
<style type="text/css">* {cursor: url(https://cur.cursors-4u.net/cursors/cur-7/cur610.cur), auto !important;}</style><a href="https://www.cursors-4u.com/cursor/2010/12/17/oxygen-black-11.html" target="_blank" title="Oxygen Black"><img src="https://cur.cursors-4u.net/cursor.png" border="0" alt="Oxygen Black" style="position:absolute; top: 0px; right: 0px;" /></a>
<link href="/resources/mypage/userInfo.css" rel="stylesheet">

<style>
#userInfo {
	width: 1000px;
	background-color: white;
}

#reservedetail {
	height: 340px; 
	width: 800px;
	background-color: white;
}
table  {
    border-spacing: 0;
    border-collapse: separate;
}

td {
	height: 70px;
	vertical-align: middle;
}
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


<div id="userInfo" class="container" style="padding: 30px; border-radius: 30px; border: 3px solid #c8c8c8; padding-top:100px;">
	<h4 style="margin: 0;"><i class="bi bi-calendar2-check"></i>예약관리</h4>
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
			     <td> ${list.RES_RESERVENO }</td>
			     <td style="color:red;">상담완료</td>
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











