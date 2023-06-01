<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점집닷컴</title>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

</head>
<body>





<c:import url="/WEB-INF/views/layout/detailBanner.jsp"/>

<!-- fullCalendar -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<script src="https://js.tosspayments.com/v1/payment-widget"></script>

<script type="text/javascript">
var resDate = $("input[name=resDate]").val()
var resTime = $("input[name=resTime]").val()
var resDiv = $("input[name=resDiv]").val()
</script>

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
        failUrl: "https://my-store.com/fail",        // 결제에 실패하면 이동하는 페이지(직접 만들어주세요)
        customerEmail: "customer123@gmail.com",
        customerName: "김토스"
        
        
      })
    })
  </script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    	var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	locale: 'kr',
        	dayCellContent : function( cal ) {
        		return ('0'+cal.date.getDate()).slice(-2)
        	}
        	,
        	dateClick: function(info) {
        		$.ajax({
					   type : 'get',           // 타입 (get, post, put 등등)
					   url : './reserveDateAjax',  // 요청할 서버url
					   dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
					   data : {  // 보낼 데이터 (Object , String, Array)
						   resDate : info.dateStr,
						   partNo : ${param.partNo}
					   }, 
					   success : function(result) { // 결과 성공 콜백함수
					    	console.log(result)
					        $("#reserveTime").html(result)
					   },
					   error : function(request, status, error) { // 결과 에러 콜백함수
					        console.log(error)
					   }
				})
        	},
            // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
            
            selectable: true,
            selectMirror: true,

            navLinks: false, // can click day/week names to navigate views
            editable: false,
        });

        calendar.render();
    });

</script>

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
</style>
	
<div id="calendarDiv">
<div id='calendar' style="width: 600px; height: 600px; margin: 100px; margin-right: 30px;"></div>


<div id="reserveTime" style="width: 500px; height: 500px; padding: 65px;"></div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>


