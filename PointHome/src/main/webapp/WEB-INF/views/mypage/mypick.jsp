<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
body {
	padding: 0;
	margin: 0;
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


<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />


<div id="userInfo" class="container" style="padding: 30px; border-radius: 30px; border: 1px solid;">
	 <h4><i class="bi bi-box2-heart-fill"></i> 찜목록</h4>
	<hr id="line">
	
	<div id="profile2">
		<span><img id="profileImg2" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></span> 
		<h5 style="margin: 20px; margin-left: 103px; margin-top: -52px;">해성동자</h5> 
		<h6 style="margin: 20px; margin-left: 103px; margin-top: -14px;">연애운전문</h6>
		<button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 700px; margin-top: -124px;">찜 취소</button>	
	</div>
	<div id="profile2">
		<span><img id="profileImg2" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></span> 
		<h5 style="margin: 20px; margin-left: 103px; margin-top: -52px;">변상용의 집</h5>
		<h6 style="margin: 20px; margin-left: 103px; margin-top: -14px;">$타로$전문$연애운$취업운$신년타로$인생타로$</h6>
		<button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 700px; margin-top: -124px;">찜 취소</button>	
	</div>
</div>
	

</div>


</body>
</html>















