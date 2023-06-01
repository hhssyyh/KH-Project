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
<style type="text/css">
a {
	color: black;
	text-decoration: none;
}
</style>

</head>
<body>

<nav class="navbar bg-light fixed-top" style="background-color: #ccc;">
  <div class="container-fluid">
  
    <a class="ms-3" href="/" style="font-size: 23px;">PointHouse</a>
    
    <div style="text-align: justify;">
	    <a href="#">링크</a>
	    <a href="#">뭘</a>
	    <a href="#">넣을까</a>
	    <a href="#">링크링크</a>
    </div>
    
    <div>
		<form class="d-flex" role="search" style="width: 400px; margin: 0 auto;">
			<input class="form-control me-2" type="search" placeholder="검색">
			<a href="#" style="color: black;">
			<i class="bi bi-search" style="font-size: 25px; margin-left: 10px;"></i>
			</a>
		</form>
    </div>
    
    
    <!-- span이 원래 버튼, i로 바꿈 -->
<!--     <span class="bi bi-list text-dark" style="font-size: 20px;" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"></span> -->
    <i class="bi bi-list text-dark me-3" style="font-size: 30px;" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"></i>
    
    
    <!-- 마이페이지, 찜, 예약결제, Real 상담, 자유게시판, 리뷰 -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">

		<c:if test="${sessionScope.login eq false || sessionScope.login == null }">
		<a href="/user/login">
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
		  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
		  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
		</svg>
		</a>
		<a href="/user/login">
		<span class="justify-content-start">
			로그인이 필요합니다.
		</span>
		</a>
		</c:if>

		<c:if test="${sessionScope.login eq true}">
		<a href="/mypage/view">
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
		  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
		  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
		</svg>
		</a>
		<a href="/mypage/view">
		<span>
			${ sessionScope.usernick } 님 환영합니다
		</span>
		</a>
		<a href="/user/logout">
		<span>
			로그아웃
		</span>
		</a>
		</c:if>

        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
        
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Home</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link active" href="#">Link</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link active" href="#">Link</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link active" href="#">Link</a>
          </li>
          
          <!-- dropdown 부분 -->
<!--           <li class="nav-item dropdown"> -->
<!--             <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> -->
<!--               Dropdown -->
<!--             </a> -->
<!--             <ul class="dropdown-menu"> -->
<!--               <li><a class="dropdown-item" href="#">Action</a></li> -->
<!--               <li><a class="dropdown-item" href="#">Another action</a></li> -->
<!--               <li> -->
<!--                 <hr class="dropdown-divider"> -->
<!--               </li> -->
<!--               <li><a class="dropdown-item" href="#">Something else here</a></li> -->
<!--             </ul> -->
<!--           </li> -->
        </ul>
        
        <!-- 검색 -->
<!--         <form class="d-flex mt-3" role="search"> -->
<!--           <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"> -->
<!--           <button class="btn btn-outline-success" type="submit">Search</button> -->
<!--         </form> -->
      </div>
    </div>
  </div>
</nav>



