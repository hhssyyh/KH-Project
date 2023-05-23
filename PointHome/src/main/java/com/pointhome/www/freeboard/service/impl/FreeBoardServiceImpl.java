package com.pointhome.www.freeboard.service.impl;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.freeboard.dao.face.FreeBoardDao;
import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardFile;
import com.pointhome.www.freeboard.service.face.FreeBoardService;
import com.pointhome.www.util.Paging;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired FreeBoardDao freeBoardDao;
	@Autowired private ServletContext context;

	@Override
	public Paging getPaging(int curPage) {

		int totalPage = freeBoardDao.selectCntAll();
		
		Paging paging = new Paging(totalPage, curPage);
		
		return paging;
	}

	@Override
	public List<FreeBoard> list(Paging paging) {
		
		
		
		return freeBoardDao.selectAll(paging);
		
		
	}

	@Override
	public FreeBoard view(int boardNo) {
		
		freeBoardDao.hit(boardNo);
		return freeBoardDao.viewBoard(boardNo);
	}

	@Override
	public void write(FreeBoard board, List<MultipartFile> dataMul) {

		freeBoardDao.insertBoard(board);
		
//		if(dataMul.getSize() <= 0 ) {
//			
//			
//			
//			return;
//		}
		
		String storedPath = context.getRealPath("upload");
		
		File storedFolder = new File(storedPath);
		if(!storedFolder.exists()) {
			storedFolder.mkdir();
		}
		
	}

}
