package com.pointhome.www.main.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;

import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.main.service.face.MainService;
import com.pointhome.www.mypage.service.face.MypageService;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerFile;
import com.pointhome.www.partner.service.face.PartnerService;
import com.pointhome.www.util.Paging;

@Controller
public class mainController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MainService mainService;
	@Autowired MypageService mypageService;
	@Autowired PartnerService partnerService;

	@GetMapping("/")
	public String main(HttpSession session, Model model) {
		logger.debug("/");
		
		if(session.getAttribute("login") != null) {
			int userno= (int) session.getAttribute("userno"); 
			
			int alertCnt = mypageService.getAlertCnt(userno);
			model.addAttribute( "alertCnt" , alertCnt);
		}
		
		return "main";
	}
	
	@GetMapping("/main/detail")
	public void detailGet(int partNo, @RequestParam(defaultValue = "0") int curPage, Model model, HttpSession session) {
		
		Partner partner = mainService.getPartnerView(partNo);
		PartnerFile partnerFile = partnerService.getPartnerFile(partNo);
		logger.debug("+++++++++++++++{}", partner);
		
		Paging paging = mainService.getPaging(curPage, partNo);
		List<Map<String, Object>> reviewList  = mainService.getReviewList(paging, partNo);
		
		if(session.getAttribute("userno") == null) {
			
		} else {
			int userNo = (Integer)session.getAttribute("userno");
			int isPick = mypageService.isPick(userNo, partNo);
			int alertCnt = mypageService.getAlertCnt(userNo);
			
			
			model.addAttribute("isPick", isPick);
			model.addAttribute( "alertCnt" , alertCnt);
		}
		
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("partnerFile", partnerFile);
		model.addAttribute("partNo", partNo);
		model.addAttribute("partner", partner);
	}
	
	@RequestMapping("/main/detailPick")
	public ModelAndView mypick(int partNo, 
			Model model, 
			HttpSession session,
			ModelAndView mav
			) {


		int userNo = (Integer)session.getAttribute("userno");
	
		mypageService.pickUpdate(userNo, partNo);
		
		int isPick = mypageService.isPick(userNo, partNo);
	
		if( isPick == 1 ) {
			mav.addObject("isPick", true);
		} else {
			mav.addObject("isPick", false);
		}
		
		mav.setViewName("jsonView");		
		
		return mav;
		
	}
	
	@GetMapping("/main/review")
	public void reviewGet(int partNo, @RequestParam(defaultValue = "0") int curPage, Model model) {
		Partner partner = mainService.getPartnerView(partNo);

		Paging paging = mainService.getPaging(curPage, partNo);
		List<Map<String, Object>> reviewList  = mainService.getReviewList(paging, partNo);

		logger.debug("+!+!+!+!+!!+{}", reviewList);

		model.addAttribute("partNo", partNo);
		model.addAttribute("partner", partner);
		model.addAttribute("reviewList", reviewList);
	}
	
	@GetMapping("/main/notice")
	public void noticeGet() {
		
	}
	
	@GetMapping("/main/reservation")
	public void reservation(Model model, int partNo) {
		logger.debug("/main/reservation [GET]");
		Partner partner = mainService.getPartnerView(partNo);

		model.addAttribute("partner", partner);
		model.addAttribute("partNo", partNo);
		
	}
	
	
	@GetMapping("/main/reserveDateAjax")
	public void reserveDateAjaxGet(Reservation reservation,int partnerPrice, Model model) {	
		
		List<Integer> reserveList = mainService.reserveTime(reservation);
		
		logger.debug("!!!!!!!!!!!!!!!!!!!!!!!!!!{}", reserveList);
		
		
		model.addAttribute("reserveList", reserveList);
		model.addAttribute("resDate", reservation.getResDate());
		model.addAttribute("partnerPrice", partnerPrice);
		
	}
	
	
	@GetMapping("/main/reserveComplete")
	public String reserveComplete(int partNo, Reservation res, HttpSession session) {
		res.setUserNo((Integer)session.getAttribute("userno"));
		mainService.insertReserveData(res);
		
		return "redirect:/main/detail?partNo=" + partNo;
	}
	
}










