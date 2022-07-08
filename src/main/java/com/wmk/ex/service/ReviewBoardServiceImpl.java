package com.wmk.ex.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wmk.ex.mapper.ReviewBoardMapper;
import com.wmk.ex.util.FileUtils;
import com.wmk.ex.vo.ReviewBoardVO;
import com.wmk.ex.vo.ReviewReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j 
@Service
@AllArgsConstructor
public class ReviewBoardServiceImpl implements ReviewBoardService {
	
	private ReviewBoardMapper reviewBoardMapper; 
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	
	//여행 게시판 목록
	public List<ReviewBoardVO> getHotReviewList(ReviewBoardVO reviweBoardVO){
		log.info("getHotReviewList...");
		return reviewBoardMapper.getHotReviewList(reviweBoardVO);
	}
	
	public List<ReviewBoardVO> getReviewList(ReviewBoardVO reviweBoardVO) {
		log.info("getrList..."); 		
		return reviewBoardMapper.getReviewList(reviweBoardVO);
	}
	
	public List<ReviewBoardVO> getReviewListAjax(ReviewBoardVO reviweBoardVO) {
		log.info("getrList..."); 		
		return reviewBoardMapper.getReviewListAjax(reviweBoardVO);
	}
	
	@Override
	public ReviewBoardVO getrBoardNum(int reviewBoardNum) {
		ReviewBoardVO rboardVO = reviewBoardMapper.getrBoardNum(reviewBoardNum);
			reviewBoardMapper.addUprHit(reviewBoardNum);
		
		log.info("getrBoardNum..."); 
		
		return rboardVO;
	}
	
	@SuppressWarnings("null")
	@Override
	public void rWriteBoard(ReviewBoardVO reviweBoardVO, MultipartHttpServletRequest mpRequest) throws Exception{
		
		log.info("rWriteBoard........");
		
		reviewBoardMapper.rWriteBoard(reviweBoardVO);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(reviweBoardVO, mpRequest); 
		
		System.out.println("abcd" + list);
		System.out.println("abcd" + list.size());
		
		
		int size = list.size();
		Map<String, Object> map = new HashMap<>();

		
		System.out.println("abcdmap" + map);
		if(size == 0) {
			System.out.println("�־�Ÿ��");
			map.put("ORIGINAL_FILE_NAME", " ");
			map.put("STORED_FILE_NAME", " ");
			map.put("FILE_SIZE", 0);
			reviewBoardMapper.insertFile(map);
		}else {
			for(int i=0; i<size; i++){ 
				reviewBoardMapper.insertFile(list.get(i));
				System.out.println("list.get(i)" + list.get(i));
			}
		}
	}	
	
	@Override
	public void updaterModify(ReviewBoardVO reviweBoardVO, MultipartHttpServletRequest mpRequest) throws Exception{
		
		reviewBoardMapper.updaterModify(reviweBoardVO);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(reviweBoardVO, mpRequest);
		log.info("list=" + list);
		int size = list.size();
		for(int i=0; i<size; i++){ 
			reviewBoardMapper.updateFile(list.get(i)); 
			System.out.println("list.get(i)" + list.get(i));
		}
	}
	
	@Override
	public void deleteBoard(ReviewBoardVO reviewBoardNum) {
		
		reviewBoardMapper.deleteBoard(reviewBoardNum);		
	}
	
	@Override
	public List<Map<String, Object>> selectFileList(int reviewBoardNum) throws Exception {

		return reviewBoardMapper.selectFileList(reviewBoardNum);
	}
	
	
	@Override
	public void removerBoard(int reviewBoardNum) {
		
		reviewBoardMapper.deleteFile(reviewBoardNum);
	}
	
	
	@Override
	public List<ReviewReplyVO> replyList(int reviewBoardNum) throws Exception {
		
		log.info("get replyList...");
		
		return reviewBoardMapper.replyList(reviewBoardNum);
	}
	
	@Override
	public void registReply(ReviewReplyVO reviewReply) throws Exception {
		
		reviewBoardMapper.registReply(reviewReply);
		
	}
	
	@Override
	public void deleteReply(ReviewReplyVO reviewReply) throws Exception {
		log.info("deleteReply...");
		
		reviewBoardMapper.deleteReply(reviewReply);
		
	}
	
	//댓글 id 확인
	@Override
	public String replyUserIdCheck(int repNum) throws Exception {
		log.info("idCheck...");
		
		return reviewBoardMapper.replyUserIdCheck(repNum);
	}
	
	
	//좋아요
	@Override
	public int updateLike(int reviewBoardNum) {
		return reviewBoardMapper.updateLike(reviewBoardNum);
	}
	@Override
	public int insertLike(int reviewBoardNum, String id) {
		return reviewBoardMapper.insertLike(reviewBoardNum, id);
	}
	@Transactional
	public void updateInsertLike(int reviewBoardNum,String id) {
		reviewBoardMapper.updateLike(reviewBoardNum);
		reviewBoardMapper.insertLike(reviewBoardNum, id);
	}
		
		
	//좋아요 취소
	@Override
	public int updateUnLike(int reviewBoardNum) {
		return reviewBoardMapper.updateUnLike(reviewBoardNum);
	}
	@Override
	public int deleteLike(int reviewBoardNum, String id) {
		return reviewBoardMapper.deleteLike(reviewBoardNum, id);
	}		
	@Transactional
	public void deleteUnlike(int reviewBoardNum,String id) {
		reviewBoardMapper.updateUnLike(reviewBoardNum);
		reviewBoardMapper.deleteLike(reviewBoardNum, id);
	}

		
	//좋아요 갯수
	@Override
	public int getLikeCount(int reviewBoardNum, String id) {
		return reviewBoardMapper.getCountLike(reviewBoardNum, id);
	}
	@Override
	public void cntLike(int reviewBoardNum) {
		reviewBoardMapper.cntLike(reviewBoardNum);
			
	}
	
	//여행지 게시판 검색
	@Override
	public List<ReviewBoardVO> reviewBoardByTitle(ReviewBoardVO reviweBoardVO) {
		log.info("reviewBoardByTitle...");

		return reviewBoardMapper.findReviewBoardByTitle(reviweBoardVO);
	}
	
	//리뷰 게시판 아이디 확인
	@Override
	public String reviewBoardUserId(int reviewBoardNum) throws Exception {
		// TODO Auto-generated method stub
		return reviewBoardMapper.reviewBoardUserId(reviewBoardNum);
	}
		

}


