<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp"/>
<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp"/>

<style type="text/css">* {cursor: url(https://cur.cursors-4u.net/cursors/cur-7/cur610.cur), auto !important;}</style><a href="https://www.cursors-4u.com/cursor/2010/12/17/oxygen-black-11.html" target="_blank" title="Oxygen Black"><img src="https://cur.cursors-4u.net/cursor.png" border="0" alt="Oxygen Black" style="position:absolute; top: 0px; right: 0px;" /></a>
<style type="text/css">
 #header, #footer {
   text-align: center;
}
#header h1 {
   line-height: 3em;
}

</style>
<style type="text/css">
#container {
	margin-left: 10%;
	width : 1200px;
}

  td, th {
    /* 셀 가운데 정렬 */
    text-align: center;
  }
</style>


<h4>${pay.partnerShopname }</h4>
<script type="text/javascript">
$(function() {
   console.log("${paging.curPage}")
})

function filterSelect() {
   console.log("click")

   console.log( $("#filter").val() )


   var filter = $("#filter").val();
   var searchType = "${searchType}";
   var keyword = "${keyword}";
   var partnerNo = "${param.partnerNo}";
   
         location.href = "/admin/payment?partnerNo=" +partnerNo+ "&searchType=" + searchType + "&keyword=" + keyword + "&filter=" + filter;


}
</script>


<script type="text/javascript">
window.onload=function(){
   
   document.getElementById("searchBtn").onclick = function() {

      let searchType = document.getElementsByName("searchType")[0].value;
      let keyword = document.getElementsByName("keyword")[0].value;
      let filter = document.getElementsByName("filter")[0].value;
      let partnerNo =${param.partnerNo};
      
      console.log(searchType)
      console.log(keyword)
      
      location.href = "/admin/payment?curPage=1&partnerNo=" + partnerNo+ "&searchType=" + searchType + "&keyword=" + keyword;
   }
   var input = document.getElementById("search");

   input.addEventListener("keyup", function (event) {
     if (event.keyCode === 13) {
       event.preventDefault();
       document.getElementById("searchBtn").click();
     }
   });   
}
</script>

 <!-- 검색 기능 -->
 <div style="margin-top: 0; padding-top:60px; width:85%; margin-left:200px;">
   <div class="input-group " >
      <select class="form-contril search-select" name="searchType" style="margin-left:400px;">
         <option value="user_email">유저아이디</option>
         <option value="user_name">유저이름</option>
      </select>
      <input name="keyword" type="text" placeholder="검색어 입력" aria-label="search"
   aria-describedby="button-addon2" name="serchName" id="search">
         
      <button class="btn btn-info" type="button" id="searchBtn" >검색</button>
   </div>
   
   <div id="filterDiv" style="text-align: right; padding-right:150px;" >
      <i class="bi bi-bar-chart-steps"></i>정렬기준 <select class="array"
         id="filter" name="filter" onchange="filterSelect()" >
         <c:choose>
            <c:when test="${filter eq 'resdateasc' }">
               <option value="resdateasc" selected>결제(과거순)</option>
               <option value=resdatedesc >결제(최근순)</option>
            </c:when>
            <c:otherwise>
             <option value="resdateasc" >결제(과거순)</option>
               <option value="resdatedesc" selected>결제(최근순)</option>
           </c:otherwise>
         </c:choose>
      </select>

</div>

<div style="padding-right:300px; padding-top:50px;">
	<div id="container">
	<table class="table table-hover table-bordered " >
	<thead class="table-dark" >	
		<tr>
			<th>예약번호</th>
			<th>결제번호</th>
			<th>유저번호</th>
			<th>유저이름</th>
			<th>유저아이디</th>
			<th>결제금액</th>
			<th>입금계좌</th>
			<th>결제일</th>
			
		</tr>
		</thead>
	 
<c:forEach var="pay" items="${payList}"> 
		<tr>
			<td>${pay.RES_NO }</td>
			<td>${pay.RES_RESERVENO }</td>
			<td>${pay.USER_NO }</td>
			<td>${pay.USER_NAME }</td>
			<td>${pay.USER_EMAIL }</td>
			<td>${pay.RES_PRICE }</td>
			<td>${pay.PARTNER_BANK }${pay.PARTNER_ACCOUNT }</td>
			<td>
 			 ${pay.RES_DATE.substring(0, 4)}년 ${pay.RES_DATE.substring(5, 7)}월 ${pay.RES_DATE.substring(8, 10)}일
			</td>
			
		</tr>
	</c:forEach>
		
	</table>
	      <c:if test="${not empty adminLogin and adminLogin}">    
         <div class="float-end mb-3">
         <input type="button" value="삭제" class="btn btn-outline-info" onclick="deleteValue();">
		</div>
	
      </c:if>
	</div>
	</div>
	
	
<!-- 페이징 -->
   <div style="margin-bottom: 200px; padding-top:80px;" >
      <!-- href로 링크만 넣어주면 됨 -->
      <ul class="pagination justify-content-center">

         <%--첫 페이지로 이동 --%>
         <!--1번이 아닐때 = ne  -->
         <c:if test="${paging.curPage ne 1 }">
            <li class="page-item"><a class="page-link" href="./payment?partnerNo=${param.partnerNo }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&larr;
                  처음</a></li>
         </c:if>
         <c:if test="${paging.curPage eq 1 }">
            <li class="page-item disabled"><a class="page-link"
               href="./payment?partnerNo=${param.partnerNo }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&larr; 처음</a></li>
         </c:if>

 <!--  이전 페이징 리스트로 이동 -->
         <c:if test="${paging.startPage ne 1 }">
            <li class="page-item"><a class="page-link"
               href="./payment?partnerNo=${param.partnerNo }&curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
         </c:if>

         <c:if test="${paging.startPage eq 1 }">
            <li class="page-item disabled"><a class="page-link"
               href="./payment?partnerNo=${param.partnerNo }&curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
         </c:if>



         <%--이전 페이지로 이동 --%>
         <c:if test="${paging.curPage gt 1 }">
            <li class="page-item"><a class="page-link"
               href="./payment?partnerNo=${param.partnerNo }&curPage=${paging.curPage -1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&lt;</a></li>
         </c:if>

         <%--페이징 번호 리스트 --%>
         <c:forEach var="i" begin="${paging.startPage }"
            end="${paging.endPage }">
            <c:if test="${paging.curPage eq i }">
               <li class="page-item active"><a class="page-link"
                  href="./payment?partnerNo=${param.partnerNo }&curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
            </c:if>

            <c:if test="${paging.curPage ne i }">
               <li class="page-item "><a class="page-link"
                  href="./payment?partnerNo=${param.partnerNo }&curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
            </c:if>

         </c:forEach>

         <%--다음 페이지로 이동 --%>
         <c:if test="${paging.curPage lt paging.totalPage }">
            <li class="page-item"><a class="page-link"
               href="./payment?partnerNo=${param.partnerNo }&curPage=${paging.curPage +1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&gt;</a></li>
         </c:if>

         <%--다음 페이징 리스트로 이동 --%>
         <c:if test="${paging.endPage ne paging.totalPage}">
            <li class="page-item"><a class="page-link"
               href="./payment?partnerNo=${param.partnerNo }&curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
         </c:if>

         <c:if test="${paging.endPage eq paging.totalPage }">
            <li class="page-item disabled"><a class="page-link"
               href="./payment?partnerNo=${param.partnerNo }&curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
         </c:if>

         <%--마지막 페이지로 이동 --%>
         <c:if test="${paging.curPage ne paging.totalPage }">
            <li class="page-item"><a class="page-link"
               href="./payment?partnerNo=${param.partnerNo }&curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">마지막&rarr; </a></li>
         </c:if>
         <c:if test="${paging.curPage eq paging.totalPage }">
            <li class="page-item "><a class="page-link" href="./payment?partnerNo=${param.partnerNo }&curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}"> 마지막&rarr; </a></li>
         </c:if>
      </ul>

   </div>

</div>
	
	<c:import url="/WEB-INF/views/layout/footer.jsp" />