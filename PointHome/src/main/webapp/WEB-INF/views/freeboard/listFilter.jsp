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

<!-- 여기 안씀 -->
<thead>
<tr>
   <th>글번호</th>
   <th>제목</th>
   <th>닉네임</th>
   <th>조회수</th>
   <th>작성일</th>
   <th>댓글수</th>
   <th>추천수</th>
</tr>
</thead>
<c:forEach var="board" items="${list }">
<tr>
   <td>${board.FREEBOARD_NO }</td>
   <td class="text-start"><a href="./view?freeboardNo=${board.FREEBOARD_NO }">${board.FREEBOARD_TITLE }</a></td>
   <td>${board.USER_NICK}</td>
   <td>${board.FREEBOARD_HIT }</td>
   <td><fmt:formatDate value="${board.FREEBOARD_DATE }" pattern="yy/MM/dd hh:mm"/>
   <td>${board.COMMENTCNT }</td>
   <td>${board.RECOMMENDCNT }</td>
</tr>
</c:forEach>


</body>
</html>

