<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<style type="text/css">
a {
	text-decoration: none;

}
#sidebar ul {
	padding:0;
	list-style-type: none;
	background-color: #ccc;
	width: 15%;
	margin: 54px 0 0 0;
	/* margin-right:0;
	margin-left: 0; */
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





<div id="sidebar">
	<ul class="bg-light">
		<li><a href="/admin/usermanage">사용자 회원관리</a></li>
		<li><a href="/admin/partnermanage">제휴사 회원관리</a></li>
		<li><a href="#">결제관리</a></li>
		<li><a href="/admin/noticelist">공지사항</a></li>
	</ul> 
</div>

