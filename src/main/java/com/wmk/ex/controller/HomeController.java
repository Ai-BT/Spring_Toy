package com.wmk.ex.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wmk.ex.service.UserService;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("Welcome home! The client locale is {}.");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@GetMapping(value="index")
	public String index(Model model) {
		log.info("index...");
		
		return "/wmk_home/index";
	}
	

	@GetMapping("/characterMaking")
	public String character(Model model) {
		log.info("character...");
		return "/wmk_home/characterMaking";
	}
	
	
	@GetMapping("/loginForm") 
	public String login(Model model) {
		log.info("loginForm...");
		return "/wmk_home/loginForm";
	}
		
	@GetMapping("/joinForm") 
	public String join(Model model) {		
		log.info("joinForm...");
		return "/wmk_home/joinForm";
	}
	
	
	@GetMapping("/mypage") 
	public String myPage(Model model) {
		log.info("mypage...");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		
		if (principal instanceof UserDetails) { // user id 가져오기 성공
			String userId = ((UserDetails)principal).getUsername(); 
			   model.addAttribute("userDetail", userService.readUser(userId));
			} else { //user id 가져오기 실패
				model.addAttribute("userDetail", "");  
			}
		return "/wmk_home/myPage";
	}
		
	
	@GetMapping("tiles")
	public String layout(Model model) {
		return "layout";
	}
	

	@GetMapping("/accessDenied")
	public String accessDenied(Model model) {
		return "accessDenied";
	}
	
	@GetMapping("/loginFail")
	public String loginFail(Model model) {
		return "loginFail";
	}
	
	@GetMapping("/modifyFail")
	public String modifyFail() {
		return "modifyFail";
	}
	
	@GetMapping("seoulList")
	public String seoulList(Model model) {
		return "seoulList";
	}
	
	@GetMapping("seoulCotentView")
	public String seoulCotentView(Model model) {
		return "seoulCotentView";
	}
}
