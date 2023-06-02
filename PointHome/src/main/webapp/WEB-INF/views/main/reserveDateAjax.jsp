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

   <label for="1" class="btn btn-secondary resRadio">10:00</label>
   <input type="radio" name="resTime" value="1" id="1" style="display: none;" checked="checked">
   
   <label for="2" class="btn btn-secondary resRadio">10:30</label>
   <input type="radio" name="resTime" value="2" id="2" style="display: none;">
   
   <label for="3" class="btn btn-secondary resRadio">11:00</label>
   <input type="radio" name="resTime" value="3" id="3" style="display: none;">
   
   <label for="4" class="btn btn-secondary resRadio">11:30</label>
   <input type="radio" name="resTime" value="4" id="4" style="display: none;">
   
   <label for="5" class="btn btn-secondary resRadio">13:00</label>
   <input type="radio" name="resTime" value="5" id="5" style="display: none;">
   
   <label for="6" class="btn btn-secondary resRadio">13:30</label>
   <input type="radio" name="resTime" value="6" id="6" style="display: none;">
   
   <br><br>
   
   <input type="radio" name="resDiv" id="visit" value="visit"><label for="visit">방문</label>
   <input type="radio" name="resDiv" id="video" value="video"><label for="video">화상전화</label>
   <input type="radio" name="resDiv" id="chat" value="chat"><label for="chat">채팅</label>
	
	<br>
	
   <button style="float: right;" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">예약하기</button>
   
   
   <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
     <!-- 결제위젯, 이용약관 영역 -->
  <div id="payment-method"></div>
  <div id="agreement"></div>
  <!-- 결제하기 버튼 -->
   
      
      
         <script>
    const clientKey = "test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq"
    const customerKey = "T75rfr5b8Ha6Wdt-tH6QG" // 내 상점의 고객을 식별하는 고유한 키
    const button = document.getElementById("payment-button")

    // ------  결제위젯 초기화 ------ 
    // 비회원 결제에는 customerKey 대신 ANONYMOUS를 사용하세요.
    const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
    // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제

    // ------  결제위젯 렌더링 ------ 
    // 결제위젯이 렌더링될 DOM 요소를 지정하는 CSS 선택자 및 결제 금액을 넣어주세요. 
    // https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods선택자-결제-금액-옵션
    paymentWidget.renderPaymentMethods("#payment-method", { value: 1})

    // ------  이용약관 렌더링 ------
    // 이용약관이 렌더링될 DOM 요소를 지정하는 CSS 선택자를 넣어주세요.
    // https://docs.tosspayments.com/reference/widget-sdk#renderagreement선택자
    paymentWidget.renderAgreement('#agreement')

    // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
    // 더 많은 결제 정보 파라미터는 결제위젯 SDK에서 확인하세요.
    // https://docs.tosspayments.com/reference/widget-sdk#requestpayment결제-정보
    button.addEventListener("click", function () {
      paymentWidget.requestPayment({
        orderId: "DNtNqLT3iqlNZsa2Itie2",            // 주문 ID(직접 만들어주세요)
        orderName: "토스 티셔츠 외 2건",                 // 주문명
        successUrl: "http://localhost:8888/main/reserveComplete",  // 결제에 성공하면 이동하는 페이지(직접 만들어주세요)
        failUrl: "http://localhost:8888/main/reserveFail",        // 결제에 실패하면 이동하는 페이지(직접 만들어주세요)
        customerEmail: "test123@gmail.com",
        customerName: "김토스"
        
        
      })
    })
  </script>
        
      </div>
      <div class="modal-footer">
        
        <button class="btn btn-primary" id="payment-button">결제하기</button>  
      </div>
    </div>
  </div>
</div>
   
   



  상용아 안

  
    

</body>
</html>






