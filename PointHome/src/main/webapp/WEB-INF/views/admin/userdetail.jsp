<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp" />

<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp" />

<style>

button {
	font-family: 'SBAggroM';
}
.btn-info {
	font-family: 'SBAggroM';
	background-color: #7e00c2;
	border-color: transparent;
	color: white;
}

body {
font-family: 'Lato', sans-serif;
}
</style>

<style type="text/css">* {cursor: url(https://cur.cursors-4u.net/cursors/cur-7/cur610.cur), auto !important;}</style><a href="https://www.cursors-4u.com/cursor/2010/12/17/oxygen-black-11.html" target="_blank" title="Oxygen Black"><img src="https://cur.cursors-4u.net/cursor.png" border="0" alt="Oxygen Black" style="position:absolute; top: 0px; right: 0px;" /></a>
<div style="margin-left: 16%; width:60%; padding-top:100px;">
<a href="./usermanage"><button type="button" class="btn btn-dark " style="  float: right;">목록</button></a>
	<div style="padding-top: 70px;">
		<h1 style="font-weight: bold; margin-left: 50%">회원 정보</h1>
		<br>
		<br>
		<br>
		<table class="table table-hover border-dark" style="margin-left: 15% ;">
		<thead class="table">
			<tr>
				<th>유저이름</th>
				<td>${detailList.USER_NAME}</td>
				<th>닉네임</th>
				<td>${detailList.USER_NICK}</td>
			</tr>
		</thead>
		<tbody class="table-group-divider">
			<tr>
				<th>이메일</th>
				<td>${detailList.USER_EMAIL}</td>
				<th>성별</th>
				<td>${detailList.USER_GENDER}</td>
			</tr>

			<tr>
				<th>생일</th>
				<td>${detailList.USER_BIRTHYEAR}/${detailList.USER_BIRTHMONTH}
					/ ${detailList.USER_BIRTHDAY}</td>
				<th>연락처</th>
				<td>${detailList.USER_PHONE}</td>
			</tr>

			<tr>
				<th>게시글 수</th>

				<td>${detailList.FREEBOARD}
					<a href="./userboardpost?userNo=${param.userNo }"><button id="boardChk" type="button" class="btn btn-outline-dark btn-sm">
						게시글 확인</button></a>

				</td>

				<th>댓글 개수</th>
				<td>${detailList.FREEBOARDCOMMENT}
					<a href="usercmtpost?userNo=${param.userNo }"><button id="cmtChk" type="button" class="btn btn-outline-dark btn-sm">댓글
						확인</button></a>
				</td>
				
			</tr>
			<tr>
				<th>회원</th>

				<td>
				<a href="./removeuser?userNo=${param.userNo }"><button type="button" class="btn btn-outline-dark btn-sm">회원탈퇴</button></a>
				<a href="./userupdate?userNo=${param.userNo }"><button type="button" class="btn btn-outline-dark btn-sm">회원수정</button></a>
				</td>

				<th>예약</th>
				<td>
					<a href="./userreserve?userNo=${param.userNo }"><button type="button" class="btn btn-outline-dark btn-sm">예약정보</button></a>
				</td>
				
			</tr>
						
				
		</tbody>

		</table>


    
	
    	
</div>
	
		<br>

</div>

	









</body>
</html>