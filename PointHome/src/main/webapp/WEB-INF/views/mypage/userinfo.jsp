<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
img {width: 100px; height: 100px;}
</style>



<c:import url="/WEB-INF/views/layout/header.jsp" />

<link href="/resources/mypage/userInfo.css" rel="stylesheet">


<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />




<form action="./update" method="post" enctype="multipart/form-data">

	<div id="userInfo" class="container mt-5" style="padding: 40px;">
		<div style="font-size: 20px;">기본 회원정보</div>
		<hr id="line">

		<div id="photoDiv">
			<h6>사진</h6>
			${profile }
			${user }
		</div>
		<div id="profile2">
			<div id="image_container"><img id="profileImg2" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></div>

<!-- 			<div id="btn2"> -->
<!-- 				<button type="button" class="btn btn-outline-dark nickBtn2" style="font-size: 15px;" onclick="onClickUpload();">사진변경</button> -->
<!-- 			</div> -->
			
			<div class="btn2">
				<label for="file" class="btn btn-outline-dark nickBtn2" style="font-size: 15px;">사진 변경</label>
				<input type="file" name="file" id="file" accept=".jpg, .png, .gif" style="display: none;" onchange="setThumbnail(event);">
			</div>
		

		</div>
		<hr>
		<div id="userName">
			<h6 style="margin-left: 13px;">이름(실명)</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userName }" value="${res.userName }" disabled>
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
			<input type="text" class="form-control" id="userPostCode"
				style="width: 23%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userPostCode}" name="userPostCode">
			<label for="floatingInput"></label>
		</div>
		<button type="button" class="btn btn-outline-dark PostCodeBtn" style="font-size: 15px;" onclick="kakaoPostcode()">우편번호 확인</button>

		<hr>
		
		<div id="divAddress">
			<h6 style="margin-left: 13px;">주소</h6>
			<input type="text" class="form-control" id="userAddress"
				style="width: 50%; margin-left: 215px; margin-top: -72px;"
				placeholder="${res.userAddress }" name="userAddress">
			<input type="text" class="form-control" id="userDetailAddress"
				style="width: 50%; margin-left: 215px; margin-top: 0px;"
				placeholder="${res.userDetailAddress }" name="userDetailAddress">
			<input type="text" class="form-control" id="userExtraAddress"
				style="width: 50%; margin-left: 215px; margin-top: 0px;"
				placeholder="${res.userExtraAddress }" name="userExtraAddress">
			<label for="floatingInput"></label>
		</div>
		
				
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
		
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/resources/join/user/js/Kakao_postAPI.js"></script>
	<!-- 주소 끝 -->
		


		<div id="actionBtn" style="text-align: center; padding-top: 30px;">
			<button class="btn btn-outline-dark proBtn">수정완료</button>
			<a href="#"><button type="button" class="btn btn-outline-dark proBtn">회원탈퇴</button></a>
		</div>

	</div>

</form>

</div>

    <script>
      function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.getElementById("profileImg2");
          img.setAttribute("src", event.target.result);
//           document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
    </script>


</body>
</html>
















