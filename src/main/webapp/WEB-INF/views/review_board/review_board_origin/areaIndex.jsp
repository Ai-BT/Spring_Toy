<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 시큐리티 전용 태그 -->



<!DOCTYPE html>
<html lang="en">
<head>
  <title>Wemade Korea</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형에 반드시 필요한태그 -->
      
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
	
<!-- 	<style> /* Font responsive  */
	body {font-size: 16px;}
	#district {font-size: 1rem;}
	#disf {
	/* font-size: 4rem; */
	font-size: 4vw;}
	</style> -->
	
	<style>
	
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>
  
	<style>
 	#s1 {
	/* background: blue; */
	line-height:55px;
	}

 	#s1 img {
 	vertical-align:middle;
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

</head>
<body>

<div class="container"> <!-- table -->
	<div class="row"> <!-- td -->
	
		<div class="col-sm-6" id="s1">
			<a href="index"><img src="img/main_logo2.png"></a>
		</div> <!-- tr -->
		
		<div class="col-sm-6" id="s2">
			<!-- Search Bar -->
<!-- 			<p>Search Bar</p> -->
		<p>
 		<div class="input-group mb-3">
  			<input type="text" class="form-control" placeholder="Search">
  			<div class="input-group-append">
    			<button class="btn btn-danger" type="submit">Go</button>
  			</div>
		</div>
			<!-- Search Bar End -->
		</div>
	</div>
</div>

<!-- <nav class="navbar navbar-expand-md bg-light navbar-light sticky-top"> -->
<nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">
	
	<!-- Brand Logo -->
	<a class="navbar-brand" href="#">MENU</a>
	
	<!-- Toggler -->
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<!-- Content -->
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
	<ul class="navbar-nav">

		<li class="nav-item">
			<a class="nav-link" href="index">메인</a>
		</li>
				
		<li class="nav-item">
			<a class="nav-link" href="#">핫플레이스</a>
		</li>
				
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			내 캐릭터 만들기
			</a>
			<div class="dropdown-menu">
        	<a class="dropdown-item" href="characterMaking">내 캐릭터 만들기</a>
        	<a class="dropdown-item" href="goodsIndex">굿즈(테스트)</a>
        	<a class="dropdown-item" href="goodsList">굿즈</a>
      		</div>
		</li>
		
		<!-- Dropdown -->				
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			커뮤니티
			</a>
			<div class="dropdown-menu">
        	<a class="dropdown-item" href="free_boardList">자유 게시판</a>
        	<a class="dropdown-item" href="areaIndex">여행지 게시판</a>
        	<a class="dropdown-item" href="${pageContext.request.contextPath}/list">테스트용 게시판</a>
      		</div>
		</li>
		
	</ul>
	
	</div>

<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
 	<ul class="navbar-nav"> 
	<div class="btn-group btn-group-sm">
	
<sec:authorize access="isAnonymous()"> <!-- isAnonumous: 누구나 다 access 할 수있다 -->
   		<a href="loginForm" class="btn btn-secondary" type="button">Login</a>
		<a href="joinForm" class="btn btn-secondary" type="button">Join</a> 
		<a href="http://google.com" class="btn btn-secondary" type="button">My Page</a>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
		<a class="btn btn-dark">환영합니다, <sec:authentication property="principal.user.nickname"/> 님!</a>
   		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
   			<input type="submit" class="btn btn-secondary btn-sm" value="Logout">
   		</form:form> 
		<a href="mypage" class="btn btn-secondary" type="button">My Page</a>
</sec:authorize>

	</div>

 	</ul>
	</div>

</nav>


<p>
<div class="container">
<p align="center" class="display-3" id="disf">위메코 생생후기</p>
</div><br>






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
    
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Second Line >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->    

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
<br><br><br>


<div class="jumbotron text-center" style="margin-bottom:0">
<p>Copyright © 2020 Wemade Korea All rights reserved</p>
</div>  


</body>
</html>