package com.pointhome.www.admin.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.admin.dao.face.AdminDao;
import com.pointhome.www.admin.dto.Admin;
import com.pointhome.www.admin.dto.AdminNotice;
import com.pointhome.www.admin.dto.AdminNoticeFile;
import com.pointhome.www.admin.service.face.AdminService;
import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.user.dto.User;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired AdminDao adminDao;
	@Autowired private ServletContext context;
	
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
	public List<AdminNotice> noticeList(char filter) {
		
		List<AdminNotice> alist = adminDao.selectAllAdminNotice(filter);
		
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

	@Override
	public int getAdmin(Admin admin) {
		
		
		return adminDao.selectAdminNo(admin);

	}

	@Override
	public void writeNotice(AdminNotice adminnotice,List<MultipartFile> dataMul) {
		
		adminDao.insertNotice(adminnotice);
		logger.info("adminno: {}", adminnotice.getAdminNo());
		
		for(MultipartFile m : dataMul ) {
			if(m.getSize() <= 0 ) {
				
				logger.info("0보다 작음, 처리 중단");
				
				continue;
			}
		
			String storedPath = context.getRealPath("upload");
			logger.info("storedPath : {}", storedPath);
			
			File storedFolder = new File(storedPath);
			
			storedFolder.mkdir();
			File dest = null;
			String originName = null;
			String storedName = null;
			
			do {
			originName = m.getOriginalFilename();
			storedName = originName + UUID.randomUUID().toString().split("-")[4];
			
			logger.info("storedName : {}", storedName);
		
			dest = new File(storedFolder, storedName);
			
			} while(dest.exists());
			
				try {
					m.transferTo(dest);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			
			AdminNoticeFile noticeFile = new AdminNoticeFile();
			
			noticeFile.setNotice_no(adminnotice.getNoticeNo());
			noticeFile.setAdmin_file_origin(originName);
			noticeFile.setAdmin_file_stored(storedName);
			
			logger.info("filetest :{} ", noticeFile);
			
			adminDao.insertFile(noticeFile);
			
		}
		
	}

	
	
}
