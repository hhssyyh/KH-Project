<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<link rel="stylesheet" href="/resources/main/css/main.css?d=<%= new Date() %>">

<style type="text/css">
#partnerlist-div {
	font-family: SBAggroM;
	margin: 120px;
}

.row {
   margin: 0px auto; /*가운데 정렬*/
}

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

<script type="text/javascript">
function pickPart(th) {
	
	var partNo = $(th).parents(".card").find(".partNo").val()
	console.log($(th).parents(".card").find(".partNo").val())
	
	$.ajax({
		   type : 'get',           // 타입 (get, post, put 등등)
		   url : '/mypage/mypick',  // 요청할 서버url
		   dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
		   data : {  // 보낼 데이터 (Object , String, Array)
			   partNo : $(th).parents(".card").find(".partNo").val()
		   }, 
		   success : function(result) { // 결과 성공 콜백함수
		    	console.log(result)
		        if( result.isPick ) { //찜 했음
					$(th).find("i").toggleClass("bi-heart")
					$(th).find("i").addClass("bi-heart-fill")
				} else { //찜 취소
					$(th).find("i").toggleClass("bi-heart-fill")
					$(th).find("i").addClass("bi-heart")
				}
		   
		   },
		   error : function(request, status, error) { // 결과 에러 콜백함수
		        console.log(error)
		   }
	})
}


function pickPart(th) {
	
	var partNo = $(th).parents(".card").find(".partNo").val()
	console.log($(th).parents(".card").find(".partNo").val())
	
	$.ajax({
		   type : 'get',           // 타입 (get, post, put 등등)
		   url : '/mypage/mypick',  // 요청할 서버url
		   dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
		   data : {  // 보낼 데이터 (Object , String, Array)
			   partNo : $(th).parents(".card").find(".partNo").val()
		   }, 
		   success : function(result) { // 결과 성공 콜백함수
		    	console.log(result)
		        if( result.isPick ) { //찜 했음
					$(th).find("i").toggleClass("bi-heart")
					$(th).find("i").addClass("bi-heart-fill")
				} else { //찜 취소
					$(th).find("i").toggleClass("bi-heart-fill")
					$(th).find("i").addClass("bi-heart")
				}
		   
		   },
		   error : function(request, status, error) { // 결과 에러 콜백함수
		        console.log(error)
		   }
	})
}
</script>


<div id="partnerlist-div">

<div class="container-fluid" style="margin-top: 50px; padding-left: 100px; padding-right: 100px;" >
	<div class="row" id="mypPick">
		<c:forEach var="partner" items="${list }">
			<div class="col-md-3">
				<div class="thumbnail">
					<!-- card 1개-->
					<div class="card" style="width: 310px; height: 390px; margin: 30px;">
						<input class="partNo" type="hidden" value="${partner.PARTNER_NO}">
						<!-- 카드 사진 -->
						<a href="/main/detail?partNo=${partner.PARTNER_NO }"><img src="../resources/main/img/partner_01.png" style="width: 100%;" class="card-img-top" alt="프로필사진"></a>
						<!-- 카드 사진 이하 내용 start-->
						<div class="card-content" style="padding: 10px 5px; padding-left: 15px; padding-top: 15px;">
							<div>
								<!-- 카드 타입 start -->
								<div class="card-content-type ${partner.PARTNER_TYPE}">
									<c:if test="${partner.PARTNER_TYPE eq 't'}">타로</c:if>
									<c:if test="${partner.PARTNER_TYPE eq 's'}">신점</c:if>
									<c:if test="${partner.PARTNER_TYPE eq 'c'}">철학</c:if>
								</div>
<!-- 								<div class="card-content-place"> -->
<!-- 									<i class="bi bi-geo-alt-fill"></i> -->
<%-- 									${partner.PARTNER_ADDRESS } ${partner.PARTNER_EXTRAADDRESS } --%>
<!-- 								</div> -->
							</div>
							<!-- card 제휴사 상호/이름 -->
							<div class="card-title">
								<a href="#">
									<span class="card-title-name text-black">${partner.PARTNER_NICK }</span>
									<span class="card-title-shop">${partner.PARTNER_SHOPNAME }</span>
								</a>
							</div>
							<div>
								<!-- 카드 별점 end -->
								<div class="card-star"> 
									<a href="#">
										<!-- 별 갯수 -->
										<span class="star-ratings" style="font-family: Noto_Sans_KR400; font-size: 18px;">
											<span class="star-ratings-fill space-x-2 text-lg" style="width: ${partner.AVGGRADE * 20 - 4 }%;">
												<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
											</span>
											<span class="star-ratings-base space-x-2 text-lg">
												<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
											</span>
										</span>
										<!-- 별점 평균 -->
										<span class="card-star-cnt">(${partner.AVGGRADE })</span>
									</a>
								</div>
								<!-- 카드 리뷰 -->
								<div class="card-comment">
									<a href="#">
										<span><i class="bi bi-chat-left-dots-fill card-comment-icon"></i></span>
										<span class="card-comment-cnt">(${partner.CNTREVIEW })</span>
									</a>
								</div>
							</div>
							
							<!-- 카드 가격 -->
							<div class="card-price">
								<a href="#">
									<span class="card-price-discount">50%</span>
									<span class="card-price-dismon">${partner_PARTNER_PRICE }원</span>
									<span class="card-price-money">${partner_PARTNER_PRICE * 2 }원</span>
								</a>
							</div>
							
							<!-- 구독 버튼 -->
							<c:if test="${not empty userno }">
								<span class="pick" >
									<c:if test="${board.ISPICK eq 0}">
										<button type="button" onclick="pickPart(this)" class="btn btn-primary"><i class="bi bi-heart"></i></button>
									</c:if>
									<c:if test="${board.ISPICK eq 1}">
										<button type="button" onclick="pickPart(this)" class="btn btn-primary"><i class="bi bi-heart-fill"></i></button>
									</c:if>
								</span>
							</c:if>
						</div>
						<!-- 카드 사진 이하 내용 end -->
					</div>
					<!-- card 1개 end -->
				</div>
			</div>
		</c:forEach>

	</div>
</div>

<!-- 페이징 -->
<div style="margin-bottom: 200px;"><!-- href로 링크만 넣어주면 됨 -->
	<ul class="pagination justify-content-center">
	
	   <%--첫 페이지로 이동 --%>
	   <!--1번이 아닐때 = ne  -->
	   <c:if test="${paging.curPage ne 1 }">
	      <li class="page-item"><a class="page-link" href="./list">&larr; 처음</a></li>
	   </c:if>
	   <c:if test="${paging.curPage eq 1 }">
	      <li class="page-item disabled"><a class="page-link" href="./list">&larr; 처음</a></li>
	   </c:if>
	
	   <%--이전 페이징 리스트로 이동 --%>
	<%--    <li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
	<%--    <li class="page-item"><a class="page-link" href="./list?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>
	
	   <c:if test="${paging.startPage ne 1 }">
	      <li class="page-item"><a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
	   </c:if> 
	
	   <c:if test="${paging.startPage eq 1 }">
	      <li class="page-item disabled"><a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
	   </c:if> 
	
	
	
	   <%--이전 페이지로 이동 --%>
	   <c:if test="${paging.curPage gt 1 }">
	   <li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage -1 }">&lt;</a></li>
	   </c:if>
	
	   <%--페이징 번호 리스트 --%>
	   <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	   <c:if test="${paging.curPage eq i }">
	      <li class="page-item active">
	         <a class="page-link" href="./list?curPage=${i }">${i }</a>
	      </li>
	   </c:if>
	      
	   <c:if test="${paging.curPage ne i }">
	      <li class="page-item ">
	         <a class="page-link" href="./list?curPage=${i }">${i }</a>
	      </li>
	   </c:if>
	   
	   </c:forEach>
	   
	   <%--다음 페이지로 이동 --%>
	   <c:if test="${paging.curPage lt paging.totalPage }">
	   <li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage +1 }">&gt;</a></li>
	   </c:if>
	   
	   <%--다음 페이징 리스트로 이동 --%>
	   <c:if test="${paging.endPage ne paging.totalPage}">
	      <li class="page-item"><a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
	   </c:if> 
	
	   <c:if test="${paging.endPage eq paging.totalPage }">
	      <li class="page-item disabled"><a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
	   </c:if> 
	   
	   <%--마지막 페이지로 이동 --%>
	   <c:if test="${paging.curPage ne paging.totalPage }">
	      <li class="page-item"><a class="page-link" href="./list?curPage=${paging.totalPage }">마지막&rarr; </a></li>
	   </c:if>
	   <c:if test="${paging.curPage eq paging.totalPage }">
	      <li class="page-item "><a class="page-link" > 마지막&rarr; </a></li>
	   </c:if>   
	</ul>

</div>

</div>


<c:import url="/WEB-INF/views/layout/footer.jsp" />