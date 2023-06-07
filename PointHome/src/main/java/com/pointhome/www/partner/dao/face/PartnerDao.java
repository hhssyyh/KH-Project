package com.pointhome.www.partner.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.dto.PartnerFile;
import com.pointhome.www.partner.dto.PartnerNotice;
import com.pointhome.www.partner.dto.PartnerNoticeFile;
import com.pointhome.www.util.Paging;

public interface PartnerDao {

	/**
	 * partner insert
	 * 
	 * @param partner 행 삽입
	 */
	public void insertPartner(Partner partner);

	/**
	 * 이메일 번호 중복검사
	 * 
	 * @param partner
	 * @return - 중복이면 1행 반환, 없으면 0
	 */

	public int selectCntByEmailPhone(Partner partner);

	/**
	 * 로그인시 입력받은 Eamil, Password를 count로 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - 존재[1], 없음[0]
	 */
	public int selectCntByPartnerEmailPw(Partner partner);

	/**
	 * 로그인시 입력받은 Eamil, Password로 회원의 정보를 조회
	 * 
	 * @param param - 입력받은 Email, Password
	 * @return - select된 회원의 정보
	 */
	public Partner selectByPartnerEmailPw(Partner partner);

	public int selectCntTypeAll(Map<String, Object> pagingMap);


	/**
	 * 파트너 -> 유저 공지사항 조회
	 * 
	 * @param filter
	 * @return
	 */
	public List<PartnerNotice> selectAllPartnerNotice(Paging paging);

	/**
	 * 공지사항 작성폼으로부터 입력된 정보를 삽입
	 * 
	 * @param 작성한 글 정보
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
	 * 
	 * @param partner- 제휴사
	 * @return 제휴사 번호
	 */
	public int selectPartnerNo(Partner partner);

	/**
	 * 총 공지사항 게시글 수 조회
	 * 
	 * @return 총 게시글 수
	 */
	public int selectNoticeCntAll();

	/**
	 * 파트너 정보 조회
	 * 
	 * @param partnerNo -파트너 번호
	 * @return 파트너 정보 조회
	 */
	public Partner selectPartnerInfo(Integer partnerNo);

	/**
	 * 게시글 번호에 해당하는 게시글의 정보 조회
	 * 
	 * @param noticeNo - 게시글 번호
	 * @return 게시글 정보
	 */
	public PartnerNotice viewNotice(int partnerNoticeNo);

	/**
	 * 게시글 번호에 해당하는 파일 목록들 가져오기
	 * 
	 * @param partnerNoticeNo - 게시글 번호
	 * @return 게시글 번호에 해당하는 파일 목록들
	 */
	public List<MultipartFile> getMultiFiles(int partnerNoticeNo);

	/**
	 * 회원번호에 해당하는 회원 정보
	 * 
	 * @param partnerNo - 회원 번호
	 * @return 회원 정보 담은 DTO
	 */
	public Partner selectByPartnerNo(int partnerNo);

	/**
	 * 수정할 partner 정보들을 partnerNo으로 select
	 * 
	 * @param partnerNo
	 * @return
	 */
	public Partner selectPartnerByPartnerNo(Integer partnerNo);

	/**
	 * 파일 삭제
	 * 
	 * @param adminNotice - 삭제할 파일의 게시글 번호를 담은 DTO 객체
	 */
	public void deleteFile(PartnerNotice partnerNotice);

	/**
	 * 게시글 삭제
	 * 
	 * @param board - 삭제할 게시글의 번호를 담은 DTO 객체
	 */
	public void deleteNotice(PartnerNotice partnerNotice);

	/**
	 * 게시글 번호에 해당하는 게시글 정보 조회
	 * 
	 * @param partnerNoticeNo - 게시글 번호
	 * @return 게시글 정보 담은 DTO
	 */
	public PartnerNotice selectNoticebyNoticeNo(int partnerNoticeNo);
	/**
	    * 게시글 번호에 해당하는 게시글 파일 목록 조회
	    * 
	    * @param noticeNo - 게시글 번호
	    * @return - 게시글 번호에 해당하는 게시글 파일 목록
	    */

	public List<PartnerNoticeFile> selectNoticeFilebyNoticeNo(int partnerNoticeNo);
	
	/**
	    * 게시글 수정
	    * 
	    * @param notice - 게시글 정보 담은 DTO
	    */
	public void update(PartnerNotice partnerNotice);
	
	public List<Map<String, Object>> selectPartnerPick(@Param("curPage") int curPage, @Param("paging") Paging paging, @Param("userNo") int userNo, @Param("partnerType") String partnerType);

	public Partner getPartInfo(int partNo);

	public void updatePartner(Partner partner);

	public void deletePartFile(PartnerFile partnerFile);

	public void insertPartFile(PartnerFile partnerFile);

	public PartnerFile getPartnerImg(int partNo);

	

	/**
	 * 제휴사 페이지에서 보여줄 예약 리스트 가져오기
	 * @param paging 
	 * 
	 * @param partNo
	 * @return
	 */
	public List<Map<String, Object>> selectReserveList(@Param("paging") Paging paging, @Param("partNo") Integer partNo);

	/**
	 * partNo으로 reserve 갯수 select
	 * 
	 * @param partNo
	 * @return
	 */
	public int selectCntReservation(int partNo);

}
