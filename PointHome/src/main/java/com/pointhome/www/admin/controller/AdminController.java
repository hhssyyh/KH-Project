package com.pointhome.www.admin.controller;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.admin.dto.Admin;
import com.pointhome.www.admin.dto.AdminNotice;
import com.pointhome.www.admin.service.face.AdminService;
import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.util.Paging;

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
		
		int adminNo = adminService.getAdmin(admin);
		logger.debug("adminNo : {}", adminNo);
		
		if(adminChk) {
			session.setAttribute("adminSession", true);
			session.setAttribute("adminNo", adminNo);
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
	
	// 나중에 모든 DB 어떻게 삭제할건지 정해야함 / 추후 개발
	@GetMapping("/userdelete")
	public String userdeleteGet(User userno) {
		
		logger.debug("{}", userno);
		
		adminService.admindeleteUser(userno);
		
		return "redirect:/admin/usermanage";
	}
	
	
	@GetMapping("/userdetail")
	public void userdetail(int userNo, Model model) {
		logger.debug("{}",userNo);
		
		Map<String, Object> detailList = adminService.userdetail(userNo);
		
		model.addAttribute("detailList", detailList);
		
	}
	
	
	
	@GetMapping("/noticelist")
	public void adminnotice(@RequestParam(defaultValue = "0") int curPage,Model model, @RequestParam(defaultValue = "a") char filter,HttpSession session) throws Exception{
		logger.debug("/admin/noticelist");	
		
		Paging paging = adminService.getPagingNotice(curPage);
		
		List<Map<String,Object>> noticelist = adminService.selectAllSearch(paging,filter);
		
//		logger.debug("noticelist{}:",noticelist);
		
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("paging",paging);
		model.addAttribute("filter", filter);
	}
	
	 @GetMapping("/view")
	   public void view(int noticeNo,Model model, HttpSession session) {
	      logger.info("/notice/view [GET]");

	      AdminNotice view = adminService.view(noticeNo);
	      model.addAttribute("view", view);
	      
	      List<MultipartFile> file = adminService.getMultiFile(noticeNo);
	      model.addAttribute("file", file);

	      Admin viewAdmin = adminService.viewAdmin(view.getAdminNo());
	      model.addAttribute("viewAdmin", viewAdmin);

	   }
	

	
	@GetMapping("/writenotice") 
	public void writeNotice() {
		logger.debug("/admin/writernotice [Get]");
		
		
	}
	
	@PostMapping("/writenotice")
	public String writeNoticePost(HttpSession session, List<MultipartFile> dataMul, AdminNotice adminnotice) {
		logger.debug("/admin/writenotice [Post]");
		
		adminnotice.setAdminNo((Integer)session.getAttribute("adminNo"));
		
		logger.info("adminNo : {}", session.getAttribute("adminNo"));
		logger.debug("dataMul : {}",dataMul);
		logger.debug("adminnotice : {}",adminnotice);
				
		adminService.writeNotice(adminnotice,dataMul);
		
		 return "redirect:/admin/noticelist";
	}
	
	


	
//	about AJAX ctr
	
	@GetMapping("/ajax/boardchkajax")
	public String boardChkAjaxGet(int userno, Model model) {
		logger.debug("/admin/ajax/boardchkajax [GET]");
		
		logger.debug("ajax - {}", userno);	
		
		List<FreeBoard> fbList = adminService.userPost(userno);
		
		model.addAttribute("fbList", fbList);
		logger.debug("{}", fbList);
		return "/admin/ajax/boardchkajax"; 
	}
	
	@GetMapping("/ajax/cmtchkajax")
	public void cmtChkAjax(int userno, Model model) {
		logger.debug("/admin/ajax/cmtchkajax [GET]");
		
		logger.debug("ajax - {}", userno);
		
		List<FreeBoardComment> cmtList = adminService.userCmt(userno);
		logger.debug("{}", cmtList);
		
		model.addAttribute("cmtList", cmtList);
	}
	
	@GetMapping("prc/prc")
	public void prcGet() {
		
	}
	
	
	
}
