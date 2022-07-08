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
	
	<!-- Banner style tag -->
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

	<script type="text/javascript">
		$(document).ready(function(){
			
			//댓글작성
			$(".replyWriteBtn").on("click", function(){
				  var formObj = $("form[name='replyForm']");
				  formObj.attr("action", "replyWrite");
				  formObj.submit();
			});		
		})
	</script>



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
        	<a class="dropdown-item" href="#">여행후기 게시판</a>
        	<a class="dropdown-item" href="${pageContext.request.contextPath}/list">테스트용 게시판</a>
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

<!-- This is banner -->
<!-- <div class="hero-image">
  <div class="hero-text">
<p style="font-size:60px" class="display-3">Community</p>
	<p>We Make Our World</p>
  </div>
</div>
<p><br> -->


<p>
<div class="container">
<p align="center" class="display-3" id="disf">Community</p>
</div>

<div class="container" id="free_board">
  <h2>자유게시판</h2> <br>
  
 
 	
 <!-- 게시글 내용 부분 -->
<table class="table">
    <thead>
	<tr>
		<th>[잡담] ${contentView.bTitle}</th>
	</tr>
    </thead>

    <tbody>
      <tr>
        <td>
        <p><span class="badge badge-pill badge-secondary">No</span> ${contentView.bId}
        <span class="badge badge-pill badge-secondary">조회수</span> ${contentView.bHit}
        </p>
        
		<div class="card">
			<div class="card-body">
	        	<div class="row">
        			<div class="col-md-2">
        	       		<img src="img/avatar2.jpg" class="img img-rounded img-fluid"/>
        	    	</div>
        	    
        	     	<div class="col-md-10">
        	     		<strong>${contentView.bName}</strong> <br>
						<p>${contentView.bContent}</p>
						<br><p align="right">
<p class="text-dark" align="right">${contentView.bDate}</p>			
					</div>
	       	 	</div>	
			</div>	
		</div>
        
        </td>
      </tr>
    </tbody>
</table>
  
  <!-- <hr> -->
 
<p align="right">
<a href="delete2?bId=${contentView.bId}" class="btn btn-outline-dark btn-sm" role="button">삭제</a>
<a href="modifyView?bId=${contentView.bId}" class="btn btn-outline-dark btn-sm" role="button">수정</a>
<a href="replyView?bId=${contentView.bId}" class="btn btn-outline-dark btn-sm" role="button">답변<br></a>
</p>
 
<hr> <br>

<!-- 댓글 -->
<c:forEach items="${replyList}" var="replyList">
	<div class="container" id="comment_view">
	 	<table>     
			<tr>
			<div class="row">
				<div class="col-md-1" align="right">
					<img src="img/avatar2.jpg" width="50"/>
				</div>					
				<div class="col-md-11">
					<strong>작성자: ${replyList.writer}</strong> 
					
					<span class="badge badge-secondary"><a href="http://google.com" class="text-white">삭제</a></span><br>
					
					<p>내용: ${replyList.content}</p>
					<p class="text-dark" align="right">${replyList.regDate}</p>					
				</div>  			
			</div>
			</tr>
		</table>
	</div>
</c:forEach>  


<!-- 댓글 작성 -->
<%-- <form class="form-inline" action="/action_page.php">
    <label for="email2" class="mb-2 mr-sm-2">이름:</label>
    <input type="text" class="form-control mb-2 mr-sm-2" id="email2" placeholder="Enter email" name="email">
    <label for="pwd2" class="mb-2 mr-sm-2">비밀번호:</label>
    <input type="text" class="form-control mb-2 mr-sm-2" id="pwd2" placeholder="Enter password" name="pswd">
</form> --%> 

<form name="replyForm" method="get">
<div class="container" id="comment_write">
<input type="hidden" id="bId" name="bId" value="${contentView.bId}" />
<br>
	<div class="row">
    	<div class="col">
    
		<label for="Writer">이름:</label>
      	<input type="text" class="form-control" id="Writer" placeholder="" name="Writer">
    
    	</div>
    	
    	<div class="col">
    	<label for="bPw">비밀번호:</label>
      	<input type="password" class="form-control" id="pw" placeholder="" name="bPw"> <p>
    	</div>
	</div>

    <div class="form-group">
      <label for="Content">댓글:</label>
      <textarea class="form-control" rows="5" id="Content" name="Content"></textarea>
    </div>
	
	 <div>
 	 	<button type="button" class="replyWriteBtn">등록</button>
 	 </div>

</div>
</form>


<hr>
<br> 

<p align="right">
<a href="writeView" class="btn btn-dark" role="button">글 작성</a>
<a href="boardList" class="btn btn-dark" role="button">목록</a>
</p>
<br>
  
          
  <table class="table table-hover">
    <thead class="thead-light" align="center">
      <tr>
        <th>No</th>
        <th>구분</th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>등록일</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${list}" var="dto">
      <tr>
        <td align="center">${dto.bId}</td>
        <td align="center">잡담</td>
        <td ><c:forEach begin="1" end="${dto.bIndent}">Re:</c:forEach>
        <a class="text-dark" href="contentView?bId=${dto.bId}">${dto.bTitle}</a></td>
        <td align="center">${dto.bName}</td>
        <td align="center">${dto.bHit}</td>
        <td align="center">${dto.bDate}</td>
      </tr>
</c:forEach>
      <tr>
        <td align="center">2</td>
        <td align="center">잡담</td>
        <td >이제목을 누르면 내용이 보입니다.</td>
        <td align="center">이선영</td>
        <td align="center">14</td>
        <td align="center">2020.09.16</td>
      </tr>
      <tr>
        <td align="center">1</td>
        <td align="center">잡담</td>
        <td >이제목을 누르면 내용이 보입니다.</td>
        <td align="center">김대환</td>
        <td align="center">14</td>
        <td align="center">2020.09.16</td>
      </tr>
    </tbody>
  </table>


<p align="right"><a href="writeView" class="btn btn-dark" role="button">글 작성</a></p>

</div>



<div class="container" id="board_pagination">

	<ul class="pagination justify-content-center">
    	
    	<li class="page-item"><a class="page-link text-dark" href="javascript:void(0);">Previous</a></li>
    
    	<li class="page-item"><a class="page-link text-dark" href="javascript:void(0);">1</a></li>
    	<li class="page-item"><a class="page-link text-dark" href="javascript:void(0);">2</a></li>
    	<li class="page-item"><a class="page-link text-dark" href="javascript:void(0);">3</a></li>
    	<li class="page-item"><a class="page-link text-dark" href="javascript:void(0);">Next</a></li> <br>
    
 
	</ul>
  
</div>

<div class="container" id="board_search_bar">

	<div class="row">
		
		<div class="col-sm-4">
		</div>

		<div class="col-sm-4">
<!-- Board Search Bar -->
 			<div class="input-group mb-3">
  				<input type="text" class="form-control" placeholder="">
  				<div class="input-group-append">
    				<button class="btn btn-danger btn-dark" type="submit">검색</button>
  				</div>
			</div>
<!-- Board Search Bar End -->
		</div>
	
		<div class="col-sm-4">
		</div>
		
	</div>

</div>

<br>

<div class="jumbotron text-center" style="margin-bottom:0">
<p>Copyright © 2020 Wemade Korea All rights reserved</p>
</div>  


</body>
</html>