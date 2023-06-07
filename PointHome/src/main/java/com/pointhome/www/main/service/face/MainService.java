package com.pointhome.www.main.service.face;

import java.util.List;

import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.partner.dto.Partner;

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

}
