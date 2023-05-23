package com.pointhome.www.freeboard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pointhome.www.freeboard.dao.face.FreeBoardDao;
import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.freeboard.service.face.FreeBoardService;
import com.pointhome.www.util.Paging;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired FreeBoardDao freeBoardDao;

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
	public List<FreeBoardComment> commentView(int freeboardNo) {
		
		return freeBoardDao.viewBoardComment(freeboardNo);
	}

	@Override
	public void insert(FreeBoardComment comment) {
		
		freeBoardDao.insertBoardComment(comment);
	}

}
