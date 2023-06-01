package com.pointhome.www.main.service.face;

import java.util.List;

import com.pointhome.www.main.dto.Reservation;

public interface MainService {

	public List<Integer> reserveTime(Reservation res);

	public void insertReserveData(Reservation res);

}
