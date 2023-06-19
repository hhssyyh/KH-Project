/**
 *  회원가입 정보들의 유효성 검사
 */
function fn_validate(){
		
	const Email = $('#Email');
	const userEmail = $('#userEmail');
	const userEmailSelect = $('#userEmailSelect');
	const EmailCode = $('#EmailCode');
	const Pw = $('#userPw');
	const PwChk = $('#userPwChk');
	const Nick = $('#userNick');
	const Name = $('#userName');
	const Phone = $('#userPhone');
	const BirthYear = $('#userBirthYear');
	const BirthMonth = $('#userBirthMonth');
	const BirthDay = $('#userBirthDay');
	const userPostCode = $('#userPostCode');
	const userAddress = $('#userAddress');
	const userDetailAddress = $('#userDetailAddress');
	const userExtraAddress = $('#userExtraAddress');

	const msgEmail = $('#msgEmail');
	const msgEmailCode = $('#msgEmailCode');
	const msgPw = $('#msgPw');
	const msgPwChk = $('#msgPwChk');
	const msgNick = $('#msgNick');
	const msgName = $('#msgName');	
	const msgPhone = $('#msgPhone');
	const msgBirthYear = $('#msgBirthYear');
	const msgBirthMonth = $('#msgBirthMonth');
	const msgBirthDay = $('#msgBirthDay');
	const msgPostCode = $('#msgPostCode');
	const msgAddress = $('#msgAddress');
	const msgDetailAddress = $('#msgDetailAddress');
	const msgExtraAddress = $('#msgExtraAddress');
	

	$('#Email, #userEmailSelect').on('blur', function(){
		
		const Type = "Email";
		const resultMap = fn_reg(Type, userEmail.val());
		
		console.log(resultMap);
		// 입력창이 비었을때
		if(userEmail.val() == '') {
			msgEmail.html("");
			msgEmail.html("이메일을 입력해주세요");
			msgEmail.css("color","red");
			Email.parent().parent().addClass('has-validation');
			Email.parent().addClass('is-invalid');
			Email.addClass('is-invalid');
		}
		
		// 입력창이 비었을때 비지 않았을 때
		if(userEmail.val() != ''){
			if(resultMap.regResult) {
				console.log('유효성 검증 성공 : ' + resultMap.regResult);
				msgEmail.html("");
				msgEmail.css("color","red");
				Email.parent().parent().removeClass('has-validation');
				Email.parent().removeClass('is-invalid');
				Email.removeClass('is-invalid');
			} else {
				console.log('유효성 검증 실패 : ' + resultMap.regResult);
				msgEmail.html("");
				msgEmail.html("<span>" + resultMap.msg + "</span>");
				msgEmail.css("color","red");
				Email.parent().parent().addClass('has-validation');
				Email.parent().addClass('is-invalid');
				Email.addClass('is-invalid');
			}
		}

	})

	$('#chkDupEmail').click(function() {
		
		const regType = "Email";
		const resultMap = fn_reg(regType, Email.val());
		
		const $data = {'Email':userEmail.val()};
		const type = "POST";
		const url = "/mail/chkDupEmail";
			
		$.ajax({
			type: type
			, url: url
			, data: JSON.stringify($data)
			, dataType: 'json'
			, contentType: "application/json; charset=UTF-8"
			, success: function(res){
				console.log('AJAX 성공');
				
				if (res.Email == null) {
	 				$('#input-Email-code').css('display','block');
	 				userEmailSelect.attr('readonly','readonly');
	 				userEmail.attr('readonly','readonly');
					msgEmail.html("");
					msgEmail.html("인증코드 발송, 이메일을 확인해주세요");
					msgEmail.css("color","green");
					msgEmailCode.html("인증코드 발송, 이메일을 확인해주세요");
					msgEmailCode.css('color','green');
		 			
				} else {
					console.log("해당 이메일로 가입할 수 없습니다.");
					msgEmail.html("");
					msgEmail.html("해당 이메일로 가입할 수 없습니다.");
					msgEmail.css("color","red");
					userEmail.parent().parent().addClass('has-validation');
					userEmail.parent().addClass('is-invalid');
					userEmail.addClass('is-invalid');

				}
			}  
			,  error : function(){ console.log('AJAX 실패');}
		});
		
	})

	$('#EmailCode').blur(function() {
		
		const $data = {'Email':userEmail.val(), 'EmailCode':EmailCode.val()};
		const type = "POST";
		const url = "/mail/chkEmailCode";

		$.ajax({
			type: type
			, url: url
			, data: JSON.stringify($data)
			, dataType: 'json'
			, contentType: "application/json; charset=UTF-8"
			, success: function(res){
				console.log('AJAX 성공');
				console.log(res);
				console.log('인증번호 일치');
				msgEmailCode.html("");
				msgEmailCode.html("인증번호 확인 완료");
 				EmailCode.attr('readonly','readonly');
				msgEmailCode.css("color","green");
		    }  
			,  error : function(){ 
				console.log('AJAX 실패');
				console.log('인증번호 불일치');
				msgEmailCode.html("");
				msgEmailCode.html("인증번호가 일치하지 않습니다.");
				msgEmailCode.css("color","red");
				EmailCode.addClass('has-validation');
			}
		});  
	
	})
	
	$('#userPw').blur(function(){
		
		console.log("입력된 비밀번호 : " + Pw.val());

		if(Pw.val() == '') {
			msgPw.html("");
			msgPw.html("<span>비밀번호를 입력해주세요.</span>");
			msgPw.css("color","red");
			Pw.parent().parent().addClass('has-validation');
			Pw.parent().addClass('is-invalid');
			Pw.addClass('is-invalid');
		}
		
		if(Pw.val() != '') {
	
			resultMap = fn_reg("Pw", Pw.val());
			console.log(resultMap);
			
			if(resultMap.regResult == false) {
				msgPw.html("");
				msgPw.html("<span>" + resultMap.msg + "</span>");
				msgPw.css("color","red");
				Pw.parent().parent().addClass('has-validation');
				Pw.parent().addClass('is-invalid');
				Pw.addClass('is-invalid');
			}
			if(resultMap.regResult == true) {
				msgPw.html("");
				Pw.parent().parent().removeClass('has-validation');
				Pw.parent().removeClass('is-invalid');
				Pw.removeClass('is-invalid');
				
				if(PwChk.val() != '') {
					
					if(Pw.val() != PwChk.val()){ // 비밀번호 입력값과 같지 않을때
						msgPwChk.html("");
						msgPwChk.html("<span>비밀번호가 일치하지 않습니다</span>");
						msgPwChk.css("color","red");
						PwChk.parent().parent().addClass('has-validation');
						PwChk.parent().addClass('is-invalid');
						PwChk.addClass('is-invalid');
					} else { // 비밀번호 입력값과 같을때
						msgPwChk.html("");
						PwChk.parent().parent().removeClass('has-validation');
						PwChk.parent().removeClass('is-invalid');
						PwChk.removeClass('is-invalid');
					}
					
				}

			
			}
		}
	
	})

	$('#userPwChk').blur(function(){
		
		// 입력값이 없을때
		if(PwChk.val() == '') {
			msgPwChk.html("");
			msgPwChk.html("<span>비밀번호를 입력해주세요.</span>");
			msgPwChk.css("color","red");
			PwChk.parent().parent().addClass('has-validation');
			PwChk.parent().addClass('is-invalid');
			PwChk.addClass('is-invalid');
		}
		
		// 입력값이 있을때
		if(PwChk.val() != '') {
			
			if(Pw.val() != PwChk.val()){ // 비밀번호 입력값과 같지 않을때
				msgPwChk.html("");
				msgPwChk.html("<span>비밀번호가 일치하지 않습니다</span>");
				msgPwChk.css("color","red");
				PwChk.parent().parent().addClass('has-validation');
				PwChk.parent().addClass('is-invalid');
				PwChk.addClass('is-invalid');
			} else { // 비밀번호 입력값과 같을때
				msgPwChk.html("");
				PwChk.parent().parent().removeClass('has-validation');
				PwChk.parent().removeClass('is-invalid');
				PwChk.removeClass('is-invalid');
			}
			
		}
	
	})
	
	$('#userNick').blur(function(){
		
		if(Nick.val() == ''){
			msgNick.html("");
			msgNick.html("<span>닉네임을 입력해주세요.</span>");
			msgNick.css("color","red");
			Nick.parent().parent().addClass('has-validation');
			Nick.parent().addClass('is-invalid');
			Nick.addClass('is-invalid');
						
		}

		if(Nick.val() != ''){
			resultMap = fn_reg("Nick", Nick.val());
			console.log(resultMap);
			
			if(resultMap.regResult == false) {
				msgNick.html("");
				msgNick.html("<span>" + resultMap.msg + "</span>");
				msgNick.css("color","red");
				Nick.parent().parent().addClass('has-validation');
				Nick.parent().addClass('is-invalid');
				Nick.addClass('is-invalid');
			}
			if(resultMap.regResult == true) {
				msgNick.html("");
				Nick.parent().parent().removeClass('has-validation');
				Nick.parent().removeClass('is-invalid');
				Nick.removeClass('is-invalid');
			}
		}
		
	})
	
	$('#userName').blur(function(){
		
		if(Name.val() == ''){
			msgName.html("");
			msgName.html("<span>닉네임을 입력해주세요.</span>");
			msgName.css("color","red");
			Name.parent().parent().addClass('has-validation');
			Name.parent().addClass('is-invalid');
			Name.addClass('is-invalid');
						
		}

		if(Name.val() != ''){
			resultMap = fn_reg("Name", Name.val());
			console.log(resultMap);
			
			if(resultMap.regResult == false) {
				msgName.html("");
				msgName.html("<span>" + resultMap.msg + "</span>");
				msgName.css("color","red");
				Name.parent().parent().addClass('has-validation');
				Name.parent().addClass('is-invalid');
				Name.addClass('is-invalid');
			}
			if(resultMap.regResult == true) {
				msgName.html("");
				Name.parent().parent().removeClass('has-validation');
				Name.parent().removeClass('is-invalid');
				Name.removeClass('is-invalid');
			}
		}
		
	})

	$('#userName').blur(function(){
		
		if(Name.val() == ''){
			msgName.html("");
			msgName.html("<span>이름을 입력해주세요.</span>");
			msgName.css("color","red");
			Name.parent().parent().addClass('has-validation');
			Name.parent().addClass('is-invalid');
			Name.addClass('is-invalid');
			
		}

		if(Name.val() != ''){
			resultMap = fn_reg("Name", Name.val());
			console.log(resultMap);
			
			if(resultMap.regResult == false) {
				msgName.html("");
				msgName.html("<span>" + resultMap.msg + "</span>");
				msgName.css("color","red");
				Name.parent().parent().addClass('has-validation');
				Name.parent().addClass('is-invalid');
				Name.addClass('is-invalid');
			}
			if(resultMap.regResult == true) {
				msgName.html("");
				Name.parent().parent().removeClass('has-validation');
				Name.parent().removeClass('is-invalid');
				Name.removeClass('is-invalid');
			}
		}
		
	})
	
	$('#userPhone').blur(function(){
		
		if(Phone.val() == ''){
			msgPhone.html("");
			msgPhone.html("<span>연락처를 입력해주세요.</span>");
			msgPhone.css("color","red");
			Phone.parent().parent().addClass('has-validation');
			Phone.parent().addClass('is-invalid');
			Phone.addClass('is-invalid');
						
		}

		if(Phone.val() != ''){
			
			const $data = {'userPhone':Phone.val()};
			const type = "POST";
			const url = "/user/chkPhone";
			
			resultMap = fn_reg("Phone", Phone.val());
			console.log("/user/chkPhone" + resultMap);
			
			if(resultMap.regResult == false) {
				msgPhone.html("");
				msgPhone.html("<span>" + resultMap.msg + "</span>");
				msgPhone.css("color","red");
				Phone.parent().parent().addClass('has-validation');
				Phone.parent().addClass('is-invalid');
				Phone.addClass('is-invalid');
			}
			if(resultMap.regResult == true) {
				msgPhone.html("");
				Phone.parent().parent().removeClass('has-validation');
				Phone.parent().removeClass('is-invalid');
				Phone.removeClass('is-invalid');
				
				$.ajax({
					type: type
					, url: url
					, data: JSON.stringify($data)
					, dataType: 'json'
					, contentType: "application/json; charset=UTF-8"
					, success: function(res){
						console.log('AJAX 성공');
						console.log(res);
						msgPhone.html("");
						msgPhone.html("가입에 사용된 번호입니다.");
						msgPhone.css("color","red");
						Phone.addClass('has-validation');
				    }  
					,  error : function(){ 
						console.log('AJAX 실패');
						msgPhone.html("");
						msgPhone.html("사용이 가능한 번호입니다.");
						msgPhone.css("color","green");
					}
				});  
			}
		}
		
	})

	$('#userBirthYear').blur(function(){
		
		if(BirthYear.val() == ''){
			msgBirthYear.html("");
			msgBirthYear.html("<span>생일(년)을 입력하세요.</span>");
			msgBirthYear.css("color","red");
			BirthYear.parent().parent().addClass('has-validation');
			BirthYear.parent().addClass('is-invalid');
			BirthYear.addClass('is-invalid');
						
		}

		if(BirthYear.val() != ''){
			resultMap = fn_reg("BirthYear", BirthYear.val());
			console.log(resultMap);
			
			if(resultMap.regResult == false) {
				msgBirthYear.html("");
				msgBirthYear.html("<span>" + resultMap.msg + "</span>");
				msgBirthYear.css("color","red");
				BirthYear.parent().parent().addClass('has-validation');
				BirthYear.parent().addClass('is-invalid');
				BirthYear.addClass('is-invalid');
			}
			if(resultMap.regResult == true) {
				msgBirthYear.html("");
				BirthYear.parent().parent().removeClass('has-validation');
				BirthYear.parent().removeClass('is-invalid');
				BirthYear.removeClass('is-invalid');
			}
		}
		
	})

	$('#userBirthMonth').blur(function(){
		
		if(BirthMonth.val() == ''){
			msgBirthMonth.html("");
			msgBirthMonth.html("<span>생일(년)을 입력하세요.</span>");
			msgBirthMonth.css("color","red");
			BirthMonth.parent().parent().addClass('has-validation');
			BirthMonth.parent().addClass('is-invalid');
			BirthMonth.addClass('is-invalid');
						
		}

		if(BirthMonth.val() != ''){
			msgBirthMonth.html("");
			BirthMonth.parent().parent().removeClass('has-validation');
			BirthMonth.parent().removeClass('is-invalid');
			BirthMonth.removeClass('is-invalid');
		}
		
	})

	$('#userBirthDay').blur(function(){
		
		if(BirthDay.val() == ''){
			msgBirthDay.html("");
			msgBirthDay.html("<span>생일(년)을 입력하세요.</span>");
			msgBirthDay.css("color","red");
			BirthDay.parent().parent().addClass('has-validation');
			BirthDay.parent().addClass('is-invalid');
			BirthDay.addClass('is-invalid');
						
		}

		if(BirthDay.val() != ''){
			resultMap = fn_reg("BirthDay", BirthDay.val());
			console.log(resultMap);
			
			if(resultMap.regResult == false) {
				msgBirthDay.html("");
				msgBirthDay.html("<span>" + resultMap.msg + "</span>");
				msgBirthDay.css("color","red");
				BirthDay.parent().parent().addClass('has-validation');
				BirthDay.parent().addClass('is-invalid');
				BirthDay.addClass('is-invalid');
			}
			if(resultMap.regResult == true) {
				msgBirthDay.html("");
				BirthDay.parent().parent().removeClass('has-validation');
				BirthDay.parent().removeClass('is-invalid');
				BirthDay.removeClass('is-invalid');
			}
		}
		
	})

	$('#userPostCode').blur(function(){
		
		if(userPostCode.val() == ''){
			msgPostCode.html("");
			msgPostCode.html("<span>우편번호를 입력하세요.</span>");
			msgPostCode.css("color","red");
			userPostCode.parent().parent().addClass('has-validation');
			userPostCode.parent().addClass('is-invalid');
			userPostCode.addClass('is-invalid');
						
		}

		if(userPostCode.val() != ''){
				msgPostCode.html("");
				userPostCode.parent().parent().removeClass('has-validation');
				userPostCode.parent().removeClass('is-invalid');
				userPostCode.removeClass('is-invalid');
		}
		
	})

	$('#userAddress').blur(function(){
		
		if(userAddress.val() == ''){
			msgAddress.html("");
			msgAddress.html("<span>우편번호를 입력하세요.</span>");
			msgAddress.css("color","red");
			userAddress.parent().parent().addClass('has-validation');
			userAddress.parent().addClass('is-invalid');
			userAddress.addClass('is-invalid');
						
		}

		if(userAddress.val() != ''){
				msgAddress.html("");
				userAddress.parent().parent().removeClass('has-validation');
				userAddress.parent().removeClass('is-invalid');
				userAddress.removeClass('is-invalid');
		}
		
	})

	$('#userDetailAddress').blur(function(){
		
		if(userDetailAddress.val() == ''){
			msgDetailAddress.html("");
			msgDetailAddress.html("<span>우편번호를 입력하세요.</span>");
			msgDetailAddress.css("color","red");
			userDetailAddress.parent().parent().addClass('has-validation');
			userDetailAddress.parent().addClass('is-invalid');
			userDetailAddress.addClass('is-invalid');
						
		}

		if(userDetailAddress.val() != ''){
				msgDetailAddress.html("");
				userDetailAddress.parent().parent().removeClass('has-validation');
				userDetailAddress.parent().removeClass('is-invalid');
				userDetailAddress.removeClass('is-invalid');
		}
		
	})
	
	$(document).submit(function() {
		
	})
	
}

// 정규표현식 함수
function fn_reg(type, data){
	var reg;
	var msg;
	var regResult = false;
	
	switch(type){
		case "Email" :
			reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			msg = "이메일을 확인 해 주세요.";
			break;
		case "Pw" :
			reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
			msg = "영문 대소문자, 숫자, 특수문자를 포함한 8 ~ 16자리";
			break;
		case "Nick" :
			data = fn_replace(data);
			reg = /[a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣]{3,}/;
			msg = "한글,영문포함 3글자 이상(숫자, 특수문자 제외) 입니다.";
			break;
		case "Name" :
			data = fn_replace(data);
			reg = /[a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣]{3,}/;
			msg = "이름을 올바르게 입력해 주세요.";
			break;
		case "Phone" :
			reg = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
			msg = "ex)01012345678 형식으로 입력해주세요.";
			break;
		case "BirthYear" :
			reg = /^\d{4}$/;
			msg = "생년 4자리";
			break;
		case "BirthDay" :
			reg = /^(?:0?[1-9]|[1-2]\d|3[01])$/;
			msg = "1일 ~ 31일";
			break;
	}
	
	regResult = reg.test(data);
	
	if(regResult == true){
		msg = "";
	}
	
	resultMap = {regResult : regResult, msg : msg}
	return resultMap;
}

// 공백 제거함수
function fn_replace(obj){
	var resultObj = obj.trim();
	return resultObj;	
}