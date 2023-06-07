package com.pointhome.www.main.service.face;

import java.util.List;
import java.util.Map;

import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.util.Paging;

public interface MainService {

	public List<Integer> reserveTime(Reservation res);

	/**
	 * 예약완료시 예약 테이블에 저장
	 * 
	 * @param res
	 */
	public void insertReserveData(Reservation res);

	/**
	 * 유저가 보는 제휴사 상세페이지의 정보 가져오기
	 * 
	 * @param partNo
	 * @return
	 */
	public Partner getPartnerView(int partNo);
	/**
	 * 유저 이름 조회
	 * @param userNo - 로그인한 유저의 session 값
	 * @return 유저의 이름
	 */
	public String getUserName(int userNo);

	/**
	 * 리뷰리스트 페이징
	 * 
	 * @param curPage
	 * @param partNo 
	 * @return
	 */
	public Paging getPaging(int curPage, int partNo);
	
	/**
	 * 해당 제휴사의 리뷰 리스트 가져오기
	 * @param paging 
	 * 
	 * @param partNo
	 * @return 리뷰 정보와 유저 닉네임
	 */
	public List<Map<String, Object>> getReviewList(Paging paging, int partNo);


}
