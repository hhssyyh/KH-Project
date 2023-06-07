


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- 사용자 헤더 (읽기전용)--%>
<c:if test="${not empty login and login}">
	<c:import url="/WEB-INF/views/layout/header.jsp" />

</c:if>
<%-- 제휴사 헤더 (읽기전용)--%>
<c:if test="${not empty partnerLogin and partnerLogin}">
	<c:import url="/WEB-INF/views/layout/partnerLayout/header.jsp" />
	<c:import url="/WEB-INF/views/layout/partnerLayout/sidebarContainer.jsp" />
</c:if>

<%-- 운영사헤더 --%>
<c:if test="${not empty adminLogin and adminLogin}">
	<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp" />
	<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp" />
</c:if>


<!-- 필터랑 타입 적용하여 소팅-->
<script type="text/javascript">
    var selectedFilter = "${filter}";
    var selectedType = "";

    function filterSelect() {
        var filter = $("#filter").val();

        // 제휴사 필터 선택 시
        if (filter === "p") {
            selectedType = "p";
            location.href = "./noticelist?curPage=1"+"&filter=p";
        }
        // 유저 필터 선택 시
        else if (filter === "u") {
            selectedType = "u";
            location.href = "./noticelist?curPage=1"+"&filter=u";
        }
        // 전체 필터 선택 시
        else if (filter === "a") {
            selectedType = "a";
            location.href = "./noticelist?curPage=1"+"&filter=a";
        }
    }

    $(function() {
        console.log("${paging.curPage}");
        $("#filter").val(selectedFilter);

        if (selectedFilter === "u") {
            selectedType = "u";
        } else if (selectedFilter === "p") {
            selectedType = "p";
        } else {
            selectedType = "a";
        }
    });
</script>



<style type="text/css">
#container {
	margin-left: 20%;
}
</style>



<div class="container text-center">
	<div class="table table-hover table-sm text-center pt-5">
		<c:if test="${not empty adminLogin and adminLogin}">
			<select class="mt-5" id="filter" name="filter"
				onchange="filterSelect()" style="margin-left: 1000px;">

				<c:choose>
					<c:when test="${filter eq 'p' || type eq 'p' }">
						<option value="a">전체</option>
						<option value="p" selected>제휴사</option>
						<option value="u">유저</option>
					</c:when>
					<c:when test="${filter eq 'u' || type eq 'u'} ">
						<option value="a">전체</option>
						<option value="p">제휴사</option>
						<option value="u" selected>유저</option>
					</c:when>
					<c:otherwise>
						<option value="a" selected>전체</option>
						<option value="p">제휴사</option>
						<option value="u">유저</option>
					</c:otherwise>

				</c:choose>
			</select>
		</c:if>



		<h1 style="text-align: center; margin-top: 70px">공지사항</h1>


		<hr style="margin-left: 150px;">

		<table id="listTable" class="table table-hover table-sm text-center"
			style="margin-left: 60px;">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>작성자</th>
				</tr>
			</thead>


			<c:forEach var="notice" items="${noticelist }">
				<tr>
					<td>${notice.NOTICE_NO }</td>
					<td class="text-start"><a
						href="./view?noticeNo=${notice.NOTICE_NO }">${notice.NOTICE_TITLE }</a></td>

					<td><fmt:formatDate value="${notice.NOTICE_DATE }"
							pattern="yy/MM/dd hh:mm" />
					<td>운영자</td>
				</tr>
			</c:forEach>


		</table>



		<c:if test="${not empty adminLogin and adminLogin}">
			<!-- 작성 버튼 -->
			<div class="float-end mb-3">
				<a href="/admin/writenotice"><button id="btnWrite"
						class="btn btn-info">공지사항 작성</button></a>
			</div>
			<div class="clearfix"></div>
		</c:if>

		<%--       <c:if test="${empty adminLogin and !adminLogin}">
         <br>
         <br>
      </c:if>
 --%>
	</div>
</div>
<!-- div.container -->


<!-- 페이징 -->
 <div style="margin-bottom: 200px;">
	<!-- href로 링크만 넣어주면 됨 -->
	<ul class="pagination justify-content-center">
	

		<!-- 첫 페이지로 이동 -->
		<!--1번이 아닐때 = ne  -->
		<c:if test="${paging.curPage ne 1 }">
			<li class="page-item"><a class="page-link" href="./noticelist?filter=${filter}&type=${type}">&larr;
					처음</a></li>
		</c:if>
		<c:if test="${paging.curPage eq 1 }">
			<li class="page-item disabled"><a class="page-link"
				href="./noticelist?filter=${filter}&type=${type}">&larr; 처음</a></li>
		</c:if>


		<c:if test="${paging.startPage ne 1 }">
			<li class="page-item"><a class="page-link"
				href="./noticelist?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&type=${type}">&laquo;</a></li>
		</c:if>

		<c:if test="${paging.startPage eq 1 }">
			<li class="page-item disabled"><a class="page-link"
				href="./noticelist?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&type=${type}">&laquo;</a></li>
		</c:if>



<!-- 		이전 페이지로 이동 -->
		<c:if test="${paging.curPage gt 1 }">
			<li class="page-item"><a class="page-link"
				href="./noticelist?curPage=${paging.curPage -1 }&filter=${filter}&type=${type}">&lt;</a></li>
		</c:if>

<!-- 		페이징 번호 리스트 -->
		<c:forEach var="i" begin="${paging.startPage }"
			end="${paging.endPage }">
			<c:if test="${paging.curPage eq i }">
				<li class="page-item active"><a class="page-link"
					href="./noticelist?curPage=${i }&filter=${filter}&type=${type}">${i }</a></li>
			</c:if>

			<c:if test="${paging.curPage ne i }">
				<li class="page-item "><a class="page-link"
					href="./noticelist?curPage=${i }&filter=${filter}&type=${type}">${i }</a></li>
			</c:if>

		</c:forEach>

<!-- 		다음 페이지로 이동 -->
		<c:if test="${paging.curPage lt paging.totalPage }">
			<li class="page-item"><a class="page-link"
				href="./noticelist?curPage=${paging.curPage +1 }&filter=${filter}&type=${type}">&gt;</a></li>
		</c:if>

<!-- 		다음 페이징 리스트로 이동 -->
		<c:if test="${paging.endPage ne paging.totalPage}">
			<li class="page-item"><a class="page-link"
				href="./noticelist?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&type=${type}">&raquo;</a></li>
		</c:if>

		<c:if test="${paging.endPage eq paging.totalPage }">
			<li class="page-item disabled"><a class="page-link"
				href="./noticelist?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&type=${type}">&raquo;</a></li>
		</c:if>

<!-- 		마지막 페이지로 이동 -->
	<c:if test="${paging.curPage ne paging.totalPage }">
			<li class="page-item"><a class="page-link"
				href="./noticelist?curPage=${paging.totalPage }&filter=${filter}&type=${type}">마지막&rarr; </a></li>
		</c:if>
		<c:if test="${paging.curPage eq paging.totalPage }">
			<li class="page-item "><a class="page-link"
				href="./noticelist?curPage=${paging.totalPage }&filter=${filter}&type=${type}"> 마지막&rarr; </a></li>
		</c:if>  


	</ul>

</div>  






<c:import url="../layout/footer.jsp" />