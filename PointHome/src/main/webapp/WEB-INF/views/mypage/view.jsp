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
	margin-top: 100px;
}

.conRow {
	text-align: center;
}

.conRowDiv {
	display: inline-block;
	width: 500px;
	height: 500px;
	padding: 20px;
	margin-bottom: 80px;
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
	margin-right: 50px;
}

#noticeDiv {
	
}

#btnCon {
	width: 1060px;
	height: 500px;
	margin: 0 auto;
	
	border: 1px solid #ccc;
 	background-color: white;
}


</style>



<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />


<div id="mypageCon" class="container">

	<div class="conRow">
		<div id="reserveDiv" class="conRowDiv">
			<div class="conTitle">예약관리</div>
			<button class="btn btn-outline-secondary" style="float: right; font-size: 13px;">전체 예약 조회</button>
			<hr>
		</div>
		
		<span class="stripe"></span>
		
		<div id="noticeDiv" class="conRowDiv">
			<div class="conTitle">공지사항</div>
			<hr>
		</div>
	</div>
	
	<div id="btnCon">
		
	</div>

</div>

</div>


</body>
</html>





