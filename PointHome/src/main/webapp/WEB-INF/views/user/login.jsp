<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/>

<div class="container">
<form class="form" action="/user/login" method="post">
<div class="form-signin m-auto">
<div class="d-grid gap-2 col-4 mx-auto mb-5">
<div class="mt-5 mb-5"></div>

<h1 class="text-center mt-5 mb-5">PointHome</h1>

<div class="form-floating mb-3">
  <input type="text" class="form-control" name="userEmail" id="userEmail" placeholder="이메일">
  <label for="floatingInput">이메일</label>
</div>

<div class="form-floating">
  <input type="password" class="form-control" name="userPw" id="userPw" placeholder="비밀번호">
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

<div class="nav justify-content-center col">
	<div class="nav-item"><a class="nav-link" href="./searchid">아이디 찾기</a></div>	
	<div class="nav-item">|</div>	
	<div class="nav-item"><a class="nav-link" href="./searchpw">비밀번호 찾기</a></div>
</div>

<div class="container">
<div class="mt-3 text-center mb-5">
  <a href="./naverlogin"><img height="50" src="/resources/login/user/img/btnG_logo_round.png"/></a>
  <a href="./kakaologin"><img height="50" src="/resources/login/user/img/kakao_logo_round.png"/></a>
</div>
</div>
</div>
</div>

</form>

</div>

<c:import url="../layout/footer.jsp"/>