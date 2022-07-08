<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>   
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
 	#s1 {
	/* background: blue; */
	line-height:55px;
	}

 	#s1 img {
 	vertical-align:middle;
	}
	
	</style>
	
<style>

	body, html {
  height: 100%;
  margin: 0;
/*    font-family: Arial, Helvetica, sans-serif; */
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

</style>
	
	
<%-- 	<style>
	
  /* Make the image fully responsive */
  #imginfo {
    width: 200;
    height: 100;
  }
  </style> --%>
  
  	<style>
	
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
	height: 230px;
  }
  
  .list_picture img {
    width: 100%;
	height: 230px;
  
  }
  
  </style>	


</head>
<body>

<div class="container"> <!-- table -->
	<div class="row"> <!-- td -->
	
		<div class="col-sm-6" id="s1">
			<img src="img/main_logo2.png">
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
        	<a class="dropdown-item" href="boardList">내 캐릭터 만들기</a>
        	<a class="dropdown-item" href="#">굿즈</a>
      		</div>
		</li>
		
		<!-- Dropdown -->				
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			커뮤니티
			</a>
			<div class="dropdown-menu">
        	<a class="dropdown-item" href="boardList">자유 게시판</a>
        	<a class="dropdown-item" href="#">여행지 게시판</a>
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


<!-- This is banner -->
<div class="hero-image">
  <div class="hero-text">
	<p style="font-size:60px" class="display-3">서울 (Seoul)</p>
	<p>We Make Our World</p>
  </div>
</div>

<!-- Group button -->
<p><br>
<div class="container" id="district">

  <div class="row">
  
  	<div class="col-sm-2">
  	</div>
  	
  	
  	<div class="col-sm-8" align="center">
		<!-- Group button details-->
		<div class="btn-group btn-group btn-block">
			<button type="button" class="btn btn-secondary">관광지</button>
		    <button type="button" class="btn btn-secondary">행사</button>
		    <button type="button" class="btn btn-secondary">맛집</button>
		    <button type="button" class="btn btn-secondary">기타</button>
		</div>  	
  	</div>
  	
  	
  	<div class="col-sm-2">
  	</div>
  
  </div>
  
  
</div>


  <div class="album py-5">
    <div class="container">
		<div class="row">
		
		<div class="col-md-4"> <!-- <div class="card mb-4 shadow-sm"> -->
	  <div class="card shadow-sm">
	  	<div class="list_picture">
		<a href="seoulCotentView"><img src="img/travel_board_img/kyungbok.jpg" class="img-fluid mx-auto d-block rounded"></a>
	    </div>
	    <div class="card-body">
	      <p class="card-text"><strong>경복궁</strong><br>투어 & 박물관이 있는 역사적인 궁전</p>

	      <h class="text-warning">★★★★★</h> (5) <br>
	      <span class="badge  badge-pill badge-danger ">Like</span> 18 
	      <span class="badge  badge-pill badge-success">분류</span> 관광지
	    </div>
	  </div>
	  <br>
        </div>
        
	<div class="col-md-4"> <!-- <div class="card mb-4 shadow-sm"> -->
	  <div class="card shadow-sm">
	  	<div class="list_picture">
		<a href="http://google.com"><img src="img/travel_board_img/n_tower.jpg" class="img-fluid mx-auto d-block rounded"></a>
	    </div>
	    <div class="card-body">
	      <p class="card-text"><strong>N서울타워</strong><br>도시의 전경을 조망할 수 있는 타워 & 레스토랑</p>

	      <h class="text-warning">★★★★☆</h> (4) <br>
	      <span class="badge  badge-pill badge-danger ">Like</span> 18 
	      <span class="badge  badge-pill badge-success">분류</span> 관광지
	    </div>
	  </div>
	  <br>
        </div>
        
		<div class="col-md-4"> <!-- <div class="card mb-4 shadow-sm"> -->
	  <div class="card shadow-sm">
	  	<div class="list_picture">
		<a href="http://google.com"><img src="img/travel_board_img/myungdong.jpg" class="img-fluid mx-auto d-block rounded"></a>
	    </div>
	    <div class="card-body">
	      <p class="card-text"><strong>명동</strong><br>다양한 쇼핑 및 캐주얼한 세계 각국의 요리를 선보이는 식당</p>
	      <h class="text-warning">★★★☆☆</h> (3) <br>
	      <span class="badge  badge-pill badge-danger ">Like</span> 22 
	      <span class="badge  badge-pill badge-success">분류</span> 맛집
	    </div>
	  </div>
	  <br>
        </div>        
        

        
       <!-- second line -->
		<div class="col-md-4"> <!-- <div class="card mb-4 shadow-sm"> -->
	  <div class="card shadow-sm">
	  	<div class="list_picture">
		<a href="seoulCotentView"><img src="img/travel_board_img/kyungbok.jpg" class="img-fluid mx-auto d-block rounded"></a>
	    </div>
	    <div class="card-body">
	      <p class="card-text"><strong>경복궁</strong><br>투어 & 박물관이 있는 역사적인 궁전</p>

	      <h class="text-warning">★★★★★</h> (5) <br>
	      <span class="badge  badge-pill badge-danger ">Like</span> 18 
	      <span class="badge  badge-pill badge-success">분류</span> 관광지
	    </div>
	  </div>
	  <br>
        </div>
        
	<div class="col-md-4"> <!-- <div class="card mb-4 shadow-sm"> -->
	  <div class="card shadow-sm">
	  	<div class="list_picture">
		<a href="http://google.com"><img src="img/travel_board_img/n_tower.jpg" class="img-fluid mx-auto d-block rounded"></a>
	    </div>
	    <div class="card-body">
	      <p class="card-text"><strong>N서울타워</strong><br>도시의 전경을 조망할 수 있는 타워 & 레스토랑</p>

	      <h class="text-warning">★★★★☆</h> (4) <br>
	      <span class="badge  badge-pill badge-danger ">Like</span> 18 
	      <span class="badge  badge-pill badge-success">분류</span> 관광지
	    </div>
	  </div>
	  <br>
        </div>
        
		<div class="col-md-4"> <!-- <div class="card mb-4 shadow-sm"> -->
	  <div class="card shadow-sm">
	  	<div class="list_picture">
		<a href="http://google.com"><img src="img/travel_board_img/myungdong.jpg" class="img-fluid mx-auto d-block rounded"></a>
	    </div>
	    <div class="card-body">
	      <p class="card-text"><strong>명동</strong><br>다양한 쇼핑 및 캐주얼한 세계 각국의 요리를 선보이는 식당</p>
	      <h class="text-warning">★★★☆☆</h> (3) <br>
	      <span class="badge  badge-pill badge-danger ">Like</span> 22 
	      <span class="badge  badge-pill badge-success">분류</span> 맛집
	    </div>
	  </div>
	  <br>

        </div>             
 
      </div>

  </div>
  
	<!--  board buttons --> 
 	<div class="container">
	<p align="right">
	<a href="travelWriteView" class="btn btn-dark" role="button">글 작성</a>
	</p>
	<br>
	</div>



<div class="jumbotron text-center" style="margin-bottom:0">
<p>Copyright © 2020 Wemade Korea All rights reserved</p>
</div>  


</body>
</html>