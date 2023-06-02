package com.pointhome.www.admin.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.admin.dto.Admin;
import com.pointhome.www.admin.dto.AdminNotice;
import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.util.Paging;

public interface AdminService {
	/**
	 * 어드민 로그인
	 * 
	 * @param admin - admin id와 pw로 로그인
	 * @return 조회 성공시 true / 실패시 false
	 */
	public boolean adminLogin(Admin admin);
	/**
	 * 전체 회원 조회
	 * 
	 * @return 모든 회원을 조회한다.
	 */
	public List<User> userList();
	/**
	 * 선택한 유저의 회원을 삭제한다.
	 * 
	 * @param userno - 선택한 회원의 userno
	 */
	public void admindeleteUser(User userno);
	
	/**
	 * 선택한 유저의 상세 조회 
	 * @param userNo - 선택한 유저
	 * @return 
	 */
	public Map<String, Object> userdetail(int userNo);
	
	/**
	 * 공지글 전체 조회
	 * @param filterchar 
	 * @return 모든 공지 게시글
	 */
	public List<AdminNotice> noticeList(char filter, Paging paging);
	/**
	 * 선택한 유저의 게시글을 조회한다.
	 * @param userno - 유저
	 * @return - 글 전체 조회 
	 */
	public List<FreeBoard> userPost(int userno);
	/**
	 *  댓글 전체 조회
	 * @param userno - 유저 번호
	 * @return 유저 번호로 조회한 전체 댓글
	 */
	public List<FreeBoardComment> userCmt(int userno);
	
	/**
	 * adminNo 조회
	 * @param admin - 사용자 번호
	 * @return 사용자 번호 조회
	 */
	public int getAdmin(Admin admin);
	
	/**
	 * 제휴사 또는 사용자에게 보여질 공지사항을 삽입한다
	 * @param adminnotice - 운영사 공지사항 정보
	 * @param dataMul 
	 * @return  삽입된 게시글 [1]: 존재 | [0]: 없음
	 */
	public void writeNotice(AdminNotice adminnotice, List<MultipartFile> dataMul);
	/**
	 * 게시글 목록을 위한 페이징 객체 생성
	 * 
	 * @param curPage- 현재페이지
	 * @return - 계산이 완료된 Paging 객체
	 */
	public Paging getPagingNotice(int curPage);
	
	/**
	 * 페이징 적용 , 필터 적용한 목록 조회
	 * 
	 * @param paging - 페이징 객체
	 * @param filter - 필터
	 * @return 페이징과 필터를 적용한 리스트 정보 
	 */
	public List<Map<String, Object>> selectAllSearch(Paging paging, char filter);
	

    /**
    * 게시글 상세보기 
    * @param noticeNo - 상세 조회할 게시글 번호 객체
    * @return 조회된 상세 게시글 객체
    */
	public AdminNotice view(int noticeNo);
	/**
	    * 게시글 번호를 이용한 업로드된 파일 정보 조회 
	    * 
	    * @param noticeNo - 조회할 게시글 번호
	    * @return 다중 첨부파일의 정보
	    */
	public List<MultipartFile> getMultiFile(int noticeNo);
	
		/**
	    * 뷰에 보낼 운영자 정보 조회
	    * 
	    * @param adminNo - 세션에 저장된 회원 번호
	    * @return 회원 정보
	    */
	public Admin viewAdmin(int adminNo);

	
	
	
	
}
