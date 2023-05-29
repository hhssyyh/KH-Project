<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<link href="/resources/mypage/userInfo.css" rel="stylesheet">


<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />



<div id="userInfo"
	style="margin: 0 auto; margin-top: 200px; padding: 30px;">
	<h4>리뷰조회</h4>
	<hr id="line">
	
<table class="table">
  <thead>
	<tr>
		<th>작성 가능 후기</th> 
		<th>작성 완료 후기</th>
	</tr>
  </thead>


  <tbody class="table-group-divider">
    <tr>
      <th scope="col">예약번호</th>
      <th scope="col">예약 </th>
      <th scope="col">예약일자</th>
      <th scope="col">금액 </th>
      <th scope="col">  </th>
     </tr>
     <hr>
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
  
    
  </tbody>
</table>




</div>

</div>

</body>
</html>
















