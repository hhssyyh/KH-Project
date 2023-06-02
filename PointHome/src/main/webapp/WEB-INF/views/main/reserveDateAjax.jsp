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
	
   <button style="float: right;" onclick="requestPay()" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">예약하기</button>


<div class="modal fade modal-xl" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

  		  <!-- 결제위젯, 이용약관 영역 -->
		  <div id="payment-method"></div>
		  <div id="agreement"></div>
		  <!-- 결제하기 버튼 -->
		  <button id="payment-button">결제하기</button>
		  
  		
  

</body>
</html>






