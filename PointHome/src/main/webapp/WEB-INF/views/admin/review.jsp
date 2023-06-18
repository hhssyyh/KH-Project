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
	padding-top: 60px;
	margin-left: 27%;
	width : 1700px;
}
</style>
<style type="text/css">
   .checkbox-table .checkbox-cell input[type="checkbox"] {
      width: 16px;
      height: 16px;
   }
</style>

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
			var url = "removeReview";    
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ 
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 리뷰가 없습니다.");
		    }
		    else{
				var chk = confirm("정말 삭제하시겠습니까?");				 
				$.ajax({
				    url : url,                  
				    type : 'POST',              
				    traditional : true,
				    data : {
				    	valueArr : valueArr       
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        location.replace("review?partnerNo=" + "${param.partnerNo}");
	                    }
	                    else{
	                        alert("삭제 실패");
	                    }
	                }
				});
			}
		}
		
		
	</script>



<div style="padding-right:650px; padding-top:50px;">
	<div id="container">
	<table class="table table-hover table-bordered " >
	<thead class="table-dark" >	
		<tr>
		
			<th> <input id="allCheck" type="checkbox" name="allCheck" class="form-check-input" /></th>	
			<th>리뷰번호</th>
			<th >예약번호</th>
			<th>유저번호</th>
			<th style="width: 100px;">유저이름</th>
			<th>유저 아이디</th>
			<th style="width: 130px;">유저 닉네임</th>
			<th>리뷰내용</th>
			<th>별점</th>
			<th>작성날짜</th>
		</tr>
		</thead>
	<c:forEach var="review" items="${reList}"> 
		<tr>
		<td class="checkbox"><input name="RowCheck" type="checkbox" value="${review.REVIEW_NO}"/></td>
			<td>${review.REVIEW_NO }</td>
			<td>${review.RES_NO }</td>
			<td>${review.USER_NO }</td>
			<td>${review.USER_NAME }</td>
			<td>${review.USER_EMAIL }</td>
			<td>${review.USER_NICK }</td>
			<td>${review.REVIEW_CONTENT }</td>
			<td>${review.REVIEW_GRADE }</td>
			<td><fmt:formatDate value="${review.REVIEW_DATE}" pattern="yyyy/MM/dd HH시 mm분"/></td>
		</tr>
	</c:forEach>
		
	</table>
	      <c:if test="${not empty adminLogin and adminLogin}">    
         <div class="float-end mb-3">
         <input type="button" value="삭제" class="btn btn-dark" onclick="deleteValue();">
		</div>
	
      </c:if>
	</div>
	</div>
	
	<c:import url="/WEB-INF/views/layout/footer.jsp" />