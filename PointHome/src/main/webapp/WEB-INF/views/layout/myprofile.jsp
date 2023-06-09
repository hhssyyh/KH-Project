<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style type="text/css">
a {
	color: black;
	text-decoration: none;
}

#mypage {
 	margin-bottom: 100px; 
}

#myBanner {
	height: 300px;
	width: 100%;
	background-color: #E8F5FF	
}

#profile {
	display: flex;
	align-items: center;
	float: left;
	padding-top: 70px;
	padding-left: 25%;
}

#profileImg {
	width: 150px;
}

#nickDiv {
	text-align: center;
	padding-left: 40px;
}

.nickBtn {
	width: 130px;
	font-size: 13px;
	margin-top: 3px;
}

.btnRow {
	
	margin-top: 10px;
}

 .proBtn {
	width: 150px;
	font-size: 15px;
	margin: 10px;
}

#myImg {width: 150px; height: 150px;}



</style>


<div style="margin: 10px; margin-left: 40px; margin-top: 80px;">
	<a href="./view" style="font-size: 30px;">MYMENU</a>
</div>

<div id="myBanner">
	<div id="profile">
		<span>
			<c:choose>
			<c:when test="${userFile.userImg eq null }">
			<div id="image_container"><img id="myImg" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></div>
			</c:when>
			<c:otherwise>
				<a href="./view"><img id="myImg" src="/upload/${userFile.userImg }"  alt=""></a>
			</c:otherwise>
			</c:choose>
		</span>
		
		
		<div id="nickDiv">
			<div style="font-size: 30px;">${res.userNick }</div>
			${profile }
<%-- 			<img src="/upload/${profile.userImg}"  alt=""> --%>
			<a href="./userinfo"><button class="btn btn-outline-dark nickBtn">회원정보수정</button></a>
		</div>
	</div>

</div>
<div class="btnRow">
	<a href="/mypage/myboardList"><button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 1000px; margin-top: -400px;">내가 쓴 글</button></a>
	<a href="/mypage/alertList"><button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 1200px; margin-top: -447px;">알림 내역</button></a>
	<a href="/mypage/mypickList"><button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 1000px; margin-top: -400px;">찜 내역</button></a>
	<a href="/mypage/myreview"><button class="btn btn-outline-dark proBtn" style="margin: 8px; margin-left: 1200px; margin-top: -447px;">리뷰 조회</button></a>   
</div>














