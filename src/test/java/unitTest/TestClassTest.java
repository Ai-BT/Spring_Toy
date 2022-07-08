package unitTest;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wmk.ex.service.ReviewBoardService;
import com.wmk.ex.vo.ReviewBoardVO;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})

public class TestClassTest {

	   @Setter(onMethod_ = @Autowired)
	   ReviewBoardService reviewBoardService;
	   
	   @Setter(onMethod_ = @Autowired)
	   private WebApplicationContext context;
	   
	   @Before
	   public void setup() {
		   
	   }
	   @Test
	   public void plustest() {
	      int a = 1;
	      int b = 2;
	      
	      Assert.assertEquals(plus(a, b),3);
	   }
	   //유닛테스트 단위 비즈니스 로직에 대한 예측값 > 가장 좁은단위 
	   
	   @Test
	   public void getReviewTest() {
	      int reviewBoardNum = 22;
	      ReviewBoardVO review = reviewBoardService.getrBoardNum(reviewBoardNum);
	      Assert.assertEquals(review.getrBoardNum(),22);
	   }
	   public int getBoardnum(int reviewBoardNum) {
	      return reviewBoardNum;
	   }
	   
	   public int plus(int a,int b) {
	      return a+b;
	   }

	   
}
