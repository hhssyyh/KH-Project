<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점집닷컴</title>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Font모음 css -->
<link href="/resources/common/css/font.css" rel="stylesheet">

<style type="text/css">
a {
	color: black;
	text-decoration: none;
}
nav {
	background-color: none;
}
.category{
	font-family : 'SBAggroM';
	font-size: 1.8em;
	color: balck;
	margin-top: 5px;
}
.nav_ment{
	font-family : 'Noto_Sans_KR700';
	font-size: 24px;
}
.offcanvas-body>ul>li{
	font-family : 'SBAggroM';
	font-size: 24px;
	margin-top : 5px;
	margin-bottom : 5px;
}
.offcanvas-body>ul>li>a{
	margin-left : 20px;
}
.alarmCount {
    position: absolute;
/*     top: -16px; */
    margin-left: 50px;
    right: -20px;
    z-index: 10;
    min-width: 0px;
    padding: 0 5px;
    box-sizing: border-box;
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.28);
    border: 1px solid rgba(0,0,0,.04);
    border-radius: 10px;
    background-color: #f04433;
    -ms-transform: translateX(50%);
    transform: translateX(50%);
    font-size: 1.1rem;
    line-height: 18px;
    font-weight: bold;
    text-align: center;
    color: #fff;
    transform: translate( -50%, -50% );
}
#alertCk{
/* 	position: relative; */
	width: 20px; 
	height: 20px;
	font-size: 25px;
}

* {
 	font-family : 'NotoSansKR-Regular';
}

</style>

<c:if test="${login }">
<script type="text/javascript">
$(function()  {
$("#alertCnt").on('click', "#alertCk", function() {
	console.log("click")
	console.log(${userno})
	
	$.ajax({
		type: 'get',
		url : '/mypage/deleteAlert',
		dataType : 'json',
		data: {
			userNo: ${userno}
		},
		   success : function(result) { // 결과 성공 콜백함수
			console.log(result)
		   },
		   error : function(request, status, error) { // 결과 에러 콜백함수
		        console.log(error)
		   }
	})
	
})
	
	
})


</script>
</c:if>
</head>
<body>

<nav class="navbar fixed-top">
<div class="container-fluid my-2">

<!-- 로고 영역 -->
<a class="col-1 ms-3" href="/">
    <div style="width:40px; heitght:40px; display: inline-block;">
	<svg xmlns="http://www.w3.org/2000/svg" version="1.1"xlink="http://www.w3.org/1999/xlink"xmlns:svgjs="http://svgjs.com/svgjs" width="100%" height="100%"viewBox="12.401999473571777 6.422000408172607 75.19662475585938 87.156005859375">
		<g fill="#fcbf19">
		<path d="M55.98 61.445a2.566 2.566 0 0 0 2.219-3.848L53.812 50l4.387-7.598a2.566 2.566 0 0 0-2.219-3.848h-8.773l-4.387-7.598a2.569 2.569 0 0 0-2.223-1.28c-.914 0-1.762.488-2.219 1.28l-4.386 7.598h-8.774c-.918 0-1.761.492-2.219 1.285-.46.793-.46 1.77 0 2.563L27.382 50l-4.386 7.597H23a2.548 2.548 0 0 0 0 2.563 2.561 2.561 0 0 0 2.218 1.285h8.774l4.386 7.598a2.562 2.562 0 0 0 2.22 1.28c.917 0 1.76-.487 2.222-1.28l4.387-7.598zm-12.473-3.848l-2.906 5.035-2.91-5.035a2.562 2.562 0 0 0-2.22-1.28H29.66l2.906-5.036a2.566 2.566 0 0 0 0-2.563l-2.906-5.035h5.817-.004c.914 0 1.761-.488 2.219-1.281l2.906-5.035 2.906 5.035h.004a2.558 2.558 0 0 0 2.219 1.281h5.816l-2.906 5.035h-.004a2.566 2.566 0 0 0 0 2.563l2.906 5.035h-5.812a2.56 2.56 0 0 0-2.22 1.281zm-19.995-28.96a2.564 2.564 0 0 0 2.563-2.563v-5.98h5.98a2.566 2.566 0 1 0 0-5.129h-8.547.004a2.561 2.561 0 0 0-2.562 2.563v8.547a2.561 2.561 0 0 0 2.562 2.562zm34.179-13.672h-8.547a2.564 2.564 0 0 0 0 5.129h5.98v5.98h.005a2.561 2.561 0 1 0 5.125 0v-8.547a2.564 2.564 0 0 0-2.563-2.562z"></path>
		<path d="M86.797 23.09a8.504 8.504 0 0 0-4.824-4.418l-13.29-4.836a8.524 8.524 0 0 0-8.429-7.414H20.945a8.547 8.547 0 0 0-8.543 8.543v70.07a8.547 8.547 0 0 0 8.543 8.543h39.31a8.55 8.55 0 0 0 8.542-8.543v-5.184l18.281-50.227a8.506 8.506 0 0 0-.281-6.535zM63.672 85.035a3.424 3.424 0 0 1-3.418 3.418H20.945a3.424 3.424 0 0 1-3.418-3.418v-70.07a3.424 3.424 0 0 1 3.418-3.418h39.309a3.424 3.424 0 0 1 3.418 3.418zm18.594-57.168L68.801 64.863l-.004-45.527 11.422 4.156a3.414 3.414 0 0 1 2.043 4.375z"></path>
		<path d="M57.691 71.363a2.559 2.559 0 0 0-2.563 2.563v5.98h-5.984a2.564 2.564 0 0 0 0 5.129h8.547a2.565 2.565 0 0 0 2.563-2.566v-8.547.004a2.561 2.561 0 0 0-2.563-2.563zm-25.636 8.543h-5.98v-5.98a2.561 2.561 0 0 0-2.563-2.563 2.559 2.559 0 0 0-2.563 2.563v8.546-.004a2.562 2.562 0 0 0 2.563 2.567h8.547-.004a2.566 2.566 0 1 0 0-5.129z"></path>
		</g>
	</svg>
	</div>

    <div style="width:100px; heitght:130px; display: inline-block;">
	<svg xmlns="http://www.w3.org/2000/svg" version="1.1" xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="100%" height="100%" viewBox="8.050000190734863 -73.94000244140625 317.6200256347656 92.21000671386719">
		<g fill="#2e2e2e">
		<path d="M50.36 -38.63L40.99 -32.66L29.25 -52.35L17.42 -32.66L8.05 -38.63L21.77 -61.25L11.27 -61.25L11.27 -72.04L47.15 -72.04L47.15 -61.25L36.64 -61.25ZM70.06 8.52C70.06 9.66 69.84 10.75 69.39 11.79C68.95 12.83 68.35 13.73 67.59 14.48C66.84 15.24 65.95 15.84 64.94 16.28C63.93 16.73 62.86 16.95 61.73 16.95L37.87 16.95C36.73 16.95 35.66 16.73 34.65 16.28C33.64 15.84 32.76 15.24 32 14.48C31.24 13.73 30.64 12.83 30.2 11.79C29.76 10.75 29.54 9.66 29.54 8.52L29.54 -19.31L58.89 -19.31L58.89 -47.81L45.16 -47.81L45.16 -58.7L58.89 -58.7L58.89 -73.94L70.06 -73.94L70.06 -19.31ZM58.89 6.15L58.89 -8.52L40.71 -8.52L40.71 6.15Z M135.57 -38.63L126.2 -32.66L114.46 -52.35L102.62 -32.66L93.25 -38.63L106.98 -61.25L96.47 -61.25L96.47 -72.04L132.35 -72.04L132.35 -61.25L121.84 -61.25ZM155.26 8.99C155.26 10.13 155.04 11.22 154.6 12.26C154.16 13.3 153.56 14.2 152.8 14.96C152.04 15.72 151.16 16.31 150.15 16.76C149.14 17.2 148.06 17.42 146.93 17.42L123.07 17.42C121.94 17.42 120.86 17.2 119.85 16.76C118.84 16.31 117.96 15.72 117.2 14.96C116.44 14.2 115.85 13.3 115.4 12.26C114.96 11.22 114.74 10.13 114.74 8.99L114.74 -19.31L125.91 -19.31L125.91 -10.98L144.09 -10.98L144.09 -13.63L144.09 -73.94L155.26 -73.94L155.26 -19.31ZM144.09 6.63L144.09 -0.19L125.91 -0.19L125.91 6.63Z M250.88 -47.81L238.95 -47.81L238.95 -13.54L227.68 -13.54L227.68 -73.94L238.95 -73.94L238.95 -58.7L250.88 -58.7ZM215.94 -33.99L188.2 -33.99C187.07 -33.99 186 -34.21 184.99 -34.65C183.98 -35.09 183.09 -35.69 182.34 -36.45C181.58 -37.21 180.98 -38.1 180.54 -39.15C180.09 -40.19 179.87 -41.28 179.87 -42.41L179.87 -72.04L215 -72.04L215 -61.25L191.14 -61.25L191.14 -44.78L215.94 -44.78ZM242.17 11.36L233.46 18.27L216.8 -1.8L200.04 18.27L191.33 11.36L216.8 -18.93Z M277.38 -46.48L267.92 -46.48L267.92 -57.28L286.38 -57.28L289.69 -61.25L266.97 -61.25L266.97 -72.04L300.01 -72.04L307.02 -65.13L276.91 -28.78L268.39 -35.6ZM325.67 8.52C325.67 9.66 325.45 10.75 325 11.79C324.56 12.83 323.96 13.73 323.2 14.48C322.45 15.24 321.56 15.84 320.55 16.28C319.54 16.73 318.47 16.95 317.34 16.95L293.57 16.95C292.44 16.95 291.36 16.73 290.35 16.28C289.34 15.84 288.46 15.24 287.7 14.48C286.95 13.73 286.35 12.83 285.9 11.79C285.46 10.75 285.24 9.66 285.24 8.52L285.24 -19.31L314.5 -19.31L314.5 -44.97L299.92 -44.97L299.92 -55.86L314.5 -55.86L314.5 -73.94L325.67 -73.94L325.67 -19.31ZM314.5 6.15L314.5 -8.52L296.41 -8.52L296.41 6.15Z"></path>
		</g>
	</svg>
	</div>
</a>
<!-- 로고 영역 끝 -->
  
<div class="col-4"></div>
  
<!-- 카테고리 영역 -->

<div>
	<a class="category mx-5" href="/partner/list">전체</a>
	<a class="category mx-5" href="/partner/list?partnerType=t">타로</a>
	<a class="category mx-5" href="/partner/list?partnerType=c">철학</a>
	<a class="category mx-5" href="/partner/list?partnerType=s">신점</a>

</div>
<!-- 카테고리 영역 -->

<!-- 알림 영역 -->    
<div class="col-1 text-end">	
	<c:if test="${not empty sessionScope.login }">
	<c:choose>
	<c:when test="${alertCnt eq 0}">
		<a href="/mypage/alertList" id="alertCk">
			<i class="bi bi-bell"></i>
		</a>	
	</c:when>
	<c:otherwise>
		<a href="/mypage/alertList" id="alertCk">
			<i class="bi bi-bell"></i>
			<span class="alarmCount">${alertCnt} </span>
		</a>
	</c:otherwise>
	</c:choose>
	</c:if>
</div>
<!-- 알림 영역 끝 -->    
    
<!-- 사이드바 햄버거 버튼 -->    
<div class="col-1 text-end">
	<i class="bi bi-list" style="font-size: 30px;" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"></i>
</div>
<!-- 사이드바 햄버거 버튼 끝 -->    
    
<!-- 마이페이지, 찜, 예약결제, Real 상담, 자유게시판, 리뷰 -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
	
	<div class="offcanvas-header bg-dark mb-2">
	
	<!-- 로그인하지 않았을때 -->
	<c:if test="${sessionScope.login eq false || sessionScope.login == null }">
	
	<a class="text-white" href="/user/login">
		<i class="bi bi-person-circle fs-1"></i>
	</a>
	
	<a href="/user/login">
		<span class="nav_ment nav_link justify-content-start text-white">
			로그인이 필요합니다.
		</span>
	</a>
	
	</c:if>
	<!-- 로그인하지 않았을때 끝 -->
	
	<!-- 로그인했을때 -->
	<c:if test="${sessionScope.login eq true}">
	<a class="nav_link text-white" href="/mypage/view">
		<i class="bi bi-person-circle fs-1"></i>
	</a>
	<a href="/mypage/view">
		<span class="nav_ment nav_link ustify-content-start fs-5 text-white">
			${ usernick } 님 환영합니다
		</span>
	</a>
	</c:if>
	<!-- 로그인했을때 끝 -->
	
	<!-- 닫기 버튼 -->
	<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	<!-- 닫기 버튼 끝 -->
	
	</div>

<div class="offcanvas-body">
	<ul class="navbar-nav flex-grow-1 pe-3 mx-3">
	  
		<li class="nav-item">
			<i class="bi bi-house-door-fill"></i>
			<a class="nav-link d-inline" aria-current="page" href="#">홈</a>
		</li>
	  
		<li class="nav-item">
			<i class="bi bi-play-btn-fill" style="color:red;"></i>
			<a class="nav-link d-inline" href="#">리얼상담 영상</a>
		</li>
	
		<!-- 로그인시에만 출력 -->
		<c:if test="${login}">
		<li class="nav-item">
			<i class="bi bi-bag-check-fill"></i>
			<a class="nav-link d-inline" href="#">나의 찜</a>
		</li>
	
		<li class="nav-item">
			<i class="bi bi-calendar3"></i>
			<a class="nav-link d-inline" href="#">나의 예약내역</a>
		</li>
		</c:if>
		<!-- 로그인시에만 출력 -->
	  
		<li class="nav-item"><hr></li>
	</ul>
		  
	<ul class="navbar-nav flex-grow-1 pe-3 mx-3">
		
		<li class="nav-item">
			<i class="bi bi-chat-left-dots-fill" style="color:dark;"></i>
			<a class="nav-link d-inline" href="#">리뷰 모음</a>
		</li>
	
		<li class="nav-item">
			<i class="bi bi-journal-text"></i>
			<a class="nav-link d-inline" href="/freeboard/list">자유게시판</a>
		</li>
	
		<li class="nav-item">
			<i class="bi bi-info-circle-fill"></i>
			<a class="nav-link d-inline" href="#">공지사항</a>
		</li>
	
		<li class="nav-item">
			<i class="bi bi-telephone-fill"></i>
			<a class="nav-link d-inline" href="#">고객센터</a>
		</li>
		
		<li class="nav-item">
			<i class="bi bi-pen"></i>
			<a class="nav-link d-inline" href="#">제휴신청</a>
		</li>
	  
		<li class="nav-item"><hr></li>
	</ul>
</div>
	
<div class="nav_footer mb-3">
	<c:if test="${sessionScope.login eq true}">
		<hr>
		<div class="nav_ment d-grid gap-2 col-10 mx-auto">
			<a class="btn btn-dark fs-4" href="/user/logout">로그아웃</a>
		</div>
	</c:if>
</div>

</div>
</div>

</nav>

</body>
</html>