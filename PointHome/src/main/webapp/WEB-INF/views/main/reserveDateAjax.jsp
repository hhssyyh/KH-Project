<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<style type="text/css">
.btn-secondary {
	margin: 10px;
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

</script>

</head>
<body>


	<input type="text" name="resDate" value="${resDate }" style="display: none;">
	<p>오전</p>
   <label for="1" class="btn btn-secondary resRadio">10:00</label>
   <input type="radio" name="resTime" value="1" id="1" style="display: none;" checked="checked">
   
   <label for="2" class="btn btn-secondary resRadio">10:30</label>
   <input type="radio" name="resTime" value="2" id="2" style="display: none;">
   
   <label for="3" class="btn btn-secondary resRadio">11:00</label>
   <input type="radio" name="resTime" value="3" id="3" style="display: none;">
   
   <label for="4" class="btn btn-secondary resRadio">11:30</label>
   <input type="radio" name="resTime" value="4" id="4" style="display: none;">
   
   <p>오후</p>
   <label for="5" class="btn btn-secondary resRadio">13:00</label>
   <input type="radio" name="resTime" value="5" id="5" style="display: none;">
   
   <label for="6" class="btn btn-secondary resRadio">13:30</label>
   <input type="radio" name="resTime" value="6" id="6" style="display: none;">
   
   <label for="7" class="btn btn-secondary resRadio">14:00</label>
   <input type="radio" name="resTime" value="7" id="7" style="display: none;">
   
   <label for="8" class="btn btn-secondary resRadio">14:30</label>
   <input type="radio" name="resTime" value="8" id="8" style="display: none;">
   
   <label for="9" class="btn btn-secondary resRadio">15:00</label>
   <input type="radio" name="resTime" value="9" id="9" style="display: none;">
   
   <label for="10" class="btn btn-secondary resRadio">15:30</label>
   <input type="radio" name="resTime" value="10" id="10" style="display: none;">
   
   <label for="11" class="btn btn-secondary resRadio">16:00</label>
   <input type="radio" name="resTime" value="11" id="11" style="display: none;">
   
   <label for="12" class="btn btn-secondary resRadio">16:30</label>
   <input type="radio" name="resTime" value="12" id="12" style="display: none;">
   
   <label for="13" class="btn btn-secondary resRadio">17:00</label>
   <input type="radio" name="resTime" value="13" id="13" style="display: none;">
   
   <label for="14" class="btn btn-secondary resRadio">17:30</label>
   <input type="radio" name="resTime" value="14" id="14" style="display: none;">
   
   <label for="15" class="btn btn-secondary resRadio">18:00</label>
   <input type="radio" name="resTime" value="15" id="15" style="display: none;">
   
   <label for="16" class="btn btn-secondary resRadio">18:30</label>
   <input type="radio" name="resTime" value="16" id="16" style="display: none;">
   
   <label for="17" class="btn btn-secondary resRadio">19:00</label>
   <input type="radio" name="resTime" value="17" id="17" style="display: none;">
   
    <label for="18" class="btn btn-secondary resRadio">19:30</label>
   <input type="radio" name="resTime" value="18" id="18" style="display: none;">
   
   <br><br>
   
   <input type="radio" name="resDiv" id="visit" value="visit"><label for="visit">방문</label>
   <input type="radio" name="resDiv" id="video" value="video"><label for="video">화상전화</label>
   <input type="radio" name="resDiv" id="chat" value="chat"><label for="chat">채팅</label>
	
	<br>
	
	
	<script type="text/javascript">
	var resDate = $("input[name=resDate]").val()
	var resTime = $("input[name=resTime]").val()
	var resDiv = $("input[name=resDiv]").val()
	
    var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq' // 테스트용 클라이언트 키
    var price = ${partnerPrice}
        // 2. 결제창 SDK 초기화
    var tossPayments = TossPayments(clientKey)
	$("#payBtn").click(function() {
		tossPayments.requestPayment('카드', {
			amount: price,
			orderId: 'Dl8baxDJc-HODLm8KBv14',
			orderName: '토스 티셔츠 외 2건',
			customerName: '박토스',
			successUrl: "http://localhost:8888/main/reserveComplete?partNo=" + ${param.partNo} + "&resDate=" + resDate + "&resTime=" + resTime + "&resDiv=" + resDiv + "&resPrice=" + price,
			failUrl: 'http://localhost:8080/reserveFail',
		})
	})
	</script>
	
	
	<c:if test="${empty login }">
	   <button style="float: right;" id="payBtn" class="btn btn-secondary" disabled="disabled">예약하기</button>
	</c:if>
	<c:if test="${login }">
	   <button style="float: right;" id="payBtn" class="btn btn-secondary">예약하기</button>
	</c:if>
   
</body>
</html>






