<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<style type="text/css">
 .resRadio { 
	font-size: 18px;
 } 

 .resRadio:hover { 
 	background-color: #7e00c2;
 	border-color: #7e00c2;
 	color: white; 
 } 

.btn-light {
	margin: 10px;
}

.btnSelected {
	background-color: #7e00c2; 
	border-color: #7e00c2;
 	color: white; 
}

.btnSelected:hover {
	background-color: #7e00c2; 
	border-color: #7e00c2;
 	color: white; 
}
</style>


<script type="text/javascript">
$(".resRadio").click(function() {
	$(".resRadio").removeClass("btnSelected")
	$(this).addClass("btnSelected")
	
// 	$("input[name=resTime]").removeAttr("checked")
	$(this).children($("input[name=resTime]")).prop('checked', true)
}) 

</script>

</head>
<body>


	<input type="text" name="resDate" value="${resDate }" style="display: none;">
	<!-- 	<p>오전</p> -->
	<%-- 	${reserveList.get(0)} --%>
	<%-- 	${reserveList.contains('1')} --%>
	
	<c:set var="dateMap" value="<%=new HashMap() %>" />
	<c:set target="${dateMap }" property="1" value="10:00" />
	<c:set target="${dateMap }" property="2" value="10:30" />
	<c:set target="${dateMap }" property="3" value="11:00" />
	<c:set target="${dateMap }" property="4" value="11:30" />
	
	<c:set target="${dateMap }" property="5" value="13:00" />
	<c:set target="${dateMap }" property="6" value="13:30" />
	<c:set target="${dateMap }" property="7" value="14:00" />
	<c:set target="${dateMap }" property="8" value="14:30" />
	<c:set target="${dateMap }" property="9" value="15:00" />
	<c:set target="${dateMap }" property="10" value="15:30" />
	<c:set target="${dateMap }" property="11" value="16:00" />
	<c:set target="${dateMap }" property="12" value="16:30" />
	<c:set target="${dateMap }" property="13" value="17:00" />
	<c:set target="${dateMap }" property="14" value="17:30" />
	<c:set target="${dateMap }" property="15" value="18:00" />
	<c:set target="${dateMap }" property="16" value="18:30" />
	<c:set target="${dateMap }" property="17" value="19:00" />
	<c:set target="${dateMap }" property="18" value="19:30" />

	<c:forEach var="i" begin="1" end="18">
		<c:if test="${i eq 1 }">
			<p>오전</p>
		</c:if>
		<c:if test="${i eq 5 }">
		   <p>오후</p>
		</c:if>	
		<c:if test="${reserveList.contains(String.valueOf(i))}">
			<label for="${i}" class="btn btn-light resRadio disabled">${dateMap.get(String.valueOf(i)) }</label>
   			<input type="radio" name="resTime" value="${i }" id="${i }" style="display: none;">
		</c:if>
		<c:if test="${not reserveList.contains(String.valueOf(i))}">
			<label for="${i }" class="btn btn-light resRadio">${dateMap.get(String.valueOf(i)) }</label>
   			<input type="radio" name="resTime" value="${i }" id="${i }" style="display: none;">
		</c:if>
	</c:forEach>
   
   <br><br>
   
   <div style="font-size: 18px;">
	   <input type="radio" class="form-check-input radio-check ms-3 me-1" name="resDiv" id="visit" value="visit"><label for="visit" class="me-2">방문</label>
	   <input type="radio" class="form-check-input radio-check me-1" name="resDiv" id="video" value="video"><label for="video" class="me-2">화상전화</label>
	   <input type="radio" class="form-check-input radio-check me-1" name="resDiv" id="chat" value="chat"><label for="chat">채팅</label>
	</div>
	
	<br>
	
	
	<script type="text/javascript">
	var resDate = $("input[name=resDate]").val()
	var costomerName = '${userName}'
    var clientKey = 'test_ck_k6bJXmgo28eXg4nE7L6rLAnGKWx4' // 테스트용 클라이언트 키
    var price = ${partnerPrice}
	var orderid = '${orderId}'
	console.log(orderid)
        // 2. 결제창 SDK 초기화
    var tossPayments = TossPayments(clientKey)
	$("#payBtn").click(function() {
		var resTime = $("input:radio[name=resTime]:checked").val()
		var resDiv = $("input[name=resDiv]:checked").val()
		tossPayments.requestPayment('카드', {
			amount: price,
			orderId: orderid,
			orderName: resDiv,
			customerName: costomerName,
			successUrl: "http://localhost:8888/main/reserveComplete?partNo=" + ${param.partNo} + "&resDate=" + resDate + "&resTime=" + resTime + "&resDiv=" + resDiv + "&resPrice=" + price,
			failUrl: 'http://localhost:8888/reserveFail',
		})
	})
	</script>
	
	
	<c:if test="${empty login }">
	   <button style="float: right; background-color: #7e00c2; color: white; font-size: 18px;" id="payBtn" class="btn" disabled="disabled">예약하기</button>
	</c:if>
	<c:if test="${login }">
	   <button style="float: right; background-color: #7e00c2; color: white; font-size: 18px;" id="payBtn" class="btn">예약하기</button>
	</c:if>
   
</body>
</html>






