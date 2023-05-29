package com.pointhome.www.admin.service.face;

import java.util.List;
import java.util.Map;

import com.pointhome.www.admin.dto.Admin;
import com.pointhome.www.admin.dto.AdminNotice;
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
	 * @return 모든 공지 게시글
	 */
	public List<AdminNotice> noticeList();
	
	
	
	
}
