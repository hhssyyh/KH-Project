<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/partnerLayout/header.jsp" />

<link href="/resources/mypage/userInfo.css" rel="stylesheet">

<%-- <c:import url="/WEB-INF/views/layout/myprofile.jsp" /> --%>

<style>
	#profileImg2 {width: 100px; height: 100px;}
	
</style>

<style type="text/css">

	a {
		color: black;
		text-decoration: none;
	}
	
	.modal {
	  position: fixed;
	  top: 0;
	  left: 0;
	
	  width: 100%;
	  height: 100%;
	
	  display: none;
	
	  background-color: rgba(0, 0, 0, 0.4);
	}
	      
	.modal.show {
	  display: block;
	}
	
	
	.modal_body {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	
	  width: 400px;
	  height: 100px;
	
	  padding: 40px;
	
	  text-align: center;
	
	  background-color: rgb(255, 255, 255);
	  border-radius: 10px;
	  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	
	  transform: translateX(-50%) translateY(-50%);
	}
	


</style>



<div id="mypage">





<form action="./imgUpdate" method="post" enctype="multipart/form-data">

	<div id="userInfo" class="container mt-5" style="padding: 40px; height: 1500px;">
		<div style="font-size: 20px;">기본 제휴사 정보</div>
		<hr id="line">

		<div id="photoDiv">
			<h6>사진</h6>

		</div>
		<div id="profile2">
			<c:choose>
			<c:when test="${partnerFile.partnerImg eq null }">
			<div id="image_container"><img id="profileImg2" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></div>
			</c:when>
			<c:otherwise>
			<img id="profileImg2" src="/upload/${partnerFile.partnerImg }">
			</c:otherwise>
			</c:choose>

			
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
				placeholder="${res.partnerName }" value="${res.partnerName }" disabled>
			<label for="floatingInput"></label>

		</div>
		<hr>
		<div id="userId">
			<h6 style="margin-left: 13px;">아이디(이메일)</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.partnerEmail}" disabled> <label
				for="floatingInput"></label>

		</div>
		<hr>


		<div id="divNick">
			<h6 style="margin-left: 13px;">닉네임</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -68px;"
				value="${res.partnerNick }" name="partnerNick">
			<label for="floatingInput"></label>

		</div>
		
		<hr>
		<div id="divPw">
			<h6 style="margin-left: 13px; display: inline-block; margin-right: 115px;">비밀번호</h6>
			<input type="text" class="form-control" id="floatingInput" name="partnerPw"
            style="width: 20%; margin-left: 215px; margin-top: -72px; margin-bottom: 10px;"
            placeholder="비밀번호 확인">
			<input type="text" class="form-control" id="floatingInput" name=""
            style="width: 20%; margin-left: 215px; margin-top: 0px; margin-bottom: 10px;"
            placeholder="비밀번호 수정">
			<input type="text" class="form-control" id="floatingInput" name=""
            style="width: 20%; margin-left: 215px; margin-top: 0px; margin-bottom: 10px;"
            placeholder="비밀번호 수정 확인">
			
<!-- 			<button type="button" class="btn btn-outline-dark proBtn">비밀번호 수정</button> -->
		</div>

		<hr>
		
 <div id="divBirth">
         <h6 style="margin-left: 13px;">생년월일</h6>
         <input type="text" class="form-control" id="floatingInput"
            style="width: 13%; margin-left: 215px; margin-top: -68px;"
            placeholder="${res.partnerBirthyear }${res.partnerBirthmonth  }${res.partnerBirthday  }" disabled>
         <label for="floatingInput"></label>
      </div>
      <hr>

		<div id="divPhone">
			<h6 style="margin-left: 13px;">연락처</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 23%; margin-left: 215px; margin-top: -68px;"
				value="${res.partnerPhone}" name="partnerPhone">
			<label for="floatingInput"></label>
		</div>
		<hr>

		<div id="divPhone">
			<h6 style="margin-left: 13px;">상호명</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 23%; margin-left: 215px; margin-top: -68px;"
				value="${res.partnerShopname}" name="partnerShopname">
			<label for="floatingInput"></label>
		</div>
		<hr>

		<div id="divPhone">
			<h6 style="margin-left: 13px;">제휴타입</h6>
			<select class="form-control" name="partnerType" id="floatingInput" 
					style="width: 23%; margin-left: 215px; margin-top: -68px;">
			         <option value="t" selected>타로</option>
			         <option value="c">철학</option>
			         <option value="s">신점</option>
			</select>
			<label for="floatingInput"></label>
		</div>
		<hr>

		<div id="divPhone">
			<h6 style="margin-left: 13px;">계좌</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 23%;  margin-left: 215px; margin-top: -68px;"
				value="${res.partnerAccount}" name="partnerAccount">
			<label for="floatingInput"></label>
		</div>
		
			<div class="form-floating col-3">
		   <select class="form-select"  name="partnerBank" id="partnerBank" 
				   style="width: 50%; height:0%; margin-left: 450px; margin-top: -60px;">
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
		   <label for="floatingInput"></label>
		</div>
			
		<hr>
		
		
		
		
		<div id="divPostCode">
			
			<h6 style="margin-left: 13px;">우편번호</h6>
			<span id="floatingInput"><input type="text" class="form-control" id="partnerPostcode"
				style="width: 23%; margin-left: 215px; margin-top: -68px;"
				value="${res.partnerPostcode}" name="partnerPostcode">
			<label for="floatingInput"></label>
		<button type="button" class="btn btn-outline-dark PostCodeBtn" style="font-size: 15px;" onclick="kakaoPostcode()">우편번호 확인</button>
		</span>
		</div>

		<hr>
		
		<div id="divAddress">
			<h6 style="margin-left: 13px;">주소</h6>
			<input type="text" class="form-control" id="partnerAddress"
				style="width: 50%; margin-left: 215px; margin-top: -72px;"
				value="${res.partnerAddress }" name="partnerAddress">
			<input type="text" class="form-control" id="partnerDetailaddress"
				style="width: 50%; margin-left: 215px; margin-top: 0px;"
				value="${res.partnerDetailaddress }" name="partnerDetailaddress">
			<input type="text" class="form-control" id="partnerExtraaddress"
				style="width: 50%; margin-left: 215px; margin-top: 0px;"
				value="${res.partnerExtraaddress }" name="partnerExtraaddress">
			<label for="floatingInput"></label>
		</div>
		
				
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
		
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/resources/join/partner/js/Kakao_postAPI.js"></script>
	<!-- 주소 끝 -->
		
		<!-- 모달창 -->
		
		
		<div class="modal">
	      <div class="modal_body" >정말 탈퇴하시겠습니까?&nbsp;&nbsp;&nbsp;    
	      <a href="./removeUser"><button type="button" class="btn btn-outline-primary btn-default btn-xs">확인</button></a>
	      <button type="button" class="btnModalCancle btn btn-outline-primary btn-default btn-xs " >취소</button>
	      </div>     
	    </div>

		<div id="actionBtn" style="text-align: center; padding-top: 30px;">
			<button class="btn btn-outline-dark proBtn">수정완료</button>
			<button type="button" class="btn-open-popup btn btn-outline-dark proBtn">회원탈퇴</button>
		</div>

	</div>

</form>

</div>

	 <script>
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');
      const btnModalCancle = document.querySelector('.btnModalCancle');
      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show'); 

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
          
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');
          

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });

      btnModalCancle.addEventListener('click', (event) => {
    	  modal.classList.remove('show'); 
      });
      
    </script>
	

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
















