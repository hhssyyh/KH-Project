<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	width: 20%;
	margin-right:0;
	margin-left: 0;
	margin-top:15px;
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
	    <a class="navbar-brand" href="#">
	      <!-- <img src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="Logo" width="30" height="24" class="d-inline-block align-text-top"> -->
	      PointHouse
	    </a>
	    <a href="/user/login">login</a>
	  </div>
	</nav>
	
	<div class="bg-light">
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a class="nav-link active" aria-current="page" href="#">Active</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">Link</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">Link</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link disabled">Disabled</a>
	  </li>
	</ul>
	</div>
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




<div style="padding-bottom: 105px; padding-top:105px; margin-left:21%;">

<!-- carosel -->	
	<div>
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-inner">
		    
		    <div class="carousel-item active" >
		      <img src="../resources/carosel.jpeg" class="d-block" height="400px" style="margin:0 auto;" alt="...">
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

		<div><p style="font-size:30px;" >신규상담사</p></div>
		<div><a href="./main" style="font-size:20px; margin-left: 10px" >TOP10</a></div>
		
	</div>

<div class="justify-content-center" style="display:flex;">
		<!-- img -->
		<div class="card" style="width: 300px;">
		  <img src="../resources/dog.jpeg" class="card-img-top" height="200px" alt="ex">
		<!-- img end  -->
		  <div class="card-body">
		    <h5 class="card-title">Card title</h5>
		    <p class="card-text">11</p>
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




</div>
<!-- margin-left: 20% -->

</body>
</html>
