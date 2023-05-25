package com.pointhome.www.user.service.impl;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pointhome.www.user.dao.face.UserDao;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.service.face.UserService;

@Service
public class UserServiceImpl implements UserService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserDao userDao;
	
	@Override
	public void addUser(User user) {
		logger.debug( "회원가입 추가 성공[1] | 실패[0] => " + userDao.insertUser(user) );
	}

	@Override
	public Boolean isLogin(User param) {
		
		Boolean res = false;
		
		if( userDao.selectCntByUserEmailPw(param) > 0) {
			res = true;
			logger.debug("회원정보 존재 : {}", res);
		}
		
		return res;
	}

	@Override
	public User getUser(User param) {

		User user = new User();
		user = userDao.selectByUserEmailPw(param);
		logger.debug("{}", user);

		return user;
	}

	@Override
	public User selectInfo(int userno) {

		
		return userDao.selectByUserId(userno);
	}

	@Override
	public String generateState() {

	    SecureRandom random = new SecureRandom();
	    return new BigInteger(130, random).toString(32);
	}

	@Override
	public Map<String, Object> getStateApiUrl() {

		Map<String, Object> map = new HashMap<>();
		
		String callbackURL = "http://localhost:8888/user/callback";
	    String clientId = "cUmMzSZPUu5v9OklWSqJ";//애플리케이션 클라이언트 아이디값";
	    
	    String redirectURI = null;
		try {
			redirectURI = URLEncoder.encode(callbackURL, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    
		SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString(32);
	    String apiURL = "";
	    apiURL += "https://nid.naver.com/oauth2.0/authorize?response_type=code";
        apiURL += "&client_id=" + clientId;
        apiURL += "&redirect_uri=" + redirectURI;
        apiURL += "&state=" + state;
		
        map.put("state", state);
        map.put("apiURL", apiURL);
		
        logger.debug("{}", map.put("apiURL", apiURL));
		return map;
	}

	@Override
	public String getTokenNaver(String code, String state) {

		String callbackURL = "http://localhost:8888/";
		String clientId = "cUmMzSZPUu5v9OklWSqJ";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "7us20334CP";//애플리케이션 클라이언트 시크릿값";
		String redirectURI = null;

		try {
			redirectURI = URLEncoder.encode(callbackURL, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String apiURL = "";
		apiURL += "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		
		return apiURL;
	}


}