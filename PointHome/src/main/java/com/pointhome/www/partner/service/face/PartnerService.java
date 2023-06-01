package com.pointhome.www.partner.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.admin.dto.AdminNotice;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerNotice;
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

	/**
	 * 공지글 전체 조회
	 * @param filterchar 
	 * @return 모든 공지 게시글
	 */
	public List<PartnerNotice> noticeList();

	/**
	 * 제휴사 또는 사용자에게 보여질 공지사항을 삽입한다
	 * @param partnerNotice - 운영사 공지사항 정보
	 * @param dataMul 
	 * @return  삽입된 게시글 [1]: 존재 | [0]: 없음
	 */
	public void writeNotice(PartnerNotice partnerNotice, List<MultipartFile> dataMul);

	/**
	 * partnerNo 조회
	 * @param partnerNo - 사용자 번호
	 * @return 제휴사 번호 조회
	 */
	public int getPartnerNoByEmail(Partner partner);

	


}
