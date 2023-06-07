<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/partnerLayout/header.jsp" />

<style type="text/css">
.reservemanage {
	display: inline-block;
	margin-top: 80px;
	margin-left: 15%;
	width: 85%;
}

table {
	text-align: center;
}

</style>


<div class="reservemanage">
	<div class="container">
		<h2>예약관리</h2>
		<hr>
		
		<table class="table table-hover" style="width: 80%; margin: 50px;">
			<tr style="background-color: #ECECEC">
				<th>예약번호</th>
				<th>예약고유번호</th>
				<th>유저</th>
				<th>예약날짜</th>
				<th>결제내역</th>
			</tr>
			<c:forEach var="reservation" items="${reserveList }">
				<tr>
					<td>${reservation.RES_NO }</td>
					<td>${reservation.RES_RESERVENO }</td>
					<td>${reservation.USER_NICK } (${reservation.USER_EMAIL })</td>
					<td>${reservation.RES_DATE }</td>
					<td>${reservation.RES_PRICE }</td>
				</tr>
			</c:forEach>
		</table>

	</div>
</div>

</body>
</html>






