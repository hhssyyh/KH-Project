package com.pointhome.www.freeboard.dao.face;

import java.util.List;

import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.util.Paging;

public interface FreeBoardDao {

	public int selectCntAll();

	public List<FreeBoard> selectAll(Paging paging);
	
	public FreeBoard viewBoard(int boardNo);
	
	public void hit(int boardNo);



}
