<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/partnerLayout/header.jsp" />

<style type="text/css">
#calendarDiv {
	display: flex;
 	justify-content: center;
 	align-items: center;
}

.fc-day-sun a {
 	color: red;
 	text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}
.fc-day a {
  text-decoration: none;
 }

.reservemanage {
	display: inline-block;
	margin-top: 85px;
	margin-left: 14%;
	width: 85%;
}

table {
	text-align: center;
}

.modal-body .btn {
	margin-bottom: 15px;
	margin-right: 15px;
}

.tdCenter {
	position: relative;
	top: 50%;
	transform: translateY(15%);
}

.btnSelected {
	background-color: orange;
	border-color: orange;
}

.btnSelected:hover {
	background-color: orange;
	border-color: orange;
}
</style>


<script type="text/javascript">
$(".resRadio").click(function() {
	$(".resRadio").removeClass("btnSelected")
	
//	$(".resRadio:checked").prev().css("color", "red")
	$(this).addClass("btnSelected")
	
}) 

function updateReservation(th) {
	var date = $(th).parents(".listTr").find(".resdate").text()
	var time = $(th).parents(".listTr").find(".restime").text()
	var resNo = $(th).parents(".listTr").find(".resno").text()
	
	location.href = "./updateReserve?date=" + date + "&time=" + time + "&resNo=" + resNo 
}
</script>

<div class="reservemanage">
	<div style="width: 90%; margin: 0 auto;">
		<h2>예약관리</h2>
		<hr>

		<table class="table table-hover" style="width: 80%; margin: 50px;">
			<thead style="height: 50px;">
				<tr style="background-color: #ECECEC">
					<th>번호</th>
					<th>예약고유번호</th>
					<th>유저</th>
					<th>방식</th>
					<th>예약날짜</th>
					<th>예약시간</th>
					<th>결제금액</th>
					<th></th>
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
					<td>
						<button onclick="updateReservation(this)" class="btn btn-secondary btn-sm">
							수정
						</button>
					</td>
				</tr>
			</c:forEach>
		</table>

	</div>

</div>


</body>
</html>
