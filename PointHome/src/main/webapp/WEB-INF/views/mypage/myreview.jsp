<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<link href="/resources/mypage/userInfo.css" rel="stylesheet">

<style>
.star-ratings {
  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #2b2a29;
}
 
.star-ratings-fill {
  color: #fff58c;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: gold;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}
</style>

<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />

<div id="userInfo"
	style="margin: 0 auto; margin-top: 30px; padding: 30px;">
	<h4>리뷰조회</h4>
	<hr id="line">
	
<table class="table">

  <tbody class="table-group-divider">
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제휴사 이름</th>
      <th scope="col">별점</th>
      <th scope="col">리뷰작성일자</th>
      <th scope="col">리뷰내용</th>
     </tr>
     <hr>
    
   	<c:forEach var="list" items="${reviewlist}">
	<tr>
      <th scope="row">${list.REVIEW_NO}</th>
      <td>${list.PARTNER_SHOPNAME}</td>
      <td>
      <span class="star-ratings">
                  <span class="star-ratings-fill space-x-2 text-lg" style="width: ${list.REVIEW_GRADE * 20}%;">
                     <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                  </span>
                  <span class="star-ratings-base space-x-2 text-lg">
                     <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                  </span>
      </span>
      </td>
      <td>${list.REVIEW_DATE }</td>
      <td>${list.REVIEW_CONTENT }</td>
    </tr>
    	</c:forEach>
  
    
  </tbody>
</table>




</div>

</div>

</body>
</html>
















