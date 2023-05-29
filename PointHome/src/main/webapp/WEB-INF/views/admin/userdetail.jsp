<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp"/>

<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp"/>

<div style="margin-left:16%; margin-top: 54px;">

<div style="padding-top:10px;">
	<h1>회원 정보</h1>
	<table class="table">
		<tr>
			<th>유저이름</th>
			<td>${detailList.USER_NAME}</td>
			<th>닉네임</th>
			<td>${detailList.USER_NICK}</td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td>${detailList.USER_EMAIL}</td>
			<th>성별</th>
			<td>${detailList.USER_GENDER}</td>	
		</tr>
		
		<tr>
			<th>생일</th>
			<td></td>
			
			<th>연락처</th>
			<td></td>
		</tr>
		
		
		
		<tr>
		<th>게시글 수</th>
		<!-- 게시글이 0개면 a태그 막기 -->
			<td>${detailList.FREEBOARD}</td>
			<td>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
	 			게시글 확인
				</button>
			</td>
		</tr>
		
		<tr>
			<th>댓글 개수</th>
			<td>
				${detailList.FREEBOARDCOMMENT}	
			</td>	
			
			
			
			<td>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
	 			게시글 확인
				</button>
			</td>
		</tr>
	</table>
	
	
	<br>
	<h1>예약 정보</h1>
</div>
	<a href="./usermanage"><button>목록</button></a>
	<button>회원탈퇴</button>
</div>



</body>
</html>