<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

    <!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>


<script type="text/javascript">
document.cookie = "safeCookie1=foo; SameSite=Lax"; 


IMP.init("imp25445063");

function requestPay(){
    IMP.request_pay({
        pg : 'tosstest',
        pay_method : 'card',
        merchant_uid: "order_no_0001", //상점에서 생성한 고유 주문번호
        name : '주문 명:결제테스트',   //필수 파라미터 입니다.
        amount : 1004,
        buyer_email : 'iamport@siot.do',
        buyer_name : '구매자이름',
        buyer_tel : '010-1234-5678',
        buyer_addr : '서울특별시 강남구 삼성동',
        buyer_postcode : '123-456',
    }, function(rsp) { // callback 로직
    	//* ...중략 (README 파일에서 상세 샘플코드를 확인하세요)... *//
    });
    
}

	
</script>
<body>
dd

<button onclick="requestPay()">결제</button>
</body>
</html>