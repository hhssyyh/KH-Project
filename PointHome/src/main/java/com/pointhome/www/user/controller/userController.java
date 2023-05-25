package com.pointhome.www.user.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.service.face.UserService;

@Controller
public class userController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userService;
	
	@GetMapping("/user/join")
	public void join() {
		logger.debug("/user/join [GET]");
	}

	@PostMapping("/user/join")
	public String joinProc(User user) {
		logger.debug("/user/join [POST]");
		logger.debug("{}", user);

		userService.addUser(user);

		return "redirect:./login";
	}

	@GetMapping("/user/login")
	public void login() {
		logger.debug("/user/login [GET]");
		
	}

	@PostMapping("/user/login")
	public String loginProc(User Param, HttpSession session) {
		logger.debug("/user/login [POST]");
		logger.debug("{}", Param);
		
		Boolean login = userService.isLogin(Param);
		
		if (login) {
			
			User user = new User();
			user = userService.getUser(Param);
			
			logger.debug("{}", login);
			logger.debug("{}", user.getUserNo());
			session.setAttribute("login", true);
			session.setAttribute("userno", user.getUserNo());
			
			return "redirect:/";
		}

		return "redirect:/user/login";
		
	}

	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		logger.debug("/user/logout [GET]");
		
		session.invalidate();
		
		return "redirect:/";
	}

	@GetMapping("/user/searchid")
	public void searchid() {
		logger.debug("/user/searchid [GET]");
		
	}

	@PostMapping("/user/searchid")
	public void searchidProc() {
		logger.debug("/user/searchid [POST]");
		
	}

	@GetMapping("/user/searchpw")
	public void searchpw() {
		logger.debug("/user/searchpw [GET]");
		
	}

	@PostMapping("/user/searchpw")
	public void searchpwProc() {
		logger.debug("/user/searchpw [POST]");
		
	}

	@GetMapping("/user/naverlogin")
	public ModelAndView naverlogin(HttpSession session) {
		logger.debug("/user/naverlogin [GET]");

		Map<String, Object> map = userService.getStateApiUrl();
				
	    String apiURL = (String) map.get("apiURL");
	    String state = (String) map.get("state");
	    logger.debug("{}",apiURL);
	    
	    session.setAttribute("state", state);
	    
	    // 외부 URL로 retrun
	    return new ModelAndView("redirect:" + apiURL);
	}

	@GetMapping("/user/callback")
	public String naverCallback(HttpServletRequest request, HttpSession session) {
		logger.debug("/user/callback [GET]");
		
		String code = request.getParameter("code");
		String state = (String)session.getAttribute("state");

		String apiURL = userService.getTokenNaver(code, state);
		
		String accessToken = "";
		String refreshToken = "";

		try {
			URL url = new URL(apiURL);
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			
			con.setRequestMethod("GET");
			
			int responseCode = con.getResponseCode();
			
			BufferedReader br;
			
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;
			String res = "";;

			while ((inputLine = br.readLine()) != null) {
				res += inputLine;
			}

			br.close();

			if (responseCode == 200) {
				logger.debug(res.toString());

				Gson gson = new Gson();

				JsonObject jsonObj = gson.fromJson(res, JsonObject.class);
				logger.debug("{}", jsonObj);

				accessToken = jsonObj.get("access_token").getAsString();
				refreshToken = jsonObj.get("refresh_token").getAsString();
				logger.debug("{}", accessToken);
				logger.debug("{}", refreshToken);

			}

			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
////////////////////////////////////////////////////////////////

		if(accessToken != null) { // access_token을 잘 받아왔다면

			try {

				String apiurl = "https://openapi.naver.com/v1/nid/me";
				URL url = new URL(apiurl);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
//				con.setRequestProperty("Authorization", header);
				int responseCode = con.getResponseCode();
				BufferedReader br;

				if(responseCode==200) { // 정상 호출
				  br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {  // 에러 발생
				  br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}

				String inputLine;
				StringBuffer res = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
				  res.append(inputLine);
				}

				br.close();

//				Gson gson = new Gson();
//				Object obj = gson.fromJson(res, JsonObject.class);
//				JSONObject jsonObj = (JSONObject)obj;
//				JSONObject resObj = (JSONObject)jsonObj.get("response");
//				 
				//왼쪽 변수 이름은 원하는 대로 정하면 된다. 
				//단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
//				String naverCode = (String)resObj.get("id");
//				String email = (String)resObj.get("email");
//				String name = (String)resObj.get("name");
//				String nickName = (String)resObj.get("nickname");
				
		    } catch (Exception e) {

		    	e.printStackTrace();

		    }

		}
		
		
		
		  return "redirect:/";
		  
	}
	
	
	
	@GetMapping("/user/kakaologin")
	public void kakaoLogin() {
		logger.debug("/user/kakaoLogin [GET]");
		
	}
	


}