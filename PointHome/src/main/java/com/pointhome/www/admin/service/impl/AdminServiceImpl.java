package com.pointhome.www.admin.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;
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
import com.pointhome.www.freeboard.dto.FreeBoardFile;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.util.Paging;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired AdminDao adminDao;
	@Autowired private ServletContext context;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean adminLogin(Admin admin) {
		int chk = adminDao.selectAdminIdPw(admin);
		
		if(chk > 0) {
		logger.debug("회원정보 존재{}", chk);
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
		//logger.debug("{}",dlist);
		return dlist;
	}
	
	@Override
	public List<AdminNotice> noticeList(char filter, Paging paging) {
		
		List<AdminNotice> alist = adminDao.selectAllAdminNotice(filter, paging);
		
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
	public Admin getAdmin(Admin admin) {
		
		
		return adminDao.selectByAdminEmailPw(admin);

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
			
			noticeFile.setNoticeNo(adminnotice.getNoticeNo());
			noticeFile.setAdminFileOrigin(originName);
			noticeFile.setAdminFileStored(storedName);
			
			logger.info("filetest :{} ", noticeFile);
			
			adminDao.insertFile(noticeFile);
			
		}
		
	}

	@Override
	public Paging getPagingNotice(int curPage,String filter, String type) {
		
		int totalPage = adminDao.selectNoticeCntAll(filter,type);
	      
	      Paging paging = new Paging(totalPage, curPage); 
	      
		return paging;
	}

	@Override
	public List<Map<String, Object>> selectAllSearch(Paging paging, String filter, String type) {
		
		return adminDao.selectAllSearch(paging,filter,type);
	}

	@Override
	public AdminNotice view(int noticeNo) {
		
		return adminDao.viewNotice(noticeNo);
	}

	@Override
	public List<MultipartFile> getMultiFile(int noticeNo) {
		
		
		return adminDao.getMultiFiles(noticeNo);
	}

	@Override
	public Admin viewAdmin(int adminNo) {
		
		return adminDao.selectAllAdminNo(adminNo);
	}

	@Override
	public void delete(AdminNotice adminNotice) {

		adminDao.deleteFile(adminNotice);
		adminDao.deleteNotice(adminNotice);
	}

	@Override
	public AdminNotice selectNotice(int noticeNo) {

		return adminDao.selectNoticebyNoticeNo(noticeNo);
	}

	 @Override
	   public List<AdminNoticeFile> selectNoticeFile(int noticeNo) {

	      
	      return adminDao.selectNoticeFilebyNoticeNo(noticeNo);
	   }

	@Override
	public void update(AdminNotice notice, List<MultipartFile> dataMul) {

		adminDao.deleteFile(notice);
		adminDao.update(notice);
		
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
	            logger.debug("!!!!!!!!!++++++++++++++++");
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
	         
	         AdminNoticeFile adminNoticeFile = new AdminNoticeFile();
	         
	         adminNoticeFile.setNoticeNo(notice.getNoticeNo());
	         adminNoticeFile.setAdminFileOrigin(originName);
	         adminNoticeFile.setAdminFileStored(storedName);
	         
	         logger.info("filetest :{} ", adminNoticeFile);
	         
	         logger.info("++++++++++++++++++++++++삭제");
	         adminDao.insertFile(adminNoticeFile);
		}

	}

	@Override
	public AdminNoticeFile getFile(int adminFileNo) {
		logger.info("ds{}", adminDao.selectFile(adminFileNo));
	      return adminDao.selectFile(adminFileNo);
	}

	@Override
	public void delete(int userno) {

		adminDao.deleteUserByUserNo(userno);
	}

	
}
