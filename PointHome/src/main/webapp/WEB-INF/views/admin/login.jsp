<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
<div class="container">

<h1 class="text-center mt-5 mb-5">관리자페이지</h1>
<form class="form" action="/admin/login" method="post">
<div class="form-signin m-auto">
<div class="d-grid gap-2 col-4 mx-auto">
<div class="form-floating mb-3">


	<input type="text" class="form-control" name="adminId" id="adminId" placeholder="ID">
	  <label for="floatingInput">아이디</label>
	</div>
	
	<div class="form-floating">
	  <input type="password" class="form-control" name="adminPw" id="adminPw" placeholder="비밀번호">
	  <label for="floatingPassword">비밀번호</label>
	</div>
	
	<button class="btn btn-primary btn-lg">로그인</button>

</div>
</div>
</form>
</div>
</body>
</html>