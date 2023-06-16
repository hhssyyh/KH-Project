<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
body {
	padding: 0;
	margin: 0;
	font-family: 'SBAggroL';
}

#userInfo {
	width: 1000px;
	background-color: white;
}

#line {
	border-top: 3px solid;
}

.nickBtn2 {
	width: 150px;
	font-size: 18px;
	margin-top: 24px;
	margin-right: 145px;
}

#profileImg2{
	width: 60px;
	margin-left:20px;
	
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

table  {
    border-spacing: 0;
/*     border-collapse: separate; */
}

td {
	height: 70px;
	vertical-align:middle;
	margin: 0auto;
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
			var url = "removePicklist";    
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


<div id="userInfo" class="container" style="padding: 30px; border-radius: 30px; border: 3px solid #c8c8c8;">
	 <h4><i class="bi bi-bag-heart"></i>&nbsp;&nbsp; 찜목록</h4>
	<hr id="line">
	
	<table class="table table-hover table-sm text-center checkbox-table">
		  <thead>
            <tr>
           		<th><input id="allCheck" type="checkbox" name="allCheck" class="form-check-input" /></th>	
               <th></th>
               <th></th>
               <th></th>
            </tr>
         </thead>
	<c:forEach var="list" items="${pickList}">
		<tr>
			<td class="checkbox"><input name="RowCheck" type="checkbox" value="${list.PARTNER_NO}"/></td>
			<c:choose>
				<c:when test="${list.PARTNER_IMG eq null}">
					<td><span><a href="/main/detail?partNo=${list.PARTNER_NO}"><img id="profileImg2" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></a></span></td>
				</c:when>
			<c:otherwise>
					<td><span><a href="/main/detail?partNo=${list.PARTNER_NO}"><img id="profileImg2" alt="" src="/upload/${list.PARTNER_IMG }"></a></span></td>
			</c:otherwise>
			</c:choose>
				<td>${list.PARTNER_SHOPNAME }<br>${list.PARTNER_NICK }</td>
					<c:if test="${list.PARTNER_TYPE eq 't'}">
				<td>타로 전문</td>
				</c:if>
				<c:if test="${list.PARTNER_TYPE eq 's'}">
					<td>신점 전문</td>
				</c:if>
				<c:if test="${list.PARTNER_TYPE eq 'c'}">
					<td>사주 전문</td>
				</c:if>
		</tr>
	</c:forEach>
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
      <li class="page-item"><a class="page-link" href="./mypickList">&larr; 처음</a></li>
   </c:if>
   <c:if test="${paging.curPage eq 1 }">
      <li class="page-item disabled"><a class="page-link" href="./mypickList">&larr; 처음</a></li>
   </c:if>

   <%--이전 페이징 리스트로 이동 --%>
<%--    <li class="page-item"><a class="page-link" href="./mypickList?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
<%--    <li class="page-item"><a class="page-link" href="./mypickList?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

   <c:if test="${paging.startPage ne 1 }">
      <li class="page-item"><a class="page-link" href="./mypickList?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
   </c:if> 

   <c:if test="${paging.startPage eq 1 }">
      <li class="page-item disabled"><a class="page-link" href="./mypickList?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
   </c:if> 



   <%--이전 페이지로 이동 --%>
   <c:if test="${paging.curPage gt 1 }">
   <li class="page-item"><a class="page-link" href="./mypickList?curPage=${paging.curPage -1 }">&lt;</a></li>
   </c:if>

   <%--페이징 번호 리스트 --%>
   <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
   <c:if test="${paging.curPage eq i }">
      <li class="page-item active">
         <a class="page-link" href="./mypickList?curPage=${i }">${i }</a>
      </li>
   </c:if>
      
   <c:if test="${paging.curPage ne i }">
      <li class="page-item ">
         <a class="page-link" href="./mypickList?curPage=${i }">${i }</a>
      </li>
   </c:if>
   
   </c:forEach>
   
   <%--다음 페이지로 이동 --%>
   <c:if test="${paging.curPage lt paging.totalPage }">
   <li class="page-item"><a class="page-link" href="./mypickList?curPage=${paging.curPage +1 }">&gt;</a></li>
   </c:if>
   
   <%--다음 페이징 리스트로 이동 --%>
   <c:if test="${paging.endPage ne paging.totalPage}">
      <li class="page-item"><a class="page-link" href="./mypickList?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
   </c:if> 

   <c:if test="${paging.endPage eq paging.totalPage }">
      <li class="page-item disabled"><a class="page-link" href="./mypickList?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
   </c:if> 
   
   <%--마지막 페이지로 이동 --%>
   <c:if test="${paging.curPage ne paging.totalPage }">
      <li class="page-item"><a class="page-link" href="./mypickList?curPage=${paging.totalPage }">마지막&rarr; </a></li>
   </c:if>
   <c:if test="${paging.curPage eq paging.totalPage }">
      <li class="page-item "><a class="page-link" > 마지막&rarr; </a></li>
   </c:if>   
</ul>

</div>
	
</div>
	

</div>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
















