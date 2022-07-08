package com.wmk.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wmk.ex.service.ReviewBoardService;
import com.wmk.ex.vo.ReviewBoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class HotBoardController {
	
	 private ReviewBoardService reviewService;
	 
	//핫플레이스 게시판
	@RequestMapping("/hot_reviewList")
	public String hotReviewList(ReviewBoardVO reviewBoardVO, Model model) {
		log.info("hot_reviewList...");
		
		model.addAttribute("hotReivewList", reviewService.getHotReviewList(reviewBoardVO));
			
		return "/hot_board/hotReviewList";
	}
	 
}
