<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<link href="/resources/mypage/view.css" rel="stylesheet" >



<div id="mypage">

<h3 style="margin: 20px; margin-left: 30px;"><a href="./view">MYMENU</a></h3>

<div id="myBanner">
	<div id="profile">
		<span><img id="profileImg" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></span>
		<div id="nickDiv">
			<h1>NICKNAME</h1>
			<button class="btn btn-outline-dark nickBtn">회원정보수정</button>
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


<div id="mypageCon" class="container">

	<div class="conRow">
		<div id="reserveDiv" class="conRowDiv">
			<h5>예약관리</h5>
			<hr>
		</div>
		
		<span class="stripe"></span>
		
		<div id="noticeDiv" class="conRowDiv">
			<h5>공지사항</h5>
			<hr>
		</div>
	</div>
	
	<div id="btnCon">
		
	</div>

</div>

</div>


</body>
</html>





