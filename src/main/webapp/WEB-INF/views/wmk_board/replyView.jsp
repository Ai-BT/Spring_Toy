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


 	<script type="text/javascript">

	function validateForm() {
		
		var name = document.forms["boardForm"]["bName"].value;
		if (name == "" || name == null){
	    alert("이름을 입력해주세요.");
		return false;
		}
	  
	}
	
	function validateForm2() {
		
		var pw = document.forms["boardForm"]["bPw"].value;
		if (pw == "" || pw == null){
	    alert("비밀번호를 입력해주세요.");
		return false;
		}
	  
	}
	
	function validateForm3() {
		
		var title = document.forms["boardForm"]["bTitle"].value;
		if (title == "" || title == null){
	    alert("제목을 입력해주세요.");
		return false;
		}
	  
	}
	
	function validateForm4() {
		
		var con = document.forms["boardForm"]["bContent"].value;
		if (con == "" || con == null){
	    alert("내용을 입력해주세요.");
		return false;
		}
	  
	}
	
	function removeCheck() {
		
		if (confirm("목록으로 돌아가겠습니까?") == true){

		document.form.submit();

		 }else {
			 return false;
		}

	}

 	</script> 
		


</head>
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
			<a class="nav-link" href="${pageContext.request.contextPath}/index">메인</a>
		</li>
				
		<li class="nav-item">
			<a class="nav-link" href="#">핫플레이스</a>
		</li>
				
		<li class="nav-item">
			<a class="nav-link" href="#">내 캐릭터 만들기</a>
		</li>
						
		<li class="nav-item">
			<a class="nav-link" href="boardList">커뮤니티</a>
		</li>
		
	</ul>
	
	</div>

<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
 	<ul class="navbar-nav"> 
	<div class="btn-group btn-group-sm">
	
<sec:authorize access="isAnonymous()"> <!-- isAnonumous: 누구나 다 access 할 수있다 -->
   		<a href="${pageContext.request.contextPath}/loginForm" class="btn btn-secondary" type="button">Login</a>
		<a href="${pageContext.request.contextPath}/joinForm" class="btn btn-secondary" type="button">Join</a> 
		<a href="http://google.com" class="btn btn-secondary" type="button">My Page</a>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
		<a class="btn btn-dark">환영합니다, <sec:authentication property="principal.user.nickname"/> 님!</a>
   		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
   			<input type="submit" class="btn btn-secondary btn-sm" value="Logout">
   		</form:form> 
		<a href="${pageContext.request.contextPath}/mypage" class="btn btn-secondary" type="button">My Page</a>
</sec:authorize>

	</div>

 	</ul>
</div>

</nav>






<p>
<div class="container">
<p align="center" class="display-3" id="disf">Community</p>
</div>




<div class="container" id="write_view">
  <h2>자유게시판</h2> <br>
 


<form name="boardForm" action="reply2" onsubmit="return validateForm(), validateForm2(), validateForm3(), validateForm4()" method="get" required>
	<input type="hidden" name="bId" value="${replyView.bId}">
	<input type="hidden" name="bGroup" value="${replyView.bGroup}">
	<input type="hidden" name="bStep" value="${replyView.bStep}">
	<input type="hidden" name="bIndent" value="${replyView.bIndent}">
	
	<div class="row">
    	<div class="col">
    
		<label for="bName">이름:</label>
      	<input type="text" class="form-control" id="name" placeholder="" name="bName" value="${replyView.bName}">
    
    	</div>
    	
    	<div class="col">
    	<label for="bPw">비밀번호:</label>
      	<input type="password" class="form-control" id="pw" placeholder="" name="bPw"> <p>
    	</div>
	</div>
	
		<div class="form-group">
    	<label for="bTitle">제목:</label>
      	<input type="text" class="form-control" id="title" placeholder="" name="bTitle" value="${replyView.bTitle}"> <p>
		</div>
	
	<div>구분:</div>
	<div class="form-check-inline">
 	<label class="form-check-label">
    	<input type="radio" class="form-check-input" name="bCartegory" checked="checked" disabled>잡담
	</label> 	
	</div>
	<div class="form-check-inline">
	<label class="form-check-label">
    <input type="radio" class="form-check-input" name="bCartegory" disabled>질문
	</label>
	</div>
	<div class="form-check-inline">
	<label class="form-check-label">
    <input type="radio" class="form-check-input" name="bCartegory" checked="checked">답변
	</label>
	</div>
	<div class="form-check-inline disabled">
	<label class="form-check-label">
    <input type="radio" class="form-check-input" name="bCartegory" disabled>공지
	</label>
	</div><p>

  	
    <div class="form-group">
      <label for="content">내용:</label>
      <textarea class="form-control" rows="10" id="content" name="bContent">${replyView.bContent}</textarea>
    </div>
  
	<p align="center"><button type="submit" class="btn btn-dark">답변</button> 
<!-- 	<a href="boardList" class="btn btn-dark" role="button" onclick="removeCheck()">취소</a></p> -->
	<a href="boardList" class="btn btn-dark" role="button" onclick="return confirm('목록으로 돌아가겠습니까?');">취소</a></p>




	<br>
	
</form>

</div>









<div class="jumbotron text-center" style="margin-bottom:0">
<p>Copyright © 2020 Wemade Korea All rights reserved</p>
</div>  


</body>
</html>