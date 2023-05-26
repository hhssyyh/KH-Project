package com.pointhome.www.user.kakao.controller;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pointhome.www.user.service.impl.OAuthService;

@Controller
public class kakaoController {
//	@ResponseBody => Data를 리턴해주는 컨트롤러 함수 
	@Autowired
	OAuthService oAuthService;
	private static Logger logger = LoggerFactory.getLogger(kakaoController.class);

	@RequestMapping(value = "/")
	public String main() {

		return "/";
	}

	@RequestMapping(value = "/user/kakaologin")
	public String getKakaoAuthUrl(Model model, HttpSession session, @RequestParam("code") String code)
			throws Exception {
		System.out.println("code : " + code);

		String access_Token = oAuthService.getKakaoAccessToken(code);
		oAuthService.getUserInfo(access_Token);

		// 사용자정보 세션
		HashMap<String, Object> userInfo = oAuthService.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);

		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		if (userInfo.get("email") != null) {

			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("access_Token", access_Token);
			session.setAttribute("login", true);
		}
		// 로그인 상태 확인
		boolean isLoggedIn = checkKakaoLogin(session);
		System.out.println("Kakao Login Status: " + isLoggedIn);

		return "redirect:/";
	}

	// 카카오톡 로그인 상태 확인 메서드
	private boolean checkKakaoLogin(HttpSession session) {
		Object loginAttribute = session.getAttribute("login");
		if (loginAttribute != null && loginAttribute instanceof Boolean) {
			return (Boolean) loginAttribute;
		}
		return false;
	}

	@RequestMapping(value = "/user/kakaologout")
	public String kakaoLogout(HttpServletRequest request, HttpServletResponse response) {
	    String access_Token = (String) request.getSession().getAttribute("access_Token");
	    if (access_Token != null) {
	        oAuthService.kakaoLogout(access_Token);
	    }

	    // 세션 초기화
	    request.getSession().invalidate();

	    // 쿠키 삭제
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            cookie.setValue("");
	            cookie.setPath("/");
	            cookie.setMaxAge(0);
	            response.addCookie(cookie);
	        }
	    }

	    return "redirect:/";
	}

}