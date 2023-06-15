<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">

body {
	padding: 0;
	margin: 0;
	
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
	border-style: dotted;
 	background-color: white; 
}

.conTitle {
	display: inline-block;
	font-size: 20px;
	margin-left: 8px;
}

.stripe {
	width: 1px;
	height: 300px;
}

#btnCon {
	width: 1080px;
	height: 500px;
	margin: 0 auto;
	
	border: 1px solid #ccc;
 	background-color: white;
}

.myBtn {
	width: 10%;
	margin-right: 10px;
	background-color: #E8F5FF;
		border: 5px solid #A696CD;
	border-style: dotted;
	border-radius: 10px;
}

* {
 	font-family: 'Noto_Sans_KR500';
}

hr{
	color: #7e00c2;
}

#reserveDiv {
	margin-right: 70px;
	border: 10px solid #A696CD;
	border-style: dotted;
	border-radius: 10px;
}

#noticeDiv {
	border: 10px solid #A696CD;
	border-style: dotted;
	border-radius: 10px;
}

.line{
	border:3px solid red;
}

</style>



<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />

<div class="text-center mb-4">
	<button class="btn btn-outline-secondary myBtn">상담내역</button>
	<a href="./myreserve"><button class="btn btn-outline-secondary myBtn">결제내역</button></a>
	<a href="./qna"><button class="btn btn-outline-secondary myBtn">나의 문의</button></a>
	<a href="/user/serviceCenter"><button class="btn btn-outline-secondary myBtn">고객센터</button></a>
</div>

<hr style="width: 60%; margin: 0 auto; margin-bottom: 80px;">

<div id="mypageCon" class="container">

	<div class="conRow">
		<div id="reserveDiv" class="conRowDiv">
		
			<div class="conTitle" id="conTitle">예약관리</div>
			<a href="./myreserve" class="btn btn-outline-secondary" style="float: right; font-size: 13px;">전체 예약 조회</a>
			<hr>
				<c:forEach var="list" items="${reservelist}" begin="0" end="7">
				<fmt:parseDate value="${RESERVE_TIME}" var="resDate" pattern="yyyy-MM-dd HH:mm"/>
				<table>
					<tr class="line">
					<td scope="col">${list.RNUM }</td>
					<td scope="col">${list.RESERVE_TIME }</td>
					<td scope="col">${list.PARTNER_SHOPNAME }</td>
					</tr>
				</table>
				</c:forEach>
		</div>
		<span class="stripe"></span>
		
		<div id="noticeDiv" class="conRowDiv">
			<div class="conTitle"><a href="/">공지사항</a></div>
			<hr>
		</div>
	</div>
	
<!-- 	<div id="btnCon"> -->
<!-- 		<div> -->
<!-- 			<button>상담내역</button> -->
<!-- 			<button>상품 구매내역</button> -->
<!-- 			<button>결제내역</button> -->
<!-- 		</div> -->
		
<!-- 		<div> -->
<!-- 			<button>나의 문의</button> -->
<!-- 			<button>고객센터</button> -->
<!-- 		</div> -->
<!-- 	</div> -->

</div>

</div>


</body>
</html>


<c:import url="/WEB-INF/views/layout/footer.jsp"/>


