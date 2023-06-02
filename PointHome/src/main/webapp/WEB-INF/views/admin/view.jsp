<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="../layout/adminLayout/adminHeader.jsp" />

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



<div class="container" style="margin-top: 180px; margin-bottom: 200px;">

<h1 style="text-align: center">게시글 상세보기</h1>
<hr>
<!-- title JSTL로 가지고 오기 -->
<h3>${view.noticeTitle }</h3>
<i class="bi bi-person-circle fs-1" style="height:200px"></i> ${viewAdmin.adminId } <br>

<!-- 날짜 -->
<fmt:formatDate value="${view.noticeDate }" pattern="yy/MM/dd hh:mm"/>



<hr>

<div id="content" >
<!-- 본문 내용 가져오기 -->
${view.noticeContent }

<c:forEach var="bfile" items="${file}"><br>

<c:choose>
<c:when test="${fn:contains(fn:toLowerCase(bfile.admin_file_origin), 'gif') }">
<img src="/upload/${bfile.admin_file_stored}"  alt="">
</c:when>
<c:when test="${fn:contains(fn:toLowerCase(bfile.admin_file_origin), 'png') }">
<img src="/upload/${bfile.admin_file_stored}"  alt="">
</c:when>
<c:when test="${fn:contains(fn:toLowerCase(bfile.admin_file_origin), 'jpg') }">
<img src="/upload/${bfile.admin_file_stored}"  alt="">
</c:when>


</c:choose>

</c:forEach>



</div>



<hr>

<!-- 게시글 수정, 삭제 구현 아직 안함 -->


 <div class="modal2">
<div class="modal2_body" >게시글을 삭제하시겠습니까?

<a href="./delete?freeboardNo=${board.freeboardNo}"><button type="button" class="btn btn-outline-primary btn-default btn-xs">확인</button></a>
<button type="button" class="btnModalCancle2 btn btn-outline-primary btn-default btn-xs">취소</button>
</div>
</div> 

<div class="text-end">

	<a href="./noticelist"><button class="btn btn-secondary">목록</button></a>

<c:if test="${userno eq board.userNo}">
<a href="./update?freeboardNo=${board.freeboardNo}"><button type="button" class="btn btn-secondary" >수정</button></a>
<button type="button" class="btn-reset-popup btn btn-secondary" >삭제</button>
</c:if> 
</div>




<!-- i태그 이미지 >> 사용자 프로필 가져오기 로 코맨트 for each 출력-->
</div>
<!-- div.container -->


<c:import url="/WEB-INF/views/layout/footer.jsp" />
