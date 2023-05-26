package com.pointhome.www.admin.controller;

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

import com.pointhome.www.admin.dto.Admin;
import com.pointhome.www.admin.dto.AdminNotice;
import com.pointhome.www.admin.service.face.AdminService;
import com.pointhome.www.user.dto.User;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired AdminService adminService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/main")
	public void Main() {
		logger.debug("/admin/main [GET]");
	}
	
	@GetMapping("/login")
	public void loginGet() {
		logger.debug("/admin/login [GET]");
		
	}
	
	@PostMapping("/login") 
	public String loginPost(Admin admin, HttpSession session) {
		
		logger.info("{}", admin);
	
		boolean adminChk = adminService.adminLogin(admin);
		logger.debug("{}", adminChk);
		
		if(adminChk) {
			session.setAttribute("adminSession", true);
			session.setAttribute("admin", "admin");
			return "redirect:/admin/main";  
			
		}
		return "redirect:/admin/login";
		
	}
	
	@GetMapping("/logout")
	public String logoutGet(HttpSession session) {
		logger.info("/admin/logout [GET]");
		session.invalidate();
		return "redirect:/admin/login" ;	
	}
//	회원 관리
	@GetMapping("/usermanage")
	public void usermanage(Model model) {
		logger.debug("/admin/usermanage");
		
		List<User> userList = adminService.userList();
		
		model.addAttribute("userList", userList);
		
	}
	
	// 나중에 모든 DB 어떻게 삭제할건지 정해야함
	@GetMapping("/userdelete")
	public String userdeleteGet(User userno) {
		
		logger.debug("{}", userno);
		
		adminService.admindeleteUser(userno);
		
		return "redirect:/admin/usermanage";
	}
	
	@GetMapping("/userdetail")
	public void userdetail(int userNo) {
		logger.debug("{}",userNo);
		
		adminService.userdetail(userNo);
		
		
	}
	
	@GetMapping("/noticelist")
	public void adminnotice(Model model) {
		logger.debug("/admin/noticelist");	
		
		List<AdminNotice> noticelist = adminService.noticeList();
		
		model.addAttribute("noticelist", noticelist);
	}
	
	
	
}
