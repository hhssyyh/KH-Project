package com.pointhome.www.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.service.face.UserService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userService;
	
	public void mypage() {}
	

	@GetMapping("/userInfo")
	public void mypageInfo( Model model, HttpSession session) {
		
		int userno= Integer.parseInt((String) session.getAttribute("userno")); 
		
		  User res= userService.selectInfo(userno);
		
		  logger.debug("res{}",res);
		model.addAttribute("res", res);
	}
	
	@GetMapping("/myreserve")
	public void myreserve() {}
	
	@GetMapping("/myreservedetail")
	public void myreservedetail() {}
	
}
