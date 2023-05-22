package com.pointhome.www.user.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pointhome.www.user.dao.face.UserDao;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.service.face.UserService;

@Service
public class UserServiceImpl implements UserService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserDao userDao;
	
	@Override
	public void addUser(User user) {
		logger.debug( "회원가입 추가 성공[1] | 실패[0] => " + userDao.insertUser(user) );
	}

	@Override
	public Boolean isLogin(User param) {
		
		Boolean res = false;
		
		if( userDao.selectCntByUserEmailPw(param) > 0) {
			res = true;
			logger.debug("회원정보 존재 : {}", res);
		}
		
		return res;
	}

	@Override
	public User getUser(User param) {

		User user = new User();
		user = userDao.selectByUserEmailPw(param);
		logger.debug("{}", user);

		return user;
	}

}