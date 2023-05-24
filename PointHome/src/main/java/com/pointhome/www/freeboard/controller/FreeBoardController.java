package com.pointhome.www.freeboard.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.freeboard.service.face.FreeBoardService;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.util.Paging;

@Controller
@RequestMapping("/freeboard")
public class FreeBoardController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired FreeBoardService freeBoardService;



	@GetMapping("/list")
	public void BoardList( @RequestParam(defaultValue = "0") int curPage,
			Model model
			) {
		logger.info("/freeboard/list [GET]");

		Paging paging = freeBoardService.getPaging(curPage);

		//		List<FreeBoard> list = freeBoardService.list(paging);
		//		logger.info("list{}",list);
		//		model.addAttribute("list", list);

		//FreeBoard, FreeBoardComment, FreeBoardRecommend, User
		List<Map<String, Object>> list = freeBoardService.getList(paging);

		logger.info("!!!!!!!!!!!!!!!!{}", list);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}

	@GetMapping("/view")
	public void BoardView(int freeboardNo,Model model, HttpSession session) {
		logger.info("/freeboard/view [GET]");

		FreeBoard board = freeBoardService.view(freeboardNo);

		List<FreeBoardComment> boardCommentList = freeBoardService.commentView(freeboardNo);
		logger.info("{}",boardCommentList);

		int cntRecommend = freeBoardService.getCntRecommend(freeboardNo);
		
		
		model.addAttribute("board", board);
		model.addAttribute("boardCommentList", boardCommentList);
		model.addAttribute("commentCnt", boardCommentList.size());

		
		List<MultipartFile> file = freeBoardService.getMultiFile(freeboardNo);
		model.addAttribute("file", file);
		model.addAttribute("cntRecommend", cntRecommend);

		// 추천부분
		if(session.getAttribute("login") != null)
		{
			int isRecommend = freeBoardService.isRecommend(freeboardNo, (Integer)session.getAttribute("userno"));
			model.addAttribute("isRecommend", isRecommend);
		}

		User viewUser = freeBoardService.viewUser(board.getUserNo());
		
		model.addAttribute("viewUser", viewUser);
	}


	@GetMapping("/write")
	public void write() {
		logger.info("/board/write");
	}

	@PostMapping("/write")
	public String writeRes(FreeBoard board, List<MultipartFile> dataMul, HttpSession session ) 
	{ 

		board.setUserNo( (Integer)session.getAttribute("userno"));


		logger.info("{}", session.getAttribute("userno"));
		freeBoardService.write(board, dataMul);

		return "redirect:./list"; 
	}

	@PostMapping("/view")
	public String commentWrite(FreeBoardComment comment,Model model, HttpSession session) {
		logger.info("/freeboard/view [Post]");
		logger.info("{}",comment);

		comment.setUserNo((Integer)session.getAttribute("userno"));

		freeBoardService.insert(comment);

		model.addAttribute("freeboardNo", comment.getFreeboardNo());
		return "redirect:./view";
	}	

	@RequestMapping("/recommend")
	public void recommend(int freeboardNo,Model model, HttpSession session) {

		freeBoardService.updateRecommend(freeboardNo, (Integer)session.getAttribute("userno"));

		int isRecommend = freeBoardService.isRecommend(freeboardNo, (Integer)session.getAttribute("userno"));
		int cntRecommend = freeBoardService.getCntRecommend(freeboardNo);

		model.addAttribute("isRecommend", isRecommend);
		model.addAttribute("cntRecommend", cntRecommend);

	}

	
	@RequestMapping("/delete")
	public String delete(FreeBoard board) {
		freeBoardService.delete(board);
		return "redirect:./list";
	}

	@GetMapping("/commentDelete")
	public String commentDelete(int commNo, int freeboardNo, Model model) {
		
		logger.info("삭제삭제삭제사겢");
		
		freeBoardService.deleteComment(commNo);
		
		model.addAttribute("freeboardNo", freeboardNo);
		
		return "redirect:./view";
	}

}








