package com.wmk.ex.mapper;

import java.util.List;

import com.wmk.ex.vo.CartListVO;
import com.wmk.ex.vo.CartVO;
import com.wmk.ex.vo.OrderDetailVO;
import com.wmk.ex.vo.OrderListVO;
import com.wmk.ex.vo.OrderVO;
import com.wmk.ex.vo.UserVO;

public interface ShopMapper {
	

	public UserVO userIdread(String id) throws Exception;
		
	//장바구니 담기
	public void addCart(CartVO cart) throws Exception;
	
	//카트 리스트
	public List<CartListVO> cartList(String username);
	
	//카트 삭제
	public void deleteCart(CartVO cart) throws Exception;
	
	//주문
	public void orderInfo(OrderVO order) throws Exception;
		
	//�ֹ� ������
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;
	
	//�ֹ��� īƮ ����
	public void cartAllDelete(String userId) throws Exception;
	
	//Ư�� ������ �ֹ���� ����
	public List<OrderVO> orderList(OrderVO order) throws Exception;
	
	//Ư�� ū �ֹ��� �󼼳��� ����
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	

}
