<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />


<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<style type="text/css">
div.content {
	min-height: 300px;
}

div.fr {
	text-align: right;
}

#cmt {
	border-right: 0px;
	border-top: 0px;
	border-left: 0px;
}

.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}

.modal2 {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal2.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 500px;
	height: 100px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}

.modal2_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 500px;
	height: 100px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}

.container img {
  max-width: 100%;
  height: auto;
  display: block;
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

<div id="content" >
<!-- 본문 내용 가져오기 -->
${board.freeboardContent }

<c:forEach var="bfile" items="${file}"><br>

<%-- ${fn:contains(fn:toLowerCase(bfile.freeboardfileOrigin), "gif") } --%>
<%-- ${fn:contains(bfile.freeboardfileOrigin, 'gif') } --%>
<c:choose>
<c:when test="${fn:contains(fn:toLowerCase(bfile.freeboardfileOrigin), 'gif') }">
<img src="/upload/${bfile.freeboardfileStored}"  alt="">
</c:when>
<c:when test="${fn:contains(fn:toLowerCase(bfile.freeboardfileOrigin), 'png') }">
<img src="/upload/${bfile.freeboardfileStored}"  alt="">
</c:when>
<c:when test="${fn:contains(fn:toLowerCase(bfile.freeboardfileOrigin), 'jpg') }">
<img src="/upload/${bfile.freeboardfileStored}"  alt="">
</c:when>

<%-- 		<a href="./download?fileNo=${bfile.freeboardfileNo}">${bfile.freeboardfileOrigin }</a> --%>

</c:choose>

</c:forEach>


<div style="font-size:12px;"  >

<c:choose>
<c:when test="${!empty file}">
<hr>
첨부파일
<c:forEach var="bfile" items="${file}">
<a href="./download?fileNo=${bfile.freeboardfileNo}">${bfile.freeboardfileOrigin }</a>
</c:forEach>
</c:when>
</c:choose>
</div>

</div>

<!-- 첨부파일 -->

<!-- <div class="mb-3"> -->
<%-- 		<c:forEach var="boardFile" items="${file}"> --%>

<%-- 			<a href="./download?fileNo=${boardFile.freeboardfileNo}">${boardFile.freeboardfileOrigin }</a><br> --%>

<%-- 		</c:forEach> --%>
<!-- </div> -->

<hr>



<div class="modal2">
<div class="modal2_body" >게시글을 삭제하시겠습니까?

<a href="./delete?freeboardNo=${board.freeboardNo}"><button type="button" class="btn btn-outline-primary btn-default btn-xs">확인</button></a>
<a href="/freeboard/list"><button type="button" class="btn btn-outline-primary btn-default btn-xs">취소</button></a>
</div>
</div>

<div class="text-end">

	<a href="./list"><button class="btn btn-secondary">목록</button></a>

<c:if test="${userno eq board.userNo}">
<a href="./update?freeboardNo=${board.freeboardNo}"><button type="button" class="btn btn-secondary" >수정</button></a>
<button type="button" class="btn-reset-popup btn btn-secondary" >삭제</button>
</c:if>
</div>

<!--    <div class="text-end"> -->

<%--   		<a href="./update?freeboardNo=${board.freeboardNo}"><button type="button" class="btn-open-popup btn-secondary" >수정</button></a> --%>
<%--    		<a href="./delete?freeboardNo=${board.freeboardNo}"><button type="button" class="btn-reset-popup btn-secondary" >삭제</button></a> --%>

<!--    </div> -->

<div class="comments">
댓글 ${commentCnt }개



<c:if test="${not empty login and login}">
<!-- post 댓글 인서트 -->
<form action="./view" method="post">
${userno} <input type="text" name="commContent" size="80" id="cmt">
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



<script>
  const body2 = document.querySelector('body');
  const modal2 = document.querySelector('.modal2');
  const btnOpenPopup2 = document.querySelector('.btn-reset-popup');

  btnOpenPopup2.addEventListener('click', () => {
    modal2.classList.toggle('show');

    if (modal2.classList.contains('show')) {
      body2.style.overflow = 'hidden';
    }
  });

  modal2.addEventListener('click', (event) => {
    if (event.target === modal2) {
      modal2.classList.toggle('show');

      if (!modal2.classList.contains('show')) {
        body2.style.overflow = 'auto';
      }
    }
  });
</script>

