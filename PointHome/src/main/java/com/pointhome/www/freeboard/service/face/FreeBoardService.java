package com.pointhome.www.freeboard.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.pointhome.www.freeboard.dto.FreeBoard;
import com.pointhome.www.freeboard.dto.FreeBoardComment;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.freeboard.dto.FreeBoardFile;
import com.pointhome.www.util.Paging;

public interface FreeBoardService {

	/**
	 * 게시글 목록을 위한 페이징 객체 생성
	 * 
	 * @param curPage- 현재페이지
	 * @param filter - 필터
	 * @param searchType - 검색 타입
	 * @param keyword - 키워드
	 * @return - 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(int curPage, String filter, String searchType, String keyword);

	/**
    * 페이징이 적용된 게시글 목록 조회
    * 
    * @param paging - 페이징 정보 객체
    * @return 페이징이 적용된 게시글 목록
    */
	public List<FreeBoard> list(Paging paging);

    /**
    * 게시글 상세보기 
    * 
    * @param board_no - 상세 조회할 게시글 번호 객체
    * @return 조회된 상세 게시글 객체
    */
	public FreeBoard view(int board_no);


   /**
    * 게시글 정보, 첨부 파일을 함께 처리
    * 
    * @param board - 게시글 정보 DTO
    * @param dataMul - 첨부파일 정보 DTO
    */
	public void write(FreeBoard board, List<MultipartFile> dataMul);

   /**
    * 게시판 댓글 목록 조회
    * 
    * @param freeboardNo - 게시판 번호
    * @return 게시판 댓글 리스트
    */
	public List<Map<String, Object>> commentView(int freeboardNo);

   /**
    * 댓글 삽입
    * 
    * @param comment - 게시판 댓글 정보 DTO
    */
	public void insert(FreeBoardComment comment);

   /**
    * 게시글 번호를 이용한 업로드된 파일 정보 조회 
    * 
    * @param freeboardNo - 조회할 게시글 번호
    * @return 다중 첨부파일의 정보
    */
	public List<MultipartFile> getMultiFile(int freeboardNo);


   /**
    * 파일 번호를 이용한 업로드 파일 정보 조회
    * 
    * @param fileNo - 조회할 파일의 번호
    * @return 첨부 파일의 정보
    */
	public FreeBoardFile getFile(int fileNo);

   /**
    * 게시판 글 삭제
    * 
    * @param board - 삭제할 게시판의 객체
    */
	public void delete(FreeBoard board);
	
	   
   /**
    * 회원 번호와 게시글 번호흘 통한 추천수 수 확인
    * 
    * @param freeboardNo - 추천이 게시글 번호
    * @param userNo - 추천을 한 회원 번호
    * @return 총 추천 수
    */
	public int isRecommend(int freeboardNo, int userNo);

   /**
    * 게시글 번호를 통해 총 추천 수 확인
    * 
    * @param freeboardNo - 게시글 번호
    * @return 게시글에 달린 총 추천의 수
    */
	public int getCntRecommend(int freeboardNo);

   /**
    * 추천 수정
    * 
    * @param freeboardNo - 게시글 번호
    * @param userNo - 회원 번호
    */
	public void updateRecommend(int freeboardNo, Integer userNo);

   /**
    * 2개의 객체로 페이징이 적용된 리스트 조회
    * 
    * @param paging - 페이징 객체
    * @return 페이징이 적용되 리스트
    */
	public List<Map<String, Object>> getList(Paging paging);

   /**
    * 댓글 삭제
    * 
    * @param commNo - 해당 댓글 번호
    */
	public void deleteComment(int commNo);

   /**
    * 뷰에 보낼 유저 정보 조회
    * 
    * @param userNo - 세션에 저장된 회원 번호
    * @return 회원 정보
    */
	public User viewUser(int userNo);

   /**
    * 댓글 수정
    * 
    * @param comment - 수정할 댓글의 객체
    */
	public void updateComment(FreeBoardComment comment);

   /**
    * 게시글 번호를 통한 게시글 정보 조회
    * 
    * @param freeboardNo - 게시글 번호
    * @return 게시글 번호에 해당하는 정보 DTO
    */
	public FreeBoard selectBoard(int freeboardNo);

   /**
    * 게시글 번호를 통한 게시글 파일의 정보 조회
    * 
    * @param freeboardNo - 조회할 해당 게시글의 번호
    * @return 게시글 파일들 정보의 목록
    */
	public List<FreeBoardFile> selectBoardFile(int freeboardNo);

	/**
    * 게시글 정보와 파일 수정하기
    * 
    * @param board - 게시글 DTO
    * @param dataMul - 게시글 파일 리스트 DTO
    */
	public void update(FreeBoard board, List<MultipartFile> dataMul);

   /**
    * 필터와 페이징 객체로 리스트 조회
    * 
    * @param paging - 페이징 객체
    * @param filter - 게시글 필터
    * @return 페이징과 필터를 적용한 리스트 정보 
    */
	public List<Map<String, Object>> selectBoardByFilter(Paging paging, String filter);

	/**
	 * 페이징 적용 , 필터와 검색 타입과 키워드 적용한 목록 조회
	 * 
	 * @param paging - 페이징 객체
	 * @param filter - 필터
	 * @param searchType - 검색 타입
	 * @param keyword - 키워드
	 * @return 페이징과 필터와 검색 타입과 키워드를 적용한 리스트 정보 
	 */
	public List<Map<String, Object>> selectAllSearch(Paging paging, String filter, String searchType, String keyword);

	/**
	 * 댓글 리스트에 보여줄 유저 닉네임 가져오기
	 * 
	 * 
	 * @param freeboardNo 해당 게시글에 있는 유저 닉 찾기
	 * @return 그 값담아주기
	 */
	public List<User> viewUserNick(int freeboardNo);

}

