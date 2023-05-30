<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<link href="/resources/mypage/userInfo.css" rel="stylesheet">


<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />


<form action="./update" method="get">

	<div id="userInfo" class="container mt-5" style="padding: 40px;">
		<div style="font-size: 20px;">기본 회원정보</div>
		<hr id="line">

		<div id="photoDiv">
			<h6>사진</h6>
		</div>
		<div id="profile2">
			<span><img id="profileImg2" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></span>

			<div id="btn2">
				<button type="button" class="btn btn-outline-dark nickBtn2" style="font-size: 15px;">사진변경</button>
			</div>

		</div>
		<hr>
		<div id="userName">
			<h6 style="margin-left: 13px;">이름(실명)</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userName }" disabled>
			<label for="floatingInput"></label>

		</div>
		<hr>
		<div id="userId">
			<h6 style="margin-left: 13px;">아이디(이메일)</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userEmail }" disabled> <label
				for="floatingInput"></label>

		</div>
		<hr>


		<div id="divNick">
			<h6 style="margin-left: 13px;">닉네임</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -68px;"
				value="${res.userNick }" name="userNick">
			<label for="floatingInput"></label>

		</div>
		<hr>
		<div id="divPw">
			<h6 style="margin-left: 13px; display: inline-block; margin-right: 115px;">비밀번호</h6>
			<button type="button">비밀번호 수정</button>
		</div>

		<hr>
		<div id="divBirth">
			<h6 style="margin-left: 13px;">생년월일</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 13%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userBirthYear }${res.userBirthMonth  }${res.userBirthDay  }" disabled>
			<label for="floatingInput"></label>
		</div>
		<hr>
		<div id="divPhone">
			<h6 style="margin-left: 13px;">연락처</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 23%; margin-left: 215px; margin-top: -68px;"
				value="${res.userPhone}" name="userPhone">
			<label for="floatingInput"></label>
		</div>
		<hr>
		<div id="divPostCode">
			<h6 style="margin-left: 13px;">우편번호</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 23%; margin-left: 215px; margin-top: -68px;"
				value="${res.userPostCode}" name="userPostCode">
			<label for="floatingInput"></label>
		</div>
		<button class="btn btn-outline-dark PostCodeBtn" style="font-size: 15px;">우편번호 확인</button>

		<hr>
		<div id="divAddress">
			<h6 style="margin-left: 13px;">주소</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -72px;"
				value="${res.userAddress }" name="userAddress">
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: 0px;"
				value="${res.userDetailAddress }" name="userDetailAddress">
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: 0px;"
				value="${res.userExtraAddress }" name="userExtraAddress">
			<label for="floatingInput"></label>
		</div>


		<div id="actionBtn" style="text-align: center; padding-top: 30px;">
			<button class="btn btn-outline-dark proBtn">수정완료</button>
			<a href="#"><button type="button" class="btn btn-outline-dark proBtn">회원탈퇴</button></a>
		</div>

	</div>

</form>

</div>

</body>
</html>
















