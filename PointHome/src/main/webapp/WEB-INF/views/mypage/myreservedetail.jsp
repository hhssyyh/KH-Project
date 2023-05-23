<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
body {
	padding: 0;
	margin: 0;
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

#profileBtnDiv {
	float: right;
	display: flex;
	justify-content: center;
	text-align: center;
	align-items: center;
	padding-right: 500px;
	height: 300px;
	width: 300px;
}

.proBtn {
	width: 150px;
	font-size: 15px;
	margin: 10px;
}

#userInfo {
	height: 400px;
	width: 1000px;
	background-color: white;
}

#reservedetail {
	height: 340px; 
	width: 800px;
	background-color: white;
}

#line {
	border-top: 3px solid;
}

.nickBtn2 {
	width: 150px;
	font-size: 18px;
	margin-top: 24px;
	margin-right: 145px;
}
</style>

<h3 style="margin: 20px; margin-left: 30px; margin-top: 40px;">
	<a>MYMENU</a>
</h3>

<div id="myBanner">
	<div id="profile">
		<span><img id="profileImg" alt=""
			src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></span>
		<div id="nickDiv">
			<h2>NICKNAME</h2>
			<button class="btn btn-outline-dark nickBtn ">회원정보수정</button>
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

<div id="mypageCon"></div>



<div id="userInfo"
	style="margin: 0 auto; margin-top: 200px; padding: 30px; border-radius: 30px; border: 1px solid;">
	<h4>예약 상세 정보</h4>
	<hr id="line">
	<h5>제휴사 이름</h5>
	

	<h5>일정</h5>
	<h5>예약일</h5>

</div>

<div id="userInfo"
	style="margin: 0 auto; margin-top: 200px; padding: 30px; border-radius: 30px; border: 1px solid;">
	<h4>오시는길</h4>

</div>

<div id="userInfo"
	style="margin: 0 auto; margin-top: 200px; padding: 30px; border-radius: 30px; border: 1px solid;">
	<h4>이용확인</h4>
	

</div>


</body>
</html>















