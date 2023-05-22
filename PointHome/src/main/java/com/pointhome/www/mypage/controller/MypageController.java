package com.pointhome.www.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@GetMapping("/view")
	public void mypage() {}
	
	
	@GetMapping("/userInfo")
	public void mypageInfo() {}
	
}
