package com.wmk.ex.service;

import java.util.List;

import com.wmk.ex.vo.CartListVO;
import com.wmk.ex.vo.CartVO;
import com.wmk.ex.vo.OrderDetailVO;
import com.wmk.ex.vo.OrderListVO;
import com.wmk.ex.vo.OrderVO;



public interface ShopService {
	
	//��ٱ��� ���
	public void addCart(CartVO cart) throws Exception;
	
	//��ٱ��� ����
	public List<CartListVO> cartList(String username) throws Exception;
	
	//��ٱ��� ����
	public void deleteCart (CartVO cart) throws Exception;
	
	
	// �ֹ�����
	public void orderInfo(OrderVO order) throws Exception;

	//�ֹ� �� ����
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;
	
	//īƮ���� 
	public void cartAllDelete(String userId) throws Exception;
	
	//Ư�� ������ �ֹ� ��Ϻ���
	public List<OrderVO> orderList(OrderVO order) throws Exception;
	
	//Ư�� ū �ֹ��� �󼼳��� ����
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	

}
