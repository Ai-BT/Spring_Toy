package com.wmk.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wmk.ex.mapper.ShopMapper;
import com.wmk.ex.vo.CartListVO;
import com.wmk.ex.vo.CartVO;
import com.wmk.ex.vo.OrderDetailVO;
import com.wmk.ex.vo.OrderListVO;
import com.wmk.ex.vo.OrderVO;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class ShopServiceImpl implements ShopService {

	private ShopMapper shopmapper;

	// 장바구니 담기
	@Override
	public void addCart(CartVO cart) throws Exception {

		shopmapper.addCart(cart);

	}

	@Override
	public List<CartListVO> cartList(String username) throws Exception {

		return shopmapper.cartList(username);
	}

	public void deleteCart(CartVO cart) throws Exception {

		shopmapper.deleteCart(cart);

	}

	@Override
	public void orderInfo(OrderVO order) throws Exception {

		shopmapper.orderInfo(order);

	}

	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {

		shopmapper.orderInfo_Details(orderDetail);

	}

	@Override
	public void cartAllDelete(String userId) throws Exception {
		shopmapper.cartAllDelete(userId);

	}

	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {

		return shopmapper.orderList(order);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {

		return shopmapper.orderView(order);
	}

}
