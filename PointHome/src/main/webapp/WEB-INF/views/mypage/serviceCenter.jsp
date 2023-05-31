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



<c:import url="/WEB-INF/views/layout/myprofile.jsp" />


<div id="mypageCon" class="container">

	<div id="serviceDiv"
		style="margin: 0 auto; margin-top: 50px; padding: 30px;">
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


<c:import url="/WEB-INF/views/layout/footer.jsp" />




