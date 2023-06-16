package com.pointhome.www.mail.controller;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pointhome.www.mail.dto.UserEmailCode;
import com.pointhome.www.mail.service.face.MailService;

@Controller
public class MailController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MailService mailService;
	
	@PostMapping("/mail/chkDupEmail")
	@ResponseBody
	public Map<String, Object> chkDupEmail(@RequestBody Map<String, Object> jsonData) {
		logger.debug("/user/chkDupEmail [POST]");
		logger.debug("Email 중복 확인차 받은 param : {}", jsonData);

		Map<String, Object> map = new HashMap<>();

		String param = (String) jsonData.get("Email");

		String Email = mailService.chkUserEmail(param);
		logger.debug("Email 중복 확인차 검색된 Email [존재X : null] : {}", Email);
		
		// 입력받은 Eamil로 가입이 가능한 경우 메일 발송
		if (Email == null) {
			
			int authNumber = mailService.makeRandomNumber();
			logger.debug("생성된 인증 코드 : {}", authNumber);
			
			String EmailCode = mailService.joinEmail(param, authNumber);
			logger.debug("발송된 인증 코드 : {}", EmailCode);
			
			UserEmailCode userEmailCode = new UserEmailCode(param,EmailCode, null);
			mailService.addEamilCode(userEmailCode);
			
			map.put("EmailCode", EmailCode);
			logger.debug("발송된 인증 코드 : {}", map);

		}
		
		map.put("Email", Email);
		return map;
	}
	
}
