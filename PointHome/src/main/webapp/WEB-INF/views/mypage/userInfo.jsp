<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<link href="/resources/mypage/userInfo.css" rel="stylesheet">


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
	style="margin: 0 auto; margin-top: 200px; padding: 30px;">
	<h4>기본 회원정보</h4>
	<hr id="line">

	<div id="photoDiv">
		<h5>사진</h5>
	</div>
	<div id="profile2">
		<span><img id="profileImg2" alt=""
			src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></span>

		<div id="btn2">
			<button class="btn btn-outline-dark nickBtn2 ">사진변경</button>
		</div>
		
	</div>
	
	<hr>
	<div id="userId">
		<h5>아이디(이메일)</h5>
		<input type="text" id="userIdInput">
	</div>
	<hr>
	<div id="userNick">
		<h5>닉네임</h5>
	</div>
	<hr>
	<div id="userPw">
		<h5>비밀번호</h5>
	</div>
	<hr>
	<div id="userName">
		<h5>이름(실명)</h5>
	</div>
	<hr>
	<div id="userPhone">
		<h5>휴대전화</h5>
	</div>
	
	
	<div id="actionBtn">
	<button>회원탈퇴</button>
	<button>수정완료</button>
	</div>


</div>



</body>
</html>






















