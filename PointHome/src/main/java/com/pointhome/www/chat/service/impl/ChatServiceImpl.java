package com.pointhome.www.chat.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pointhome.www.chat.dao.face.ChatDao;
import com.pointhome.www.chat.service.face.ChatService;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired ChatDao chatDao;
	
	@Override
	public String getUserNice(int userSession) {
		
		return chatDao.selectUserNick(userSession);
	}
}
