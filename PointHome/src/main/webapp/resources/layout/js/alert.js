$("#alertCnt").on('click', "#alertCk", function() {

	console.log("click")
	console.log(${userno})
	
	$.ajax({
		type: 'get',
		url : '/mypage/deleteAlert',
		dataType : 'json',
		data: { userNo: ${userno} },
		success : function(result) { console.log(result) },
		error : function(request, status, error) { console.log(error) }
	})

}