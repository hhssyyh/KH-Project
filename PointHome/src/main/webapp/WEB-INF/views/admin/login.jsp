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
<style>
body{
background-color: #000000;
display: flex;
  justify-content: center;
  align-items: center;
  min-height: 80vh;

}


</style>

<style>
@import url('https://fonts.googleapis.com/css?family=Special+Elite');

body {
  background: #000;
}

.title {
  position: relative;
  margin: 60px;
  
  font-family: 'Special Elite', cursive;
  font-size: 3em;
  color: #fff;
  text-transform: uppercase;
  overflow: hidden;
}

.title:before {
  content: attr(data-content);
  position: absolute;
  left: -2px;
  text-shadow: 3px 0 #00f;
  top: 0;
  color: #fff;
  overflow: hidden;
  clip: rect(0, 900px, 0, 0);
  animation: noise-anim-2 3s infinite linear alternate-reverse;
}

.title:after {
  content: attr(data-content);
  position: absolute;
  left: -2px;
  text-shadow: -3px 0 #f00;
  top: 0;
  color: #fff;
  overflow: hidden;
  clip: rect(0, 900px, 0, 0);
  animation: noise-anim-2 3s infinite linear alternate-reverse;
}

@keyframes noise-anim-2 {
  0% {
    clip: rect(77px, 9999px, 22px, 0);
  }
  5% {
    clip: rect(70px, 9999px, 31px, 0);
  }
  10% {
    clip: rect(37px, 9999px, 45px, 0);
  }
  15% {
    clip: rect(43px, 9999px, 29px, 0);
  }
  20% {
    clip: rect(41px, 9999px, 44px, 0);
  }
  25% {
    clip: rect(9px, 9999px, 79px, 0);
  }
  30% {
    clip: rect(91px, 9999px, 12px, 0);
  }
  35% {
    clip: rect(48px, 9999px, 74px, 0);
  }
  40% {
    clip: rect(30px, 9999px, 69px, 0);
  }
  45% {
    clip: rect(31px, 9999px, 93px, 0);
  }
  50% {
    clip: rect(91px, 9999px, 52px, 0);
  }
  55% {
    clip: rect(55px, 9999px, 62px, 0);
  }
  60% {
    clip: rect(21px, 9999px, 71px, 0);
  }
  65% {
    clip: rect(29px, 9999px, 52px, 0);
  }
  70% {
    clip: rect(33px, 9999px, 81px, 0);
  }
  75% {
    clip: rect(44px, 9999px, 3px, 0);
  }
  80% {
    clip: rect(71px, 9999px, 47px, 0);
  }
  85% {
    clip: rect(77px, 9999px, 76px, 0);
  }
  90% {
    clip: rect(43px, 9999px, 48px, 0);
  }
  95% {
    clip: rect(13px, 9999px, 80px, 0);
  }
  100% {
    clip: rect(15px, 9999px, 11px, 0);
  }
}

@keyframes noise-anim {
  0% {
    clip: rect(40px, 9999px, 198px, 0);
  }
  5% {
    clip: rect(111px, 9999px, 135px, 0);
  }
  10% {
    clip: rect(134px, 9999px, 92px, 0);
  }
  15% {
    clip: rect(156px, 9999px, 171px, 0);
  }
  20% {
    clip: rect(92px, 9999px, 73px, 0);
  }
  25% {
    clip: rect(200px, 9999px, 108px, 0);
  }
  30% {
    clip: rect(147px, 9999px, 48px, 0);
  }
  35% {
    clip: rect(136px, 9999px, 189px, 0);
  }
  40% {
    clip: rect(12px, 9999px, 116px, 0);
  }
  45% {
    clip: rect(74px, 9999px, 4px, 0);
  }
  50% {
    clip: rect(25px, 9999px, 97px, 0);
  }
  55% {
    clip: rect(40px, 9999px, 39px, 0);
  }
  60% {
    clip: rect(73px, 9999px, 123px, 0);
  }
  65% {
    clip: rect(58px, 9999px, 36px, 0);
  }
  70% {
    clip: rect(154px, 9999px, 8px, 0);
  }
  75% {
    clip: rect(115px, 9999px, 96px, 0);
  }
  80% {
    clip: rect(50px, 9999px, 195px, 0);
  }
  85% {
    clip: rect(71px, 9999px, 154px, 0);
  }
  90% {
    clip: rect(49px, 9999px, 84px, 0);
  }
  95% {
    clip: rect(73px, 9999px, 180px, 0);
  }
  100% {
    clip: rect(113px, 9999px, 117px, 0);
  }
}

</style>
<style type="text/css">* {cursor: url(https://cur.cursors-4u.net/cursors/cur-7/cur610.cur), auto !important;}</style><a href="https://www.cursors-4u.com/cursor/2010/12/17/oxygen-black-11.html" target="_blank" title="Oxygen Black"><img src="https://cur.cursors-4u.net/cursor.png" border="0" alt="Oxygen Black" style="position:absolute; top: 0px; right: 0px;" /></a>
<body>
<div class="container">

<p class="title" data-content="ADMIN" style="margin-left: 520px; font-size:80px;" onclick="location.href='/'">ADMIN</p>
<form class="form" action="/admin/login" method="post">
<div class="form-signin m-auto">
<div class="d-grid gap-2 col-4 mx-auto">
<div class="form-floating mb-3">


	<input type="text" class="form-control" name="adminId" id="adminId" placeholder="ID">
	  <label for="floatingInput">ID</label>
	</div>
	
	<div class="form-floating">
	  <input type="password" class="form-control" name="adminPw" id="adminPw" placeholder="비밀번호">
	  <label for="floatingPassword">PASSWORD</label>
	</div>
	
<button class="btn btn-outline-dark" style="color:white; font-weight: lighter;">LOGIN</button>
</div>
</div>
</form>
</div>
</body>
</html>