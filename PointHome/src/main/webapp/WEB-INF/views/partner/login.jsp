<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점집닷컴</title>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- 폰트모음 -->
<link href="/resources/common/css/font.css" rel="stylesheet">

<style type="text/css">

body {
	font-family: SBAggroL;
}

</style>

</head>
<body>

<div class="container">
<form class="form" action="./login" method="post">
<div class="form-signin m-auto">
<div class="d-grid gap-2 col-4 mx-auto">
<div class="mt-5 mb-5"></div>

<h1 class="text-center mt-5 mb-5">
	<a class="ms-3" href="/">
    <div style="width:200px; display: inline-block;">
	<svg xmlns="http://www.w3.org/2000/svg" version="1.1" xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="100%" height="100%" viewBox="8.050000190734863 -73.94000244140625 317.6200256347656 92.21000671386719">
		<path d="M50.36 -38.63L40.99 -32.66L29.25 -52.35L17.42 -32.66L8.05 -38.63L21.77 -61.25L11.27 -61.25L11.27 -72.04L47.15 -72.04L47.15 -61.25L36.64 -61.25ZM70.06 8.52C70.06 9.66 69.84 10.75 69.39 11.79C68.95 12.83 68.35 13.73 67.59 14.48C66.84 15.24 65.95 15.84 64.94 16.28C63.93 16.73 62.86 16.95 61.73 16.95L37.87 16.95C36.73 16.95 35.66 16.73 34.65 16.28C33.64 15.84 32.76 15.24 32 14.48C31.24 13.73 30.64 12.83 30.2 11.79C29.76 10.75 29.54 9.66 29.54 8.52L29.54 -19.31L58.89 -19.31L58.89 -47.81L45.16 -47.81L45.16 -58.7L58.89 -58.7L58.89 -73.94L70.06 -73.94L70.06 -19.31ZM58.89 6.15L58.89 -8.52L40.71 -8.52L40.71 6.15Z M135.57 -38.63L126.2 -32.66L114.46 -52.35L102.62 -32.66L93.25 -38.63L106.98 -61.25L96.47 -61.25L96.47 -72.04L132.35 -72.04L132.35 -61.25L121.84 -61.25ZM155.26 8.99C155.26 10.13 155.04 11.22 154.6 12.26C154.16 13.3 153.56 14.2 152.8 14.96C152.04 15.72 151.16 16.31 150.15 16.76C149.14 17.2 148.06 17.42 146.93 17.42L123.07 17.42C121.94 17.42 120.86 17.2 119.85 16.76C118.84 16.31 117.96 15.72 117.2 14.96C116.44 14.2 115.85 13.3 115.4 12.26C114.96 11.22 114.74 10.13 114.74 8.99L114.74 -19.31L125.91 -19.31L125.91 -10.98L144.09 -10.98L144.09 -13.63L144.09 -73.94L155.26 -73.94L155.26 -19.31ZM144.09 6.63L144.09 -0.19L125.91 -0.19L125.91 6.63Z M250.88 -47.81L238.95 -47.81L238.95 -13.54L227.68 -13.54L227.68 -73.94L238.95 -73.94L238.95 -58.7L250.88 -58.7ZM215.94 -33.99L188.2 -33.99C187.07 -33.99 186 -34.21 184.99 -34.65C183.98 -35.09 183.09 -35.69 182.34 -36.45C181.58 -37.21 180.98 -38.1 180.54 -39.15C180.09 -40.19 179.87 -41.28 179.87 -42.41L179.87 -72.04L215 -72.04L215 -61.25L191.14 -61.25L191.14 -44.78L215.94 -44.78ZM242.17 11.36L233.46 18.27L216.8 -1.8L200.04 18.27L191.33 11.36L216.8 -18.93Z M277.38 -46.48L267.92 -46.48L267.92 -57.28L286.38 -57.28L289.69 -61.25L266.97 -61.25L266.97 -72.04L300.01 -72.04L307.02 -65.13L276.91 -28.78L268.39 -35.6ZM325.67 8.52C325.67 9.66 325.45 10.75 325 11.79C324.56 12.83 323.96 13.73 323.2 14.48C322.45 15.24 321.56 15.84 320.55 16.28C319.54 16.73 318.47 16.95 317.34 16.95L293.57 16.95C292.44 16.95 291.36 16.73 290.35 16.28C289.34 15.84 288.46 15.24 287.7 14.48C286.95 13.73 286.35 12.83 285.9 11.79C285.46 10.75 285.24 9.66 285.24 8.52L285.24 -19.31L314.5 -19.31L314.5 -44.97L299.92 -44.97L299.92 -55.86L314.5 -55.86L314.5 -73.94L325.67 -73.94L325.67 -19.31ZM314.5 6.15L314.5 -8.52L296.41 -8.52L296.41 6.15Z"></path>
	</svg>
	</div>
	</a>
</h1>
				
<ul class="nav nav-tabs nav-justified">
	<li class="nav-item">
		<a class="nav-link" aria-current="page" href="/user/login">사용자</a>
	</li>
	<li class="nav-item">
		<a class="nav-link active" href="./login">제휴사</a>
	</li>
</ul>

<div class="form-floating mt-3 mb-3">
	<input type="text" class="form-control" name="partnerEmail" id="partnerEmail" placeholder="이메일">
	<label for="floatingInput">이메일</label>
</div>

<div class="form-floating">
	<input type="password" class="form-control" name="partnerPw" id="partnerPw" placeholder="비밀번호">
	<label for="floatingPassword">비밀번호</label>
</div>

<div class="container">
	<div class="row">
		<div class="form-check form-switch col">
			<input class="form-check-input mb-3" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked> 
			<label class="form-check-label" for="flexSwitchCheckChecked">로그인 상태 유지</label>
		</div>
	</div>
</div>

<button class="btn btn-primary btn-lg">로그인</button>
<a href="./join" class="btn btn-outline-secondary btn-lg" type="button">회원가입</a>

<div class="nav justify-content-center col mt-3">
	<div class="nav-item"><a class="nav-link" href="#">아이디 찾기</a></div>
	<div class="nav-item">|</div>
	<div class="nav-item"><a class="nav-link" href="#">비밀번호 찾기</a></div>
</div>

</div>
</div>

</form>

</div>

</body>
</html>