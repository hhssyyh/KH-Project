<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
body {
	padding: 0;
	margin: 0;
}

#userInfo {
	width: 1000px;
	background-color: white;
}

#reservedetail {
	height: 340px; 
	width: 800px;
	background-color: white;
}

#line {
	border-top: 3px solid;
}

.nickBtn2 {
	width: 150px;
	font-size: 18px;
	margin-top: 24px;
	margin-right: 145px;
}

#profileImg2{
	width: 60px;
	margin-left:20px;
	
}

.testImg{
  position : relative;
  }

.alert{
 position: absolute;
 z-index: 5;
 font-size: 10px;
 color: white;
 background-color: red;
 border-radius: 50%;
 height:5px;
 width: 5px;
}

</style>



<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />

<div id="userInfo" class="container" style="padding: 30px; border-radius: 30px; border: 1px solid;">
	 <div class="testImg">
<!-- 	 <button class="alert">4</button><i class="bi bi-bell"></i>  -->
	 <h4><img class="bell" src="../resources/bell.svg" style="width: 25px; height: 25px;"> 알림 내역</h4>
<!-- 	 <h4><img src="../resources/bell.svg"><button class="alert">4</button></h4> -->
	</div>
	<hr id="line">
	
	
	
	<c:forEach var="list" items="${alarmList}">			
			<a href="/freeboard/view?freeboardNo=${list.FREEBOARD_NO}"><h5 style="margin: 20px; margin-left: 103px; margin-bottom: 60px;">
			"게시글 [  ${list.FREEBOARD_TITLE }  ] 에 댓글 [ ${list.COMM_CONTENT} ] 이 달렸습니다."</h5></a>
			<h6 style="margin: 20px; margin-left: 103px; margin-top: -52px;"><fmt:formatDate value="${list.ALERT_DATE }" pattern="yy/MM/dd hh:mm" /></h6>
			<hr>
	</c:forEach>
	
	
	<c:forEach var="list" items="${recommList}">
	
	
			<a href="/freeboard/view?freeboardNo=${list.FREEBOARD_NO}"><h5 style="margin: 20px; margin-left: 103px; margin-bottom: 60px;">
			"게시글 [  ${list.FREEBOARD_TITLE }  ] 가 추천되었습니다."</h5></a>
			<h6 style="margin: 20px; margin-left: 103px; margin-top: -52px;"><fmt:formatDate value="${list.ALERT_DATE }" pattern="yy/MM/dd hh:mm" /></h6>
			<hr>	
	</c:forEach>	
	
	
<%-- 	<c:forEach var="list" items="${recommList}"> --%>
<%-- 			<a href="/freeboard/view?freeboardNo=${list.FREEBOARD_NO}"><h5 style="margin: 20px; margin-left: 103px; margin-bottom: 60px;"> --%>
<%-- 			"게시글 [  ${list.FREEBOARD_TITLE }  ] 가 추천되었습니다."</h5></a> --%>
<%-- 			<h6 style="margin: 20px; margin-left: 103px; margin-top: -52px;"><fmt:formatDate value="${list.ALERT_DATE }" pattern="yy/MM/dd hh:mm" /></h6> --%>
<!-- 			<hr> -->
<%-- 	</c:forEach>	 --%>
	

	
	


	
	
</div>
	

</div>


</body>
</html>















