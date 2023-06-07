<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
</style>
    

<div id="toptab" class="fixed-top">
	<ul class="nav justify-content-center">
		<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="/main/detail?partNo=${partNo }">상세페이지</a>
		</li>

		<li class="nav-item">
			<a class="nav-link" href="/main/review">리뷰</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/main/partnernotice">공지사항</a>
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
	
	<div style="width:400px; height:200px; padding: 20px;">
		<div style="font-size: 50px;">
			${partner.partnerShopname }(${partner.partnerNick })  
		</div>
		
		<p>${partner.partnerEmail }</p>
		<p>${partner.partnerPhone }</p>
	</div>
</div>