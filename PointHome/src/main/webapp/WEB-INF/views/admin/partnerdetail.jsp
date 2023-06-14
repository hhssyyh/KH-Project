<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>






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
				<td colspan='4'>${detailList.partnerPrice}</td>
			</tr>
			<tr>
				<th>홍보문구</th>
				<td colspan='4'>${detailList.partnerPr}</td>
			</tr>



		</table>


    
	
    	<a href="./partnermanage"><button type="button" class="btn btn-outline-dark proBtn">목록</button></a>
    	<a href="./removepartner?partnerNo=${param.partnerNo }"><button type="button" class="btn-open-popup btn btn-outline-dark proBtn">회원탈퇴</button></a>
		<a href="./partnerupdate?partnerNo=${param.partnerNo }"><button type="button" class="btn btn-outline-dark proBtn">회원수정</button></a>
		<a href="./partreserve?partnerNo=${param.partnerNo }"><button type="button" class="btn btn-primary">예약정보</button></a>
		<a href="./review?partnerNo=${param.partnerNo }"><button type="button" class="btn btn-primary">리뷰조회</button></a>
		<a href="./partnervideo?partnerNo=${param.partnerNo }"><button type="button" class="btn btn-primary">영상관리</button></a>
	
		<br>
</div>



	









</body>
</html>