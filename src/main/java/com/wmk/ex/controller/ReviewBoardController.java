package com.wmk.ex.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wmk.ex.service.ReviewBoardService;
import com.wmk.ex.service.UserService;
import com.wmk.ex.vo.CustomUser;
import com.wmk.ex.vo.FreeBoardVO;
import com.wmk.ex.vo.ReviewBoardVO;
import com.wmk.ex.vo.ReviewReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class ReviewBoardController {
	
	@Autowired
	private ReviewBoardService reviewService;
	
	@Autowired
	private UserService userService;
	
	//여행지 메인 read
	@RequestMapping("/areaIndex")
	public String AreaList() {
		
		log.info("area_List...");
		
		return "/review_board/areaIndex";
	}
	
	
	//여행지 목록 read
	@RequestMapping("/review_boardList")
	//작성 후(write 메서드) 보낸 파라메터 값(지역명)을 받기 위해 @RequestParam 을 사용한다.
	public String ReviewList(ReviewBoardVO reviewBoardVO, Model model, @RequestParam("rArea") String reviewArea) throws Exception {
		
		log.info("review_boardList...");
		
		if(!"".equals(reviewArea) || reviewArea != null  ) { //만약 rArea가 ""이 아니거나 null값이 아니면, rArea의 값을 vo에 넣어준다.
			reviewBoardVO.setrArea(reviewArea);
		}
		
		model.addAttribute("rList", reviewService.getReviewList(reviewBoardVO));
		model.addAttribute("rArea", reviewBoardVO.getrArea());
		
		log.info("rList" + reviewService.getReviewList(reviewBoardVO));
		log.info("rArea" + reviewBoardVO.getrArea());
		
		
		//
//		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		   if (principal instanceof UserDetails) { // user id 가져오기 성공
//			   String userId = ((UserDetails)principal).getUsername(); 
//			   model.addAttribute("userDetail", userService.readUser(userId));
//			} else { //user id 가져오기 실패
//				model.addAttribute("userDetail", "");  
//			}
//		   
//		   ReviewBoardVO rBoardVO = reviewService.getrBoardNum(reviewBoardVO.getrBoardNum());
//		   userService.readUser(rBoardVO.getrId());
//		   model.addAttribute("profileImg", userService.readUser(rBoardVO.getrId()));  
		//
		   
		   
		return "/review_board/userReviewList";
	}
	
	
	
	
	//Ajax 목록 read
	@RequestMapping("/review_boardList_ajax") 
	@ResponseBody
	public List<ReviewBoardVO> ReviewListAjax(@RequestBody ReviewBoardVO reviewBoardVO, Model model) throws Exception {
	  
	   log.info("review_boardList_ajax..."); 
	   log.info("rArea"+ reviewBoardVO.getrArea());
	     
	   List<ReviewBoardVO> reviewList = null;
	    
	   if(reviewBoardVO.getrCategory() == 0) { //if category가 0이면 모든 리스트를 출력, 아니면 ajax 리스트
		   reviewList = reviewService.getReviewList(reviewBoardVO);
	   }else {
		   reviewList = reviewService.getReviewListAjax(reviewBoardVO);
	    	
	   }
	   model.addAttribute("rList", reviewService.getReviewList(reviewBoardVO));	   
		
	   return reviewList ;
	}

	
	//여행지 내용 read
	@GetMapping("/review_contentView") 
	public String ReviewContentView(ReviewBoardVO reviewBoardVO, Model model,  @RequestParam("area") String area, Authentication authentication) throws Exception {
		
		if(area != "") { //if area가 ""아니면, area를 jsp에 area라는 이름으로 뿌려준다.
			model.addAttribute("area", area);
			log.info("Area..");
		}
		
		log.info("rContent_view...");
		
		model.addAttribute("rContentView", reviewService.getrBoardNum(reviewBoardVO.getrBoardNum()));
		log.info("rContentView=" + reviewService.getrBoardNum(reviewBoardVO.getrBoardNum()));
		
		List<Map<String, Object>> fileList = reviewService.selectFileList(reviewBoardVO.getrBoardNum());
		model.addAttribute("file", fileList);
		
		CustomUser loginInfo =  authentication != null ? (CustomUser) authentication.getPrincipal() : null;

		if(loginInfo == null) {
			model.addAttribute("isSelectLike", false); // 로그인 안된사람은 좋아요 눌르지 못하니 false리턴
		} else {
			int likeCount = reviewService.getLikeCount(reviewBoardVO.getrBoardNum(), loginInfo.getUser().getId()); // 로그인 유저가 해당 게시글 좋아요 버튼 눌렀는지 알기 위해 해당 테이블 조회
			log.info("like Count	:"+likeCount);
			model.addAttribute("isSelectLike", likeCount > 0);
		}
		
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) { // user id 가져오기 성공
			String userId = ((UserDetails) principal).getUsername();
			model.addAttribute("userDetail", userService.readUser(userId));
		} else { // user id 가져오기 실패
			model.addAttribute("userDetail", "");
		}

		ReviewBoardVO rBoardVO = reviewService.getrBoardNum(reviewBoardVO.getrBoardNum());
		userService.readUser(rBoardVO.getrId());
		model.addAttribute("profileImg", userService.readUser(rBoardVO.getrId()));

		
		
		
		
		
		return "/review_board/reviewContentView";
	}
	
	
	//여행지 작성 뷰 read
	@RequestMapping("/review_writeView")
	public String ReviewWriteView(ReviewBoardVO reviewBoardVO ,Model model) throws Exception {
		
		log.info("review_writeView...");
		model.addAttribute("rArea", reviewBoardVO.getrArea());
		
		return "/review_board/writeView";
	}
	
	
	//여행지 작성 create
	@RequestMapping("/review_write")
	public String Write(ReviewBoardVO reviewBoardVO, String area, RedirectAttributes redirect, MultipartHttpServletRequest mpRequest) throws Exception {
		
		log.info("review_write...");
		log.info("area="+ area);
		reviewService.rWriteBoard(reviewBoardVO, mpRequest);
		
		//redirect로 parameter값 전달(get방식으로 area값을 보내주기 위해 redirect를 한다.) **받는 곳에서 반드시 @RequestParam으로 매핑해주어야함!!!
		redirect.addAttribute("rArea", area);  
		
		return "redirect:review_boardList";
	}
	
	
	//여행지 게시판 수정 뷰 read
	@ResponseBody
	@GetMapping("/ReviewModifyIdCheck") 
	public String ReviewModifyIdCheck(ReviewBoardVO reviewBoardVO, Model model, String area) throws Exception {
	
		int result = 0;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		log.info("ReviewModifyIdCheck...");
		
		String username = ((UserDetails)principal).getUsername();
		String userId = reviewService.reviewBoardUserId(reviewBoardVO.getrBoardNum());
		
		log.info("username:" + username);
		log.info("userid:" + userId);
		
		
		if (username.equals(userId)) {				
			
			reviewBoardVO.setrId(username);
			model.addAttribute("rModifyView", reviewService.getrBoardNum(reviewBoardVO.getrBoardNum()));
			model.addAttribute("area", area);
			
			List<Map<String, Object>> fileList = reviewService.selectFileList(reviewBoardVO.getrBoardNum());
			model.addAttribute("file", fileList);
			
			result = 1;
			 
			log.info("수정 접속 성공");
			log.info(result);	
			
		}
		
		log.info(result);
				
		//return "/review_board/modifyView";
		return String.valueOf(result);
	}
	
	
	
	@GetMapping("/review_modifyView") 
	public String ReviewModifyView(ReviewBoardVO reviewBoardVO, Model model, String area) throws Exception {
	
					
			
			model.addAttribute("rModifyView", reviewService.getrBoardNum(reviewBoardVO.getrBoardNum()));
			model.addAttribute("area", area);
			
			List<Map<String, Object>> fileList = reviewService.selectFileList(reviewBoardVO.getrBoardNum());
			model.addAttribute("file", fileList);
			
	
		return "/review_board/modifyView";
		
	}
	
	
	
	
	
	
	
	//여행지 게시판 수정 update
	@RequestMapping("/review_modify")
	public String reviewModify(ReviewBoardVO reviewBoardVO, RedirectAttributes redirect, MultipartHttpServletRequest mpRequest) throws Exception {
			
		log.info("review_modify...");	
		
		reviewService.updaterModify(reviewBoardVO, mpRequest);
				
		redirect.addAttribute("area", reviewBoardVO.getrArea());
		redirect.addAttribute("rBoardNum", reviewBoardVO.getrBoardNum());
		
		return "redirect:review_contentView";
	}

	
	//여행지 게시판 삭제 delete
	@ResponseBody
	@GetMapping("/review_delete") 
	public String ReviewDelete(ReviewBoardVO reviewBoardVO, RedirectAttributes redirect) throws Exception{
		
	    log.info("review_delete...");
	    
	    int result = 0;
	   
	    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    
	    String username = ((UserDetails)principal).getUsername();
		String userId = reviewService.reviewBoardUserId(reviewBoardVO.getrBoardNum());
		
		log.info("username:" + username);
		log.info("userid:" + userId);
		
		if (username.equals(userId)) {
			
			log.info("삭제 성공");
			
			reviewBoardVO.setrId(username);
			redirect.addAttribute("rArea", reviewBoardVO.getrArea());
			
			reviewService.deleteBoard(reviewBoardVO);
			
			result = 1;		
			log.info(result);
		}
	    
		log.info(result);
		
		return String.valueOf(result);
	}
	
	
	
	


	
	//ckeditor 이미지 저장 create
	@RequestMapping("/img/imageUpload.do")
    public void ImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception{
        
		//파일명 변경
        UUID uid = UUID.randomUUID();
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        try{           
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();          
        	
            //저장되는 이미지 경로
            String path = "C:\\Review\\" + "ckImage/";

            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
           
            //저장파일이 존재하지 않는다면
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 만들어준다. (디렉토리)
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            
            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush();
            
            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/ex/img/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName+ "&#";         
            
            printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
            printWriter.flush(); 

        }catch(IOException e){
            e.printStackTrace();
        } finally {
          try {
           if(out != null) { out.close(); }
           if(printWriter != null) { printWriter.close(); }
          } catch(IOException e) { e.printStackTrace(); }
         }
        
        return;
    }
	
	
	//이미지 저장 create
	@RequestMapping("/img/ckImgSubmit.do")
    public void CkSubmit(@RequestParam(value="uid") String uid
                            , @RequestParam(value="fileName") String fileName,HttpServletResponse response) throws ServletException, IOException{
        
		String path = "C:\\Review\\" + "ckImage/";
	   
	    String sDirPath = path + uid + "_" + fileName;
		
	    File imgFile = new File(sDirPath);
    
	    if(imgFile.isFile()){
	        byte[] buf = new byte[1024];
	        int readByte = 0;
	        int length = 0;
	        byte[] imgBuf = null;
	        
	        FileInputStream fileInputStream = null;
	        ByteArrayOutputStream outputStream = null;
	        ServletOutputStream out = null;
	        
	        try{
	            fileInputStream = new FileInputStream(imgFile);
	            outputStream = new ByteArrayOutputStream();
	            out = response.getOutputStream();
	            
	            while((readByte = fileInputStream.read(buf)) != -1){
	                outputStream.write(buf, 0, readByte);
	            }
	            
	            imgBuf = outputStream.toByteArray();
	            length = imgBuf.length;
	            out.write(imgBuf, 0, length);
	            out.flush();
	            
	        }catch(IOException e){
	            log.info(e);
	        }finally {
	            outputStream.close();
	            fileInputStream.close();
	            out.close();
	        }
	    }
	}
	
	
	//댓글 등록 create
	@ResponseBody
	@RequestMapping("/review_contentView/registReply")
	public void RegistReply(ReviewReplyVO reviewReply) throws Exception {
		
		log.info("regist reply");	 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	 
		if(principal instanceof UserDetails) {
		  String username = ((UserDetails)principal).getUsername();
		  log.info(username);
		  reviewReply.setId(username);
		}else{ 
		  String username = principal.toString();	   	   
		}
	
		reviewService.registReply(reviewReply);
	}
	
	
	//댓글 리스트 read
	@ResponseBody
	@RequestMapping("/review_contentView/replyList")
	public List<ReviewReplyVO> getReplyList(@RequestParam("n") int reviewBoardNum) throws Exception {
		
		log.info("get reply list...");	   
		List<ReviewReplyVO> reply = reviewService.replyList(reviewBoardNum);
	 
		return reply;
	} 
	
	//댓글 삭제 delete
	@ResponseBody
	@RequestMapping("/review_contentView/deleteReply")
	public String getReplyList(ReviewReplyVO reviewReply) throws Exception {
	
		int result = 0;		 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();	 
		String username = ((UserDetails)principal).getUsername();
		String userId = reviewService.replyUserIdCheck(reviewReply.getRepNum());
		log.info(userId);
		 
		if(username.equals(userId)) {			
			reviewReply.setId(username); 
			log.info(username);
			reviewService.deleteReply(reviewReply);
			  
			result = 1;		  
			log.info("result" + result);
		}
		 
		log.info("result " + result);
		 
		return String.valueOf(result);
	 
	}
	
	//여행지 게시판 검색
	@GetMapping("/review_boardByTitle")
	public String reviewBoardByTitle(ReviewBoardVO reviewBoardVO, Model model) {  
	
		log.info("reviewBoardByTitle");
		
		reviewService.reviewBoardByTitle(reviewBoardVO);
		log.info("freeBoardVO=" + reviewBoardVO);
		
		model.addAttribute("reviewBoardByTitle", reviewService.reviewBoardByTitle(reviewBoardVO));
		model.addAttribute("title", reviewBoardVO.getrTitle());
		
		return "/wmk_home/allAreaContentView";
	}
	
}



