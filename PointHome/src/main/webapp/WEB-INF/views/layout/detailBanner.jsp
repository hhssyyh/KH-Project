<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
function pickPart(th) {
	
	var partNo = $(th).parents(".pick").find(".partNo").val()
	console.log($(th).parents(".pick").find(".partNo").val())
	
	$.ajax({
		   type : 'get',           // 타입 (get, post, put 등등)
		   url : '/main/detailPick',  // 요청할 서버url
		   dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
		   data : {  // 보낼 데이터 (Object , String, Array)
			   partNo : $(th).parents(".pick").find(".partNo").val()
		   }, 
		   success : function(result) { // 결과 성공 콜백함수
		    	console.log(result)
		        if( result.isPick ) { //찜 했음
					$(th).find("i").toggleClass("bi-heart")
					$(th).find("i").addClass("bi-heart-fill")
				} else { //찜 취소
					$(th).find("i").toggleClass("bi-heart-fill")
					$(th).find("i").addClass("bi-heart")
				}
		   
		   },
		   error : function(request, status, error) { // 결과 에러 콜백함수
		        console.log(error)
		   }
	})
}
</script>
<style>
body {
	background-color: #f2efe1;
}

#toptab {
	margin-top: 100px;
}

#container{
	margin: 0 auto;
	margin-top: 154px;
 	background-color: #5758BB; 
	width:80%; 
	height:350px;
	display: flex;
  	justify-content: center;
  	align-items: center;
  	color: #f2c305;
}

#container div {
	margin-right: 10px;

}

#btn {
	position: fixed;

}

.nav-link {
	color: #5758BB;
}
</style>
    

<div id="toptab" class="fixed-top">
	<ul class="nav justify-content-center">
		<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="/main/detail?partNo=${partNo }">상세페이지</a>
		</li>

		<li class="nav-item">
			<a class="nav-link" href="/main/review?partNo=${partNo }">리뷰</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/main/partnernotice?partNo=${partNo }">공지사항</a>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" href="/main/reservation?partNo=${partNo }">예약</a>
		</li>
	</ul>
</div>

<div id="container">
	<div>
		<div style="width:200px; height:200px;">
			<img id="profileImg" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927">
		</div>
	</div>
	
	
	<span class="pick" > 
	<input class="partNo" type="hidden" value="${partNo}">
		<c:if test="${isPick eq 0}">
			<button type="button" onclick="pickPart(this)" class="btn btn-primary"><i class="bi bi-heart"></i></button>
		</c:if>
		<c:if test="${isPick eq 1}">
			<button type="button" onclick="pickPart(this)" class="btn btn-primary"><i class="bi bi-heart-fill"></i></button>
		</c:if>
	</span>
	
	<div style="width:400px; height:200px; padding: 20px;">
		<div style="font-size: 50px;">
			${partner.partnerShopname }(${partner.partnerNick })  
		</div>
		
		<p>${partner.partnerEmail }</p>
		<p>${partner.partnerPhone }</p>
	</div>
</div>