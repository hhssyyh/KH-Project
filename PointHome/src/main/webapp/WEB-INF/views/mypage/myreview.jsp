<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: gold;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}

#reviewInfo {
	width: 1000px;
	background-color: 
}

body {
	font-family: 'SBAggroL';
}

.pagination {
	margin-top : 50px;
	margin-bottom : -150px;
}

.page-link {
  color: #483D8B; 
  background-color: white;
  border-color: #D2D2FF;
}

.page-item.active .page-link {
 z-index: 1;
 color: white;
 font-weight:bold;
 background-color: #A696CD;
  border-color: #CBB8EE;
 
}

.page-link:focus, .page-link:hover {
  color: white;
  background-color: #A696CD; 
  border-color: #CBB8EE;
}

td, th {
	height: 50px;
	vertical-align:middle;
}

.dBtn{
	width: 100px;
	font-size: 15px;
	color: white;
	margin: 10px;
	background-color: #FEBEBE;
	border-color: #FEBEBE;
	vertical-align:middle;
}

</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		$(function(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue(){
			var url = "removeReviewlist";    
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ 
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 글이 없습니다.");
		    }
		    else{
				var chk = confirm("정말 삭제하시겠습니까?");
				if(chk){
					$.ajax({
				    url : url,                  
				    type : 'POST',              
				    traditional : true,
				    data : {
				    	valueArr : valueArr       
				    },
	                success: function(jdata){
	                	$("#userInfo").html(jdata)
	                }
				});
					
				}
				else {
					alert("삭제 실패");
				}
			
			}
		}
</script>



<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />

<div id="userInfo" class="container" style="padding: 30px; border-radius: 30px; border: 3px solid #c8c8c8; background-color: white;">
	
	<h4 style="margin: 0;"><i class="bi bi-chat-left-text"></i> 내가 쓴 리뷰</h4>		
	<hr id="line" >

<table class="table table-hover table-sm text-center checkbox-table">

  <tbody class="table-group-divider">
    <tr>
      <th><input id="allCheck" type="checkbox" name="allCheck" class="form-check-input" /></th>	
      <th scope="col">번호</th>
      <th scope="col">제휴사 이름</th>
      <th scope="col">별점</th>
      <th scope="col">리뷰작성일자</th>
      <th scope="col">리뷰내용</th>
     </tr>

    
   	<c:forEach var="list" items="${reviewlist}">
	<tr>
		<td class="checkbox"><input name="RowCheck" type="checkbox" value="${list.REVIEW_NO}"/></td>
      <td scope="row">${list.RNUM}</td>
      <td><a href="/main/detail?partNo=${list.PART_NO }">${list.PARTNER_SHOPNAME}</a></td>
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
      <td><fmt:formatDate value="${list.REVIEW_DATE }" pattern="yy/MM/dd HH:mm"/></td>
      <td>${list.REVIEW_CONTENT }
    		<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
			<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
			<fmt:parseNumber value="${list.REVIEW_DATE.time / (1000*60*60*24)}" integerOnly="true" var="reviewDate" /><!-- 게시글 작성날짜를 숫자로 -->
			<c:if test="${today - reviewDate le 2}">
			<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
			</c:if>
      </td>
 
    </tr>
    	</c:forEach>
  
    
  </tbody>
</table>

	<div class="float-end mx-3">
       <label for="delete"><i class="bi bi-trash" ></i></label>
       <input type="button"  id="delete" style="display: none;" value="삭제" class="btn btn-outline-info" onclick="deleteValue();">
	</div>
	
	
<!-- 페이징 -->
<div style="margin-bottom: 200px;"><!-- href로 링크만 넣어주면 됨 -->
<ul class="pagination justify-content-center">

   <%--첫 페이지로 이동 --%>
   <!--1번이 아닐때 = ne  -->
   <c:if test="${paging.curPage ne 1 }">
      <li class="page-item"><a class="page-link" href="./myreview">&larr; 처음</a></li>
   </c:if>
   <c:if test="${paging.curPage eq 1 }">
      <li class="page-item disabled"><a class="page-link" href="./myreview">&larr; 처음</a></li>
   </c:if>

   <%--이전 페이징 리스트로 이동 --%>
<%--    <li class="page-item"><a class="page-link" href="./myreview?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
<%--    <li class="page-item"><a class="page-link" href="./myreview?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

   <c:if test="${paging.startPage ne 1 }">
      <li class="page-item"><a class="page-link" href="./myreview?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
   </c:if> 

   <c:if test="${paging.startPage eq 1 }">
      <li class="page-item disabled"><a class="page-link" href="./myreview?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
   </c:if> 



   <%--이전 페이지로 이동 --%>
   <c:if test="${paging.curPage gt 1 }">
   <li class="page-item"><a class="page-link" href="./myreview?curPage=${paging.curPage -1 }">&lt;</a></li>
   </c:if>

   <%--페이징 번호 리스트 --%>
   <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
   <c:if test="${paging.curPage eq i }">
      <li class="page-item active">
         <a class="page-link" href="./myreview?curPage=${i }">${i }</a>
      </li>
   </c:if>
      
   <c:if test="${paging.curPage ne i }">
      <li class="page-item ">
         <a class="page-link" href="./myreview?curPage=${i }">${i }</a>
      </li>
   </c:if>
   
   </c:forEach>
   
   <%--다음 페이지로 이동 --%>
   <c:if test="${paging.curPage lt paging.totalPage }">
   <li class="page-item"><a class="page-link" href="./myreview?curPage=${paging.curPage +1 }">&gt;</a></li>
   </c:if>
   
   <%--다음 페이징 리스트로 이동 --%>
   <c:if test="${paging.endPage ne paging.totalPage}">
      <li class="page-item"><a class="page-link" href="./myreview?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
   </c:if> 

   <c:if test="${paging.endPage eq paging.totalPage }">
      <li class="page-item disabled"><a class="page-link" href="./myreview?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
   </c:if> 
   
   <%--마지막 페이지로 이동 --%>
   <c:if test="${paging.curPage ne paging.totalPage }">
      <li class="page-item"><a class="page-link" href="./myreview?curPage=${paging.totalPage }">마지막&rarr; </a></li>
   </c:if>
   <c:if test="${paging.curPage eq paging.totalPage }">
      <li class="page-item "><a class="page-link" > 마지막&rarr; </a></li>
   </c:if>   
</ul>
</div>

</div>
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp" />














