package com.pointhome.www.mail.service.face;

public interface MailService {

	/**
	 * 회원가입시 Email 중복확인 메소드
	 * @param email - 입력된 Email 파라미터
	 * @return 조회 성공한 경우, 입력때 받은 data
	 */
	public String chkUserEmail(String email);
	
	/**
	 * 인증코드를 랜덤으로 생성하는 메소드
	 * 
	 * @return int - 인증코드 : 111111 ~ 999999 (6자리 난수)
	 */
	public int makeRandomNumber();
	
	/**
	 * 메일을 발송 메소드
	 * 
	 * @param email - 인증메일을 보낼 email
	 * @param authNumber - (int)인증코드 : 111111 ~ 999999 (6자리 난수)
	 * @return authNumber - (String)인증코드 : 111111 ~ 999999 (6자리 난수)
	 */
	public String joinEmail(String email, int authNumber);
	
}
