package com.pointhome.www.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.service.face.UserService;
import com.pointhome.www.user.service.impl.OAuthService;

@Controller
public class userController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userService;
	@Autowired OAuthService oAuthService;
	
	@GetMapping("/user/join")
	public void join(Model model) {
		logger.debug("/user/join [GET]");

	}

	@PostMapping("/user/join")
	public String joinProc(User user) {
		logger.debug("/user/join [POST]");
		logger.debug("{}", user);
		
		int res = userService.getCntUserByEmailPhone(user);
		logger.debug("회원가입 여부 res : {}", res);
		
		if(res < 0) {
			logger.debug("회원가입한적 없음");
			
			return "/user/join";
		}

		logger.debug("회원가입한적 없음, 회원가입 진행");
		userService.addUser(user);
		
		return "redirect:user/login";

	}

	@GetMapping("/user/login")
	public void login() {
		logger.debug("/user/login [GET]");
		
	}

	@PostMapping("/user/login")
	public String loginProc(User Param, HttpSession session) {
		logger.debug("/user/login [POST]");
		logger.debug("{}", Param);
		
		Boolean login = userService.isLogin(Param);
		
		if (login) {
			
			User user = new User();
			user = userService.getUser(Param);
			
			logger.debug("{}", login);
			logger.debug("{}", user.getUserNo());
			session.setAttribute("login", true);
			session.setAttribute("userno", user.getUserNo());
			
			return "redirect:/";
		}

		return "redirect:/user/login";
		
	}

	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		logger.debug("/user/logout [GET]");
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	@GetMapping("/user/qna")
	public void qna() {}

	
//	@GetMapping("/user/")











	@GetMapping("/user/searchid")
	public void searchid() {
		logger.debug("/user/searchid [GET]");
		
	}

	@PostMapping("/user/searchid")
	public void searchidProc() {
		logger.debug("/user/searchid [POST]");
		
	}

	@GetMapping("/user/searchpw")
	public void searchpw() {
		logger.debug("/user/searchpw [GET]");
		
	}

	@PostMapping("/user/searchpw")
	public void searchpwProc() {
		logger.debug("/user/searchpw [POST]");
		
	}

	@GetMapping("/user/naverlogin")
	public ModelAndView naverlogin(HttpSession session) {
		logger.debug("/user/naverlogin [GET]");

		Map<String, Object> map = userService.getStateApiUrl();
				
	    String apiURL = (String) map.get("apiURL");
	    String state = (String) map.get("state");
	    logger.debug("{}",apiURL);
	    
	    session.setAttribute("state", state);
	    
	    // 외부 URL로 retrun
	    return new ModelAndView("redirect:" + apiURL);
	}

	@GetMapping("/user/callback")
	public String naverCallback(HttpServletRequest request, HttpSession session, Model model) {
		logger.debug("/user/callback [GET]");
		
		String code = request.getParameter("code");
		String state = (String)session.getAttribute("state");

		String apiURL = userService.getApiURL(code, state);
		JsonObject Token = userService.getTokenNaver(apiURL);
		User userInfo = userService.getUserInfoNaver(Token);				
		logger.info("Naver에서 읽어온 User정보 : {}", userInfo);
		
		int res = userService.getCntUserByEmailPhone(userInfo);
		logger.debug("회원 가입 내역 [1]있음 | [0]없음 => res : {}", res);
		
		
		if ( res > 0 ) {
			logger.debug("회원 가입내역 존재");
			
			return "redirect:/";
			
		} else {
			logger.debug("회원 가입내역 없음");
			model.addAttribute("userInfo", userInfo);
			
			return "/user/join";
		}
		
		  
	}
	
	
	
	@GetMapping("/user/kakaologin")
	public void kakaoLogin() {
		logger.debug("/user/kakaoLogin [GET]");
		
	}
	
}


