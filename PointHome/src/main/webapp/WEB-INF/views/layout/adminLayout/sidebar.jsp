<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<li><a href="/admin/usermanage">회원관리</a></li>
		<li><a href="#">결제관리</a></li>
		<li><a href="#">리뷰조회</a></li>
		<li><a href="/admin/noticelist">공지사항</a></li>
	</ul> 
</div>

