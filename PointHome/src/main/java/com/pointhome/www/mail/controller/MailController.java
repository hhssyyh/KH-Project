package com.pointhome.www.mail.controller;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pointhome.www.mail.service.face.MailService;

@Controller
public class MailController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MailService mailService;
	
	@PostMapping("/mail/chkDupEmail")
	@ResponseBody
	public Map<String, Object> chkDupEmail(@RequestBody Map<String, Object> jsonData, HttpSession session) {
		logger.debug("/user/chkDupEmail [POST]");
		logger.debug("Email 중복 확인차 받은 param : {}", jsonData);
		
		// 결과값을 담을 map객체
		Map<String, Object> map = new HashMap<>();

		// ajax로 받은 중복확인할 Email
		String param = (String) jsonData.get("Email");

		String Email = mailService.chkUserEmail(param);
		logger.debug("Email 중복 확인차 검색된 Email [존재X : null] : {}", Email);
		
		// 입력받은 Eamil로 가입이 가능한 경우 메일 발송
		if (Email == null) {
			// 인증코드 난수 발생 메소드
			int authNumber = mailService.makeRandomNumber();
			logger.debug("생성된 인증 코드 : {}", authNumber);
			
			// 메일을 발송한 뒤의 인증코드를  저장
			String EmailCode = mailService.joinEmail(param, authNumber);
			logger.debug("발송된 인증 코드 : {}", EmailCode);

			// 인증코드를 세션에 저장
			session.setAttribute("Email", param);
			session.setAttribute("EmailCode", EmailCode);
		}
		
		map.put("Email", Email);
		return map;
	}
	
	@PostMapping("/mail/chkEmailCode")
	@ResponseBody
	public Map<String, Object> chkEmailCode(@RequestBody Map<String, Object> jsonData, HttpSession session) {
		logger.debug("/user/chkEmailCode [POST]");
		logger.debug("입력 받은 인증번호 JSON : {}", jsonData);


		// 인증번호
		String inputEmail = (String) jsonData.get("Email");
		String inputCode = (String) jsonData.get("EmailCode");
		
		// 세션에 저장된 인증번호
		String Email = (String) session.getAttribute("Email");
		String EmailCode = (String) session.getAttribute("EmailCode");
		
		if(inputCode.equals(EmailCode) && inputEmail.equals(Email)) {
			return jsonData;
		} else {
			return null;
		}
		
	}
	
	
}
