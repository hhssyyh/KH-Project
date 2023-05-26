package com.pointhome.www.freeboard.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.freeboard.dto.FreeBoardFile;
import com.pointhome.www.freeboard.dto.FreeBoardRecommend;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.util.Paging;

public interface FreeBoardDao {

	public int selectCntAll();

	public List<FreeBoard> selectAll(Paging paging);

	public FreeBoard viewBoard(int boardNo);

	public void hit(int boardNo);

	public void insertBoard(FreeBoard board);

	public void insertFile(FreeBoardFile freeboardFile);

	public List<FreeBoardComment> viewBoardComment(int freeboardNo);

	public void insertBoardComment(FreeBoardComment comment);

	public List<MultipartFile> getMultiFiles(int freeboardNo);

	public FreeBoardFile selectFile(int fileNo);

	public void deleteFile(FreeBoard board);

	public void deleteBoard(FreeBoard board);
	
	public int selectByBoardUserNo(FreeBoardRecommend recommend);

	public int selectCntRecommend(int freeboardNo);

	public void deleteRecommend(FreeBoardRecommend recommend);

	public void insertRecommend(FreeBoardRecommend recommend);

	public List<Map<String, Object>> selectAllMap(Paging paging);

	public void deleteComment(int commNo);

	public User selectUserNo(int userNo);


	public FreeBoard selectBoardbyBoardNo(int freeboardNo);

	public List<Map<String, Object>> selectBoardByFilter(@Param("paging") Paging paging, @Param("filter") String filter);

  public List<FreeBoardFile> selectBoardFilebyBoardNo(int freeboardNo);

	public void update(FreeBoard board);
}





