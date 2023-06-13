<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>




<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp" />

<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp" />



<div style="margin-left: 16%;">

	<div style="padding-top: 10px;">
		<h1>회원 정보</h1>
		<table class="table">
			<tr>
				<th>유저이름</th>
				<td>${detailList.partnerName}</td>
				<th>닉네임</th>
				<td>${detailList.partnerNick}</td>
			</tr>

			<tr>
				<th>이메일</th>
				<td>${detailList.partnerEmail}</td>
				<th>성별</th>
				<td>${detailList.partnerGender}</td>
			</tr>

			<tr>
				<th>생일</th>
				<td>${detailList.partnerBirthyear}/${detailList.partnerBirthmonth}
					/ ${detailList.partnerBirthday}</td>
				<th>연락처</th>
				<td>${detailList.partnerPhone}</td>
			</tr>



		</table>


    
	
    	<a href="./partnermanage"><button type="button" class="btn btn-outline-dark proBtn">목록</button></a>
    	<a href="./removepartner?partnerNo=${param.partnerNo }"><button type="button" class="btn-open-popup btn btn-outline-dark proBtn">회원탈퇴</button></a>
		<a href="./partnerupdate?partnerNo=${param.partnerNo }"><button type="button" class="btn btn-outline-dark proBtn">회원수정</button></a>
		<a href="./partreserve?partnerNo=${param.partnerNo }"><button type="button" class="btn btn-primary">예약정보</button></a>
	
		<br>
</div>



	









</body>
</html>