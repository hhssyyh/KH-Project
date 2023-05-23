package com.pointhome.www.user.dao.face;

import com.pointhome.www.user.dto.User;

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

	/**
	 * 유저 정보 조회한 다음 가져오기
	 * @param userno 
	 * @return
	 */
	public User selectByUserId(int userno);

}