<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	  
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
	
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
	.filterDiv {
/* 		border: 1px solid gray; */
	  float: left;
	  background-color: #ffffff;
	  color: #ffffff;
	  width: 100px;
	  line-height: 100px;
	  text-align: center;
	  margin: 2px;
	  display: none;

	}
	
	.show {
	  display: block;
	}
	
	.container {
	  margin-top: 20px;
	  overflow: hidden;
	}
	
	/* Style the buttons */
/*  	.btn {
	  border: none;
	  outline: none;
	  padding: 12px 16px;
	  background-color: #f1f1f1;
	  cursor: pointer;
	}
	
	.btn:hover {
	  background-color: #ddd;
	}
	
	.btn.active {
	  background-color: #666;
	  color: white;
	} */
</style>


	<style>
	
   	.image-stack {
	  display: grid;
	  grid-template-columns: repeat(12, 1fr);
	  position: relative;
	}

	
  /* Make the image fully responsive */
   	.image-stack img {
    width: 150%;
/*     height: 100%; */
  	}
 
	.layer0 {
	grid-column: 1 / span 8;
	grid-row: 1; // make this image be on the same row
	  }	
	
	.layer1 {
	grid-column: 1 / span 8;
	grid-row: 1; // make this image be on the same row
	  }

	 .layer2 {
	grid-column: 1 / span 8;
	grid-row: 1; // make this image be on the same row
	  }
	  
	  
	.layer3 {
	grid-column: 1 / span 8;
	grid-row: 1; // make this image be on the same row
	}
	
	
	.layer4 {
	 grid-column: 1 / span 8;
	 grid-row: 1; // make this image be on the same row
	}
	
	.layer5 {
	 grid-column: 1 / span 8;
	 grid-row: 1; // make this image be on the same row
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
        	<a class="dropdown-item" href="boardList">내 캐릭터 만들기</a>
        	<a class="dropdown-item" href="/ex">굿즈</a>
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