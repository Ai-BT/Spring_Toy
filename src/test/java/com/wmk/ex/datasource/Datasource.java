package com.wmk.ex.datasource;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.extern.log4j.Log4j;

//JUnit test는 springFramework를 다 돌리지 않아서 의존성을 주입해주는 context를 같이 돌려야함 
@RunWith(SpringRunner.class) 
//@RunWith 를 사용하면 junit에 내장된 러너를 사용하는 대신 어노테이션으로 정의된 러너클래스를 사용함 
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context2.xml")
//@ContextConfiguration 의 locations 속성에 xml형태의 애플리 케이션 컨텍스트만 로딩가능 ?ㄱㄱ class파일 지정하니까 오류 
@Log4j
public class Datasource {
	
	@Autowired
	private DataSource dataSource;
	//JUnit 
	@Test
	public void testdatasource() {
		//통신과 같이 열어주는 클래스 생성시 try()에 넣으면 자동으로 Try catch 종료시 close함
		try(Connection con = dataSource.getConnection()){
			//Connection클래스에서 closeall()이라는 메소드가 정의 되이뜸
			
			System.out.println("con	:"+con);
		}catch(Exception e) {
			e.printStackTrace();
			//예외 처리 !
		System.out.println("dataSouce	:"+dataSource);
	}
		
	}

	
	
	
	
}
