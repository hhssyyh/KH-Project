package com.pointhome.www.partner.dao.face;

import java.util.List;
import java.util.Map;

import com.pointhome.www.admin.dto.AdminNoticeFile;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerNotice;
import com.pointhome.www.partner.dto.PartnerNoticeFile;
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

	public int selectCntTypeAll(Map<String, Object> pagingMap);

	public List<Partner> selectTypeListAll(Map<String, Object> listMap);

	/**
	 * 파트너 -> 유저 공지사항 조회
	 * @param filter
	 * @return
	 */
	public List<PartnerNotice> selectAllPartnerNotice();
	/**
	 * 공지사항 작성폼으로부터 입력된 정보를 삽입
	 * @param  작성한 글 정보
	 * @return - 성공[1] 실패[0]
	 */
	public void insertNotice(PartnerNotice partnerNotice);

	/**
	 * 공지사항 작성폼에 파일 삽입
	 * 
	 * @param noticeFile
	 */
	public void insertFile(PartnerNoticeFile noticeFile);

	/**
	 * 제휴사 번호 조회
	 * @param partner- 제휴사 
	 * @return 제휴사 번호 
	 */
	public int selectPartnerNo(Partner partner);




	

	

}
