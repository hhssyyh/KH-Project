<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp"/>
<link href="/resources/join/user/css/join.css" rel="stylesheet">



<!-- 전체 배경화면 색 설정 -->
<div class="bg-light" >
<!-- 전체 배경화면 색 설정 끝 -->

<div class="container">

<div class="row text-center" style="margin-top: 60px; margin-bottom: 80px;">

<!-- 좌여백 -->
<div class="col-3"></div>
<!-- 좌여백 끝 -->
<div class="col-6">

   <div class="h1 mt-3 mb-5">
      <a class="navbar-brand h1 text-center col-5" href="./">PointHome</a>
   </div>

	<form action="/partner/join" method="post">

	<div class="row g-2 mb-3">
		<div class="form-floating col-8">
		   <input type="email" class="form-control" name="partnerEmail" id="partnerEmail" placeholder="이메일">
		   <label for="partnerEmail">이메일</label>
		</div>
		       
		<div class="form-floating col-4">
			<select class="form-select" name="partnerEmailSelect" id="partnerEmailSelect">
				<option selected>직접입력</option>
				<option value="@gmail.com">@gmail.com</option>
				<option value="@naver.com">@naver.com</option>
				<option value="@hanmail.net">@hanmail.net</option>
			</select> 
			<label for="partnerEmailSelect">선택</label>
		</div>
	</div>

      <div class="form-floating mb-3">
         <input type="text" class="form-control" name="partnerPw" id="partnerPw" placeholder="비밀번호">
         <label for="partnerPw">비밀번호</label>
      </div>

      <div class="form-floating mb-3">
         <input type="text" class="form-control" name="partnerPwChk" id="partnerPwChk" placeholder="비밀번호 확인">
         <label for="partnerPwChk">비밀번호 확인</label>
      </div>

      <div class="form-floating mb-3">
         <input type="text" class="form-control" name="partnerNick" id="partnerNick" placeholder="이름">
         <label for="partnerNick">닉네임</label>
      </div>

      <div class="form-floating mb-3">
         <input type="text" class="form-control" name="partnerName" id="partnerName" placeholder="이름">
         <label for="partnerName">이름</label>
      </div>

      <div class="form-floating mb-3">
         <input type="text" class="form-control" name="partnerPhone" id="partnerPhone" placeholder="연락처">
         <label for="partnerPhone">연락처</label>
      </div>
	
	<div class="row g-2 mb-3">
	
	<div class="form-floating col-9">
		<input type="text" class="form-control" name="partnerShopname" id="partnerShopname" placeholder="상호명">
		<label for="partnerShopname">상호명</label>
	</div>

	<div class="form-floating col-3">
		<select class="form-select" name="partnerType" id="partnerType">
		         <option value="t" selected>타로</option>
		         <option value="c">철학</option>
		         <option value="s">신점</option>
		</select>
		<label for="partnerType">제휴타입</label>
	</div>

	</div>
	
	<div class="row g-2 mb-3">

		<div class="form-floating col-9">
		   <input type="text" class="form-control" name="partnerAccount" id="partnerAccount" placeholder="계좌">
		   <label for="partnerAccount">계좌</label>
		</div>

		<div class="form-floating col-3">
		   <select class="form-select" name="partnerBank" id="partnerBank">
		            <option value="국민" selected>국민</option>
		            <option value="sc제일">sc제일</option>
		            <option value="신한">신한</option>
		            <option value="우리">우리</option>
		            <option value="외환">외환</option>
		            <option value="기업">기업</option>
		            <option value="농협">농협</option>
		            <option value="수협">수협</option>
		            <option value="KBE하나">KBE하나</option>
		            <option value="한국시티">한국시티</option>            
		   </select> 
		   <label for="partnerBank">은행</label>
		</div>
		
	</div>

   <div class="form-floating mb-3">
      <select class="form-select" name="partnerGender" id="partnerGender">
         <option value="M" selected>남자</option>
         <option value="F">여자</option>
      </select> 
      <label for="partnerGender">성별</label>
   </div>

   <div class="row g-2 mb-3">
      <div class="col-md">
         <div class="form-floating">
            <input type="text" class="form-control" name="partnerBirthyear" id="partnerBirthyear" placeholder="년">
            <label for="partnerBirthyear">년</label>
         </div>
      </div>
      <div class="col-md">
         <div class="form-floating">
            <select class="form-select" name="partnerBirthmonth" id="partnerBirthmonth">
               <option selected>선택</option>
               <option value="1">1</option>
               <option value="2">2</option>
               <option value="3">3</option>
               <option value="4">4</option>
               <option value="5">5</option>
               <option value="6">6</option>
               <option value="7">7</option>
               <option value="8">8</option>
               <option value="9">9</option>
               <option value="10">10</option>
               <option value="11">11</option>
               <option value="12">12</option>
            </select> 
            <label for="partnerBirthmonth">월</label>
         </div>
      </div>
      <div class="col-md">
         <div class="form-floating">
            <input type="text" class="form-control" name="partnerBirthday" id="partnerBirthday" placeholder="이메일">
            <label for="partnerBirthday">일</label>
         </div>
      </div>
   </div>

   <!-- 주소 시작 -->
   <div class="row g-2 mb-3">
      <div class="col-8">
         <div class="form-floating">
            <input type="text" class="form-control" name="partnerPostcode" id="partnerPostcode" placeholder="우편번호">
            <label for="partnerPostcode">우편번호</label>
         </div>
      </div>
      
      <div class="col-4">
         <div class="form-floating">
            <button type="button" class="btn btn-primary btn-lg" onclick="kakaoPostcode()">우편번호 찾기</button>
         </div>
      </div>
   </div>

   <div class="form-floating mb-3">
      <input type="text" class="form-control" name="partnerAddress" id="partnerAddress" placeholder="주소">
      <label for="floatingInput">주소</label>
   </div>
   
   <div class="row g-2 mb-3">
      <div class="col-6">
         <div class="form-floating">
            <input type="text" class="form-control" name="partnerDetailaddress" id="partnerDetailaddress" placeholder="상세주소">
            <label for="">상세주소</label>
         </div>
      </div>
      
      <div class="col-6 mb-3">
         <div class="form-floating">
            <input type="text" class="form-control" name="partnerExtraaddress" id="partnerExtraaddress" placeholder="참고사항">
            <label for="">참고사항</label>
         </div>
      </div>
   </div>
      
   <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
      <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
   </div>
      
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="/resources/join/partner/js/Kakao_postAPI.js"></script>

   <div class="d-grid mb-5">
     <button class="btn btn-primary btn-lg" type="submit">가입하기</button>
   </div>
   </form>
</div>
</div>
</div>


<!-- 우 여백 -->
<div class="col-3"></div>
<!-- 우 여백 끝 -->

</div>

<c:import url="../layout/footer.jsp"/>