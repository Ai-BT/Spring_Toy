<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
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

<p>
	<p align="center" class="display-3" id="login_f">My Order View</p>

	<div class="container">
	<img class="mx-auto d-block" src="goods/profile.png" width="150"><br>
	<h3 align="center"> <sec:authentication property="principal.user.nickname"/> 님의 주문상세내역입니다.</h3>
	
	</div>
	<br>
	
	<div class="container">
		
 
		<div class="row">
		
			<div class="col-sm-3">
	
			</div>
			
			<div class="col-sm-8">
			
			</div>
		
		
		
		</div>
	
	</div>

<div class="container">

<h5><strong>배송지 정보</strong></h5>
  <table class="table">
  	<tbody>
  	
  	<tr align="center">
  		<td>수령인</td>
  		<td>주소</td>
  		<td>연락처</td>
  		<td>총 결제금액</td>
  	
  	</tr>
  	
  	  <c:forEach items="${orderView}" var="orderView" varStatus="status">
  	 	 <c:if test="${status.first}">
  	 <tr align="center">
  		<td>${orderView.orderRec}</td>
  		<td>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}</td>
  		<td>${orderView.orderPhon}</td>
  		<td><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</td>
  	
  	</tr>
  		</c:if>
  	  </c:forEach>
  	
  	
  	</tbody>
  
  </table>

	
</div>

<div class="container">

			<h5><strong>주문상품 정보</strong></h5>
		  <table class="table">

		    <tbody>
		    
		      <tr align="center">
		        <td>상품 정보</td>
		        <td>상품 금액</td>
		        <td>할인 금액</td>
		        <td>배송비</td>
		        <td>주문 금액</td>
		        

		      </tr>		    
		    
			<c:set var="sum" value="0" />
			
			<c:forEach items="${orderView}" var="orderView">      
					      <tr>
					      	<td>
					      	
					      	<div class="container">
					      		<div class="row">
					      		
					      		<div class="col-sm-3">
					      		
					      		<img src="${orderView.gdsImg}" class="mx-auto d-block" width="100">
					      		</div>
					      		
								<div class="col-sm-7">
					      		<h5>${orderView.gdsName}</h5>
					      		색상: ${cartList.gdsColor}  / 사이즈: ${cartList.gdsSize} / 수량: ${orderView.cartStock}개 <br>
					      		     		
					      		
					      		</div>
					      	
					      		</div>
					      	</div>
					      	
					      	</td>
					      
					        <td><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}" /> 원</td>
					        <td>0 원</td>
					        <td>무료 배송</td>
					        <td><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}" /> 원</td> 
					      </tr>
			  
			  <c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
			  </c:forEach>
					    </tbody>
					    
					  </table>
					  
	</div>
	


</body>
</html>
