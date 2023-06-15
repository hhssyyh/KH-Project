<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">


</script>


</head>
<body>

<table id="listTable" class="table table-hover table-sm text-center checkbox-table">
         <thead>
            <tr>
           		<th> <input id="allCheck" type="checkbox" name="allCheck" class="form-check-input" /></th>	
               <th>댓글번호</th>
               <th>댓글이 작성된 게시글</th>
               <th>댓글내용</th>
               <th>작성일</th>
            </tr>
         </thead>
         <c:forEach var="board" items="${cmtList}">
            <tr>
            	<td class="checkbox"><input name="RowCheck" type="checkbox" value="${board.COMM_NO}"/></td>
               <td>${board.COMM_NO }</td>
               <td class="text-start"><a href="/freeboard/view?freeboardNo=${board.FREEBOARD_NO }">${board.FREEBOARD_TITLE }</a></td>
               <td>${board.COMM_CONTENT }</td>
               <td><fmt:formatDate value="${board.COMM_DATE }"
                     pattern="yy/MM/dd hh:mm" />
            </tr>
         </c:forEach>
      </table>


</body>
</html>