<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script type="text/javascript">
const IMP = window.IMP;
IMP.init("imp25445063");


console.log(window.IMP);

	
function requestPay() {
   
   IMP.request_pay({

      pay_method:   "card"      //결제 수단 (필수)
      , merchant_uid: "a001"   //고유 주문 번호 (필수)
      , amount: 100         //금액 (필수)
      , buyer_tel: ""      //주문자 전화번호 (필수)
   
      , pg: "html5_inicis"   //결제 지원 PG 선택
      , name: "주문 상품 이름"
      , buyer_name: "주문자 이름"
   
   }, function( rsp ) {
      
      console.log( rsp )
      
      //서버로 응답된 데이터를 submit하도록 한다
      //서버에서는 DB에 데이터를 저장한다(INSERT)
      
      $("<form>").attr({
         action: '/url'
         , method: 'post'
      })
      .append(
         $("<input>")
         .attr({
            type: 'text'
            , name: 'merchant_id'
            , value: rsp.merchant_id
         })
      )
      .appendTo( $(document.body) )
      .submit()
      
   })
   
}

	
</script>
</head>
<body>


<!-- <a href="./reserve?resTime=1"><button class="btn btn-secondary">10:00</button></a> -->
<!-- <button class="btn btn-secondary">10:30</button> -->
<!-- <button class="btn btn-secondary">11:00</button> -->
<!-- <button class="btn btn-secondary">11:30</button> -->
<!-- <button class="btn btn-secondary">13:00</button> -->
<!-- <button class="btn btn-secondary">13:30</button> -->
<!-- <button class="btn btn-secondary">14:00</button> -->
<!-- <button class="btn btn-secondary">14:30</button> -->
<!-- <button class="btn btn-secondary">15:00</button> -->
<!-- <button class="btn btn-secondary">15:30</button> -->
<!-- <button class="btn btn-secondary">16:00</button> -->
<!-- <button class="btn btn-secondary">16:30</button> -->
<!-- <button class="btn btn-secondary">17:00</button> -->
<!-- <button class="btn btn-secondary">17:30</button> -->
<!-- <button class="btn btn-secondary">18:00</button> -->
<!-- <button class="btn btn-secondary">18:30</button> -->
<!-- <button class="btn btn-secondary">19:00</button> -->
<!-- <button class="btn btn-secondary">19:30</button> -->



<!-- <form action="./reserveDateAjax" method="post"> -->
	<input type="text" name="resDate" value="${resDate }" style="display: none;">
	<input type="text" name="partNo" value="${param.partNo }" style="display: none;">


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
   
   <br><br><br>
   
   <input type="radio" name="resDiv" value="visit">방문
   <input type="radio" name="resDiv" value="video">화상전화
   <input type="radio" name="resDiv" value="chat">채팅 
	
	<br>
	
   <button style="float: right;" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">예약하기</button>
<!-- </form> -->

<button onclick="requestPay()">결제</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>



</body>
</html>






