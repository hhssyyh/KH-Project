package com.pointhome.www.mail.dao.face;

public interface MailDao {
	
	/**
	 * 사용자 회원가입시 이메일 중복 체크
	 * @param param - 조회할 Email 
	 * @return 조회된 이메일
	 */
	public String selectUserEmailByEmail(String param);

}
