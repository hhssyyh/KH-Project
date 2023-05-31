package com.pointhome.www.partner.service.face;

import java.util.List;
import java.util.Map;

import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.util.Paging;

public interface PartnerService {

	/**
	 * 회원가입시 파트너를 추가
	 * 
	 * @param user - 입력받은 회원 정보
	 */
	public void join(Partner partner);

	/**
	 * 로그인시, DB에 회원이 존재 유무 확인
	 * 
	 * @param partner - 입력받은 Email, Password
	 * @return - 회원일 경우 = [true]
	 */
	public Boolean isLogin(Partner partner);

	/**
	 * 로그인시, DB에서 회원의 정보 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - 회원의 정보
	 */
	public Partner getPartner(Partner partner);

	public Paging getPaging(int curPage);

	public List<Partner> list(Paging paging);

	public Paging getTypePaging(Map<String, Object> pagingMap);

	public List<Partner> typelist(Map<String, Object> listMap);

	


}
