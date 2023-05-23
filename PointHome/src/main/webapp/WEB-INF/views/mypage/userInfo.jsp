<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<link href="/resources/mypage/userInfo.css" rel="stylesheet">


<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />


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
		<h5 style="margin-left: 13px;">아이디(이메일)</h5>
		${res.userEmail }
	</div>
	<hr>
 

	<div class="form-floating mb-3">
		<input type="text" class="form-control" id="floatingInput" style="width: 50%; margin-left: 215px;  " placeholder="Nickname"  >
			 <label for="floatingInput" ><h5>닉네임</h5></label>
	</div> 
	<hr>
	<div class="form-floating mb-3">
		<input type="text" class="form-control" id="floatingInput" style="width: 50%; margin-left: 215px;  " placeholder="Password"  >
			 <label for="floatingInput" ><h5>비밀번호</h5></label>
	</div>
	

	<hr>
	
	<div id="userName">
		<h5 style="margin-left: 13px;">이름(실명)</h5>
	</div>
	<hr>
	<div class="form-floating mb-3">
		<input type="text" class="form-control" id="floatingInput"
			style="width: 50%; margin-left: 215px;  " placeholder="Password"  >
			 <label for="floatingInput" ><h5>비밀번호</h5></label>
	</div>



	<div id="actionBtn" style="text-align: center; padding-top: 30px;">
		<button class="btn btn-outline-dark proBtn">회원탈퇴</button>
		<button class="btn btn-outline-dark proBtn">수정완료</button>
	</div>


</div>

</div>

</body>
</html>
















