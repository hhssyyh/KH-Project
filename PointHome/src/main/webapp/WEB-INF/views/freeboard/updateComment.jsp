<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
div.content {
	min-height: 300px;
}

div.fr {
	text-align: right;
}

#cmt {
	border-right: 0px;
	border-top: 0px;
	border-left: 0px;
}

.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}

.modal2 {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal2.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 500px;
	height: 100px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}

.modal2_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 500px;
	height: 100px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(0%) translateY(0%);
}
span{
	font-family: 'SBAggroL';
	white-space: nowrap;
}
button{
	font-family: 'SBAggroM';
}
.btn-info {
	font-family: 'SBAggroM';
	background-color: #7e00c2;
	border-color: transparent;
	color: white;
}
</style>


<script type="text/javascript">
$(function() {
	$(".commInput").hide()
	$(".commBtnInput").hide()
})

function updateComment(th){
	
	$(".commBtnInput").children(":nth-child(2)").each(function() {
		cancelCom(this)
	})

	var commentText = $(th).parents("tr").find(".commContent").text().trim()
	
	$(th).parents("tr").find(".commContent").hide()
	$(th).parents("tr").find(".commBtnComment").hide()
	
	$(th).parents("tr").find(".commInput").children().val( commentText )
	$(th).parents("tr").find(".commInput").show()
	$(th).parents("tr").find(".commBtnInput").show()
}

function cancelCom(th) {
	console.log("cancel")
	
	$(th).parents("tr").find(".commContent").show()
	$(th).parents("tr").find(".commBtnComment").show()
	
	$(th).parents("tr").find(".commInput").hide()
	$(th).parents("tr").find(".commBtnInput").hide()
}

function updateCom(th, commNo) {
	console.log("클릭")
	console.log(commNo)	
	console.log($(th).parents("#commentTr").find(".commUpdateContent"+commNo).val())
	
	
	var commentText = $(th).parents("#commentTr").find(".commUpdateContent"+commNo).val()
	
	console.log(commentText)
	
	if(commentText == ""){
		commentText = " "
	}
	
	$.ajax({
		type: "get"
		, url: "./updateComment"
		, dataType: "html"
		, data: {
			commNo: commNo
			, commContent: commentText
			, freeboardNo: ${board.freeboardNo} 
		}
		, success: function(data){
			$("#commentTr").html(data)
		}
		, error: function() {
			console.log("error")
		}
	})
}
</script>
		<table id="commentTr">
			<c:forEach var="boardCommentList" items="${boardCommentList}">
				<tr>
					<td><br><span>${boardCommentList.USER_NICK}&nbsp;&nbsp;</span></td>
					<td class="comm">
						<br>
						<div class="commContent" style="width: 980px;">
							<span><i class="bi bi-chat-left-text"></i>&nbsp;${boardCommentList.COMM_CONTENT}</span>
						</div>
						<div class="commInput">
							<input class="btn-info commUpdateContent${boardCommentList.COMM_NO}" type="text" name="commUpdateContent" 
							style="width: 600px; background-color: white; color: black; border: 1px solid #CCCCCC; border-radius: 5px; font-family: 'SBAggroL';">
						</div>
					</td>
					<td>
						<br><span style="font-size: 12px; vertical-align : top;">&nbsp;&nbsp;(<fmt:formatDate value="${boardCommentList.COMM_DATE}" pattern="yy/MM/dd hh:mm" />)</span>
					</td>
					<td class="commBtn">
						<c:if test="${not empty userno and userno eq boardCommentList.USER_NO || not empty adminLogin and adminLogin}">
							<br>	
							<div class="commBtnComment">
								<button type="button" onclick="updateComment(this)" class="btn btn-info btn-sm">수정</button>
								<a href="./commentDelete?commNo=${boardCommentList.COMM_NO}&freeboardNo=${board.freeboardNo}">
									<button type="button" class="btn btn-info btn-sm">삭제</button><br>
								</a>
							</div>
							<div class="commBtnInput">
								<button onclick="updateCom(this, ${boardCommentList.COMM_NO})" class="btn btn-info btn-sm">확인</button>
								<button onclick="cancelCom(this)" class="btn btn-info btn-sm">취소</button><br>
							</div>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>