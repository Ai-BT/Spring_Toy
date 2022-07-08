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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	
  
  .content_picture img {
    width: 500px;
	height: 100%;
  
  }
  
  </style>	
  
  

	<style>
	.checked {
	  color: orange;
	}
	</style>
<style>	
hr.new3 {
  border-top: 1px dotted grey;
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
<p><br>

<!-- 게시글 내용 부분 -->
<div class="container">
<table class="table">
    <thead>
	<tr>
		<th align="center"><h3 align="center">[경복궁] 투어 & 박물관이 있는 역사적인 궁전</h3></th>
	</tr>
    </thead>

    <tbody>
      <tr>
        <td>
        <p><span class="badge badge-pill badge-secondary">No</span> 18${contentView.bId}
        <span class="badge badge-pill badge-secondary">조회수</span> 50${contentView.bHit}
                <span class="badge badge-pill badge-secondary">등록일 </span> 2020-09-22${contentView.bDate}
        </p>
        
		<div class="card">
			<div class="card-body">
	        	<div class="row">
        			<div class="col-md-5">
        				<div class="content_picture">
        	       		<img src="img/travel_board_img/kyungbok.jpg" class="rounded img-fluid"/>
        	       		</div><br>
        	    	</div>
        	    
        	     	<div class="col-md-7">
        	     		<strong>작성자${contentView.bName}</strong> admin <br>
        	     		<strong>분류</strong> 관광지(서울)<br>

						<strong>개장 시간</strong> 09:00~21:00(연중 무휴)</br>
						<strong>위치 정보</strong> 서울특별시 종로구 세종로 사직로 161
						<hr class="new3">
						<strong>상세 정보</strong><br>${contentView.bContent}
<!-- 						 <div class="bg-light"> -->
						경복궁은 대한민국 서울 세종로에 있는 조선 왕조의 법궁이다. 
						근정전을 중심으로 하고 있다. 1395년에 창건하였다.
						 ‘경복’은 시경에 나오는 말로 왕과 그 자손, 온 백성들이 태평성대의 큰 복을 누리기를 축원한다는 의미다.
						 풍수지리적으로도 백악산을 뒤로 하고 좌우에는 낙산과 인왕산으로 둘러싸여 있어 길지의 요건를 갖추고 있다. 
						1592년, 임진왜란으로 인해 불탄 이후 그 임무를 창덕궁에 넘겨주었다가 1865년에 흥선대원군의 명으로 중건되었다. 
						일제 강점기에는 조선총독부 건물을 짓는 등 많은 전각들이 훼손되었으나, 
						1990년대부터 총독부 건물을 철거하는 등 복원사업을 벌인 덕분에 복원 작업은 현재 부분 완료된 상태다.
<!-- 						</div>	 -->					
			
					</div>
	       	 	</div>	
			</div>	
		</div>
        
        </td>
      </tr>
    </tbody>
</table>

<%-- <p align="right">
<a href="delete2?bId=${contentView.bId}" class="btn btn-outline-dark btn-sm" role="button">삭제</a>
<a href="modifyView?bId=${contentView.bId}" class="btn btn-outline-dark btn-sm" role="button">수정</a>
</p> --%>

</div>

<!-- Like -->
<div class="container">
<div align="center">
<!-- <img src="img/travel_board_img/like_1.png" class="img-rounded img-fluid" id="like"> -->
<img src="img/travel_board_img/like_1.png" width="70" onmouseover="this.src='img/travel_board_img/like_2.png'" 
onmouseout="this.src='img/travel_board_img/like_2.png'">
<h4 align="center"><strong>15</strong></h4>
</div>

<hr> <br>
</div>


<!--  Comment view -->
<div class="container" id="comment_view">

 	<table>     
		<tr>
		<div class="row">
		<div class="col-md-1" align="right">
			<img src="img/avatar2.jpg" width="50"/>
		</div>
		<div class="col-md-11">
			<strong>김대환</strong> 
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star"></span>
<span class="fa fa-star"></span> <a>(3)</a>
<span class="badge badge-secondary"><a href="http://google.com" class="text-white"> 삭제</a></span><br>
			<p>경복궁 가봤는데 아주 좋아요.<br>제 엉덩이만큼 끝내주는 관광지입니다..</p>
			<p class="text-dark" align="right">${contentView.bDate}</p>					
		</div>
					

		</div>
		</tr>
	</table>
	
</div>



<!-- Comment write -->
<div class="container" id="comment_write">

<form action="">
<br>
	<div class="row">
    	<div class="col">
    
		<label for="bName">이름:</label>
      	<input type="text" class="form-control" id="name" placeholder="" name="bName">
    
    	</div>
    	
    	<div class="col">
    	<label for="bPw">비밀번호:</label>
      	<input type="password" class="form-control" id="pw" placeholder="" name="bPw"> <p>
    	</div>
    	
    	<div class="col">
		<label for="sel1">평가:</label>
		<select class="form-control" id="sel1" name="sellist1">
			<option>★☆☆☆☆(1)</option>
			<option>★★☆☆☆(2)</option>
			<option>★★★☆☆(3)</option>
			<option>★★★★☆(4)</option>
			<option>★★★★★(5)</option>
		</select>
    	</div>
    	
	</div>

    <div class="form-group">
      <label for="comment">댓글:</label>
      <textarea class="form-control" rows="5" id="comment" name="text"></textarea>
    </div>
    
    <!-- <button type="submit" class="btn btn-outline-dark btn-sm">등록</button> -->
    <a href="" class="btn btn-outline-dark btn-sm" role="button">등록</a>
</form>
<hr>
<br>
</div>
 
<!--  board buttons --> 
<div class="container">
<p align="right">
<a href="" class="btn btn-dark" role="button">수정</a>
<a href="" class="btn btn-dark" role="button">삭제</a>
<a href="seoulList" class="btn btn-dark" role="button">목록</a>
</p>
<br>
</div>

<p>

<div class="jumbotron text-center" style="margin-bottom:0">
<p>Copyright © 2020 Wemade Korea All rights reserved</p>
</div>  


</body>
</html>