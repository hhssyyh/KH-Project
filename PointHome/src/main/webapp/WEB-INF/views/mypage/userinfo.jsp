<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<link href="/resources/mypage/userInfo.css" rel="stylesheet">

<div id="mypage">

	<c:import url="/WEB-INF/views/layout/myprofile.jsp" />


	<div id="userInfo" class="container mt-5" style="padding: 30px;">
		<div>기본 회원정보</div>
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
		<div id="userName">
			<h5 style="margin-left: 13px;">이름(실명)</h5>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userName }" disabled> <label
				for="floatingInput"></label>

		</div>
		<hr>
		<div id="userId">
			<h5 style="margin-left: 13px;">아이디(이메일)</h5>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userEmail }" disabled> <label
				for="floatingInput"></label>

		</div>
		<hr>


		<div id="divNick">
			<h5 style="margin-left: 13px;">닉네임</h5>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userNick }"> <label for="floatingInput"></label>

		</div>
		<hr>
		<div id="divPw">
			<h5 style="margin-left: 13px;">비밀번호</h5>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userPw }"> <label for="floatingInput"></label>
		</div>

		<hr>
		<div id="divPw2">
			<h5 style="margin-left: 13px;">비밀번호 확인</h5>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userPw }"> <label for="floatingInput"></label>

		</div>
		<hr>
		<div id="divBirth">
			<h5 style="margin-left: 13px;">생년월일</h5>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 13%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userBirthYear }${res.userBirthMonth  }${res.userBirthDay  }">
			<label for="floatingInput"></label>
		</div>
		<hr>
		<div id="divPhone">
			<h5 style="margin-left: 13px;">연락처</h5>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 23%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userPhone}"> <label for="floatingInput"></label>
		</div>
		<hr>
		<div id="divPostCode">
			<h5 style="margin-left: 13px;">우편번호</h5>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 23%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userPostCode}"> <label
				for="floatingInput"></label>
		</div>
		<button class="btn btn-outline-dark PostCodeBtn ">우편번호 확인</button>

		<hr>
		<div id="divAddress">
			<h5 style="margin-left: 13px;">주소</h5>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -72px;"
				placeholder="${res.userAddress }"> <input type="text"
				class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: 0px;"
				placeholder="${res.userDetailAddress }"> <input type="text"
				class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: 0px;"
				placeholder="${res.userExtraAddress }"> <label
				for="floatingInput"></label>
		</div>




		<div id="actionBtn" style="text-align: center; padding-top: 30px;">
			<button class="btn btn-outline-dark proBtn">회원탈퇴</button>
			<button class="btn btn-outline-dark proBtn">수정완료</button>
		</div>



	</div>
</div>

</body>
</html>
















