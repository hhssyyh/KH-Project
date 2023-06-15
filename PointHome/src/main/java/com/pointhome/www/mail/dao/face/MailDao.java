package com.pointhome.www.mail.dao.face;

import com.pointhome.www.mail.dto.UserEmailCode;

public interface MailDao {
	
	/**
	 * 사용자 회원가입시 이메일 중복 체크
	 * @param param - 조회할 Email 
	 * @return 조회된 이메일
	 */
	public String selectUserEmailByEmail(String param);

	/**
	 * 발송된 이메일 코드를 DB에 저장하는 메소드
	 * @param userEmailCode - 이메일 인증 코드
	 */
	public void insertEmailCode(UserEmailCode userEmailCode);
}
