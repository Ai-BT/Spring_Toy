package com.wmk.ex.service;


import java.util.List;
import org.springframework.stereotype.Service;
import com.wmk.ex.mapper.FreeBoardMapper;
import com.wmk.ex.page.Criteria;
import com.wmk.ex.vo.FreeBoardVO;
import com.wmk.ex.vo.FreeReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j 
@Service
@AllArgsConstructor
public class FreeBoardServiceImpl implements FreeBoardService {
	
	private FreeBoardMapper mapper; 
	
	//게시판 목록 
	@Override
	public List<FreeBoardVO> getList() throws Exception {
		log.info("getList..."); 
		
		return mapper.getList();
	}
	
	//게시판 번호 get
	@Override
	public FreeBoardVO getNum(int fBoard_Num) throws Exception {
		FreeBoardVO fboardVO = mapper.getNum(fBoard_Num);
							mapper.addUphit(fBoard_Num);
		
		log.info("getNum..."); 
		
		return fboardVO;
	}		
	
	//게시판 작성
	@Override
	public void writeBoard(FreeBoardVO fboardVO) throws Exception {
		
		log.info("writeBoard........");
		
		mapper.writeBoard(fboardVO);		
	}
	
	//게시판 수정
	@Override
	public void updateModify(FreeBoardVO fboardVO) throws Exception {
		
		mapper.updateModify(fboardVO);	
	}
	
	
	//게시판 삭제 
	@Override
	public void deleteBoard(FreeBoardVO fboardVO) throws Exception {
		
		mapper.deleteBoard(fboardVO);	
		
	}
	
	//게시판 페이징
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		
		log.info("get total count...");
		return mapper.getTotalCount(cri);
	}

	//게시판 페이징
	@Override
	public List<FreeBoardVO> getListWithPaging(Criteria criteria) throws Exception {
		
		log.info("get List with criteria"  + criteria);
		return mapper.getListWithPaging(criteria);
	}
	
	
	//게시판 댓글 작성
	@Override
	public void registReply(FreeReplyVO reply) throws Exception {
		mapper.registReply(reply);
		
	}
	
	//게시판 댓글 목록
	@Override
	public List<FreeReplyVO> replyList(int fBoard_Num) throws Exception {
		
		log.info("get replyList...");
		
		return mapper.replyList(fBoard_Num);
	}
	
	//게시판 댓글 삭제
	@Override
	public void deleteReply(FreeReplyVO reply) throws Exception {
		
		log.info("deleteReply...");
		
		mapper.deleteReply(reply);
		
	}

	@Override
	public String replyUserIdCheck(int repNum) throws Exception {
		
		log.info("idCheck...");
		log.info("replyUserIdCheck " + repNum);
		log.info("replyUserIdCheck: " + mapper.replyUserIdCheck(repNum));
		
		return mapper.replyUserIdCheck(repNum);
	}
	
	//게시판 id 체크
	@Override
	public String boardUserIdCheck(int fBoard_Num) throws Exception {
		
		log.info("board idCheck...");
		log.info(mapper.boardUserIdCheck(fBoard_Num));
		log.info(fBoard_Num);
		
		return mapper.boardUserIdCheck(fBoard_Num);
	}
	
	//게시판 서치
	@Override
	public List<FreeBoardVO> boardByTitle(FreeBoardVO fboardVO) {
		
		log.info("boardByTitle...");

		return mapper.findBoardByTitle(fboardVO);
	}
	



	
	

}



