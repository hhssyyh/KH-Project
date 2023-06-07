package com.pointhome.www.main.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.main.service.face.MainService;
import com.pointhome.www.partner.dto.Partner;

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
		Partner partner = mainService.getPartnerView(partNo);
		logger.debug("+++++++++++++++{}", partner);
		
		model.addAttribute("partNo", partNo);
		model.addAttribute("partner", partner);
	}
	
	@GetMapping("/main/review")
	public void reviewGet() {
		
	}
	
	@GetMapping("/main/notice")
	public void noticeGet() {
		
	}
	
	@GetMapping("/main/reservation")
	public void reservation(Model model, int partNo, HttpSession session ) {
		logger.debug("/main/reservation [GET]");
		
		//session uerno로 회워 이름 조회
		// session값으로 userNo 조회
		
		
		
		
		

		Partner partner = mainService.getPartnerView(partNo);
		
		model.addAttribute("partner", partner);
		model.addAttribute("partNo", partNo);
		
	}
	
	
	@GetMapping("/main/reserveDateAjax")
	public void reserveDateAjaxGet(Reservation reservation,int partnerPrice, Model model) {	
		
		List<Integer> reserveList = mainService.reserveTime(reservation);
		
		model.addAttribute("reserveList", reserveList);
		model.addAttribute("resDate", reservation.getResDate());
		model.addAttribute("partnerPrice", partnerPrice);
	}
	
	
	@GetMapping("/main/reserveComplete")
	public String reserveComplete(int partNo, Reservation res, HttpSession session, HttpServletRequest request) {
		res.setUserNo((Integer)session.getAttribute("userno"));
		
		String orderId = request.getParameter("orderId");
		String paymentKey = request.getParameter("paymentKey");
		String amount = request.getParameter("amount");
		String secretKey = "test_sk_YPBal2vxj81wD47MXPeV5RQgOAND:";
		
		logger.info(orderId);
		logger.info(paymentKey);
		logger.info(amount);
		logger.info(secretKey);
		
	    JSONObject jsonObject = null;
	      
	      Encoder encoder = Base64.getEncoder(); 
	      byte[] encodedBytes;
	      HttpURLConnection connection = null;
	      int code = 0;
	      try {
	         encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
	         String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);

	         paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);

	         URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");

	         connection = (HttpURLConnection) url.openConnection();
	         connection.setRequestProperty("Authorization", authorizations);
	         connection.setRequestProperty("Content-Type", "application/json");
	         connection.setRequestMethod("POST");
	         connection.setDoOutput(true);

	         JSONObject obj = new JSONObject();
	         obj.put("paymentKey", paymentKey);
	         obj.put("orderId", orderId);
	         obj.put("amount", amount);
	         
	         OutputStream outputStream = connection.getOutputStream();
	         outputStream.write(obj.toString().getBytes("UTF-8"));
	         
	         code = connection.getResponseCode();
	         boolean isSuccess = code == 200 ? true : false;
	         
	         InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();
	         
	         Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
	         JSONParser parser = new JSONParser();
	         jsonObject = (JSONObject) parser.parse(reader);
	         
	         responseStream.close();
	         
	            if (isSuccess) {
	                //결제 성공
	                     logger.info("결과 데이터 : {}", jsonObject.toJSONString()); 
	                     logger.info("orderName : {}", jsonObject.get("orderName")); 
	                     logger.info("method : {}", jsonObject.get("method")); 
	                        
	                     if(jsonObject.get("method").equals("카드")) {  logger.info("method : {}",(((JSONObject)jsonObject.get("card")).get("number")));}
	                     if(jsonObject.get("method").equals("가상계좌")) { logger.info("method : {}",(((JSONObject)jsonObject.get("virtualAccount")).get("accountNumber")));} 
	                     if(jsonObject.get("method").equals("계좌이체")) { logger.info("method : {}",(((JSONObject)jsonObject.get("transfer")).get("bank")));}
	                     if(jsonObject.get("method").equals("휴대폰")) { logger.info("method : {}",(((JSONObject)jsonObject.get("mobilePhone")).get("customerMobilePhone")));}     
	                           
	                    } else { 
	                   //결제 실패
	                        logger.info("method : {}", jsonObject.get("message")); 
	                        logger.info("에러코드 : {}", jsonObject.get("code") ); 
	                    }
	      } catch (UnsupportedEncodingException e) {
	         e.printStackTrace();
	      } catch (MalformedURLException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      } catch (ParseException e) {
	         e.printStackTrace();
	      }
	      
	      
	    // 주문번호 생성
	      
	      
		mainService.insertReserveData(res);
		
	//	return "redirect:/main/detail?partNo=" + partNo;
		return "redirect:/main/reserveComplete";
	}
	
	@GetMapping("/reservationComplete")
	public void reservationComplete() {
		
	}
	
}










