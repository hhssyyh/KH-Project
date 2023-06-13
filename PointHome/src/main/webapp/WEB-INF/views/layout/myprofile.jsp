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
	display: flex;
	height: 300px;
	width: 60%;
	text-align: center;
	margin:0 auto; 
	margin-top: 130px;
	margin-bottom: 100px;
 	background-color: #E8F5FF;
	justify-content: center;
	border-radius: 50px;
/* 	border:3px solid #A696CD; */
	border: 10px solid #A696CD;
	border-style: dotted;
	
}

#profile {
	display: flex;
	align-items: center;
	float: left;
	padding-top: 70px;
	padding-left: 15%;
}

#profileImg {
	width: 150px;
}

#nickDiv {
	text-align: center;
	padding-left: 40px;
	color: #3C3C8C;
}

.nickBtn {
	width: 130px;
	font-size: 13px;
	margin-top: 3px;
	border-color: #834683;
}

 .btnRowBox { 
 
 	display: flex;
	align-items: center;
	float: right;
 	height: 300px; 
 	width: 50%; 
 	padding: 50px; 
/*  	padding-right: 25%; */

} 
 .btnRow { 	
	width: 20%;
	padding-right: 180px;
	
 } 

 .btnRow2 { 

 	width: 20%;
 } 

 .proBtn {
	width: 150px;
	font-size: 15px;
	color: white;
	margin: 10px;
	background-color: #8C8CBE;
	border-color: #8C8CBE;
}

#myImg {width: 150px; height: 150px;}

table {
  border-spacing: 10px;
  border-collapse: separate;
}

</style>


<!-- <div style="margin: 10px; margin-left: 40px; margin-top: 80px;"> -->
<!-- 	<a href="./view" style="font-size: 30px;">MYMENU</a> -->
<!-- </div> -->

<div id="myBanner">
	<div id="box" style="width: 1500px; margin: 0 auto;">
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
		
		<div class="btnRowBox">
			<div class="btnRow">
				<a href="/mypage/myboardList"><button class="btn btn-outline-dark proBtn" style="margin: 8px; ">내가 쓴 글</button></a>
				<a href="/mypage/alertList"><button class="btn btn-outline-dark proBtn" style="margin: 8px;">알림 내역</button></a>
			</div>
			<div class="btnRow2">
				<a href="/mypage/mypickList"><button class="btn btn-outline-dark proBtn" style="margin: 8px;">찜 내역</button></a>
				<a href="/mypage/myreview"><button class="btn btn-outline-dark proBtn" style="margin: 8px;">리뷰 조회</button></a>   
			</div>
		</div>
	
	</div>
</div>















