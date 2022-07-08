package com.wmk.ex.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wmk.ex.vo.ReviewBoardVO;
import com.wmk.ex.vo.ReviewReplyVO;


public interface ReviewBoardService {
	
	//여행 게시판 목록
	public List<ReviewBoardVO> getHotReviewList(ReviewBoardVO reviweBoardVO);

	public List<ReviewBoardVO> getReviewList(ReviewBoardVO reviweBoardVO);
	public List<ReviewBoardVO> getReviewListAjax(ReviewBoardVO reviweBoardVO);
	
	//여행 게시판 번호
	public ReviewBoardVO getrBoardNum(int reviewBoardNum);
	
	//여행 게시판 글작성
	public void rWriteBoard(ReviewBoardVO reviweBoardVO, MultipartHttpServletRequest mpRequest) throws Exception;
	
	//여행 게시판 수정
	public void updaterModify(ReviewBoardVO reviweBoardVO, MultipartHttpServletRequest mpRequest) throws Exception;

	//여행 게시판 삭제
	public void deleteBoard(ReviewBoardVO reviewBoardNum);
	
	//리뷰 게시판 id
	public String reviewBoardUserId(int fBoard_Num) throws Exception;
	
	//업로드 파일 list로 뿌려주기
	public List<Map<String, Object>> selectFileList(int reviewBoardNum) throws Exception;
	
	//업로드된 파일 삭제
	public void removerBoard(int fileSize);
	
	//여행 게시판 댓글 목록
	public List<ReviewReplyVO> replyList(int reviewBoardNum) throws Exception;
	
	//여행 게시판 댓글 등록
	public void registReply(ReviewReplyVO reviewReply) throws Exception;
		
	//여행 게시판 댓글 삭제
	public void deleteReply(ReviewReplyVO reviewReply) throws Exception;
	
	//여행 게시판 댓글 id 확인
	public String replyUserIdCheck(int repNum) throws Exception;

	//좋아요 기능		
	public int updateLike(int reviewBoardNum);
	public int insertLike(int reviewBoardNum,String id);
	public void updateInsertLike(int reviewBoardNum,String id);
	
	//좋아요 취소 기능
	public int updateUnLike(int reviewBoardNum);
	public int deleteLike(int reviewBoardNum,String id);
	public void deleteUnlike(int reviewBoardNum,String id);
	
	//좋아요 갯수
	public int getLikeCount(int reviewBoardNum,String id);
	public void cntLike(int reviewBoardNum);
	
	//여행지 게시판 검색
	public List<ReviewBoardVO> reviewBoardByTitle(ReviewBoardVO reviweBoardVO);
		
	

}
