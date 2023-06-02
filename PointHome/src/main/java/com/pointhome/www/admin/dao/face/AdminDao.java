package com.pointhome.www.admin.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.admin.dto.Admin;
import com.pointhome.www.admin.dto.AdminNotice;
import com.pointhome.www.admin.dto.AdminNoticeFile;
import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.util.Paging;

public interface AdminDao {
	/**
	 * admin 로그인 값을 비교한다.
	 * @param admin - id와 pw 비교 
	 * @return 성공 1 / 실패 0
	 */
	public int selectAdminIdPw(Admin admin);
	
	/**
	 *  모든 회원 정보를 조회한다.
	 * @return 모든 회원 정보
	 */
	public List<User> selectAllUser();
	/**
	 *  회원 탈퇴
	 * @param userno - 삭제할 유저의 userno
	 */
	public void deleteUserinfo(User userno);
	/**
	 * DB에서 모든 공지 게시글 조회
	 * @return 모든 공지글 조회 
	 */
	public List<AdminNotice> selectAllAdminNotice(char filter,Paging paging);
	
	/**
	 *  해당 유저의 모든 정보 조회
	 * @param userNo - 선택한 유저
	 * @return map으로 반환
	 */
	public Map<String, Object> selectUserInfo(int userNo);
	/**
	 * 해당 유저의 게시글 조회
	 * @param userno - 해당 유저
	 * @return 해당 유저의 모든 게시글
	 */
	public List<FreeBoard> selectUserPost(int userno);
	/**
	 * 해당 유저를 통해 모든 댓글 조회
	 * @param userno - 해당 유저 
	 * @return 전체 댓글 조회
	 */
	public List<FreeBoardComment> selectUserCmt(int userno);

	/**
	 * 운영사 번호 조회
	 * @param admin - 운영사 
	 * @return 운영사 번호 
	 */
	public int selectAdminNo(Admin admin);
	
	/**
	 * 공지사항 작성폼으로부터 입력된 정보를 삽입
	 * @param  작성한 글 정보
	 * @return - 성공[1] 실패[0]
	 */
	public int insertNotice(AdminNotice adminnotice);

	/**
	 * 공지사항 작성폼에 파일 삽입
	 * 
	 * @param noticeFile
	 */
	public void insertFile(AdminNoticeFile noticeFile);


	/**
	 * 총 공지사항 게시글 수 조회
	 * 
	 * @return 총 게시글 수 
	 */
	public int selectNoticeCntAll();

	   /**
	    * 페이징과 필터적용된 게시글 목록 조회
	    * 
	    * @param paging - 페이징
	    * @param filter - 필터
	    * @return -페이징과 필터가 적용된 게시글 목록
	    */
	public List<Map<String, Object>> selectAllSearch(@Param("paging") Paging paging, @Param("filter")char filter);

	/**
	    * 게시글 번호에 해당하는 게시글의 정보 조회
	    * 
	    * @param noticeNo - 게시글 번호
	    * @return 게시글 정보
	    */
	public AdminNotice viewNotice(int noticeNo);
	
	/**
    * 게시글 번호에 해당하는 파일 목록들 가져오기
    * 
    * @param noticeNo - 게시글 번호
    * @return 게시글 번호에 해당하는 파일 목록들
    */
	public List<MultipartFile> getMultiFiles(int noticeNo);

	/**
	    * 회원번호에 해당하는 회원 정보
	    * 
	    * @param adminNo - 회원 번호
	    * @return 회원 정보 담은 DTO
	    */
	public Admin selectAllAdminNo(int adminNo);
	

	
	
	

}
