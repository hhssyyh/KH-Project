package com.pointhome.www.admin.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.admin.dto.Admin;
import com.pointhome.www.admin.dto.AdminNotice;
import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.user.dto.User;

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
	public List<AdminNotice> noticeList(char filter);
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

	
	
	
	
}
