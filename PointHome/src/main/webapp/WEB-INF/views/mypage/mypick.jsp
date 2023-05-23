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

#profileImg2{
	width: 60px;
	margin-left:20px;
	
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

</div>
		<div class="btnRow">
			<button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 1000px; margin-top: -400px;">1:1 채팅 문의</button>
			<button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 1200px; margin-top: -447px;">알림 내역</button>
			<button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 1000px; margin-top: -400px;">찜 내역</button>
			<button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 1200px; margin-top: -447px;">후기 작성</button>   
		</div>

<div id="mypageCon"></div>



<div id="userInfo"
	style="margin: 0 auto; margin-top: 200px; padding: 30px; border-radius: 30px; border: 1px solid;">
	 <h4><i class="bi bi-box2-heart-fill"></i> 찜목록</h4>
	<hr id="line">
	
	<div id="profile2">
		<span><img id="profileImg2" alt=""
			src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></span> 
				<h5 style="margin: 20px; margin-left: 103px; margin-top: -52px;">해성동자</h5> 
				<h6 style="margin: 20px; margin-left: 103px; margin-top: -14px;">연애운전문</h6>
				<button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 700px; margin-top: -124px;">찜 취소</button>	
		</div>
	<div id="profile2">
		<span><img id="profileImg2" alt=""
			src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></span> 
				<h5 style="margin: 20px; margin-left: 103px; margin-top: -52px;">변상용의 집</h5>
				<h6 style="margin: 20px; margin-left: 103px; margin-top: -14px;">$타로$전문$연애운$취업운$신년타로$인생타로$</h6>
				<button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 700px; margin-top: -124px;">찜 취소</button>	
		</div>
	</div>
	</div>
	


</div>



</body>
</html>















