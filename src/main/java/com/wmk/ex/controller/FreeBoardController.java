package com.wmk.ex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wmk.ex.page.Criteria;
import com.wmk.ex.page.PageDTO;
import com.wmk.ex.service.FreeBoardService;
import com.wmk.ex.service.UserService;
import com.wmk.ex.vo.FreeBoardVO;
import com.wmk.ex.vo.FreeReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/free_board")
@AllArgsConstructor
@Log4j
public class FreeBoardController {
	
	private FreeBoardService freeService;
	
	@Autowired
	private UserService userService;
	
	//게시판 목록 read
	@GetMapping("/boardList")
	public String BoardList(Model model, Criteria cri) throws Exception {
		
		int total = freeService.getTotalCount(cri);
		
		log.info("total" + total);
		log.info(cri);
		log.info("BoardList...");
		
		model.addAttribute("list", freeService.getListWithPaging(cri));	
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		
		return "/free_board/boardList";
	}
	
	
	//게시판 내용 read
	@GetMapping("/contentView")
	public String ContentView(FreeBoardVO freeBoardVO, Model model) throws Exception {
		
	   log.info("contentView...");
	   model.addAttribute("contentView", freeService.getNum(freeBoardVO.getfBoard_Num()));
	   model.addAttribute("list", freeService.getList());
	   
	   Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	   if (principal instanceof UserDetails) { // user id 가져오기 성공
		   String userId = ((UserDetails)principal).getUsername(); 
		   model.addAttribute("userDetail", userService.readUser(userId));
		} else { //user id 가져오기 실패
			model.addAttribute("userDetail", "");  
		}
	   
	   FreeBoardVO fBoardVO = freeService.getNum(freeBoardVO.getfBoard_Num());
	   userService.readUser(fBoardVO.getfId());
	   model.addAttribute("profileImg", userService.readUser(fBoardVO.getfId()));  
	   
	   return "/free_board/contentView"; 
	}
	
	
	//게시판 작성 뷰 read
	@GetMapping("/writeView")
	public String WriteView() throws Exception {
		
		log.info("writeView...");
		
		return "/free_board/writeView";
	}
	
	
	//게시판 작성 create
	@PostMapping("/free_write")
	public String Write(FreeBoardVO freeBoardVO) throws Exception {
		
		log.info("free_write...");
		freeService.writeBoard(freeBoardVO);

		return "redirect:boardList";
	}
		

	
	// 게시판 수정 뷰 read
	@ResponseBody
	@GetMapping("/modifyIdCheck")
	public String ModifyView(FreeBoardVO freeBoardVO, Model model) throws Exception {
		
		int result = 0;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		log.info("ModifyView...");

		String username = ((UserDetails) principal).getUsername();
		String userId = freeService.boardUserIdCheck(freeBoardVO.getfBoard_Num());

		log.info("username:" + username);
		log.info("userid:" + userId);

		if (username.equals(userId)) {

			freeBoardVO.setfId(username);
			model.addAttribute("modifyView", freeService.getNum(freeBoardVO.getfBoard_Num()));

			result = 1;
			 
			log.info("수정 접속 성공");
			log.info(result);			

		}

		log.info(result);
		 
		return String.valueOf(result);

	}
	
	
	
	@GetMapping("/modifyView")
	public String ModifyView2(FreeBoardVO freeBoardVO, Model model) throws Exception {

		log.info("ModifyView...");

	
		model.addAttribute("modifyView", freeService.getNum(freeBoardVO.getfBoard_Num()));
		
		return "/free_board/modifyView";

	}
	
	
	
	
	//게시판 수정 작성 완료 update
	@PutMapping("/modify")
	public String Modify(FreeBoardVO freeboardVO) throws Exception {
		
		log.info("Modify...");
		freeService.updateModify(freeboardVO);
				
		return "redirect:boardList";
	}
	
	
	//게시판 삭제 delete
	@ResponseBody
	@DeleteMapping("/delete") 
	public String Delete(FreeBoardVO freeBoardVO) throws Exception {
		
		
		int result = 0;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		log.info("delete...");	
		 
		String username = ((UserDetails)principal).getUsername();
		String userId = freeService.boardUserIdCheck(freeBoardVO.getfBoard_Num());
		
		log.info("username:" + username);
		log.info("userid:" + userId);
		
		if(username.equals(userId)) {
			 
			 freeBoardVO.setfId(username); 
			 freeService.deleteBoard(freeBoardVO);
			  
			 result = 1;
			 
			 log.info("삭제 성공");
			 log.info(result);
		}
		
		log.info(result);
	   
		return String.valueOf(result);
	}
	
	
	//댓글 등록 create
	@ResponseBody
	@PostMapping("/registReply")
	public void RegistReply(FreeReplyVO freeReplyVO) throws Exception {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("regist reply...");

		if (principal instanceof UserDetails) { // user id 가져오기 성공
			String username = ((UserDetails)principal).getUsername();
			log.info("유저 id " + username);
			freeReplyVO.setId(username);
		} else { //user id 가져오기 실패
			
			log.info("유저 id 가져오기 실패");
		}
	 
		freeService.registReply(freeReplyVO);	 
	}
	
	
	//댓글 목록 read
	@ResponseBody
	@GetMapping("/replyList")
	public List<FreeReplyVO> GetReplyList(@RequestParam("n") int fBoard_Num) throws Exception {
		log.info("get reply list");
		    
		List<FreeReplyVO> replyList = freeService.replyList(fBoard_Num);
		  
		return replyList;
	}
	
	
	//댓글 삭제 delete
	@ResponseBody
	@DeleteMapping("/deleteReply")
	public String DeleteReply(FreeReplyVO freeReplyVO) throws Exception {
	 
		int result = 0;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		log.info("DeleteReply...");	
		 
		String username = ((UserDetails)principal).getUsername();
		String userId = freeService.replyUserIdCheck(freeReplyVO.getRepNum());
		log.info("username id " + username);
		log.info("userId id " + userId);
		 
		if(username.equals(userId)) {
				 
			freeReplyVO.setId(username); 
			freeService.deleteReply(freeReplyVO);
			  
			result = 1;
		}	 
		return String.valueOf(result);		 
	}
	
	//게시판 서치
	@GetMapping("/boardByTitle")
	public String boardByTitle(FreeBoardVO freeBoardVO, Model model) {  
	
		log.info("boardByTitle");
		
		freeService.boardByTitle(freeBoardVO);
		log.info(freeBoardVO.toString()); 
		
		model.addAttribute("boardByTitle", freeService.boardByTitle(freeBoardVO));
		
		return "/free_board/boardList";
	}
	
	
}



