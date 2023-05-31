package com.pointhome.www.main.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.main.service.face.MainService;
import com.pointhome.www.partner.service.face.PartnerService;

@Controller
public class mainController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MainService mainService;

	@GetMapping("/")
	public String main() {
		logger.debug("/");
		
		return "main";
	}
	
	@GetMapping("/main/detail")
	public void detailGet( ) {
//		mainService.getPartnerView()
		
	}
	
	@GetMapping("/main/review")
	public void reviewGet() {
		
	}
	
	@GetMapping("/main/notice")
	public void noticeGet() {
		
	}
	
	@GetMapping("/main/reservation")
	public void reservation() {
		logger.debug("/main/reservation [GET]");
		
	}
	
	
	
	
	
	@GetMapping("/main/reserveDateAjax")
	public void reserveDateAjaxGet(Reservation reservation, HttpSession session) {
		
//		reservation.setUserNo((Integer)session.getAttribute("userno"));
		logger.info("!!!!!!!!!!!!{}", reservation);
		
//		mainService.getReserveTime
		
	}
	
	
	
}

