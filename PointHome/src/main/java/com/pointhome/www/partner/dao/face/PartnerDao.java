package com.pointhome.www.partner.dao.face;

import java.util.List;

import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.util.Paging;

public interface PartnerDao {

	/**
	 * partner insert
	 * @param partner 행 삽입
	 */
	public void insertPartner(Partner partner);

	/**
	 * 이메일 번호 중복검사
	 * @param partner
	 * @return - 중복이면 1행 반환, 없으면 0
	 */

	public int selectCntByEmailPhone(Partner partner);

	/**
	 * 로그인시 입력받은 Eamil, Password를
	 * count로 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - 존재[1], 없음[0]
	 */
	public int selectCntByPartnerEmailPw(Partner partner);

	/**
	 * 로그인시 입력받은 Eamil, Password로
	 * 회원의 정보를 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - select된 회원의 정보
	 */
	public Partner selectByPartnerEmailPw(Partner partner);

	public int selectCntAll();

	public List<Partner> selectAll(Paging paging);



	

	

}
