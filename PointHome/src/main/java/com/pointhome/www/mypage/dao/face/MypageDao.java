package com.pointhome.www.mypage.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.mypage.dto.AlertRecomm;
import com.pointhome.www.mypage.dto.MyPick;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserFile;

public interface MypageDao {
	
	/**
	 * 회원 번호에 해당하는 회원 정보 조회
	 * 
	 * @param userno - 회원 번호
	 * @return - 회원 정보 담은 DTO
	 */
	public User selectByUserId(int userno);
	
	/**
	 * 회원 정보 수정
	 * 
	 * @param user - 회원 정보 담은 DTO
	 */
	public void updateUser(User user);
	
	/**
	 * 회원 프로필 이미지 삭제
	 * 
	 * @param userFile - 회원 프로필 이미지 정보를 담은 DTO
	 */
	public void deleteFile(UserFile userFile);

	/**
	 * 회원 프로필 이미지 삽입
	 * 
	 * @param userFile - 회원 프로필 이미지 정보를 담은 DTO
	 */
	public void insertFile(UserFile userFile);
	
	/**
	 * 회원번호에 해당하는 프로필 이미지 조회
	 * 
	 * @param userno - 회원 번호
	 * @return userFile - 해당 회원 프로필 이미지 정보를 담은 DTO
	 */
	public UserFile selectImgByUserno(int userno);

	/**
	 * 회원 탈퇴
	 * 
	 * @param userno - 회원 번호
	 */
	public void deleteMemberByUserno(int userno);

	/**
	 * 사용자가 찜한 제휴사 수 조회
	 * 
	 * @param myPick - 회원 번호와 제휴사 번호를 담은 DTO
	 * @return - 사용자가 찜한 제휴사 수
	 */
	public int selectByPickUserNo(MyPick myPick);

	/**
	 * 찜 삽입
	 * 
	 * @param myPick - 회원 번호와 제휴사 번호를 담은 DTO
	 */
	public void insertPick(MyPick myPick);

	/**
	 * 찜 삽입 취소
	 * 
	 * @param myPick - 회원 번호와 제휴사 번호를 담은 DTO
	 */
	public void deletePick(MyPick myPick);

	public List<FreeBoard> selectBoardByUserNo(int userNo);

	public List<Map<String, Object>> getPickList(int userNo);

	public List<Map<String, Object>> selectAlarmList(int userNo);

//	public List<Map<String, Object>> selectReList(int userNo);

	public int selectAlertCnt(int userNo);

	public void deleteAlertByUserno(int userNo);

	public void deleteAlertReByUserno(int userNo);

	public List<Reservation> selectReserveList(int userNo);

	

	

}
