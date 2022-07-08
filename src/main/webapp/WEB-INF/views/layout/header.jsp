<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>


	<style type="text/css">
	
	 #no-drag {
 
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none; 
	user-select:none;
	} 
	   
	</style>
	
<div class="container" id="no-drag"> <!-- table -->
	<div class="row"> <!-- td -->
	
		<div class="col-sm-6" id="s1">
			<a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/img/main_logo2.png"></a>	
			<!-- 여행지게시판 디자인 참고로 해당링크 잠시 필요 -->
		</div> <!-- tr -->
		
		<div class="col-sm-6" id="s2">
			<!-- Search Bar -->
<!-- 			<p>Search Bar</p> -->
		<p>
		<form name="review_boardByTitle" action="review_boardByTitle" method="get">
	 		<div class="input-group mb-3">
	  			<input type="text" name="rTitle" id="rTitle" class="form-control" placeholder="Search">
	  			<div class="input-group-append">
	    			<button id="findReviewBtn" class="btn btn-danger" type="button">Go</button>
	  			</div>
			</div>
		</form>
			<!-- Search Bar End -->
		</div>
	</div>
</div>

<!-- <nav class="navbar navbar-expand-md bg-light navbar-light sticky-top"> -->
<nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top" id="no-drag">
	
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
			<a class="nav-link" href="${pageContext.request.contextPath}/index">메인</a>
		</li>
				
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath}/hot_reviewList">핫플레이스</a>
		</li>
				
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			내 캐릭터 만들기
			</a>
			<div class="dropdown-menu">
        	<a class="dropdown-item" href="${pageContext.request.contextPath}/characterMaking">내 캐릭터 만들기</a>
        	<a class="dropdown-item" href="${pageContext.request.contextPath}/goodsList">굿즈</a>
      		</div>
		</li>
		
		<!-- Dropdown -->				
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			커뮤니티
			</a>
			<div class="dropdown-menu">
        	<a class="dropdown-item" href="${pageContext.request.contextPath}/free_board/boardList">자유 게시판</a>
        	<a class="dropdown-item" href="${pageContext.request.contextPath}/areaIndex">여행지 게시판</a>
      		</div>
		</li>
		
	</ul>
	
	</div>

<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
 	<ul class="navbar-nav"> 
	<div class="btn-group btn-group-sm">
	
<sec:authorize access="isAnonymous()"> <!-- isAnonumous: 누구나 다 access 할 수있다 -->
   		<a href="${pageContext.request.contextPath}/loginForm" class="btn btn-secondary" type="button">Login</a>
		<a href="${pageContext.request.contextPath}/joinForm" class="btn btn-secondary" type="button">Join</a> 
		<a href="${pageContext.request.contextPath}/loginForm" class="btn btn-secondary" type="button">My Page</a>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
		<a class="btn btn-dark">반갑습니다.<sec:authentication property="principal.user.nickname"/> 님</a>
   		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
   			<input type="submit" class="btn btn-secondary btn-sm" value="Logout">
   		</form:form> 
		<a href="${pageContext.request.contextPath}/mypage" class="btn btn-secondary" type="button">My Page</a>
</sec:authorize>

	</div>

 	</ul>
</div>

	<script type="text/javascript">
	 	$(document).ready(function(){
	 		$("#findReviewBtn").on("click", function(){  
	 			var form = document.review_boardByTitle;
	 			var empty = "";
	 			if( $("#rTitle").val().trim() == null || $("#rTitle").val().trim() == empty || $("#rTitle").val().trim() == undefined ) {
	 				alert("검색어를 입력해주세요");
	 				$("#rTitle").val("");
	 			}else{
	 				form.submit();
	 			}
	 			
	 		});
 		});
	 		 
	</script> 
</nav>