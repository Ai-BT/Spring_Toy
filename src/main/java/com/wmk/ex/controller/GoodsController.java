package com.wmk.ex.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wmk.ex.service.AdminService;
import com.wmk.ex.service.ShopService;
import com.wmk.ex.service.UserService;
import com.wmk.ex.vo.CategoryVO;
import com.wmk.ex.vo.GoodsVO;
import com.wmk.ex.vo.GoodsViewVO;

import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Log4j
@Controller
public class GoodsController {

	@Inject
	AdminService adminService;

	@Inject
	ShopService shopService;
	
	@Autowired
	UserService userService;

	// 상품 등록 (Get)
	@GetMapping("/admin/goods_register")
	public String getGoodsRegister2(Model model) throws Exception {
		log.info("get goods register");

		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));

		return "/wmk_goods/goods_register";

	}

	// 상품 등록 (Post)
	@PostMapping("/admin/goods_register")
	public String postGoodsRegister2(GoodsVO vo) throws Exception {

		adminService.register(vo);

		return "redirect:/goodsList";

	}

	// 상품 목록
	@GetMapping("/goodsList")
	public String goodsList(Model model) throws Exception {

		log.info("goodList");

		List<GoodsViewVO> list = adminService.goodslist();

		model.addAttribute("list", list);

		return "/wmk_goods/goodsList";

	}

	// 상품 상세내용
	@GetMapping("/goodsView")
	public String goodsView(@RequestParam("n") int gdsNum, Model model) throws Exception {
		log.info("get view");

		GoodsViewVO view = adminService.goodsView(gdsNum);
		model.addAttribute("view", view);

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails)principal).getUsername();

		if (principal instanceof UserDetails) { // user id 가져오기 성공
			model.addAttribute("profileImg", userService.readUser(username));
		} else { //user id 가져오기 실패
			model.addAttribute("profileImg", "");
		}
		
		return "/wmk_goods/goodsView";
		
	}

	// 상품 삭제
	@GetMapping("/admin/goodsDelete")
	public String goodsDelete(GoodsViewVO goodsViewVO) throws Exception {

		log.info("goodsDelete...");
		adminService.goodsDelete(goodsViewVO);

		return "redirect:/goodsList";

	}
	
	
	
}
