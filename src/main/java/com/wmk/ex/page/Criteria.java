package com.wmk.ex.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Criteria { //페이지 관리
	
	private int pageNum; 
	private int amount; 
	
	public Criteria() {
		this(1, 10); 		
	}
	
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
	
}
