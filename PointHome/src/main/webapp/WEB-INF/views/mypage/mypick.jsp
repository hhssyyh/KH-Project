<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="board" items="${list }">
			<div class="col-md-3">
				<div class="thumbnail">
					<div class="card" style="width: 250px; margin-left: 10px; margin-top: 20px;">
					
						<img src="../resources/dog.jpeg" class="card-img-top"
							height="200px" style="width: 100%" alt="ex">
						
						<input class="partNo" type="hidden" value="${board.PARTNER_NO}">
						
						
						<div class="card-body">
							<h5 class="card-title">${board.PARTNER_SHOPNAME}</h5>
							<p class="card-text">${board.PARTNER_NO}</p>
							<p class="card-text">가격 ${board.PARTNER_PRICE }</p>
							<p class="card-text">별점</p>
							<p class="card-text">후기(?)</p>
							<a href="./detail?partnerNo=${board.PARTNER_NO}" class="btn btn-primary">상세페이지</a>
							<span class="pick" >
								<c:if test="${board.ISPICK eq 0}">
									<button type="button" onclick="pickPart(this)" class="btn btn-primary"><i class="bi bi-heart"></i></button>
								</c:if>
								<c:if test="${board.ISPICK eq 1}">
									<button type="button" onclick="pickPart(this)" class="btn btn-primary"><i class="bi bi-heart-fill"></i></button>
								</c:if>
							</span>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

</body>
</html>















