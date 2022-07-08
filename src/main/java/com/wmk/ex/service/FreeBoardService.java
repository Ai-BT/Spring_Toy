package com.wmk.ex.service;


import java.util.List;

import com.wmk.ex.page.Criteria;
import com.wmk.ex.vo.FreeBoardVO;
import com.wmk.ex.vo.FreeReplyVO;



public interface FreeBoardService {
	
	//게시판 목록 
	public List<FreeBoardVO> getList() throws Exception;
	
	//게시판 번호
	public FreeBoardVO getNum(int fBoard_Num) throws Exception;
	
	//게시판 작성
	public void writeBoard(FreeBoardVO fboardVO) throws Exception;
	
	//게시판 수정
	public void updateModify(FreeBoardVO fboardVO) throws Exception;
	
	//게시판 삭제 
	public void deleteBoard(FreeBoardVO fboardVO) throws Exception;
		
	//게시판 페이징
	public List<FreeBoardVO> getListWithPaging(Criteria cri) throws Exception;
	public int getTotalCount(Criteria cri) throws Exception;
	
	//게시판 댓글 작성
	public void registReply(FreeReplyVO reply) throws Exception;
	
	//게시판 댓글 목록
	public List<FreeReplyVO> replyList(int fBoard_Num) throws Exception;
	
	//게시판 댓글 삭제
	public void deleteReply(FreeReplyVO reply) throws Exception;
	
	//댓글  id 체크
	public String replyUserIdCheck(int repNum) throws Exception;
	
	//게시판 id 체크
	public String boardUserIdCheck(int fBoard_Num) throws Exception;
	
	//게시판 서치
	public List<FreeBoardVO> boardByTitle(FreeBoardVO fboardVO);

}
