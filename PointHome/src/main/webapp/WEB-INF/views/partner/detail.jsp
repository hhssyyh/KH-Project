<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#container {
	margin-top: 154px;
}

#toptab {
	margin-top: 100px;
}

#container{
	background-color: grey;
	width:100%; 
	height:350px;
	display: flex;
  	justify-content: center;
  	align-items: center;
  	
}

#container div {
	margin-right: 10px;

}
</style>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<div id="toptab" class="fixed-top">
	<ul class="nav justify-content-center">
		<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="/partner/detail">상세페이지</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/partner/product">판매상품</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/partner/review">리뷰</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/partner/partnernotice">공지사항</a>
		</li>
	</ul>
</div>

<div id="container">
	<div>
		<div style="background-color: black; width:200px; height:200px;"></div>
	</div>
	
	<div>
		<div style="background-color: white; width:400px; height:200px;"></div>
	</div>
	
	<div>
		<div style="background-color: black; width:200px; height:200px;"></div>
	</div>
</div>

<div id="container2">
	<div>
		
	</div>
	
	<div>
		
	</div>
</div>



