<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<link href="/resources/mypage/userInfo.css" rel="stylesheet">


<h3 style="margin: 20px; margin-left: 30px; margin-top: 40px;">
	<a>MYMENU</a>
</h3>

<div id="myBanner">
	<div id="profile">
		<span><img id="profileImg" alt=""
			src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></span>
		<div id="nickDiv">
			<h2>NICKNAME</h2>
			<button class="btn btn-outline-dark nickBtn ">회원정보수정</button>
		</div>
	</div>

	<div id="profileBtnDiv">
		<div class="btnRow">
			<button class="btn btn-outline-dark proBtn">1:1 채팅 문의</button>
			<button class="btn btn-outline-dark proBtn">알림 내역</button>
		</div>
		<div class="btnRow">
			<button class="btn btn-outline-dark proBtn">찜 내역</button>
			<button class="btn btn-outline-dark proBtn">후기 작성</button>
		</div>
	</div>
</div>

<div id="mypageCon"></div>



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


</body>
</html>
















