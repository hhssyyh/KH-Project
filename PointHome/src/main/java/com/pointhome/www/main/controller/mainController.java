package com.pointhome.www.main.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.main.service.face.MainService;

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
	public void detailGet(int partNo, Model model) {
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
	public void reserveDateAjaxGet(Reservation reservation, Model model) {	
		
		List<Integer> reserveList = mainService.reserveTime(reservation);
		
		logger.debug("!!!!!!!!!!!!!!!!!!!!!!!!!!{}", reservation);
		
//		mainService.insertReserveData(reservation);
		
		model.addAttribute("reserveList", reserveList);
		model.addAttribute("resDate", reservation.getResDate());
		
	}
	
	@PostMapping("/main/reserveDateAjax")
	public String reserveDateAjaxPost(Reservation res) {
		logger.debug("/main/reservation [Post]");
		
		logger.debug("!!!!!!!!!{}", res);
		
		return "./∞·¡¶";
	}
	
}

