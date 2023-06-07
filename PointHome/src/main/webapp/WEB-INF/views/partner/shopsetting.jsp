<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/partnerLayout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<style type="text/css">
.container {

	padding: 30px;
	margin-right: 80%; 
}
	
</style>

<body>

<div id="container">
<form action="./shopsetting" method="post">
	<label>상점이름</label>
		<input type="text" name="partnerShopname" value="${partnerShopInfo.partnerShopname}">
	<br>
	<%-- <label>상점타입</label>
		<input type="text" name="partnerType" value="${partnerShopInfo.partnerType}"> --%>
		
	<label>상점주소</label>
		<input type="text" name="partnerAddress" value="${partnerShopInfo.partnerAddress}">
	<br>	
	<!-- 가격 설정 -->
	<label>상품 가격</label>
		<input type="text" name="partnerPrice" value="${partnerShopInfo.partnerPrice}">	
	<br>
	
	
		
	
	<button>수정하기</button>
</form>
</div>

</body>
</html>


<!-- partnerInfo로 정보 select 했고 화면에 보여주면서 수정할 jsp 만들면 됨 -->


