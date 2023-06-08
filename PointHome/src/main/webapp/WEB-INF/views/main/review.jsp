<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>
<c:import url="/WEB-INF/views/layout/detailBanner.jsp"/>

<style type="text/css">
.container {
	margin: 100px auto;
}
td {
	padding: 5px 10px;
}
table {
	font-size: 20px;
	margin: 0 auto;
}
</style>


<div class="container">

<table id="commentTr">

<c:forEach var="review" items="${reviewList }">
<tr>
	<td style="padding-right: 0;"><i class="bi bi-person-circle"></i>${review.USER_NICK }<td> 
	<td>
		${review.REVIEW_TITLE }
	</td> 
	<td>
		${review.REVIEW_GRADE }
	</td>
	<td>
		${review.REVIEW_CONTENT }
	</td>
	<td><fmt:formatDate value="${review.REVIEW_DATE }" pattern="yy/MM/dd hh:mm"/></td>
</tr>
</c:forEach>

</table>

</div>




<c:import url="/WEB-INF/views/layout/footer.jsp"/>
