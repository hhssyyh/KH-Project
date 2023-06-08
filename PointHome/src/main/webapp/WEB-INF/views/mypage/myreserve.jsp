<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<link href="/resources/mypage/userInfo.css" rel="stylesheet">


<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />



<div id="userInfo"
	style="margin: 0 auto; margin-top: 200px; padding: 30px;">
	<h4>예약관리</h4>
	<hr id="line">
	
	
<table class="table">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제휴사 이름</th>
      <th scope="col">날짜</th>
      <th scope="col">예약번호</th>
      <th scope="col">예약현황</th>
    </tr>
  </thead>
  
  <c:forEach var="list" items="reservelist">
      <th scope="row">1</th>
      <td>해성동자</td>
      <td>list.resDate</td>
      <td>1234-1234</td>
      <td>예약완료</td>
  
  </c:forEach>
  <tbody class="table-group-divider">
    <tr>
      <th scope="row">1</th>
      <td>해성동자</td>
      <td>2023.05.23</td>
      <td>1234-1234</td>
      <td>예약완료</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>2023.05.23</td>
      <td>1234-1234</td>
      <td>예약완료</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td >Larry the Bird</td>
	  <td>2023.05.23</td>
      <td>1234-1234</td>
      <td>예약완료</td>
    </tr>
    <tr>
      <th scope="row">4</th>
      <td >Larry the Bird</td>
	  <td>2023.05.23</td>
      <td>1234-1234</td>
      <td>예약완료</td>
    </tr>
    <tr>
      <th scope="row">5</th>
      <td >Larry the Bird</td>
	  <td>2023.05.23</td>
      <td>1234-1234</td>
      <td>예약완료</td>
    </tr>
    <tr>
      <th scope="row">6</th>
      <td >Larry the Bird</td>
	  <td>2023.05.23</td>
      <td>1234-1234</td>
      <td>예약완료</td>
    </tr>
    <tr>
      <th scope="row">7</th>
      <td >Larry the Bird</td>
	  <td>2023.05.23</td>
      <td>1234-1234</td>
      <td>예약완료</td>
    </tr>
    
  </tbody>
</table>




</div>

</div>

</body>
</html>
















