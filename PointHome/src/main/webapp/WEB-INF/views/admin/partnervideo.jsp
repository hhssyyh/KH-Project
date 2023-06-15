<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp" />

<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp" />

<div style="margin-left: 400px;">
	<br>
	<br><br><br>
	<br>
	<h1>제휴사 홍보 영상</h1>
	<hr>
	<br>
	<table class="table table-hover">
		<c:forEach var="video" items="${video}">
			<tr>
				<td><iframe width="560" height="315"
						src="https://www.youtube.com/embed/${video.partnerVideoUrl}"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write;
                        encrypted-media; gyroscope; picture-in-picture; web-share"
						allowfullscreen></iframe></td>

				<td><fmt:formatDate value="${video.partnerVideoDate}"
						pattern="yy/MM/dd hh:mm" /></td>
				<td>
					<form action="partnervideodelete?partnerNo=${param.partnerNo }" method="post">
						<input type="hidden" value="${video.partnerVideoNo}"
							name="partnerVideoNo">
						<button class="btn btn-secondary">삭제</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br><br><br><br><br>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
<script>
    function inputUrl() {
        var input = document.getElementById('partnerVideoUrl').value;
        var youtubeUrl = /^(https?:\/\/)?(www\.)?youtube\.com\/watch\?v=([a-zA-Z0-9_-]{11})$/;

        if (!youtubeUrl.test(input)) {
            alert('올바른 YouTube URL이 아닙니다!');
            return false; // 폼 제출 중지
        }

        return true; // 폼 제출 계속 진행
    }

</script>
