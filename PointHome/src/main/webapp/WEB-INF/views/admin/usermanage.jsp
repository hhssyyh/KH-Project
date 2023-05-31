<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
#container {
	padding-top: 60px;
	margin-left: 40%;
}
</style>
<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp"/>
<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp"/>

<div >
	<div id="container">	
	<table>
		<tr>
			<th>유저 번호</th>
			<th>유저 이름</th>
			<th>유저 닉네임</th>
			<th>가입 날짜</th>
			<th>상세 조회</th>
		</tr>
	<c:forEach var="user" items="${userList}"> 
		<tr>
			<td>${user.userNo }</td>
			<td>${user.userName }</td>
			<td>${user.userNick }</td>
			<td><fmt:formatDate value="${user.userJoindate}" pattern="yyyy.MM.dd"/><br /></td>
			<td><a href="/admin/userdetail?userNo=${user.userNo }">
					<button class="btn btn-info btn-sm">상세 조회</button>
				</a>
			</td>
		</tr>
	</c:forEach>
		
	</table>
	</div>



</div>



</body>
</html>