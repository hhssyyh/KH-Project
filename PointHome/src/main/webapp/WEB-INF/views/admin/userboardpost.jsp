<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp" />
<!-- 
<style type="text/css">
 #header, #footer {
   text-align: center;

#header h1 {
   line-height: 3em;
}

</style>

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
   

         location.href = "/freeboard/list" + "?searchType=" + searchType + "&keyword=" + keyword + "&filter=" + filter;


}
</script>

<script type="text/javascript">

</script>

<script type="text/javascript">
window.onload=function(){
   
   document.getElementById("searchBtn").onclick = function() {

      let searchType = document.getElementsByName("searchType")[0].value;
      let keyword = document.getElementsByName("keyword")[0].value;
      let filter = document.getElementsByName("filter")[0].value;
      
      console.log(searchType)
      console.log(keyword)
      
      location.href = "/freeboard/list?curPage=1" + "&searchType=" + searchType + "&keyword=" + keyword;
   }
}
</script> -->

<script type="text/javascript">

function allCheck(){
	var ac = document.querySelector(".allcheck");
	var rc = document.querySelectorAll(".rowcheck");
	
		
	if(ac.checked == true) {
		for(i=0; i<rc.length; i++) {
			rc[i].checked = true;
			
		}
		alert("전체 행이 선택되었습니다");
	}else {
		for(i=0, i<rc.length; i++) {
			
		rc[i].checked = false;
		}
	}
	alert("전체 행이 선택 해제 되었습니다");
	
}

// function removeuserpost(){
// 	var del = document.querySelector(".del");
	
// 	del.onclick = () {
		
// 		for(var i=0; i<rc.length; i++) {}
// 		if(rc[i].checked){
// 			rc[i].parentElement.parentElement.removeuserpost();
// 			}
		
		
// 		}
// 	}
	
// } 
 

$("#removeuserpost").click(function() {
	console.log("click")
}) 

</script>

<style type="text/css">
   .checkbox-table .checkbox-cell input[type="checkbox"] {
      width: 16px;
      height: 16px;
   }
</style>





<div class="container text-center">

   <h1 style="text-align: center">자유게시판</h1>

   <!-- 검색 기능 -->
 <%--   <div class="input-group mt-2">
      <select class="form-contril search-select" name="searchType">
         <option value="freeboard_title">제목</option>
         <option value="freeboard_content">내용</option>
         <option value="freeboard_titcont">제목+내용</option>
      </select>
      <input name="keyword" type="text" class="form-control"
         placeholder="검색어 입력" aria-label="search"
         aria-describedby="button-addon2" name="serchName">
         
      <button class="btn btn-info" type="button" id="searchBtn">검색</button>
   </div>


   <div id="filterDiv" style="text-align: right">
      <i class="bi bi-bar-chart-steps"></i>정렬기준 <select class="array"
         id="filter" name="filter" onchange="filterSelect()">
         <!-- 안바뀌네 -->
         <c:choose>
            <c:when test="${filter eq 'hit' }">
               <option value="date">날짜순</option>
               <option value="hit" selected>조회순</option>
               <option value="comment">댓글순</option>
               <option value="recommend">추천순</option>
            </c:when>
            <c:when test="${filter eq 'comment' }">
               <option value="date">날짜순</option>
               <option value="hit">조회순</option>
               <option value="comment" selected>댓글순</option>
               <option value="recommend">추천순</option>
            </c:when>
            <c:when test="${filter eq 'recommend' }">
               <option value="date">날짜순</option>
               <option value="hit">조회순</option>
               <option value="comment">댓글순</option>
               <option value="recommend" selected>추천순</option>
            </c:when>
            <c:otherwise>
               <option value="date" selected>날짜순</option>
               <option value="hit">조회순</option>
               <option value="comment">댓글순</option>
               <option value="recommend">추천순</option>
            </c:otherwise>
         </c:choose>
      </select> --%>

      <hr>

      <table id="listTable" class="table table-hover table-sm text-center checkbox-table">
         <thead>
            <tr>
            	<th><input type="checkbox" name="allcheck" onClick='allCheck()'/></th> 
               <th>글번호</th>
               <th>제목</th>
               <th>조회수</th>
               <th>작성일</th>
            </tr>
         </thead>
         <c:forEach var="board" items="${fblist}">
            <tr>
            	<td><input type="checkbox" name='rowcheck' value="${board.freeboardNo}" /></td> <!-- 체크박스 -->
               <td>${board.freeboardNo }</td>
               <td class="text-start"><a
                  href="/freeboard/view?freeboardNo=${board.freeboardNo }">${board.freeboardTitle }</a></td>
               <td>${board.freeboardHit }</td>
               <td><fmt:formatDate value="${board.freeboardDate }"
                     pattern="yy/MM/dd hh:mm" />
            </tr>
         </c:forEach>
      </table>

      <c:if test="${not empty adminLogin and adminLogin}">
         <!-- 작성 버튼 -->
<!--          <div class="float-end mb-3">
            <a href="./write"><button id="btnWrite" class="btn btn-info">수정</button></a>
         </div>
         <div class="clearfix"></div> -->
         
         <div class="float-end mb-3">
			<button id="btnWrite" class="del" id="removeuserpost">삭제</button>
         </div>
      </c:if>

      <c:if test="${empty adminLogin and !adminLogin}">
         <br>
         <br>
      </c:if>

   </div>
   <!-- div.container -->


   <!-- 페이징 -->
<%--    <div style="margin-bottom: 200px;">
      <!-- href로 링크만 넣어주면 됨 -->
      <ul class="pagination justify-content-center">

         첫 페이지로 이동
         <!--1번이 아닐때 = ne  -->
         <c:if test="${paging.curPage ne 1 }">
            <li class="page-item"><a class="page-link" href="./list?filter=${filter}&searchType=${searchType}&keyword=${keyword}">&larr;
                  처음</a></li>
         </c:if>
         <c:if test="${paging.curPage eq 1 }">
            <li class="page-item disabled"><a class="page-link"
               href="./list?filter=${filter}&searchType=${searchType}&keyword=${keyword}">&larr; 처음</a></li>
         </c:if>

         이전 페이징 리스트로 이동
            <li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li>
            <li class="page-item"><a class="page-link" href="./list?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li>

         <c:if test="${paging.startPage ne 1 }">
            <li class="page-item"><a class="page-link"
               href="./list?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
         </c:if>

         <c:if test="${paging.startPage eq 1 }">
            <li class="page-item disabled"><a class="page-link"
               href="./list?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
         </c:if>



         이전 페이지로 이동
         <c:if test="${paging.curPage gt 1 }">
            <li class="page-item"><a class="page-link"
               href="./list?curPage=${paging.curPage -1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&lt;</a></li>
         </c:if>

         페이징 번호 리스트
         <c:forEach var="i" begin="${paging.startPage }"
            end="${paging.endPage }">
            <c:if test="${paging.curPage eq i }">
               <li class="page-item active"><a class="page-link"
                  href="./list?curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
            </c:if>

            <c:if test="${paging.curPage ne i }">
               <li class="page-item "><a class="page-link"
                  href="./list?curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
            </c:if>

         </c:forEach>

         다음 페이지로 이동
         <c:if test="${paging.curPage lt paging.totalPage }">
            <li class="page-item"><a class="page-link"
               href="./list?curPage=${paging.curPage +1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&gt;</a></li>
         </c:if>

         다음 페이징 리스트로 이동
         <c:if test="${paging.endPage ne paging.totalPage}">
            <li class="page-item"><a class="page-link"
               href="./list?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
         </c:if>

         <c:if test="${paging.endPage eq paging.totalPage }">
            <li class="page-item disabled"><a class="page-link"
               href="./list?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
         </c:if>

         마지막 페이지로 이동
         <c:if test="${paging.curPage ne paging.totalPage }">
            <li class="page-item"><a class="page-link"
               href="./list?curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">마지막&rarr; </a></li>
         </c:if>
         <c:if test="${paging.curPage eq paging.totalPage }">
            <li class="page-item "><a class="page-link" href="./list?curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}"> 마지막&rarr; </a></li>
         </c:if>
      </ul>

   </div>

</div> --%>



<c:import url="/WEB-INF/views/layout/footer.jsp" />


