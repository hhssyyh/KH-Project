package com.pointhome.www.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.service.face.UserService;

@Controller
@RequestMapping("/user")
public class userController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userService;
	
	@GetMapping("/join")
	public void join() {
		logger.debug("/user/join [GET]");
	}

	@PostMapping("/join")
	public String joinProc(User user) {
		logger.debug("/user/join [POST]");
		logger.debug("{}", user);

		userService.addUser(user);

		return "redirect:./login";
	}

	@GetMapping("/login")
	public void login() {
		logger.debug("/user/login [GET]");
		
	}

	@PostMapping("/login")
	public String loginProc(User Param, HttpSession session) {
		logger.debug("/user/login [POST]");
		logger.debug("{}", Param);
		
		Boolean login = userService.isLogin(Param);
		
		if (login) {
			
			User user = new User();
			user = userService.getUser(Param);
			
			session.setAttribute("login", login);
			session.setAttribute("userno", user.getUserNo());
		
		}
		
		return "redirect:/main";
		
	}



}