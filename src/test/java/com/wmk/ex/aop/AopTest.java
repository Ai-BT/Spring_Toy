package com.wmk.ex.aop;



import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wmk.ex.service.FreeBoardService;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/aop-context.xml" })
@Log4j
public class AopTest {

	@Inject
	private FreeBoardService freeService;
	
	@Test
	public void testServiceAop() throws Exception {
		
		log.info("리스트 시작");
		log.info(freeService.getList());
		log.info("리스트 끝");
		
	}
}
