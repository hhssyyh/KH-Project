<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
#container {
	margin-top: 154px;
}

#toptab {
	margin-top: 100px;
}

#container{
	background-color: grey;
	width:100%; 
	height:350px;
	display: flex;
  	justify-content: center;
  	align-items: center;
  	
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
			<a class="nav-link active" aria-current="page" href="/main/detail">상세페이지</a>
		</li>

		<li class="nav-item">
			<a class="nav-link" href="/main/review">리뷰</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/main/partnernotice">공지사항</a>
		</li>
		
		<li class="nav-item">
			<a class="nav-link" href="/main/reservation">예약</a>
		</li>
	</ul>
</div>

<div id="container">
	<div>
		<div style="width:200px; height:200px;">
			<img id="profileImg" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927">
		</div>
	</div>
	
	<div style="background-color: white; width:400px; height:200px;">
		<div style="font-size: 50px;">
			홍길동
		</div>
		
		<p>email@naver.com</p>
		<p>010-0000-0000</p>
	</div>
</div>