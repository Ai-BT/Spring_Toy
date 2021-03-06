package com.wmk.ex.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.wmk.ex.security.CustomUserDetailService;
import com.wmk.ex.service.UserService;
import com.wmk.ex.vo.CustomUser;
import com.wmk.ex.vo.KakaoProfile;
import com.wmk.ex.vo.KakaoProfile.KakaoAccount;
import com.wmk.ex.vo.OAuthToken;
import com.wmk.ex.vo.ResponseVO;
import com.wmk.ex.vo.UserVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class UserController {

	private UserService userService;

	@Inject
	private BCryptPasswordEncoder passEncoder;

	@Autowired
	private CustomUserDetailService customUserDetailService;

	@PostMapping("/addUser")
	public String adduser(UserVO userVO) {

		log.info("post register");
		userService.addUser(userVO);

		return "redirect:/loginForm";
	}

	// delete view ??????????????????
	@GetMapping("/userDeleteView")
	public String userDeleteView() {
		log.info("welcome userDeleteView!");
		return "user/UserDeleteView";
	}

	// ????????????
	@PostMapping("user/userDelete")
	@ResponseBody
	public String userDelete(@RequestBody UserVO userVO, Authentication authentication, HttpServletRequest request)
			throws Exception {
		Gson gson = new Gson();
		CustomUser loginInfo = (CustomUser) authentication.getPrincipal();
		log.info("loginInfo:  " + loginInfo);
		boolean isValidPassword = passEncoder.matches(userVO.getPw(), loginInfo.getUser().getPw());
		
		log.info("userVO.getPw()   :  " + userVO.getPw());
		log.info("loginInfo.getUser().getPw()   :  " +  loginInfo.getUser().getPw());
		log.info("true & fail isValidPassword   :  " + isValidPassword);
		log.info("login ID      :  " + loginInfo.getUser().getId());
		log.info("login password   :  " + userVO.getPw());
		log.info("login Encoding password   :  " + loginInfo.getUser().getPw());
		log.info(" true & fail   : " + isValidPassword + "  matches   :  " + userVO.getPw() + "     :     "
				+ loginInfo.getUser().getPw());
		
		if (isValidPassword) {
			userVO.setId(loginInfo.getUser().getId());
			userVO.setPw(loginInfo.getUser().getPw());

			userService.userDelete(userVO);
			log.info("Delete success");

			request.getSession().invalidate();
			log.info("logout success ");

			return gson.toJson(new ResponseVO<>(200, "success"));
		}
		log.info("notValidPassword");
		return gson.toJson(new ResponseVO<>(400, "fail"));

	}

	// ???????????? ????????? ????????????
	@GetMapping(value = "/user/check")
	@ResponseBody
	public String checkSameId(@RequestParam("id") String id) {
		Gson gson = new Gson();
		log.info("Login ID  :  " + id);
		try {
			if (id.isEmpty()) {
				log.info("id.isEmpty :  " + id.isEmpty());
				return gson.toJson(new ResponseVO<>(401, false));
			}

			UserVO userVO = userService.getUserById(id);
			log.info("UserVO = null ? notnull? : " + userVO);
			if (userVO != null) {
				return gson.toJson(new ResponseVO<>(400, false));
			}

		} catch (Exception e) {
			return gson.toJson(new ResponseVO<>(500, false));
		}
		return gson.toJson(new ResponseVO<>(200, true));

	}

	
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(String code, HttpServletRequest request) throws Exception {

		Gson gson = new Gson();
		RestTemplate rt = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "af9546b83fbd65051801d2e327f8c259");
		params.add("redirect_uri", "http://localhost:8282/ex/auth/kakao/callback");
		params.add("code", code);

		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);

		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		RestTemplate rt2 = new RestTemplate();

		
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");


		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);


		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoProfileRequest2, String.class);

		System.out.println(response2.getBody());

		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		try {
			// ????????? ????????? ?????? ?????? ???
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
			log.info(gson.toJson(kakaoProfile));
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// ???????????? ?????? ????????????
		String socialUserId = kakaoProfile.getId().toString();
		UserVO loginUserInfo = userService.getUserByIdAndLoginType(socialUserId, "kakao");

		log.info("socialUserId    :"+socialUserId);
		log.info("loginUserInfo   :"+loginUserInfo);
		log.info("?????????");

		if (loginUserInfo == null) {
			// ?????? ????????? ????????? ????????? ??????
			UserVO socialRegisterUser = UserVO.builder()
					.id(socialUserId)	//??????????????? ???????????? ????????? 
					.pw(kakaoProfile.getId() + "kakao")
					.nickname(kakaoProfile.getProperties()//???????????? ????????? ?????????
					.getNickname())
					.email(" ")
					.nationality("nationality")
					.enabled(1)
					.login_Type("kakao")//????????? ????????? kakao????????? 
					.build();
			log.info(" ????????? ?????????!! 	;" + gson.toJson(socialRegisterUser));
			userService.addUser(socialRegisterUser);
			//service????????? ?????? ?????? 
		}

		// ???????????? ???????????? ?????? ?????? ?????? ???????????? ?????? ?????? ?????? ??????
		UserDetails userDetails = customUserDetailService.loadUserByUsername(socialUserId);

		log.info(" ??????????????? ?????? 	;" + gson.toJson(loginUserInfo));
		// ????????? ????????? ??????

		// ???????????? + ????????????(2?????? ????????????) ??? ?????? ????????? ???????????? ??????
		Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, socialUserId + "kakao",
				userDetails.getAuthorities());
		// ????????? ????????? ????????? ???????????? ??????????????? ?????? ?????? ???????????? ?????? ????????????
		SecurityContext securityContext = SecurityContextHolder.getContext();
		// ????????? ???????????? ??????????????? ????????? ?????? ??????????????? ????????????.
		securityContext.setAuthentication(authentication);
		HttpSession session = request.getSession(true);
		// ???????????? ????????? ????????? ??????
		session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);

		return "redirect:/index"; // ????????? ????????? ??????????????? ?????? ???
	}

	@GetMapping("/userModify")
	public String modify() {
		log.info("modify personal information");
		return "user/userModify";
	}

	@GetMapping("/userPwModify")
	public String Pwmodify() {
		log.info("password modify personal information");
		return "user/userPwModify";
	}

	@PostMapping("/update")
	public String userModify(UserVO userVO, HttpSession session) {
		log.info("to Modify user information");

		log.info(userVO.getId());
		log.info(userVO.getPw());
		log.info(userVO.getNickname());
		log.info(userVO.getEmail());
		log.info(userVO.getNationality());

		userService.modifyUser(userVO);
		session.invalidate();

		return "redirect:/index";
	}

	@PostMapping("/pwupdate")
	public String userPwModify(UserVO userVO, HttpSession session) {
		log.info("to Modify user information");

		log.info(userVO.getId());
		log.info(userVO.getPw());

		userService.pwModifyUser(userVO);
		session.invalidate();

		return "redirect:/index";
	}
	
	@GetMapping("/uploadProfile")
	public String uploadProfile() {
		log.info("upload Profile Img");
		return "user/userUploadProfile";
	}

	@PostMapping("/uploadProfileImg")
	public String uploadProfileImg(UserVO userVO, Model model, MultipartHttpServletRequest mpRequest)  throws Exception {

		  Iterator<String> iterator = mpRequest.getFileNames();
		  
		  MultipartFile multipartFile; 
		  String originalFileName = null; 
		  String originalFileExtension; 
		  String storedFileName = null;
		  
		  String filePath = "C:\\WMKOREA\\ThumbnailImg\\"; // ????????? ????????????
		  
		  File file = new File(filePath); 
		  if (file.exists() == false) { 
			  file.mkdirs();
		  }
		  
		  multipartFile = mpRequest.getFile(iterator.next()); 
		  if(multipartFile.isEmpty() == false) { 
		  originalFileName = multipartFile.getOriginalFilename(); 
		  originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); 
		  storedFileName = getRandomString() + originalFileExtension;
		  
		  file = new File(filePath + storedFileName); 
		  multipartFile.transferTo(file);
		  
		  }
		  
		  Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		  String userId = ((UserDetails)principal).getUsername(); 
		  userVO.setId(userId);
		  userVO.setProfile(originalFileName);
		  userVO.setImgName(storedFileName);
		  userService.uploadProfileImg(userVO);
		return "redirect:/mypage";
	}

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}