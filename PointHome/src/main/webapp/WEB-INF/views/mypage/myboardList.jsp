<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
body {
	padding: 0;
	margin: 0;
}

#userInfo {
	width: 1000px;
	background-color: white;
}

#reservedetail {
	height: 340px; 
	width: 800px;
	background-color: white;
}

#line {
	border-top: 3px solid;
}

.nickBtn2 {
	width: 150px;
	font-size: 18px;
	margin-top: 24px;
	margin-right: 145px;
}

#profileImg2{
	width: 60px;
	margin-left:20px;
	
}

</style>

<script>
function deleteRow(th){
	console.log("되는데?")
	 $(th).parents(".del").find("i").toggleClass("bi bi-check-square")
	 $(th).parents(".del").find("i").addClass("bi bi-check-square-fill")
	 
	
// 	$(th).parents(".del").find("i").addStyle ("bi bi-check2-square" style="font-size: 2rem; color: cornflowerblue;")
}



</script>


<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />


<div id="userInfo" class="container" style="padding: 30px; border-radius: 30px; border: 1px solid;">
	 <h4><i class="bi bi-pencil-square"></i> 내가 쓴 글 내역</h4>
	<hr id="line">
	
	<c:forEach var="list" items="${boardList}">
<%-- 		<span><a href="/main/detail?partNo=${list.freeboardTitle}"><img id="profileImg2" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></a></span> --%>
			
			<div class="del">
				<button type="button" id= "button" onclick="deleteRow(this);" style ="display: none;"></button>
				<label for="button"><i class="bi bi-check-square"></i></label>
			</div>
			<a href="/freeboard/view?freeboardNo=${list.freeboardNo}"><h5 style="margin: 20px; margin-left: 103px; margin-bottom: 60px;">${list.freeboardTitle }</h5></a>
			<h6 style="margin: 20px; margin-left: 103px; margin-top: -52px;"><fmt:formatDate value="${list.freeboardDate }" pattern="yy/MM/dd hh:mm" /></h6>
			<hr>
		
		
	</c:forEach>


	
	
</div>
	

</div>


</body>
</html>















