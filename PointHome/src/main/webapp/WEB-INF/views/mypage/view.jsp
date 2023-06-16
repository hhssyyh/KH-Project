<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">

body {
	padding: 0;
	margin: 0;
	font-family: 'SBAggroL';
	
}

a {
	color: black;
	text-decoration: none;
}

#mypageCon {
 	margin-top: 30px; 
}

.conRow {
	text-align: center;
}

.conRowDiv {
	display: inline-block;
	width: 500px;
	height: 500px;
	padding: 20px;
	margin-bottom: 55px;
	text-align: left;
	
	border: 2px solid #ccc;
 	background-color: white; 
}

.conTitle {
	display: inline-block; 
	font-size: 20px;
}

.stripe {
	width: 1px;
	height: 300px;
}

#btnCon {
	width: 1080px;
	height: 500px;
	margin: 0 auto;
	
 	background-color: white;
}

/* .myBtn { */
/* 	width: 10%; */
/* 	margin-right: 10px; */
/* 	background-color: #E8F5FF; */
/* 	border: 5px solid #A696CD; */
/* 	border-style: dotted; */
/* 	border-radius: 10px; */
/* } */

hr{
	color: #7e00c2;
}

#reserveDiv {
	margin-right: 70px;
	background: rgba(136, 140, 235, 0.19);
	border-radius: 10px;
	box-shadow: 5px 5px gray;
}

#noticeDiv {

	background: rgba(136, 140, 235, 0.19);
	border-radius: 10px;
	box-shadow: 5px 5px gray;
	font-size: 16px;
}

.line{
	border:3px solid red;
}

td.l{
	border-bottom: 1px solid #b4b4b4;
}

.resBtn:hover{
	color: white;
	background-color: white;
	border-color: white;
}

</style>



<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />


<!-- <div class="text-center mb-4"> -->
<!-- 	<button class="btn btn-outline-secondary myBtn">상담내역</button> -->
<!-- 	<a href="./myreserve"><button class="btn btn-outline-secondary myBtn">결제내역</button></a> -->
<!-- 	<a href="./qna"><button class="btn btn-outline-secondary myBtn">나의 문의</button></a> -->
<!-- 	<a href="./serviceCenter"><button class="btn btn-outline-secondary myBtn">고객센터</button></a> -->
<!-- </div> -->

<!-- <hr style="width: 60%; margin: 0 auto; margin-bottom: 80px;"> -->

<div id="mypageCon" class="container">

	<div class="conRow">
		<div id="reserveDiv" class="conRowDiv">
		

			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm" var="today" />
			<div class="conTitle" id="conTitle">예약내역</div>
			<button class="btn btn-outline-secondary resBtn" style="float: right; font-size: 13px;"><a href="./myreserve">전체 예약 조회</a></button>

			<hr>
				<c:forEach var="list" items="${reservelist}" begin="0" end="7">
				<fmt:parseDate value="${RESERVE_TIME}" var="resDate" pattern="yyyy-MM-dd HH:mm"/>
				<c:if test="${list.RESERVE_TIME > today}">
				<table>
					<tr class="line">
					<td scope="col">#</td>
					<td scope="col" class="l">${list.RESERVE_TIME }</td>
					<td scope="col" class="l" style="text-align: center;">${list.PARTNER_SHOPNAME }</td>
					</tr>
				</table>
				</c:if>
				</c:forEach>
		</div>
		<span class="stripe"></span>
		
		<div id="noticeDiv" class="conRowDiv" >
			<div class="conTitle">공지사항</div>
			<button class="btn btn-outline-secondary resBtn" style="float: right; font-size: 13px;"><a href="./myPickNoticeList">공지 조회</a></button>
			<button class="btn btn-outline-secondary resBtn" style="float: right; font-size: 13px; margin-right: 10px;"><a href="/mypage/mypickList">찜 내역</a></button>
			<hr>
				<c:forEach var="list" items="${pNotice}" begin="0" end="7">

				<table style="font-size: 16px;">
					<tr class="line">
					<td scope="col">#</td>				
					<td scope="col" class="l" style="text-align: center;">${list. PARTNER_SHOPNAME }에서 공지가 올라왔습니다
					<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
					<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
					<fmt:parseNumber value="${list.PARTNER_NOTICE_DATE.time / (1000*60*60*24)}" integerOnly="true" var="noticeDate" /><!-- 게시글 작성날짜를 숫자로 -->
					<c:if test="${today - noticeDate le 2}">
					<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt=""></td>
					</c:if>
					</tr>
				</table>
				</c:forEach>
			
		</div>
	</div>
	

</div>

</div>


</body>
</html>


<c:import url="/WEB-INF/views/layout/footer.jsp"/>


