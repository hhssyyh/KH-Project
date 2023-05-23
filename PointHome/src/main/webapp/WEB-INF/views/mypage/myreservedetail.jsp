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
</style>


<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />


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

</div>

</body>
</html>















