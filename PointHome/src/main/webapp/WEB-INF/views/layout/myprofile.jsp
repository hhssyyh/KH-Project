<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style type="text/css">
a {
	color: black;
	text-decoration: none;
}

#mypage {
 	margin-bottom: 100px; 
}

#myBanner {
	height: 300px;
	width: 100%;
	background-color: #ccc;
}

#profile {
	display: flex;
	align-items: center;
	float: left;
	padding-top: 70px;
	padding-left: 25%;
}

#profileImg {
	width: 150px;
}

#nickDiv {
	text-align: center;
	padding-left: 40px;
}

.nickBtn {
	width: 130px;
	font-size: 13px;
	margin-top: 3px;
}

.btnRow {
	
	margin-top: 10px;
}

 .proBtn {
	width: 150px;
	font-size: 15px;
	margin: 10px;
}


</style>


<div style="margin: 10px; margin-left: 40px; margin-top: 80px;">
	<a href="./view" style="font-size: 30px;">MYMENU</a>
</div>

<div id="myBanner">
	<div id="profile">
		<span><img id="profileImg" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></span>
		
		
		<div id="nickDiv">
			<div style="font-size: 40px;">NICKNAME</div>
			<a href="./userinfo"><button class="btn btn-outline-dark nickBtn">회원정보수정</button></a>
		</div>
	</div>

</div>
<div class="btnRow">
	<button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 1000px; margin-top: -400px;">1:1 채팅 문의</button>
	<button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 1200px; margin-top: -447px;">알림 내역</button>
	<button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 1000px; margin-top: -400px;">찜 내역</button>
	<button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 1200px; margin-top: -447px;">리뷰 조회</button>   
</div>













