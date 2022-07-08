package com.wmk.ex.mapper;

import java.util.List;

import com.wmk.ex.vo.CategoryVO;
import com.wmk.ex.vo.GoodsVO;
import com.wmk.ex.vo.GoodsViewVO;

public interface AdminMapper {
	
	//상품 카테고리
	public List<CategoryVO> category() throws Exception; 
	
	//상품 등록
	public void register(GoodsVO vo) throws Exception; 
	
	//상품 리스트
	public List<GoodsViewVO> goodslist() throws Exception;
	
	//상품 내용
	public GoodsViewVO goodsView(int gdsNum) throws Exception;	
	
	//상품삭제
	public void goodsDelete(GoodsViewVO goodsViewVO) throws Exception;
}
