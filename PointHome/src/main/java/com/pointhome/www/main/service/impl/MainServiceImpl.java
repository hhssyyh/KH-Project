package com.pointhome.www.main.service.impl;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pointhome.www.main.dao.face.MainDao;
import com.pointhome.www.main.dto.Reservation;
import com.pointhome.www.main.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {

	@Autowired MainDao mainDao;
	
	@Override
	public List<Integer> reserveTime(Reservation reservation) {
		
		return mainDao.selectReserveTime(reservation); 
	}
	
	@Override
	public void insertReserveData(Reservation res) {
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        String str = format.format(now);
		res.setResReserveno(str);
		
		mainDao.insertUserReserveData(res);
		
	}
	
	
}
