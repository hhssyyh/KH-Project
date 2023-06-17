<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp"/>
<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp"/>

<style type="text/css">* {cursor: url(https://cur.cursors-4u.net/cursors/cur-7/cur610.cur), auto !important;}</style><a href="https://www.cursors-4u.com/cursor/2010/12/17/oxygen-black-11.html" target="_blank" title="Oxygen Black"><img src="https://cur.cursors-4u.net/cursor.png" border="0" alt="Oxygen Black" style="position:absolute; top: 0px; right: 0px;" /></a>
<style type="text/css">
#container {
	margin-left: 20%;
	width:90%;
	display: inline-block;
}
</style>
<style type="text/css">
#calendarDiv {
	display: flex;
 	justify-content: center;
 	align-items: center;
}

.fc-day-sun a {
 	color: red;
 	text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}
.fc-day a {
  text-decoration: none;
 }


table {
	text-align: center;
}

.modal-body .btn {
	margin-bottom: 15px;
	margin-right: 15px;
}

.tdCenter {
	position: relative;
	top: 50%;
	transform: translateY(15%);
}

.btnSelected {
	background-color: orange;
	border-color: orange;
}

.btnSelected:hover {
	background-color: orange;
	border-color: orange;
}
</style>

<script type="text/javascript">
$(".resRadio").click(function() {
	$(".resRadio").removeClass("btnSelected")
	
	$(this).addClass("btnSelected")
	
}) 


function updateReservation(th) {
	var date = $(th).parents(".listTr").find(".resdate").text()
	var time = $(th).parents(".listTr").find(".restime").text()
	var resNo = $(th).parents(".listTr").find(".resno").text()
	 var partNo = "${param.partnerNo}";
	
	location.href = "./partupdatereserve"+"?partnerNo="+partNo+"&date=" + date + "&time=" + time + "&resNo=" + resNo 
			
}
</script>

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
   var partNo = "${param.partnerNo}";
   
         location.href = "/admin/partreserve"+"?partnerNo="+partNo+ "&searchType=" + searchType + "&keyword=" + keyword + "&filter=" + filter;


}
</script>


<script type="text/javascript">
window.onload=function(){
   
   document.getElementById("searchBtn").onclick = function() {

      let searchType = document.getElementsByName("searchType")[0].value;
      let keyword = document.getElementsByName("keyword")[0].value;
      let filter = document.getElementsByName("filter")[0].value;
      let partnerNo = ${param.partnerNo};
      
      console.log(searchType)
      console.log(keyword)
      
      location.href = "/admin/partreserve?curPage=1&partnerNo="+partnerNo + "&searchType=" + searchType + "&keyword=" + keyword;
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
         <option value="user_nick">유저닉네임</option>
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
               <option value="resdateasc" selected>예약날짜(과거순)</option>
               <option value="resdatedesc">예약날짜(최신순)</option>
            </c:when>
            <c:otherwise>
               <option value="resdateasc">예약날짜(과거순)</option>
               <option value="resdatedesc" selected>예약날짜(최신순)</option>
            </c:otherwise>
         </c:choose>
      </select>

</div>
<div class="reservemanage" style="padding-right:300px; padding-top:50px;">
	<div id="container">
		<h2>예약관리</h2>
		<hr>

		<table class="table table-hover" >
			<thead style="height: 50px;">
				<tr style="background-color: #ECECEC">
					<th>번호</th>
					<th>예약고유번호</th>
					<th>유저</th>
					<th>방식</th>
					<th>예약날짜</th>
					<th>예약시간</th>
					<th>결제금액</th>
					<th></th>
				</tr>
			</thead>
			<c:forEach var="reservation" items="${partReserveList }">
				<tr class="listTr">
					<td>
						<div class="tdCenter rnum">${reservation.RNUM }</div>
						<div class="resno" style="display: none;">${reservation.RES_NO }</div>
					</td>
					<td><div class="tdCenter reserveno">${reservation.RES_RESERVENO }</div></td>
					<td><div class="tdCenter username">${reservation.USER_NAME } (${reservation.USER_EMAIL })</div></td>
					<td><div class="tdCenter resdiv">${reservation.RES_DIV }</div></td>
					<td><div class="tdCenter resdate">${reservation.RES_DATE }</div></td>
					<td><div class="tdCenter restime">
						<c:if test="${reservation.RES_TIME eq 1 }">10:00</c:if>
						<c:if test="${reservation.RES_TIME eq 2 }">10:30</c:if>
						<c:if test="${reservation.RES_TIME eq 3 }">11:00</c:if>
						<c:if test="${reservation.RES_TIME eq 4 }">11:30</c:if>
						<c:if test="${reservation.RES_TIME eq 5 }">13:00</c:if>
						<c:if test="${reservation.RES_TIME eq 6 }">13:30</c:if>
						<c:if test="${reservation.RES_TIME eq 7 }">14:00</c:if>
						<c:if test="${reservation.RES_TIME eq 8 }">14:30</c:if>
						<c:if test="${reservation.RES_TIME eq 9 }">15:00</c:if>
						<c:if test="${reservation.RES_TIME eq 10 }">15:30</c:if>
						<c:if test="${reservation.RES_TIME eq 11 }">16:00</c:if>
						<c:if test="${reservation.RES_TIME eq 12 }">16:30</c:if>
						<c:if test="${reservation.RES_TIME eq 13 }">17:00</c:if>
						<c:if test="${reservation.RES_TIME eq 14 }">17:30</c:if>
						<c:if test="${reservation.RES_TIME eq 15 }">18:00</c:if>
						<c:if test="${reservation.RES_TIME eq 16 }">18:30</c:if>
						<c:if test="${reservation.RES_TIME eq 17 }">19:00</c:if>
						<c:if test="${reservation.RES_TIME eq 18 }">19:30</c:if>
					</div></td>
					<td><div class="tdCenter resprice">${reservation.RES_PRICE }</div></td>
					<td>
						<button onclick="updateReservation(this)" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
						수정
						</button>
					</td>
				</tr>
			</c:forEach>
		</table>

	</div>

</div>


<!-- 페이징 -->
   <div style="margin-bottom: 200px; padding-top:80px;" >
      <!-- href로 링크만 넣어주면 됨 -->
      <ul class="pagination justify-content-center">

         <%--첫 페이지로 이동 --%>
         <!--1번이 아닐때 = ne  -->
         <c:if test="${paging.curPage ne 1 }">
            <li class="page-item"><a class="page-link" href="./partreserve?partnerNo=${param.partnerNo }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&larr;
                  처음</a></li>
         </c:if>
         <c:if test="${paging.curPage eq 1 }">
            <li class="page-item disabled"><a class="page-link"
               href="./partreserve?partnerNo=${param.partnerNo }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&larr; 처음</a></li>
         </c:if>


         <c:if test="${paging.startPage ne 1 }">
            <li class="page-item"><a class="page-link"
               href="./partreserve?partnerNo=${param.partnerNo }&curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
         </c:if>

         <c:if test="${paging.startPage eq 1 }">
            <li class="page-item disabled"><a class="page-link"
               href="./partreserve?partnerNo=${param.partnerNo }&curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
         </c:if>



         <%--이전 페이지로 이동 --%>
         <c:if test="${paging.curPage gt 1 }">
            <li class="page-item"><a class="page-link"
               href="./partreserve?partnerNo=${param.partnerNo }&curPage=${paging.curPage -1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&lt;</a></li>
         </c:if>

         <%--페이징 번호 리스트 --%>
         <c:forEach var="i" begin="${paging.startPage }"
            end="${paging.endPage }">
            <c:if test="${paging.curPage eq i }">
               <li class="page-item active"><a class="page-link"
                  href="./partreserve?partnerNo=${param.partnerNo }&curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
            </c:if>

            <c:if test="${paging.curPage ne i }">
               <li class="page-item "><a class="page-link"
                  href="./partreserve?partnerNo=${param.partnerNo }&curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
            </c:if>

         </c:forEach>

         <%--다음 페이지로 이동 --%>
         <c:if test="${paging.curPage lt paging.totalPage }">
            <li class="page-item"><a class="page-link"
               href="./partreserve?partnerNo=${param.partnerNo }&curPage=${paging.curPage +1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&gt;</a></li>
         </c:if>

         <%--다음 페이징 리스트로 이동 --%>
         <c:if test="${paging.endPage ne paging.totalPage}">
            <li class="page-item"><a class="page-link"
               href="./partreserve?partnerNo=${param.partnerNo }&curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
         </c:if>

         <c:if test="${paging.endPage eq paging.totalPage }">
            <li class="page-item disabled"><a class="page-link"
               href="./partreserve?partnerNo=${param.partnerNo }&curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
         </c:if>

         <%--마지막 페이지로 이동 --%>
         <c:if test="${paging.curPage ne paging.totalPage }">
            <li class="page-item"><a class="page-link"
               href="./partreserve?partnerNo=${param.partnerNo }&curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">마지막&rarr; </a></li>
         </c:if>
         <c:if test="${paging.curPage eq paging.totalPage }">
            <li class="page-item "><a class="page-link" href="./partreserve?partnerNo=${param.partnerNo }&curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}"> 마지막&rarr; </a></li>
         </c:if>
      </ul>

   </div>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />