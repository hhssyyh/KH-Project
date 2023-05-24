package com.pointhome.www.freeboard.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.util.Paging;

public interface FreeBoardService {

	public Paging getPaging(int curPage);

	public List<FreeBoard> list(Paging paging);

	public FreeBoard view(int board_no);


	public void write(FreeBoard board, List<MultipartFile> dataMul);

	public List<FreeBoardComment> commentView(int freeboardNo);

	public void insert(FreeBoardComment comment);

	public int isRecommend(int freeboardNo, int userNo);

	public int getCntRecommend(int freeboardNo);

	public void updateRecommend(int freeboardNo, Integer userNo);

	public List<Map<String, Object>> getList(Paging paging);





}

