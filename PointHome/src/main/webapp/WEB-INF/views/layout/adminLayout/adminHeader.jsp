<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style>
#header a {
	transition: all 0.2s linear;
	padding: 5px 8px 8px 30px;
	
}
#header a:hover {
	  transform: scale(1.2);
}


</style>


<div id="header">
	<nav class="navbar fixed-top" style="background-color: #000000;">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="/admin/main" style="color:white;
font-weight: Bold; font-size: 20px;">
			ADMIN PAGE
	    </a>
	    
	    
	    <c:if test="${empty adminLogin}">
	    <span style="color:white;
font-weight: Bold;">로그인이 필요합니다.</span>
	    </c:if>
	    <c:if test="${not empty adminLogin and adminLogin}">
	    <span style="margin-left:1000px; color:white;
font-weight: Bold;"> 운영자 ${sessionScope.adminId } 님 접속 </span>
	    </c:if>
	    
	    <div style="text-align: justify; " >
	    <a href="/admin/logout" style="color:white;
font-weight: Bold;">LOGOUT</a>
    </div>
	    
	  </div>
	</nav>
	

	
</div>




