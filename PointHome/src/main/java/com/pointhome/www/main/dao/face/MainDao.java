package com.pointhome.www.main.dao.face;

import java.util.List;

import com.pointhome.www.main.dto.Reservation;

public interface MainDao {

	public List<Integer> selectReserveTime(Reservation reservation);

	public void insertUserReserveData(Reservation res);
	
	

}
