package com.pointhome.www.user.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.service.face.UserService;

@Controller
public class userController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userService;
	
	@GetMapping("/user/join")
	public void join() {
		logger.debug("/user/join [GET]");
	}

	@PostMapping("/user/join")
	public String joinProc(User user) {
		logger.debug("/user/join [POST]");
		logger.debug("{}", user);

		userService.addUser(user);

		return "redirect:./login";
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
	public String naverCallback(HttpServletRequest request, HttpSession session) {
		logger.debug("/user/callback [GET]");
		
		String code = request.getParameter("code");
		String state = (String)session.getAttribute("state");

		String apiURL = userService.getApiURL(code, state);
		JsonObject Token = userService.getTokenNaver(apiURL);
		Map<String, Object> userInfo = userService.getUserInfoNaver(Token);				

//		userInfo.get("email");
//		User user = new User();
//		user.setUserEmail();
//		userService.getUser();
//		if( ) {
//			
//		}
//

	
		  return "redirect:/";
		  
	}
	
	
	
	@GetMapping("/user/kakaologin")
	public void kakaoLogin() {
		logger.debug("/user/kakaoLogin [GET]");
		
	}
	


}