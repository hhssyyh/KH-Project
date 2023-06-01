package com.pointhome.www.mypage.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.mypage.service.face.MypageService;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserFile;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MypageService mypageService;
	
	@GetMapping("/view")
	public void view( Model model, HttpSession session) {
		logger.debug("/mypage/userinfo [GET]");
		
		int userno= (int) session.getAttribute("userno"); 
		logger.debug("userno : {}", userno);
		
		User res= mypageService.selectInfo(userno);
		
		logger.debug("res{}",res);
		model.addAttribute("res", res);
		
		
		
		UserFile userFile = mypageService.selectImg(userno);
		logger.info("userFile : {}",userFile);
		
		model.addAttribute("userFile", userFile);
		
	}
		
	
	
	@GetMapping("/userinfo")
	public void mypageInfo( Model model, HttpSession session) {
		logger.debug("/mypage/userinfo [GET]");
		
		int userno= (int) session.getAttribute("userno"); 
		logger.debug("userno : {}", userno);
		
		User res= mypageService.selectInfo(userno);
		
		logger.debug("res{}",res);
		model.addAttribute("res", res);
		
		
		
		UserFile userFile = mypageService.selectImg(userno);
		logger.info("userFile : {}",userFile);
		
		model.addAttribute("userFile", userFile);
		
	}
	
	@GetMapping("/myreserve")
	public void myreserve() {}
	
	@GetMapping("/myreservedetail")
	public void myreservedetail() {}
	
	@RequestMapping("/mypick")
	public void mypick(int partnerNo, Model model, HttpSession session) {

		int userNo = (Integer)session.getAttribute("userno");
		mypageService.pickUpdate(userNo, partnerNo);
		
		int isPick = mypageService.isPick(userNo, partnerNo);
		
		model.addAttribute("isPick", isPick);
		
		
	}
	
	@GetMapping("/myreview")
	public void myreview() {}
	
	
	@GetMapping("/serviceCenter")
	public void mypageService() {}

	@PostMapping("/update")
	public String userEdit(User user, MultipartFile file, HttpSession session, Model model) {
		
		int userno= (int) session.getAttribute("userno"); 
		
		logger.info("{}", userno);
		logger.info("{}", file);
		
		user.setUserNo(userno);
		logger.info("{}", user);
		
		mypageService.update(user, file);
		
		
		
		model.addAttribute("profile", file);
		model.addAttribute("user", user);
		
		
		return "redirect:./view";
	}
	
	@RequestMapping("/removeUser")
	public String userRemove(HttpSession session) {
		
		int userno= (int) session.getAttribute("userno"); 
		logger.debug("userno : {}", userno);
		
		mypageService.delete(userno);
		
		Object object = session.getAttribute("login");
		if(object != null ) {
			session.removeAttribute("login");
			session.invalidate();
		}

		
		return "redirect:/";
	}
	
	
	
	
}
