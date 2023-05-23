package com.pointhome.www.freeboard.dao.face;

import java.util.List;

import com.pointhome.www.freeboard.dto.FreeBoard;
<<<<<<< HEAD
import com.pointhome.www.freeboard.dto.FreeBoardFile;
=======
import com.pointhome.www.freeboard.dto.FreeBoardComment;
>>>>>>> branch 'master' of https://github.com/KHPage404/PointHome.git
import com.pointhome.www.util.Paging;

public interface FreeBoardDao {

	public int selectCntAll();

	public List<FreeBoard> selectAll(Paging paging);
	
	public FreeBoard viewBoard(int boardNo);
	
	public void hit(int boardNo);

<<<<<<< HEAD
	public void insertBoard(FreeBoard board);

	public void insertFile(FreeBoardFile freeboardFile);

=======
	public List<FreeBoardComment> viewBoardComment(int freeboardNo);

	public void insertBoardComment(FreeBoardComment comment);
>>>>>>> branch 'master' of https://github.com/KHPage404/PointHome.git



}