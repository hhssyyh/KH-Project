package com.pointhome.www.user.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.pointhome.www.user.dao.face.UserDao;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserSocial;
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
	public String getApiURL(String code, String state) {

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

	@Override
	public JsonObject getTokenNaver(String apiURL) {

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
				logger.debug("res : {}", res.toString());

				Gson gson = new Gson();

				JsonObject jsonObj = gson.fromJson(res, JsonObject.class);
				logger.debug("jsonObj : {}", jsonObj);

				return jsonObj;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public User getUserInfoNaver(JsonObject token) {
	
		  String host = "https://openapi.naver.com/v1/nid/me";
          
		  User user = new User();
          
          try {
        	  
              URL url = new URL(host);

              HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
              
              urlConnection.setRequestProperty("Authorization", "Bearer " + token.get("access_token"));
              urlConnection.setRequestMethod("GET");

              int responseCode = urlConnection.getResponseCode();
              logger.debug("responseCode : {} ", responseCode);

              BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
              logger.debug("br? {} :", br);
              
              String line = "";
              String res = "";
              
              while((line=br.readLine())!=null) {
                  res+=line;
              }

              logger.debug("res : {}", res);

              Gson gson = new Gson();
              
              JsonObject jsonObject = gson.fromJson(res, JsonObject.class);
              logger.debug("jsonObject : {}", jsonObject);
              
              JsonObject response = jsonObject.getAsJsonObject("response");
              logger.debug("response : {}", response);

              String email = response.get("email").getAsString().trim();
              String id = response.get("id").getAsString().trim();
              String name = response.get("name").getAsString().trim();
              String nickname = response.get("nickname").getAsString().trim();
              char gender = response.get("gender").getAsString().charAt(0);
              String phone = response.get("mobile").getAsString().replaceAll("[^0-9]", "").trim();
              int birthyear = response.get("birthyear").getAsInt();
              int birthmonth = Integer.parseInt(response.get("birthday").getAsString().split("-")[0]);
              int birthday = Integer.parseInt(response.get("birthday").getAsString().split("-")[1]);

              user.setUserEmail(email);
              user.setUserPw(id); // 최초 소셜로그인시, 소셜 고유ID를 Pw로 설정
              user.setUserName(name);
              user.setUserNick(nickname);
              user.setUserGender(gender);
              user.setUserPhone(phone);
              user.setUserBirthYear(birthyear);
              user.setUserBirthMonth(birthmonth);
              user.setUserBirthDay(birthday);
              
              br.close();

          } catch (IOException e) {
              e.printStackTrace();
          }
          
          logger.debug("user : {}", user);

          return user;
		
	}

	@Override
	public User selectInfo(int userno) {

		return userDao.selectByUserId(userno);
	}
	
	@Override
	public int getCntUserByEmailPhone(User userInfo) {
		int res = userDao.selectCntByUserEmailPhone(userInfo);
		logger.debug("res : {}", res);
		return res;
	}

	@Override
	public int getUserNoByEmailPhone(User userInfo) {
		
		return userDao.selectUserNoByEmailPhone(userInfo);
	}

	@Override
	public int getUserIndex() {
		return userDao.selectUserIndex();
	}
	@Override
	public void addUserSocial(UserSocial socialParam) {
		userDao.insertUserSocial(socialParam);
	}
}