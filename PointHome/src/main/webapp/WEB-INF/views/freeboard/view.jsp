<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<style type="text/css">
div.content {
	min-height: 300px;
}
div.fr{
	text-align: right;
}
#cmt{
	border-right:0px;
	border-top:0px;
	border-left:0px;
}
</style>


<script type="text/javascript">
$(function() {
	$("#recommend").on('click', "#recommendBtn", function(){
		console.log("click")
		$.ajax({
			   type : 'get',           // 타입 (get, post, put 등등)
			   url : './recommend',  // 요청할 서버url
			   dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
			   data : {  // 보낼 데이터 (Object , String, Array)
				   freeboardNo : ${board.freeboardNo }
			   }, 
			   success : function(result) { // 결과 성공 콜백함수
			    	console.log(result)
			        $("#recommend").html(result)
			   },
			   error : function(request, status, error) { // 결과 에러 콜백함수
			        console.log(error)
			   }
		})
	})
})

</script>


<div class="container" style="margin-top: 180px; margin-bottom: 200px;">

<h1 style="text-align: center">게시글 상세보기</h1>
<hr>
<!-- title JSTL로 가지고 오기 -->
<h3>${board.freeboardTitle }</h3>
<i class="bi bi-person-circle fs-1" style="height:200px"></i> ${viewUser.userNick } <br>
<!-- 날짜 -->
<fmt:formatDate value="${board.freeboardDate }" pattern="yy/MM/dd hh:mm"/>

<!-- 조회수 추천수 -->
<div class="fr">
	<span class="count me-2">조회수 ${board.freeboardHit }</span>
	<span class="cmtCount me-2">댓글 ${commentCnt }</span>
	<span id="recommend">
		<span class="hit me-2">추천수 ${cntRecommend }</span>
		
		<span>
			<c:if test="${isRecommend eq 0 }">
				<button id="recommendBtn">추천</button>
			</c:if>
			<c:if test="${isRecommend eq 1 }">
				<button id="recommendBtn">추천 취소</button>
			</c:if>
		</span>
		
	</span>
</div>

<hr>

<div id="content" style="text-align: center">
<!-- 본문 내용 가져오기 -->
${board.freeboardContent }
</div>

<hr><br>

<div class="mb-5" style="text-align: center;">
	<a href="./list"><button>목록</button></a>
</div>

<div class="comments">
댓글 ${commentCnt }개

<div style="text-align: left">
<i class="bi bi-bar-chart-steps"></i>정렬기준
<select class="array">
	<option value="a">조회순</option>
	<option value="b">댓글순</option>
	<option value="c">추천순</option>
	<option value="d">날짜순</option>
</select>
</div>


<c:if test="${not empty login and login}">
<!-- post 댓글 인서트 -->
<form action="./view" method="post">
댓글작성자 <input type="text" name="commContent" size="80" id="cmt">
<input type="hidden" value="${board.freeboardNo }" name="freeboardNo">

<button>작성</button><br><br>
</c:if>

<c:forEach var="boardCommentList" items="${boardCommentList }">
<tr>
	<td><i class="bi bi-person-circle"></i>${userNick} ${boardCommentList.userNo }<td> 
	<td>${boardCommentList.commContent }</td> 
	<td><fmt:formatDate value="${boardCommentList.commDate }" pattern="yy/MM/dd hh:mm"/></td>
	<td>
	
	<c:if test="${not empty userno and userno eq boardCommentList.userNo}">
		<a><button type="button">수정</button></a>
		<a href="./commentDelete?commNo=${boardCommentList.commNo}&freeboardNo=${board.freeboardNo}"><button type="button">삭제</button></a>
	</c:if>
	
	</td>
	<br><br>
</tr>
</c:forEach>

<!-- i태그 이미지 >> 사용자 프로필 가져오기 로 코맨트 for each 출력-->
</form>
</div>
</div><!-- div.container -->


<c:import url="/WEB-INF/views/layout/footer.jsp" />



