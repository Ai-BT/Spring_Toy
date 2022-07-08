<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 시큐리티 전용 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">

<head>
  <title>굿즈</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  
    <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형에 반드시 필요한태그 -->
      
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
		<a href="/ex/admin_goods/index" class="btn btn-secondary" type="button">관리자 화면</a>	
</sec:authorize>

	</div>

 	</ul>
</div>

</nav>


<!-- This is banner -->
<div class="hero-image">
  <div class="hero-text">
	<p style="font-size:60px" class="display-3">Goods</p>
	<p>We Make Our World</p>
<!-- 	<p style="font-size:20px" class="display-3">나의 캐릭터로 만드는 내 손 안의 프린팅 아이템</p> -->
<!-- 	<p>나의 캐릭터로 만드는 내 손 안의 프린팅 아이템!</p> -->
  </div>
</div>

<br><br>


<%-- <div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="include/header2.jsp" %>
		</div>
	</header>	 --%>
		
	
<!--  	<p>
	<p align="center" class="display-3" id="login_f">Goods</p><br> -->
	

<!-- 	<h2 align="center">나의 캐릭터로 만드는 내 손 안의 프린팅 아이템</h2> -->
	<h2 align="center"><strong>나의 캐릭터로 만드는 내 손 안의 프린팅 아이템</strong></h2>

	<br><br>


	<!-- Select Goods -->
	<div class="container">
	
		<div class="row">
		
		
		<c:forEach items="${list}" var="list">
		<div class="col-sm-4">
		

		
		<a href="${pageContext.request.contextPath}/goodsView?n=${list.gdsNum}"><img src="${pageContext.request.contextPath}/${list.gdsImg}" class="img-fluid mx-auto d-block rounded" width="275"></a>
		
		
		<h1 align="center">${list.gdsName}</h1>
<%-- 		<h1 align="center">(&#8361;${list.gdsPrice}~)</h1> --%>
		<h1 align="center">&#8361;<fmt:formatNumber pattern="###,###,###" value="${list.gdsPrice}" />~</h1>
		<p align="center" style="font-size:20px">${list.gdsDes}</p>
		

		
		
		
		
		</div>
		</c:forEach>
		

		
<!-- 		<div class="col-sm-4">
		
		<a href=""><img src="goods/picture_frame.png" class="img-fluid mx-auto d-block rounded" width="275"></a>
		<h1 align="center">Picture frame</h1>
		<h1 align="center">(&#8361;30,000~)</h1> <br>
		<p align="center" style="font-size:20px">나만의 홈인테리어를 꾸며줄 작은 데코레이션</p>
		
		
		
		
		</div>
		
		<div class="col-sm-4">
		
		
		<a href="goodsDetails2"><img src="goods/t-shirts.png" class="img-fluid mx-auto d-block rounded" width="275"></a>
		
		<h1 align="center">T-shirts</h1>
		<h1 align="center">(&#8361;15,000~)</h1> <br>
		<p align="center" style="font-size:20px">스타일과 편안함을 모두 갖춘 프리미엄 원단 100% 티셔츠</p>
		
		</div>
		
		<div class="col-sm-4">
		
		<img src="goods/mug_cup.png" class="img-fluid mx-auto d-block rounded" width="275">
		
		<h1 align="center">Mug-cup</h1>
		<h1 align="center">(&#8361;8,000~)</h1> <br>
		<p align="center" style="font-size:20px">모던하고 세련된 스타일의 나만을 위한 시그니처 아이템</p>
	
		
		
		</div> -->
		

		
		</div> <!-- row end  -->
		
<sec:authorize access="isAuthenticated()">
	<p align="right"><a href="admin/goods_register" class="btn btn-dark" role="button">제품 등록</a></p>
</sec:authorize>
	
	</div> <!--  container end -->
	
	<br><br>



<!-- </div> --> <!--  root end -->

</body>
</html>
