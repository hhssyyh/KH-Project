<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.btn-secondary {
	margin: 10px;
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

</head>
<body>

<script type="text/javascript">
$(".resRadio").click(function() {
	$(".resRadio").removeClass("btnSelected")
	$(this).addClass("btnSelected")
	
// 	$("input[name=resTime]").removeAttr("checked")
	$(this).children($("input[name=resTime]")).prop('checked', true)
}) 
</script>

<script type="text/javascript">
var resDate = $("input[name=resDate]").val()

$("#updateReserve").click(function() {
	var resTime = $("input:radio[name=resTime]:checked").val()
	var resDiv = $("input[name=resDiv]:checked").val()
   var partnerNo = "${param.partnerNo}";
	
	location.href = "./updateReserveComplete?partnerNo="+${partnerNo}+"&resNo=" + ${resNo} + "&resDate=" + resDate + "&resTime=" + resTime + "&resDiv=" + resDiv
})
</script>

</head>
<body>

	<input type="text" name="resDate" value="${resDate }" style="display: none;">

	<c:set var="dateMap" value="<%=new HashMap() %>" />
	<c:set target="${dateMap }" property="1" value="10:00" />
	<c:set target="${dateMap }" property="2" value="10:30" />
	<c:set target="${dateMap }" property="3" value="11:00" />
	<c:set target="${dateMap }" property="4" value="11:30" />
	
	<c:set target="${dateMap }" property="5" value="13:00" />
	<c:set target="${dateMap }" property="6" value="13:30" />
	<c:set target="${dateMap }" property="7" value="14:00" />
	<c:set target="${dateMap }" property="8" value="14:30" />
	<c:set target="${dateMap }" property="9" value="15:00" />
	<c:set target="${dateMap }" property="10" value="15:30" />
	<c:set target="${dateMap }" property="11" value="16:00" />
	<c:set target="${dateMap }" property="12" value="16:30" />
	<c:set target="${dateMap }" property="13" value="17:00" />
	<c:set target="${dateMap }" property="14" value="17:30" />
	<c:set target="${dateMap }" property="15" value="18:00" />
	<c:set target="${dateMap }" property="16" value="18:30" />
	<c:set target="${dateMap }" property="17" value="19:00" />
	<c:set target="${dateMap }" property="18" value="19:30" />

	<c:forEach var="i" begin="1" end="18">
		<c:if test="${i eq 1 }">
			<p>오전</p>
		</c:if>
		<c:if test="${i eq 5 }">
		   <p>오후</p>
		</c:if>	
		<c:if test="${reserveList.contains(String.valueOf(i))}">
			<label for="${i}" class="btn btn-secondary resRadio disabled">${dateMap.get(String.valueOf(i)) }</label>
   			<input type="radio" name="resTime" value="${i }" id="${i }" style="display: none;">
		</c:if>
		<c:if test="${not reserveList.contains(String.valueOf(i))}">
			<label for="${i }" class="btn btn-secondary resRadio">${dateMap.get(String.valueOf(i)) }</label>
   			<input type="radio" name="resTime" value="${i }" id="${i }" style="display: none;">
		</c:if>
	</c:forEach>
   
   <br><br>
   
   <input type="radio" class="form-check-input ms-3 me-1" name="resDiv" id="visit" value="visit"><label for="visit" class="me-2">방문</label>
   <input type="radio" class="form-check-input me-1" name="resDiv" id="video" value="video"><label for="video" class="me-2">화상전화</label>
   <input type="radio" class="form-check-input me-1" name="resDiv" id="chat" value="chat"><label for="chat">채팅</label>

	<button style="float: right;" id="updateReserve" class="btn btn-secondary">수정</button>


</body>
</html>


