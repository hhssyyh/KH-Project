<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- 부트스트랩 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- 폰트 적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Nanum+Brush+Script&display=swap" rel="stylesheet">

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
  
*{
font-size:16px;
}
  
}
</style>

<script type="text/javascript">

$(function() {      
      $("#freeboardContent").summernote({
         height: 300,
         focus: true
      })

      $(".note-editable").html('${board.freeboardContent}')
})


</script>

</head>
<body>
<div class="container" style="margin-top: 180px; margin-bottom: 200px;">

<h1 style="text-align: center">게시글 수정하기</h1>
<hr>
<form action="./update" method="post" enctype="multipart/form-data">

<input type="hidden" name="freeboardNo" value="${board.freeboardNo}">
<!-- title JSTL로 가지고 오기 -->
<div id="freeboardTitle">
	<h3>  <input type="text" id="freeboardTitle" name="freeboardTitle" placeholder= "${board.freeboardTitle }" style="border: none;" required ></h3>
</div>
<i class="bi bi-person-circle fs-1" style="height:200px"></i> writer_nick <br>
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
<%-- ${board.freeboardContent } --%>
<textarea style="display: none" id="freeboardContent" name="freeboardContent" ></textarea>

<input type="file" name="dataMul" multiple="multiple">

<button type="button" class="btn-reset-popup btn btn-secondary" >확인</button>

<div class="modal2">
<div class="modal2_body" >게시글을 수정하시겠습니까?

<button type="submit" class="btn btn-outline-primary btn-default btn-xs">확인</button>
<a href="/freeboard/list"><button type="button" class="btn btn-outline-primary btn-default btn-xs">취소</button></a>
</div>
</div>

</form>


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

<br><br><br><br><br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />


