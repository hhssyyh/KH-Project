<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">
body {
	padding: 0;
	margin: 0;
}

a {
	color: black;
	text-decoration: none;
}

#mypage {
	margin-bottom: 100px;
	padding-top: 70px;
}

#myBanner {
	height: 300px;
	width: 100%;
	text-align: center;
	
	background-color: #ccc;
}

#proBtnDiv {
	display: inline-block;
	float: right;
	margin: 0 20px;
	margin-top: 10px;
	font-size: 25px;
}

.bi::before, [class^="bi-"]::before, [class*=" bi-"]::before {
    margin: 5px;
}

#profile {
	display: flex;
	align-items: center;
/* 	float: left; */
	padding-top: 70px;
 	padding-left: 25%; 
/* 	width: 49%; */
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

#profileBtnDiv {
    float: right; 
	display: flex;
	margin-right: 30%;  
	justify-content: center;
 	text-align: center; 
 	align-items: center;
 	height: 300px;
	width: 10%;
}
 
#profileBtnDiv 

.proBtn {
	width: 150px;
	font-size: 15px;
	margin: 10px;
}

#mypageCon {
	margin-top: 100px;
}

.conRow {
	text-align: center;
}

.conRowDiv {
	display: inline-block;
	width: 40%;
	height: 500px;
	padding: 20px;
	margin-bottom: 80px;
	text-align: left;
	
	border: 1px solid #ccc;
 	background-color: white; 
}

.conTitle {
	display: inline-block;
	font-size: 20px;
	margin-left: 8px;
}

.stripe {
	width: 1px;
	height: 300px;
}

#reserveDiv {
	margin-right: 50px;
}

#noticeDiv {
	
}

#btnCon {
	width: 80%;
	height: 300px;
	background-color: #ccc;
}


</style>



<div id="mypage">

<div style="margin: 10px; margin-left: 40px;">
	<a href="./view" style="font-size: 30px;">MYMENU</a>
	
	<div id="proBtnDiv">
		<a href="#"><i class="bi bi-chat-dots"></i></a>
		<a href="#"><i class="bi bi-bell"></i></a>
		<a href="#"><i class="bi bi-bag-heart"></i></a>
	</div>
</div>

<div id="myBanner">
	<div id="profile">
		<span><img id="profileImg" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></span>
		<div id="nickDiv">
			<div style="font-size: 40px;">NICKNAME</div>
			<button class="btn btn-outline-dark nickBtn">회원정보수정</button>
		</div>
	</div>

	<div id="profileBtnDiv">
		<div class="btnRow">
			<button class="btn btn-outline-dark proBtn">1:1 채팅 문의</button>
			<button class="btn btn-outline-dark proBtn">알림 내역</button>
		</div>
		<div class="btnRow">
			<button class="btn btn-outline-dark proBtn">찜 내역</button>
			<button class="btn btn-outline-dark proBtn">후기 작성</button>
		</div>
	</div>
</div>


<div id="mypageCon" class="container">

	<div class="conRow">
		<div id="reserveDiv" class="conRowDiv">
			<div class="conTitle">예약관리</div>
			<button class="btn btn-light" style="float: right; font-size: 15px;">전체 예약 조회</button>
			<hr>
		</div>
		
		<span class="stripe"></span>
		
		<div id="noticeDiv" class="conRowDiv">
			<div class="conTitle">공지사항</div>
			<hr>
		</div>
	</div>
	
	<div id="btnCon">
		
	</div>

</div>

</div>


</body>
</html>





