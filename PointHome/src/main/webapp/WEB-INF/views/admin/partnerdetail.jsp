<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<style type="text/css">* {cursor: url(https://cur.cursors-4u.net/cursors/cur-7/cur610.cur), auto !important;}</style><a href="https://www.cursors-4u.com/cursor/2010/12/17/oxygen-black-11.html" target="_blank" title="Oxygen Black"><img src="https://cur.cursors-4u.net/cursor.png" border="0" alt="Oxygen Black" style="position:absolute; top: 0px; right: 0px;" /></a>

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




<div style="margin-left: 16%;">



	<div style="padding-top: 100px;">
		<h1 style="font-weight: bold; margin-left: 500px;">회원 정보</h1>
			<br>
		<br>
		<br>
		<table class="table table-hover border-dark">
		
			<tr>
			<th>제휴사 번호</th>
			<td>${detailList.partnerNo}</td>
			<th>상담영상</th>
			<td><a href="./partnervideo?partnerNo=${param.partnerNo }"><button type="button" class="btn btn-outline-dark btn-sm">영상관리</button></a></td>
			<th>회원 관리</th>
			<td>
			<a href="./removepartner?partnerNo=${param.partnerNo }"><button type="button" class="btn-open-popup btn btn-dark btn-sm">회원탈퇴</button></a>
		<a href="./partnerupdate?partnerNo=${param.partnerNo }"><button type="button" class="btn btn-dark btn-sm">회원수정</button></a>
			</td>
			
		
			
			
			
			</tr>
			
			<tr>
				<th>유저이름</th>
				<td>${detailList.partnerName}</td>
				<th>닉네임</th>
				<td>${detailList.partnerNick}</td>
				<th>상호명</th>
				<td>${detailList.partnerShopname}</td>
			</tr>

			<tr>
				<th>이메일</th>
				<td>${detailList.partnerEmail}</td>
				<th>성별</th>
				<td>${detailList.partnerGender}</td>
				<th>분야</th>
				<td>
				<c:choose>
                    <c:when test="${fn:contains(partnerType,t)}">
                        타로
                    </c:when>
                    <c:when test="${fn:contains(partnerType,s)}">
                        신점
                    </c:when>
                    <c:when test="${fn:contains(partnerType,c)}">
                        사주
                    </c:when>
                    <c:otherwise>
                        기타
                    </c:otherwise>
                </c:choose>
				
				</td>
			</tr>

			<tr>
				<th>생일</th>
				<td>${detailList.partnerBirthyear}/${detailList.partnerBirthmonth}
					/ ${detailList.partnerBirthday}</td>
				<th>연락처</th>
				<td>${detailList.partnerPhone}</td>
				<th>은행/계좌</th>
				<td>${detailList.partnerBank},${detailList.partnerAccount}</td>
			</tr>
			
			<tr>
				<th>가입일</th>
				<td><fmt:formatDate value="${detailList.partnerJoindate}" pattern="yyyy년 MM월 dd일"/></td>
				<th>우편번호</th>
				<td>${detailList.partnerPostcode}</td>
				<th>주소</th>
				<td>${detailList.partnerAddress},${detailList.partnerDetailaddress},${detailList.partnerExtraaddress}</td>
				
			</tr>
			<tr>
				<th>책정금액</th>
				<td colspan='5'>${detailList.partnerPrice}</td>
				
			</tr>
			<tr>
				<th>홍보문구</th>
				<td colspan='5'>${detailList.partnerPr}</td>
			</tr>
			<tr>
				<th>예약/결제/리뷰</th>
				
				<td>
		<a href="./partreserve?partnerNo=${param.partnerNo }"><button type="button" class="btn btn-outline-dark btn-sm">예약정보</button></a>
		<a href="./payment?partnerNo=${param.partnerNo }"><button type="button" class="btn btn-outline-dark btn-sm">결제내역</button></a>
		<a href="./review?partnerNo=${param.partnerNo }"><button type="button" class="btn btn-outline-dark btn-sm">리뷰조회</button></a>				
				</td>
			<th></th>
			<td></td>
			<th></th>
			<td></td>
			
			</tr>
			



		</table>


	
		<br>
		<a href="./partnermanage"><button type="button" class="btn btn-dark proBtn" style="  margin-left:1200px;">목록</button></a>
</div>



	









</body>
</html>