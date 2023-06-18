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
	margin-bottom: 50px;
	background: rgba(179, 156, 222, 0.06);
	justify-content: center;
/* 	border-radius: 50px; */
/* 	border:3px solid #A696CD; */
 	border-bottom: 7px solid #A696CD; 
 	border-top: 7px solid #A696CD; 

}

#profile {
	display: flex;
	align-items: center;
	float: left;
	padding-top: 50px;
 	padding-left: 8%; 
}

#profileImg {
	width: 180px;
}

#nickDiv {
	text-align: center;
	padding-left: 30px;
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
 	width: 45%; 
/*  	padding: 20px;  */
  	padding-right: 5%; 

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
	background-color: #A696CD;
	border-color: #A696CD;
	 vertical-align:middle;
}

#myImg {
	width: 180px; 
	height: 180px;
	border-radius:30%;
}



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
				<div style="font-size: 30px;">${userNick }</div>
				${profile }
	<%-- 			<img src="/upload/${profile.userImg}"  alt=""> --%>
				<a href="./userinfo"><button class="btn btn-outline-dark nickBtn">회원정보수정</button></a><br>
				
			</div>
		</div>
		
		<div class="btnRowBox">
			<div class="btnRow">
				<a href="/mypage/myboardList"><button class="btn btn-outline-dark proBtn" style="margin: 8px; ">내가 쓴 글</button></a>
				<a href="/mypage/myreview"><button class="btn btn-outline-dark proBtn" style="margin: 8px;">리뷰 조회</button></a>   
			</div>
			<div class="btnRow2">
				<a href="/mypage/myCommentlist"><button class="btn btn-outline-dark proBtn" style="margin: 8px;">내가 쓴 댓글</button></a>
				<a href="/chat/room"><button class="btn btn-outline-dark proBtn" style="margin: 8px;">1:1 문의</button></a>
			</div>
		</div>
	
	</div>
</div>
















