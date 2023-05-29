package com.pointhome.www.user.service.face;


import java.util.Map;

import com.google.gson.JsonObject;
import com.pointhome.www.user.dto.User;

public interface UserService {

	/**
	 * 회원가입시 회원을 추가
	 * 
	 * @param user - 입력받은 회원 정보
	 */
	public void addUser(User user);

	/**
	 * 로그인시, DB에 회원이 존재 유무 확인
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - 회원일 경우 = [true]
	 */
	public Boolean isLogin(User param);

	/**
	 * 로그인시, DB에서 회원의 정보 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - 회원의 정보
	 */
	public User getUser(User param);

	/**
	 * 토큰 생성 코드
	 * 
	 * @return - 토큰 일렬 번호
	 */
	public String generateState();

	/**
	 * 네이버 로그인시
	 * 액세스토큰을 받기 위한
	 * 인가토큰 생성
	 * 
	 * @return - 네이버 apiURL
	 */
	public Map<String, Object> getStateApiUrl();

	/**
	 * 액세스 토큰을 받을 네이버 주소
	 * 
	 * @param code - apiURL에서 읽어온 code
	 * @param state - 인가토큰
	 * @return - Access토큰을 받기 위한 apiURL주소
	 */
	public String getApiURL(String code, String state);

	public JsonObject getTokenNaver(String apiURL);

	public Map<String, Object> getUserInfoNaver(JsonObject token);

	/**
	 * userno 가져와서 유저정보조회
	 * @param userno
	 * @return 이거 컨트롤러에서 안썼던데 왜 만든거야 ??????
	 */
	public User selectInfo(int userno);

}