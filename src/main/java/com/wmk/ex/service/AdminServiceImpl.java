package com.wmk.ex.service;


import java.util.List;
import org.springframework.stereotype.Service;

import com.wmk.ex.mapper.AdminMapper;
import com.wmk.ex.vo.CategoryVO;
import com.wmk.ex.vo.GoodsVO;
import com.wmk.ex.vo.GoodsViewVO;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j 
@Service
public class AdminServiceImpl implements AdminService {
	
	
	private AdminMapper adminMapper;
	
	//상품 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		
		return adminMapper.category();
	}
	
	//상품 등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		adminMapper.register(vo);
		
	}
	
	//상품 리스트
	@Override
	public List<GoodsViewVO> goodslist() throws Exception {
		log.info("goodslist...");
		return adminMapper.goodslist();
		
	}
	
	//상품 내용
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return adminMapper.goodsView(gdsNum);
	}
	
	
	//상품 삭제
	@Override
	public void goodsDelete(GoodsViewVO goodsViewVO) throws Exception {
		
		log.info("goodsDelete...");
		adminMapper.goodsDelete(goodsViewVO);
		
	}
	


}



