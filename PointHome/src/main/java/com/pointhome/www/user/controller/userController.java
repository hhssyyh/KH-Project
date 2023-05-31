package com.pointhome.www.user.controller;


import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserSocial;
import com.pointhome.www.user.service.face.UserService;


@Controller
public class userController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userService;
	
	@GetMapping("/user/join")
	public void join(Model model) {
		logger.debug("/user/join [GET]");

	}

	@PostMapping("/user/join")
	public String joinProc(User user, UserSocial socialParam, HttpSession session) {
		logger.debug("/user/join [POST]");
		logger.debug("user : {}", user);
		logger.debug("socialParam : {}", socialParam);

		int userNo = userService.getUserIndex();

		user.setUserNo(userNo);
		logger.debug("user : {}", user);
		userService.addUser(user);
		
		if(socialParam.getSocialId() != null) {

			socialParam.setUserNo(userNo);
			logger.debug("socialParam : {}", socialParam);
			userService.addUserSocial(socialParam);
			session.setAttribute("login", true); 
			session.setAttribute("userno", socialParam.getUserNo()); 
			
			return "redirect:/";
		}
		
		return "redirect:/user/login";

	}

	@GetMapping("/user/login")
	public void login(HttpSession session) {
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
	    logger.debug("apiURL : {}",apiURL);
	    
	    session.setAttribute("state", state);
	    
	    // 외부 URL로 retrun
	    return new ModelAndView("redirect:" + apiURL);
	}
	
	@GetMapping("/user/callback")
	public String naverCallback(HttpServletRequest request, HttpSession session, Model model) {
		logger.debug("/user/callback [GET]");

		String code = request.getParameter("code");
		String state = (String)session.getAttribute("state");

//		session.invalidate();

		String apiURL = userService.getApiURL(code, state);
		JsonObject Token = userService.getTokenNaver(apiURL);
		User userInfo = userService.getUserInfoNaver(Token);				
		logger.info("Naver에서 읽어온 User정보 : {}", userInfo);
		
		int res = userService.getCntUserByEmailPhone(userInfo);
		logger.debug("회원 가입 내역 [1]있음 | [0]없음 => res : {}", res);

		if ( res < 1 ) {
			logger.debug("회원 가입내역 없음");
			model.addAttribute("userInfo", userInfo);
			model.addAttribute("socialType", 'N'); // 네이버일때, N (char)
			
			return "/user/join";
			
		} else {
			
			logger.debug("회원 가입내역 존재");
			int userno = userService.getUserNoByEmailPhone(userInfo);
			session.setAttribute("login", true); 
			session.setAttribute("userno", userno); 
			
			return "redirect:/";
		}
		
		
	}
	
	@GetMapping("/user/kakaologin")
	public ModelAndView kakaoLogin() {
		
		String apiURL= "";
		apiURL += "https://kauth.kakao.com/oauth/authorize?";
		apiURL += "response_type=code";
		apiURL += "&client_id=9bc229ac39da11c0c4922d0b6b945cad";
		apiURL += "&redirect_uri=http://localhost:8888/user/kakaocallback";
	    
	    // 외부 URL로 retrun
	    return new ModelAndView("redirect:" + apiURL);	
    }
	
	
	@RequestMapping(value = "/user/kakaocallback")
	public String getKakaoAuthUrl(Model model, HttpSession session, @RequestParam("code") String code)
			throws Exception {
		
		logger.debug("code : {} ", code);
		
		String access_Token = userService.getKakaoAccessToken(code);
		userService.getUserInfo(access_Token);

		// 사용자정보 세션
		User userInfo = userService.getUserInfo(access_Token);
		logger.debug("login Controller :{} " , userInfo);

		int res = userService.getCntUserByEmail(userInfo);
		logger.debug("res :{}",res);

		
		if(res>0) {
			logger.debug("회원정보 존재");
			
			 int userno= userService.getUserNo(userInfo);
			
			session.setAttribute("login", true);
			session.setAttribute("userno", userno);
			
			return "redirect:/";
		} else {
			logger.debug("회원정보 존재 X");
			
			model.addAttribute("userInfo",userInfo);
			model.addAttribute("socialType",'K'); //카카오로 회원가입시 K
			
			
			
			return "/user/join";
		}
		
	}

	@RequestMapping(value = "/user/kakaologout")
	public String kakaoLogout(HttpServletRequest request, HttpServletResponse response) {
	    String access_Token = (String) request.getSession().getAttribute("access_Token");
	    if (access_Token != null) {
	        userService.kakaoLogout(access_Token);
	    }

	    // 세션 초기화
	    request.getSession().invalidate();

	    // 쿠키 삭제
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            cookie.setValue("");
	            cookie.setPath("/");
	            cookie.setMaxAge(0);
	            response.addCookie(cookie);
	        }
	    }

	    return "redirect:/";
	}

	
	
	
}

