package com.pointhome.www.main.dao.face;

import java.util.List;

import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.partner.dto.Partner;

public interface MainDao {

	public List<Integer> selectReserveTime(Reservation reservation);

	public void insertUserReserveData(Reservation res);

	/**
	 * 유저가 보는 제휴사 상세 페이지의 정보 select
	 * 
	 * @param partNo
	 * @return
	 */
	public Partner selectPartnerView(int partNo);
	
	

}
