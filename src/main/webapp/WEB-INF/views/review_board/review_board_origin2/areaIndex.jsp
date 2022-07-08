<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 시큐리티 전용 태그 -->



<!DOCTYPE html>
<html lang="en">
<head>
  <title>Wemade Korea</title>

  

	
	<style>
	
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>
  

	
	<style>
	
	.img-container{
	position:relative;

	/*  display:table; */
	}
	.img-container img{
	/* display:block; */
	isplay: table-cell;
	text-align: center;
 	}
	.img-container .overlay{
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgb(0,0,0);
	  opacity:0;
	  transition:opacity 500ms ease-in-out;
	}
	.img-container:hover .overlay{
	  opacity:60%;
	}
	.overlay span{
	  position:absolute;
	  top:50%;
	  left:50%;
	  transform:translate(-50%,-50%);
	  color:#fff;
	}
		
	</style>
	
		<style>
		body, html {
			height: 100%;
			margin: 0;
		}
		
		.hero-image {
			background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("img/banner2.jpg");
			height: 20%;
			background-position: center;
			background-repeat: no-repeat;
			background-size: cover;
			position: relative;
		}
		
		.hero-text {
			text-align: center;
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			color: white;
		}
	</style>
	
	
	

</head>
<body>



<!-- This is banner -->
<div class="hero-image">
  <div class="hero-text">
	<p style="font-size:60px" class="display-3">Community</p>
	<p>We Make Our World</p>
  </div>
</div>


<p><br>



<div class="container" id="free_board">
  <h2>여행지 게시판</h2> 
  <hr><br>
</div>


<div class="container" id="district">
  <div class="row">
	
	<div class="col-sm-4">
	
	<div class="img-container" onclick="location.href='review_boardList?rArea=서울·경기·인천'">
	<p align="center"><a href="review_boardList?rArea='서울·경기·인천'"><img src="img/seoul1.jpg" class="img-fluid mx-auto d-block img-thumbnail" width="400px" height="300px"></a></p><p>
		<div class="overlay">
    	<span><h5>자세히 보기</h5></span>
    	</div>
	</div>
	
      <h4 align="center"><a href="review_boardList?rArea='서울 ·경기·인천'" style="color: black">서울·경기·인천 </a></h4>
      <p align="center">(Seoul·Gyeonggi·Incheon)
   	  <br>
	</div>
	
	
	<div class="col-sm-4">
   	<div class="img-container" onclick="location.href='review_boardList?rArea=강원도'">
	<p align="center"><a href="review_boardList?rArea='강원도'"><img src="img/gang1.jpg" class="img-fluid mx-auto d-block img-thumbnail" width="400px" height="300px"></a></p><p>
       	<div class="overlay">
    	<span><h5>자세히 보기</h5></span>
    	</div>      
    </div>  
      
      
      <h4 align="center"><a href="review_boardList?rArea='강원도'" style="color: black">강원도</a></h4>
      <p align="center">(Gangwon)</p>
      <br>
    </div>  
	
	
	<div class="col-sm-4">
	
	<div class="img-container" onclick="location.href='review_boardList?rArea=충청북도'">
	<p align="center"><a href="review_boardList?rArea='충청북도 '"><img src="img/cb.png" class="img-fluid mx-auto d-block img-thumbnail" width="400px" height="300px"></a></p><p>
		<div class="overlay">
    	<span><h5>자세히 보기</h5></span>
    	</div>
	</div>
	
      <h4 align="center"><a href="review_boardList?rArea='충청북도'" style="color: black">충청북도</a></h4>
      <p align="center">(Chung-cheong bukdo)</p>
   	<br>
	</div>
  	
  
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Second Line >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->    

  	
  	<div class="col-sm-4">
  	<div class="img-container" onclick="location.href='review_boardList?rArea=충청남도'">
    <p align="center"><a href="review_boardList?rArea='충청남도'"><img src="img/ss1.png" class="img-fluid mx-auto d-block img-thumbnail" width="400px" height="300px"></a></p><p> <!-- img-fluid -->
      			<div class="overlay">
    		<span><h5>자세히 보기</h5></span>
    		</div>
    </div>
     
     
      <h4 align="center"><a href="review_boardList?rArea='충청남도'" style="color: black">충청남도</a></h4>
      <p align="center">(Chungcheongnam-do)</p>
      <br>
    </div>
    
    

    	<div class="col-sm-4">
    <div class="img-container" onclick="location.href='review_boardList?rArea=경상북도'">
	<p align="center"><a href="review_boardList?rArea='경상북도 '"><img src="img/GJ.jpg" class="img-fluid mx-auto d-block img-thumbnail" width="400px" height="300px"></a></p><p>
       	<div class="overlay">
    	<span><h5>자세히 보기</h5></span>
    	</div>     
      
    </div>  
      
      <h4 align="center"><a href="review_boardList?rArea='경상북도'" style="color: black">경상북도</a></h4>
      <p align="center">(Gyeongsangbuk-do)</p>
   	<br>
	</div>
    
    
   	
  	
  	
  	<div class="col-sm-4">
   	<div class="img-container" onclick="location.href='review_boardList?rArea=경상남도'"> 	
    <p align="center"><a href="review_boardList?rArea='경상남도 '"><img src="img/tongyoun.jpg" class="img-fluid mx-auto d-block img-thumbnail" width="400px" height="300px"></a></p><p> <!-- img-fluid -->
       	<div class="overlay">
    	<span><h5>자세히 보기</h5></span>
    	</div> 
    	
     </div> 
      <h4 align="center"><a href="review_boardList?rArea='서울 ·경기·인천'" style="color: black">경상남도</a></h4>
      <p align="center">(Gyeongsangnam-do)</p>
      <br>
    </div>
    
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Third Line >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->    

	<div class="col-sm-4">
	<div class="img-container" onclick="location.href='review_boardList?rArea=전라북도'"> 	
	<p align="center"><a href="review_boardList?rArea='전라북도'"><img src="img/gunsan.jpg" class="img-fluid mx-auto d-block img-thumbnail" width="400px" height="300px"></a></p><p>
        <div class="overlay">
    	<span><h5>자세히 보기</h5></span>
    	</div> 
      </div> 
      <h4 align="center"><a href="review_boardList?rArea='전라북도'" style="color: black">전라북도</a></h4>
      <p align="center">(Jeollabuk do)</p>
   	<br>
	</div>
    
    
   	<div class="col-sm-4">
   	<div class="img-container" onclick="location.href='review_boardList?rArea=전라남도'">
	<p align="center"><a href="review_boardList?rArea='전라남도'"><img src="img/JN.jpg" class="img-fluid mx-auto d-block img-thumbnail" width="400px" height="300px"></a></p><p>
      <div class="overlay">
    	<span><h5>자세히 보기</h5></span>
    	</div> 
      </div> 
      <h4 align="center"><a href="review_boardList?rArea='전라남도'" style="color: black">전라남도</a></h4>
      <p align="center">(Jeollanam do)</p>
      <br>
    </div>  
  	
  	
  	<div class="col-sm-4">
  	<div class="img-container" onclick="location.href='review_boardList?rArea=제주도'">
    <p align="center"><a href="review_boardList?rArea='제주도'"><img src="img/jeju.png" class="img-fluid mx-auto d-block img-thumbnail" width="400px" height="300px"></a></p><p> <!-- img-fluid -->
      <div class="overlay">
    	<span><h5>자세히 보기</h5></span>
    	</div> 
      </div> 
      <h4 align="center"><a href="review_boardList?rArea='제주도'" style="color: black">제주도</a></h4>
      <p align="center">(Jeju do)</p>
      <br>
    </div>
  	
  
  </div>
</div>

<br><br>



</body>
</html>