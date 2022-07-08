<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 시큐리티 전용 태그 -->



<!DOCTYPE html>
<html lang="en">

<head>
  <title>굿즈: 상세보기</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" / charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형에 반드시 필요한태그 -->
      
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css"> <!--  Library for Dragabble effect  -->
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <script src="//code.jquery.com/jquery-1.12.4.js"></script> <!--  Library for Dragabble effect  -->
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!--  Library for Dragabble effect  -->
  
  <script src="js/jquery-3.3.1.min.js"></script> <!-- Library for text input -->
  
 
<%--   <style>
  #draggable {
    width: 100px;
    height: 100px;
    background: #ccc;
  }
  </style> --%>
  
  

  
  
<style>

 	#s1 {
	/* background: blue; */
	line-height:55px;
	}

 	#s1 img {
 	vertical-align:middle;
	}
	
	#font_text {
	font-weight: 700;

	}
	
</style>

	<style>
   	.image-stack {
	  display: grid;
	  grid-template-columns: repeat(12, 1fr);
	  position: relative;
	}
	
	
	.layer0 {
	grid-column: 1 / span 8;
	grid-row: 1; // make this image be on the same row
	  }	
	
	.layer1 {
	
	  grid-column: 11 / span 12;
      grid-row: 1; 
      padding-top: 350%; 
      z-index: 1;
	}
	
	.layer2 {
	
	  grid-column: 11 / span 12;
      grid-row: 1; 
      padding-top: 730%; 

	
	}
	
	
	
	
	</style>
	
	<script>
	
		$(function() {
			
			$("#btn_prompt").click(function(){
				
				var result = prompt("텍스트를 입력하세요");
				
				if(result != "") {
					
					$("#font_text").text(result);
					
				}else{
					
					$("#font_text").text("텍스트를 입력하세요");
				}
				
				
				
			});
			
		});
		
	
	</script>
	
	



</head>

<body onload="init();">


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
	<c:if test="${member == null}">
	   		<a href="loginForm" class="btn btn-secondary" type="button">Login</a>
			<a href="joinForm" class="btn btn-secondary" type="button">Join</a> 
			<a href="http://google.com" class="btn btn-secondary" type="button">My Page</a>
	</c:if>
	
	<c:if test="${member != null}">
			<a href="/ex/admin/index" class="btn btn-secondary" type="button">관리자 화면</a>	
	   		<a href="loginForm" class="btn btn-secondary" type="button">Login</a>
			<a href="joinForm" class="btn btn-secondary" type="button">Join</a> 
			<a href="mypage" class="btn btn-secondary" type="button">My Page</a>
	</c:if>
	
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


<div id="root">
 	<p>
	<p align="center" class="display-3" id="login_f">Goods Details</p><br>
	
		

	<div class="container">

		<div class="row">
				
			<div class="col-sm-6">
			
			<div class="image-stack col-sm-6" id="example"> <!-- character viewer -->
			
				<div class="layer0">	
				<img id="bg" alt="" src="goods/white_shirts_550.png">
				</div>
				
				<div class="layer1">

					<div id="draggable"><img id="faces" alt="" src="goods/profile2.png" width="150"></div>

				</div>
				
				
				<div class="layer2">	
					<div id="draggable2">
					<font id="font_text" size="5em" color="black" style=" font: Impact;">
					WemadeKorea
					</font>
					</div>
				</div>
				
					
			</div>
			

				

		

			
					

<!--  			<img src="goods/white_shirts_550.png" class="img-fluid float-left" width="100">
			<img src="goods/black_shirts_550.png" class="img-fluid float-left" width="100">
			<img src="goods/gray_shirts_550.PNG" class="img-fluid float-left" width="100">  -->
				
	
			</div>
			
			<div class="col-sm-6">
			
			
			<h2>스트릿 반팔티셔츠 (남녀공용)</h2>
			<h5>(15,000원)</h5> <br>

			
			<label for="selDistrict">색상 선택:</label>
			<select class="form-control" id="sel1" name="selColor">
			<option>흰색 (White)</option>
			<option>검정 (Black)</option>
			<option>회색 (Gray)</option>
			</select>
			
			<br>
			
			<label for="selDistrict">사이즈 선택:</label>
			<select class="form-control" id="sel1" name="selSize">
			<option>M (100)</option>
			<option>L (105)</option>
			<option>XL (110)</option>
			</select>
			<br>
			
			텍스트 입력:
			<input type="text" class="form-control" id="text" name="text" placeholder="선택사항 (무료)">
			<p><p>
			<button class="btn btn-secondary btn-sm" id="btn_prompt">입력 보기</button>
			<a href="" class="btn btn-secondary btn-sm" role="button" onclick="return confirm('서비스 지원 예정');">글꼴 스타일</a></p>
			<p>

			
			
			<div class="number">
			<form name="form" method="get">
			수량 : <input type=hidden name="sell_price" value="15000"> 
			<input type="text" name="amount" value="1" size="3" onchange="change();">
			<input type="button" value=" + " onclick="add();">
			<input type="button" value=" - " onclick="del();"><br><br>
			
			
			
			금액 : <input type="text" name="sum" size="11" readonly>원
			</form>
			
			</div>
			
			
			
			<p>배송: 주문시 결제 (2,500원)</p>
			
		<sec:authorize access="isAnonymous()"> <!-- isAnonumous: 누구나 다 access 할 수있다 -->	
		
			<a href="" class="btn btn-dark" role="button" onclick="return confirm('회원가입시 이용가능합니다.');">구매하기</a>
			<a href="" class="btn btn-dark" role="button" onclick="return confirm('회원가입시 이용가능합니다.');">장바구니 담기</a>
		
		</sec:authorize>
		

		<sec:authorize access="isAuthenticated()">			
			
			<a href="goodsOrder" class="btn btn-dark" role="button">구매하기</a>
			<a href="" class="btn btn-dark" role="button">장바구니 담기</a>
			
		</sec:authorize>
		
	
			</div>
			
		
		</div> <!-- row end -->

	</div> <!--  container end -->
	

	
	<div class="container">
	
	<hr>
		
		<br><br>
		<h3 align="center">이 곳은 제품의 상세정보가 들어갑니다.</h3>
		<br>
	
	</div>
	
	<br><br>



</div>

	<script>
	
	var sell_price;
	var amount;
	
	function init () {
		sell_price = document.form.sell_price.value;
		amount = document.form.amount.value;
		document.form.sum.value = sell_price;
		change();
	}
	
	function add () {
		hm = document.form.amount;
		sum = document.form.sum;
		hm.value ++ ;
	
		sum.value = parseInt(hm.value) * sell_price;
	}
	
	function del () {
		hm = document.form.amount;
		sum = document.form.sum;
			if (hm.value > 1) {
				hm.value -- ;
				sum.value = parseInt(hm.value) * sell_price;
			}
	}
	
	function change () {
		hm = document.form.amount;
		sum = document.form.sum;
	
			if (hm.value < 0) {
				hm.value = 0;
			}
		sum.value = parseInt(hm.value) * sell_price;
	} 
	
	
	</script>
	
	
	<script>
	$( "#draggable" ).draggable();
	$( "#draggable2" ).draggable();
	</script>
	

</body>
</html>
