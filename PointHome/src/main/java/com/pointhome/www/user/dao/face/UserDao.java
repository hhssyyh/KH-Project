package com.pointhome.www.user.dao.face;

import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserSocial;

public interface UserDao {

	/**
	 * 회원가입 폼으로부터 입력 받은
	 * 회원의 정보를 추가
	 * 
	 * @param user - 입력받은 회원 정보
	 * @return - 성공[1] 실패[0]
	 */
	public int insertUser(User user);

	/**
	 * 로그인시 입력받은 Eamil, Password를
	 * count로 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - 존재[1], 없음[0]
	 */
	public int selectCntByUserEmailPw(User param);

	/**
	 * 로그인시 입력받은 Eamil, Password로
	 * 회원의 정보를 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - select된 회원의 정보
	 */
	public User selectByUserEmailPw(User param);

	public User selectByUserId(int userno);

	/**
	 * Naver에서 받은 User정보를
	 * 이용한 회원 조회
	 * 
	 * @param userInfo - Naver에서 읽어온 정보 파라미터
	 * @return - [1]: 존재 | [0]: 없음
	 */
	public int selectCntByUserEmailPhone(User userInfo);

	/**
	 * 소셜로그인에 성공한 사용자의
	 * userNo을 조회
	 * 
	 * @param userInfo - 소셜로그인한 회원의 정보
	 * @return - 회원가입 되어있는 사용자의 userNo
	 */
	public int selectUserNoByEmailPhone(User userInfo);
	
	/**
	 * 회원가입시 추가될 다음 회원의 인덱스
	 * 
	 * @return - userNo
	 */
	public int selectUserIndex();

	/**
	 * 소셜 회원가입의 경우
	 * 회원의 소셜ID, TYPE을 추가
	 * @param socialParam - 소셜가입시 읽어온 회원의 정보
	 */
	public void insertUserSocial(UserSocial socialParam);

}