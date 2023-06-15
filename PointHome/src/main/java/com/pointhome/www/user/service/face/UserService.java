package com.pointhome.www.user.service.face;


import java.io.IOException;
import java.util.Map;

import com.google.gson.JsonObject;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserSocial;

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

	/**
	 * 네이버에 접속하여
	 * 엑세스/ 리프레쉬 토큰을 발행
	 * @param apiURL - 토큰을 받기 위한 URL
	 * @return - AccessToken, RefreshToken 값
	 */
	public JsonObject getTokenNaver(String apiURL);

	/**
	 * 네이버에서 엑세스토큰을 이용한
	 * 사용자의 정보
	 * 
	 * @param token - 액세스토큰
	 * @return - User dto에 맞춰 파싱된 사용자 정보
	 */
	public User getUserInfoNaver(JsonObject token);

	/**
	 * 사용자의 Email & Phone을
	 * 이용한 회원가입 여부 조회
	 * 
	 * @param userInfo - 회원가입시 입력 받은 파라미터
	 * @return - [1]: 존재 | [0]: 없음
	 */
	public int getCntUserByEmailPhone(User userInfo);


	/**
	 * 사용자의 Email & Phone을
	 * 이용한 회원 정보 조회
	 * 
	 * @param userInfo
	 * @return
	 */
	public User getUserNoByEmailPhone(User userInfo);

	/**
	 * 회원가입시 추가될 다음 회원의 인덱스
	 * 
	 * @return - userNo
	 */
	public int getUserIndex();
	
	/**
	 * 소셜 회원가입의 경우
	 * 회원의 소셜ID, TYPE을 추가
	 * @param socialParam - 소셜가입시 읽어온 회원의 정보
	 */
	public void addUserSocial(UserSocial socialParam);
	
	/**
	 * 카카오톡 로그인 시 인가토큰을 가져오는 메소드
	 * @param code 로그인 하는 유저의 인가코드
	 * @return 토큰값
	 */
	public String getKakaoAccessToken (String code);
	
	/**
	 *  카카오톡으로 로그인한 사용자의 정보를 가져오는 메소드
	 * @param access_Token 액세스토큰 
	 * @return 사용자 정보
	 */
	public User getUserInfo (String access_Token);
	
	public void kakaoLogout(String access_Token);

	/**
	 * 카카오 로그인시 자체 회원가입 유무 확인
	 * @param userInfo - 카카오로부터 읽어온 사용자 정보
	 * @return 성공 [1]: 실패 [0]
	 */
	public int getCntUserByEmail(User userInfo);

	/**
	 * 카카오에서 가져온 유저정보를 통해 userno을 조회
	 * @param userInfo -카카오로부터 읽어온 사용자 정보 
	 * @return 사용자의 userno
	 */
	public User getUserNo(User userInfo);

	/**
	 * 가입한 회원의 이메일을 조회
	 * 
	 * @param param - 사용자가 입력한 Name, Phone
	 * @return - 사용자 이메일
	 */
	public User getUserEmailByNamePhone(User param);

	/**
	 * 네이버 엑세스토큰 제거하기 위한 메소드
	 * (실제 네이버 로그아웃은 아님)
	 * @param accessToken - 엑세스토큰
	 * @return 네이버URL주소
	 */
	public String createNaverLogoutURL(String accessToken);

	public String requestToServer(String logoutURL, String headerStr) throws IOException ;

	/**
	 * 회원가입시 Email 중복확인 메소드
	 * @param email - 입력된 Email 파라미터
	 * @return 조회 성공한 경우, 입력때 받은 data
	 */
	public String chkUserEmail(String email);

}