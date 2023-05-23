<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Home</title>
	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</head>

<style type="text/css">
#header {



}

#sidebar ul {
	padding:0;
	list-style-type: none;
	background-color: #ccc;
	width: 15%;
	margin-top:60px;
	margin-right:0;
	margin-left: 0;
	
	position: fixed;
	height: 100%;
	overflow: auto;	
}

#sidebar li a {
	text-decoration: none;
	display: block;
	color: #000;
	padding: 8px 15px 8px 15px;
	font-weight: bold;
}



#sidebar li a:hover {
	background-color: #333;
	color: #fff;
}
	

</style>

<body>
<!-- header -->
<div id="header"> 
	<nav class="navbar bg-light fixed-top">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="/">
	      <!-- <img src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="Logo" width="30" height="24" class="d-inline-block align-text-top"> -->
	      PointHouse
	    </a>
	    <c:choose>
			<c:when test="${login}">
			    <a href="/mypage/userinfo">
			    	<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
					  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
			    </a>
			    <a href="/user/logout">
			    	<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
					  <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
					</svg>
			    </a>
			</c:when>    
			<c:otherwise>
			    <a href="/user/login">login</a>
			</c:otherwise>
	    </c:choose>
	    
	    <a href="/freeboard/list">자유게시판</a>
	  </div>
	</nav>
	
	
	<!-- tab -->	
	<div class="bg-light fixed-top" style="margin-top: 60px; margin-left: 15%;">
		<ul class="nav justify-content-center">
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="#">Active</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">사주</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">타로</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">타로버블티</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#"></a>
		  </li>
		</ul>
	</div>
	<!-- tab end -->
</div>
<!-- sidebar -->
<div id="sidebar">
	<ul class="bg-light">
		<li><a href="#">메뉴1</a></li>
		<li><a href="#">메뉴2</a></li>
		<li><a href="#">메뉴3</a></li>
		<li><a href="#">메뉴3</a></li>
	</ul>
</div>
<!-- sidebar end -->




<div style="padding-bottom: 105px; padding-top:105px; margin-left:16%;">

<!-- carosel -->	
	<div>
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-inner">
		    
		    <div class="carousel-item active" >
		      <img src="../resources/carosel.jpeg" class="d-block w-70" height="400px" style="margin:0 auto;" alt="...">
		    </div>
		    
		    <div class="carousel-item">
		      <img src="../resources/dog.jpeg" class="d-block" style="margin:0 auto;" height="400px" alt="개">
		    </div> 
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
	</div>
<!-- carosel end -->

<div style="margin:10px;"></div>

	<div style="display:flex;">

		<div><p style="font-size:30px;">인기상담사</p></div>
		<div><a href="./main" style="font-size:20px; margin-left: 10px" >TOP10</a></div>
		
	</div>

<div class="justify-content-center" style="display:flex;">
		<!-- img -->
		<div class="card" style="width: 300px;">
		  <img src="../resources/dog.jpeg" class="card-img-top" height="200px" alt="ex">
		<!-- img end  -->
		  <div class="card-body">
		    <h5 class="card-title">제휴사 이름</h5>
		    <p class="card-text">가격</p>
		    <p class="card-text">별점</p>
		    <p class="card-text">후기(?)</p>
		    <a href="#" class="btn btn-primary">상세페이지</a>
		  </div>
		</div>
		
		<div style="margin-right:10px"></div>
		
		<!-- img -->
		<div class="card" style="width: 300px;">
		  <img src="" class="card-img-top" alt="ex">
		<!-- img end  -->
		  <div class="card-body">
		    <h5 class="card-title">title</h5>
		    <p class="card-text">text</p>
		    <a href="#" class="btn btn-primary">상세페이지</a>
		  </div>
		</div>
		
		<div style="margin-right:10px"></div>
		
		<!-- img -->
		<div class="card" style="width: 300px;">
		  <img src="" class="card-img-top" alt="ex">
		<!-- img end  -->
		  <div class="card-body">
		    <h5 class="card-title">title</h5>
		    <p class="card-text">text</p>
		    <a href="#" class="btn btn-primary">상세페이지</a>
		  </div>
		</div>

		<!-- img -->
		<div class="card" style="width: 300px;">
		  <img src="" class="card-img-top" alt="ex">
		<!-- img end  -->
		  <div class="card-body">
		    <h5 class="card-title">title</h5>
		    <p class="card-text">text</p>
		    <a href="#" class="btn btn-primary">상세페이지</a>
		  </div>
		</div>		
	</div>

<div style="margin:20px;"></div>

	<div style="display:flex;">

		<div><p style="font-size:30px;">신규상담사</p></div>
		<div><a href="./main" style="font-size:20px; margin-left: 10px" >NEW</a></div>
		
	</div>
	

<div class="justify-content-center" style="display:flex;">
	<!-- img -->
	<div class="card" style="width: 300px;">
	  <img src="../resources/dog.jpeg" class="card-img-top" height="200px" alt="ex">
	<!-- img end  -->
	  <div class="card-body">
	    <h5 class="card-title">제휴사 이름</h5>
	    <p class="card-text">가격</p>
	    <p class="card-text">별점</p>
	    <p class="card-text">가격</p>
	    <p class="card-text">가격</p>
	    <a href="#" class="btn btn-primary">상세페이지</a>
	  </div>
	</div>
	
	<div style="margin-right: 10px"></div>
	
	<!-- img -->
	<div class="card" style="width: 300px;">
	  <img src="" class="card-img-top" alt="ex">
	<!-- img end  -->
	  <div class="card-body">
	    <h5 class="card-title">title</h5>
	    <p class="card-text">text</p>
	    <a href="#" class="btn btn-primary">상세페이지</a>
	  </div>
	</div>
</div>
<!-- margin-left: 20% -->
</div>
</body>
</html>
