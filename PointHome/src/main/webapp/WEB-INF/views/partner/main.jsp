<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/partnerLayout/header.jsp" />



<style type="text/css">

td {
	margin-right:30px;

}

</style>




<div id="container">

	<c:if test="${not empty partnerLogin }">
		<div style="margin: 100px 200px; margin-top: 70px;">
			<h1>대시보드</h1>
			<div>
				<span style="margin: 20px 10px; margin-top: 40px; font-size: 28px; display: inline-block;">신규 예약</span>
				<a href="reservemanage"><button class="btn btn-secondary btn-sm" style="float: right; margin-top: 50px;">예약 목록</button></a>
				<table class="table table-hover" >
					<thead style="height: 50px;">
						<tr style="background-color: #ECECEC">
							<th>번호</th>
							<th>예약고유번호</th>
							<th>유저</th>
							<th>방식</th>
							<th>예약날짜</th>
							<th>예약시간</th>
							<th>결제금액</th>
						</tr>
					</thead>
					<c:forEach var="reservation" items="${reserveList }">
						<tr class="listTr">
							<td>
								<div class="tdCenter rnum">${reservation.RNUM }</div>
								<div class="resno" style="display: none;">${reservation.RES_NO }</div>
							</td>
							<td><div class="tdCenter reserveno">${reservation.RES_RESERVENO }</div></td>
							<td><div class="tdCenter username">${reservation.USER_NAME } (${reservation.USER_EMAIL })</div></td>
							<td><div class="tdCenter resdiv">${reservation.RES_DIV }</div></td>
							<td><div class="tdCenter resdate">${reservation.RES_DATE }</div></td>
							<td><div class="tdCenter restime">
								<c:if test="${reservation.RES_TIME eq 1 }">10:00</c:if>
								<c:if test="${reservation.RES_TIME eq 2 }">10:30</c:if>
								<c:if test="${reservation.RES_TIME eq 3 }">11:00</c:if>
								<c:if test="${reservation.RES_TIME eq 4 }">11:30</c:if>
								<c:if test="${reservation.RES_TIME eq 5 }">13:00</c:if>
								<c:if test="${reservation.RES_TIME eq 6 }">13:30</c:if>
								<c:if test="${reservation.RES_TIME eq 7 }">14:00</c:if>
								<c:if test="${reservation.RES_TIME eq 8 }">14:30</c:if>
								<c:if test="${reservation.RES_TIME eq 9 }">15:00</c:if>
								<c:if test="${reservation.RES_TIME eq 10 }">15:30</c:if>
								<c:if test="${reservation.RES_TIME eq 11 }">16:00</c:if>
								<c:if test="${reservation.RES_TIME eq 12 }">16:30</c:if>
								<c:if test="${reservation.RES_TIME eq 13 }">17:00</c:if>
								<c:if test="${reservation.RES_TIME eq 14 }">17:30</c:if>
								<c:if test="${reservation.RES_TIME eq 15 }">18:00</c:if>
								<c:if test="${reservation.RES_TIME eq 16 }">18:30</c:if>
								<c:if test="${reservation.RES_TIME eq 17 }">19:00</c:if>
								<c:if test="${reservation.RES_TIME eq 18 }">19:30</c:if>
							</div></td>
							<td><div class="tdCenter resprice">${reservation.RES_PRICE }</div></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</c:if>
	
	<c:if test="${empty partnerLogin }">
		<div style="padding: 80px;">
			<h2>로그인이 필요합니다</h2>
			<a href="/partner/login"><button>로그인</button></a>
		</div>
	</c:if>
	
</div>



<c:import url="../layout/footer.jsp" />
