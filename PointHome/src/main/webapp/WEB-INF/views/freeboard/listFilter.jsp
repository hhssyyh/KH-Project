<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<i class="bi bi-bar-chart-steps"></i>정렬기준
<select class="array" id="filter" name="filter" onchange="selectFilter">
	<option value="hit">조회순</option>
	<option value="comment">댓글순</option>
	<option value="recommend">추천순</option>
	<option value="date">날짜순</option>
</select>


</body>
</html>