package com.wmk.ex.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wmk.ex.service.ShopService;
import com.wmk.ex.service.UserService;
import com.wmk.ex.vo.CartListVO;
import com.wmk.ex.vo.CartVO;
import com.wmk.ex.vo.OrderDetailVO;
import com.wmk.ex.vo.OrderListVO;
import com.wmk.ex.vo.OrderVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
//@RequestMapping("/shop/*")
public class ShopController {
 
	@Inject
	ShopService service;
	
	@Autowired 
	UserService userService;
	
	//장바구니 추가
	@ResponseBody
	@PostMapping("/addCart")
	public void addCart(CartVO cart, HttpSession session) throws Exception {
		 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 
		String username = ((UserDetails)principal).getUsername();
		cart.setUserId(username);
		service.addCart(cart);	 
	}	 	 
	 
	 
	//장바구니 리스트
	@GetMapping("/cartList")
	public String getCartList(HttpSession session, Model model) throws Exception {
		log.info("get cart list");
		 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails)principal).getUsername();
	  
		List<CartListVO> cartList = service.cartList(username);
	  
		model.addAttribute("cartList", cartList);
		 
		return "/wmk_goods/cartList";
	  
	}

	
	//장바구니 삭제
	@ResponseBody
	@PostMapping("/shop/cartList/deleteCart")
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
		
		log.info("delete cart");	  	  
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 
		String username = ((UserDetails)principal).getUsername();
	   
		int result = 0;
		int cartNum = 0;
		  	  
		if(username != null) {
			cart.setUserId(username);
		   
			for(String i : chArr) {   
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				service.deleteCart(cart);
			}
			
			result = 1;	
		}  
		return result;  
	 }
	 
	
	//제품 주문 (get)
	@GetMapping("/goodsOrder") 
	public String goodsOrder(Model model) throws Exception {
			
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails)principal).getUsername();

		if (principal instanceof UserDetails) { // user id 가져오기 성공
			model.addAttribute("profileImg", userService.readUser(username));
		} else { //user id 가져오기 실패
			model.addAttribute("profileImg", "");
		}
		
		List<CartListVO> cartList = service.cartList(username);
		  
		model.addAttribute("cartList", cartList);
			
		log.info("goodsOrder");
			
		return "/wmk_goods/goodsOrder";

	}
		
		
	//제품 주문 (post)
	@PostMapping("/goodsOrder")
	public String goodsOrder(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
			 
		log.info("order");
			 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			 
		String username = ((UserDetails)principal).getUsername();
			 		  
			  
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
			  
			  
		for(int i = 1; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}
			  
			  
		String orderId = ymd + "_" + subNum;
			  
		order.setOrderId(orderId);
		order.setUserId(username);
			  
		service.orderInfo(order);
			  
		orderDetail.setOrderId(orderId);   
		service.orderInfo_Details(orderDetail);
			  
		service.cartAllDelete(username);
			  
		return "redirect:/goodsOrderComplete";
			  		  
	}
		 	 
	 	 
	 
	//Cart 리스트
	@PostMapping("/cartList")
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
		 
		log.info("order");
		 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 
		String username = ((UserDetails)principal).getUsername();
		 		  
		  
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		  
		  
		for(int i = 1; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}
		  
		  
		String orderId = ymd + "_" + subNum;
		  
		order.setOrderId(orderId);
		order.setUserId(username);
		  
		service.orderInfo(order);
		  
		orderDetail.setOrderId(orderId);   
		service.orderInfo_Details(orderDetail);
		  
		service.cartAllDelete(username);
		  
		return "redirect:/orderList";
		    
	 }
	 
	 
	//구매 완료
	@GetMapping("/goodsOrderComplete")
	public String goodsOrderComplete(HttpSession session, OrderVO order, Model model) throws Exception {
		
		log.info("/goodsOrderComplete");
	  
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 
		String username = ((UserDetails)principal).getUsername();
	  
		if (principal instanceof UserDetails) { // user id 가져오기 성공
			model.addAttribute("profileImg", userService.readUser(username));
		} else { //user id 가져오기 실패
			model.addAttribute("profileImg", "");
		}
		
		order.setUserId(username);
	  
		List<OrderVO> orderList = service.orderList(order);
	  
		model.addAttribute("orderList", orderList);
	  
		return "/wmk_goods/goodsOrderComplete";
	  
	 }
	
	
	
	
	 
	 //주문 목록
	 @GetMapping("/orderList")
	 public String getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
		
		 log.info("get order list");
	  
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 
		 String username = ((UserDetails)principal).getUsername();
		 
		 if (principal instanceof UserDetails) { // user id 가져오기 성공
				model.addAttribute("profileImg", userService.readUser(username));
		 } else { //user id 가져오기 실패
				model.addAttribute("profileImg", "");
		 }
		 
		 order.setUserId(username);
	  
		 List<OrderVO> orderList = service.orderList(order);
	  
		 model.addAttribute("orderList", orderList);
	  
		 return "/wmk_goods/orderList";
	  
	 }
	 
	//주문목록 뷰
	@GetMapping("/orderView")
	public String getOrderList(HttpSession session, @RequestParam("n") String orderId, OrderVO order, Model model) throws Exception {
		log.info("get order view");
	  
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 
		String username = ((UserDetails)principal).getUsername();
	  
		order.setUserId(username);
		order.setOrderId(orderId);
	  
		List<OrderListVO> orderView = service.orderView(order);
	  
		model.addAttribute("orderView", orderView);
	  
		return "/wmk_goods/orderView";
	 }
	 

	 
}

