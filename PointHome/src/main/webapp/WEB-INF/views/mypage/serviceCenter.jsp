<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>



<link href="/resources/mypage/view.css" rel="stylesheet">


<style>
	#serviceDiv {
	   height: 900px;
	   width: 1000px;
	   
	   background-color: #ccc;
	}
	
	
	#line {
		border-top: 3px solid;
	}

      table {
        width: 100%;
      }
      
       th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>


<h3 style="margin: 20px; margin-left: 30px; margin-top: 80px;"><a href="./view">MYMENU</a></h3>

<div id="myBanner">
	<div id="profile">
		<span><img id="profileImg" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></span>
		<div id="nickDiv">
			<h1>NICKNAME</h1>
			<button class="btn btn-outline-dark nickBtn ">회원정보수정</button>
		</div>
	</div>

	<div id="profileBtnDiv">
		<div class="btnRow">
			<button class="btn btn-outline-dark proBtn">1:1 채팅 문의</button>
			<button class="btn btn-outline-dark proBtn">알림 내역</button>
		</div>
		<div class="btnRow">
			<button class="btn btn-outline-dark proBtn">찜 내역</button>
			<button class="btn btn-outline-dark proBtn">후기 작성</button>
		</div>
	</div>
</div>


<div id="mypageCon" class="container mt-5">

	<div id="serviceDiv"
		style="margin: 0 auto; margin-top: 200px; padding: 30px;">
		<h4>고객센터</h4>
		<hr id="line">

		
		
		<div id="serviceDiv2" style="background-color: white; padding: 30px; margin-bottom: 50px; "> 
		고객센터<br>
		TEL. 1234-5678<br><br>
		
		FAQ 자주 묻는 질문<br><br>
		
		
			<form action="./serviceCenter"  method="post">
			<input class="form-control me-2" style="margin-right:10px; width: 500px; display: inline-block;"><button class="btn btn-outline-dark">검색</button>
			</form>

		</div>
		
		<div id="serviceDiv3" style="background-color: white; padding: 30px; margin-bottom: 50px;  ">
		
		<table>
		<tr>
		<th>구분</th>
		<th>제목</th>
		</tr>
		
		<tr>
		<td>내용1</td>
		<td>내용2</td>		
		</tr>
		
		<tr>
		<td>내용1</td>
		<td>내용2</td>		
		</tr>
		
		<tr>
		<td>내용1</td>
		<td>내용2</td>		
		</tr>
		
		<tr>
		<td>내용1</td>
		<td>내용2</td>		
		</tr>
		
		<tr>
		<td>내용1</td>
		<td>내용2</td>		
		</tr>
		
		</table>
		
		
		</div>
		
	</div>
	


</div>


<br><br><br><br><br><br><br><br><br>

</body>
</html>





