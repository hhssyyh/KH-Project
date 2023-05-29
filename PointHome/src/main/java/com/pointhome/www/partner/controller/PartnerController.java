package com.pointhome.www.partner.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.service.face.PartnerService;
import com.pointhome.www.util.Paging;

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
	
	@GetMapping("/list")
	public void BoardList( @RequestParam(defaultValue = "0") int curPage, Model model) {
		logger.info("/freeboard/list [GET]");

		Paging paging = partnerService.getPaging(curPage);

				List<Partner> list = partnerService.list(paging);
		//		logger.info("list{}",list);
		//		model.addAttribute("list", list);

		//FreeBoard, FreeBoardComment, FreeBoardRecommend, User

//		List<Map<String, Object>> list = freeBoardService.getList(paging);
//		List<Map<String, Object>> list = partnerService.selectBoardByFilter(paging, filter);


		logger.info("!!!!!!!!!!!!!!!!{}", list);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	

	}
	



	
}
    