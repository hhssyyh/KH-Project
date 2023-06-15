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

* {
 	font-family: 'SBAggroM';
}

table{
	 border-spacing: 2px;
}

.payAddress{
	width:850px;
}

.payDate{
	width:400px;
}

</style>


<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />


<div id="userInfo"
	style="margin: 0 auto; margin-top: 100px; padding: 30px; border-radius: 30px; border: 1px solid;">
	<h4><i class="bi bi-credit-card"></i> 결제내역</h4>
	<hr id="line">
	<table>
		<tr>
		<td>예약번호 | ${pay.RES_RESERVENO}</td>
		<td class="payDate" >결제일 | 		<fmt:parseDate value="${pay.RES_RESERVENO}" var="date" pattern="yyyyMMddHHmmss"/>
						<fmt:formatDate value="${date}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
		<td  ></td>
		</tr>
		<tr>
		<td>상호명 | ${pay.PARTNER_SHOPNAME}</td>
		<td>대표 | ${pay.PARTNER_NAME}</td>
		<td>
		</tr>
		<tr>
		<td>번호 | ${pay.PARTNER_PHONE}</td>
		</tr>
		<tr>
		<td class="payAddress">주소 | ${pay.PARTNER_ADDRESS}${pay.PARTNER_DETAILADDRESS}${pay.PARTNER_EXTRAADDRESS}</td>
		</tr>
		
		<tr>
		<td> 예약일 | <fmt:parseDate value="${pay.RES_DATE}" var="resdate" pattern="yyyy-MM-dd"/>
					<fmt:formatDate value="${resdate}" pattern="yyyy년 MM월 dd일"/> 
						<c:if test="${pay.RES_TIME eq 1 }">10:00</c:if>
				       <c:if test="${pay.RES_TIME eq 2 }">10:30</c:if>
				       <c:if test="${pay.RES_TIME eq 3 }">11:00</c:if>
				       <c:if test="${pay.RES_TIME eq 4 }">11:30</c:if>
				       <c:if test="${pay.RES_TIME eq 5 }">13:00</c:if>
				       <c:if test="${pay.RES_TIME eq 6 }">13:30</c:if>
				       <c:if test="${pay.RES_TIME eq 7 }">14:00</c:if>
				       <c:if test="${pay.RES_TIME eq 8 }">14:30</c:if>
				       <c:if test="${pay.RES_TIME eq 9 }">15:00</c:if>
				       <c:if test="${pay.RES_TIME eq 10 }">15:30</c:if>
				       <c:if test="${pay.RES_TIME eq 11 }">16:00</c:if>
				       <c:if test="${pay.RES_TIME eq 12 }">16:30</c:if>
				       <c:if test="${pay.RES_TIME eq 13 }">17:00</c:if>
				       <c:if test="${pay.RES_TIME eq 14 }">17:30</c:if>
				       <c:if test="${pay.RES_TIME eq 15 }">18:00</c:if>
				       <c:if test="${pay.RES_TIME eq 16 }">18:30</c:if>
				       <c:if test="${pay.RES_TIME eq 17 }">19:00</c:if>
				       <c:if test="${pay.RES_TIME eq 18 }">19:30</c:if></td>
		</tr>
		<tr>
		<td>결제금액 | ${pay.RES_PRICE}원</td>
		</tr>
	</table>

</div>

<!-- <div id="userInfo" -->
<!-- 	style="margin: 0 auto; margin-top: 200px; padding: 30px; border-radius: 30px; border: 1px solid;"> -->
<!-- 	<h4>오시는길</h4> -->
<!-- </div> -->

<!-- <div id="userInfo" -->
<!-- 	style="margin: 0 auto; margin-top: 200px; padding: 30px; border-radius: 30px; border: 1px solid;"> -->
<!-- 	<h4>이용확인</h4> -->
<!-- </div> -->

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />















