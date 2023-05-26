package com.pointhome.www.partner.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.service.face.PartnerService;

@Controller
@RequestMapping("/partner")
public class PartnerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired PartnerService partnerService;
	
	@GetMapping("/main")
	public void main() {
		
		logger.debug("/partner/main[GET]");
	}
	
	@GetMapping("/join")
	public void join() {
		
		logger.debug("/partner/join[GET]");
	
		
	}
	@PostMapping("/join")
	public String joinProc(Partner partner) {
		logger.debug("/partner/join[POST]");
		logger.debug("partner{}",partner);
		
		partnerService.join(partner);
		
		
		return "redirect:./login";
		
	}
	
	@GetMapping("/login")
	public void login(Partner partner) {
		logger.debug("/partner/login [GET]");
		
		
	}
	@PostMapping("/login")
	public String loginProc(Partner partner, HttpSession session) {
		logger.debug("/partner/login [POST]");
		
		Boolean login= partnerService.isLogin(partner);
		logger.debug("login???{}",login);
				
		if(login) {
			Partner part = new Partner();
			part = partnerService.getPartner(partner);
			
			logger.debug("login{}:",login);
			logger.debug("partner_no{}:",part.getPartnerNo());
			
			session.setAttribute("login", true);
			session.setAttribute("partner_no", part.getPartnerNo());
			
			return "redirect:/";
		}
		return "redirect:./login";
		
		
	}
	
	@GetMapping("/pages/404-error")
	public void error() {
		
		logger.debug("/partner/error[GET]");
		
	}
	
	
	
}
