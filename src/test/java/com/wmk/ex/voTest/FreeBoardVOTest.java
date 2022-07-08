package com.wmk.ex.voTest;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Test;

import com.wmk.ex.vo.FreeBoardVO;

import lombok.extern.log4j.Log4j;


@Log4j
public class FreeBoardVOTest {

	@Test
	public void testFreeBoardVO() {
		FreeBoardVOTest freeBoardVO = new FreeBoardVOTest();
		
		log.info(freeBoardVO); //간단한 확인 
		
		assertNotNull(freeBoardVO); // 유식한 확인 
	}
	
	
	  @Test public void testFreeBoardVOAllArgs() { 
		  FreeBoardVO freeBoardVO = new FreeBoardVO(1, "Ejshd", "abc", "abc", new Date(), 1, 1, 1, 1);
	  
		  //객체 사용 되었는지 확인 하는 방법
		  log.info(freeBoardVO); // 간단한 확인
		  
		  assertNotNull(freeBoardVO); // 유식한 확인 
	 
	  }
	

}
