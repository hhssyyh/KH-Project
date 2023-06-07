package com.pointhome.www.partner.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.admin.dto.AdminNotice;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerFile;
import com.pointhome.www.partner.dto.PartnerNotice;
import com.pointhome.www.partner.dto.PartnerNoticeFile;
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

	public Paging getTypePaging(Map<String, Object> pagingMap);


	/**
	 * 공지글 전체 조회
	 * @param filterchar 
	 * @return 모든 공지 게시글
	 */
	public List<PartnerNotice> noticeList(Paging paging);

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


	/**
	 * 게시글 목록을 위한 페이징 객체 생성
	 * 
	 * @param curPage- 현재페이지
	 * @return - 계산이 완료된 Paging 객체
	 */
	public Paging getPagingNotice(int curPage);

	/**
	 *제휴사 정보 가져오기 
	 * @param partnerNo - 로그인한 제휴사 세션값
	 * @return 제휴사 정보
	 */
	public Partner partnerInfo(Integer partnerNo);


    /**
    * 게시글 상세보기 
    * 
    * @param notice_no - 상세 조회할 게시글 번호 객체
    * @return 조회된 상세 게시글 객체
    */
	public PartnerNotice view(int noticeNo);
	
	   /**
	    * 게시글 번호를 이용한 업로드된 파일 정보 조회 
	    * 
	    * @param partnerNoticeNo - 조회할 게시글 번호
	    * @return 다중 첨부파일의 정보
	    */
	public List<MultipartFile> getMultiFile(int partnerNoticeNo);
		/**
	    * 뷰에 보낼 유저 정보 조회
	    * 
	    * @param partnerNo - 세션에 저장된 회원 번호
	    * @return 회원 정보
	    */
	public Partner viewPartner(int partnerNo);

//	public List<Map<String, Object>> list(Paging paging, int userNo);

	/**
	 * partnerNo으로 수정할 데이터들 가져오기
	 * 
	 * @param attribute
	 * @return
	 */
	public Partner getPartnerInfo(Integer partnerNo);

		  /**
		    * 게시판 글 삭제
		    * 
		    * @param partnerNotice- 삭제할 게시판의 객체
		    */
		
		public void delete(PartnerNotice partnerNotice);

		/**
		    * 게시글 번호를 통한 게시글 정보 조회
		    * 
		    * @param noticeNo - 게시글 번호
		    * @return 게시글 번호에 해당하는 정보 DTO
		    */
		public PartnerNotice selectNotice(int partnerNoticeNo);
		/**
		    * 게시글 번호에 해당하는 게시글 파일 목록 조회
		    * 
		    * @param noticeNo - 게시글 번호
		    * @return - 게시글 번호에 해당하는 게시글 파일 목록
		    */

		public List<PartnerNoticeFile> selectNoticeFile(int partnerNoticeNo);


		/**
	    * 게시글 정보와 파일 수정하기
	    * 
	    * @param notice - 게시글 DTO
	    * @param dataMul - 게시글 파일 리스트 DTO
	    */
		public void update(PartnerNotice partnerNotice, List<MultipartFile> dataMul);


		public void partnerShopUpdate(Partner partner);

		public List<Map<String, Object>> getPartTypePick(int curPage, Paging paging, int userNo, String partnerType);

		public PartnerFile getPartnerFile(int partNo);

		public void imgUpdate(Partner partner, MultipartFile file);




	


}
