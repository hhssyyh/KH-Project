<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
	border: 1px solid #ccc;
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

#reserveDiv {
	margin-right: 70px;
}

#noticeDiv {
	
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
}
</style>



<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />

<div class="text-center mb-4">
	<button class="btn btn-outline-secondary myBtn">상담내역</button>
	<button class="btn btn-outline-secondary myBtn">상품 구매내역</button>
	<button class="btn btn-outline-secondary myBtn">결제내역</button>
	<button class="btn btn-outline-secondary myBtn">나의 문의</button>
	<a href="./serviceCenter"><button class="btn btn-outline-secondary myBtn">고객센터</button></a>
</div>

<hr style="width: 60%; margin: 0 auto; margin-bottom: 80px;">

<div id="mypageCon" class="container">

	<div class="conRow">
		<div id="reserveDiv" class="conRowDiv">
			<div class="conTitle">예약관리</div>
			<button class="btn btn-outline-secondary" style="float: right; font-size: 13px;">전체 예약 조회</button>
			<hr>
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


