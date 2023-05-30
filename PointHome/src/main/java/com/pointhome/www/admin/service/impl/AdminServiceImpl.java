package com.pointhome.www.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pointhome.www.admin.dao.face.AdminDao;
import com.pointhome.www.admin.dto.Admin;
import com.pointhome.www.admin.dto.AdminNotice;
import com.pointhome.www.admin.service.face.AdminService;
import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.user.dto.User;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired AdminDao adminDao;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean adminLogin(Admin admin) {
		int chk = adminDao.selectAdminIdPw(admin);
		
		if(chk > 0) {
		logger.debug("{}", chk);
		return true;
		}
		return false;
	}

	@Override
	public List<User> userList() {
		List<User> list = adminDao.selectAllUser();
		return list;
	}

	@Override
	public void admindeleteUser(User userno) {
		adminDao.deleteUserinfo(userno);
	}

	@Override
	public Map<String, Object> userdetail(int userNo) {
		Map<String, Object> dlist = adminDao.selectUserInfo(userNo);
		logger.debug("{}",dlist);
		return dlist;
	}
	
	@Override
	public List<AdminNotice> noticeList() {
		
		List<AdminNotice> alist = adminDao.selectAllAdminNotice();
		
		logger.debug("{}", alist);
		return alist;
	}
	
	@Override
	public List<FreeBoard> userPost(int userno) {
		List<FreeBoard> fbList = adminDao.selectUserPost(userno);
		
		return fbList;
		
		
	}
	
	@Override
	public List<FreeBoardComment> userCmt(int userno) {
		List<FreeBoardComment> cmtList = adminDao.selectUserCmt(userno);
		return cmtList;
	}
	
}
