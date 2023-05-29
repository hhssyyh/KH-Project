package com.pointhome.www.admin.dao.face;

import java.util.List;
import java.util.Map;

import com.pointhome.www.admin.dto.Admin;
import com.pointhome.www.admin.dto.AdminNotice;
import com.pointhome.www.user.dto.User;

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
	public List<AdminNotice> selectAllAdminNotice();
	
	/**
	 *  해당 유저의 모든 정보 조회
	 * @param userNo - 선택한 유저
	 * @return map으로 반환
	 */
	public Map<String, Object> selectUserInfo(int userNo);
	

	
	
	

}
