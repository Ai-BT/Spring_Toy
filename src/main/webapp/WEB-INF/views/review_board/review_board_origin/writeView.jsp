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
  <script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
	
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

 	$(document).ready(function(){
 		 $("#regBtn").on("click", function(){  
 			var title = document.forms["boardForm"]["rTitle"].value;
 			if (title == "" || title == null){
 		    alert("글제목을 입력해주세요.");
 				return false;
 			}
 			var inshort = document.forms["boardForm"]["rInShort"].value;
 			if (inshort == "" || inshort == null){
 		    alert("회원님의 피셜을 들려주세요.");
 			return false;
 			}
 	    });   
 		
 		function removeCheck() {
 			
 			if (confirm("목록으로 돌아가겠습니까?") == true){

 			document.form.submit();

 			 }else {
 				 return false;
 			}

 		}
 		
 	});

	

 	</script> 
 	
 	<!-- 이미지 미리보기 -->
 	<script> 
	  function setThumbnail(event) { 
		var reader = new FileReader(); 
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};
			
			reader.readAsDataURL(event.target.files[0]); 
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
        	<a class="dropdown-item" href="areaIndex">여행후기 게시판</a>
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






<p>
<div class="container">
<p align="center" class="display-3" id="disf">Community</p>
</div>




<div class="container" id="review_write_view">
  <h2>여행후기게시판</h2> <br>
 

<%-- <sec:authorize access="isAnonymous()">
	<div class="row">
    	<div class="col">
    
		<label for="fId">이름:</label>
      	<input type="text" class="form-control" id="fId" placeholder="" name="fId">
    
    	</div>
    	
	</div>
</sec:authorize> --%>
<form id ="boardForm" name="boardForm" action="review_write" method="post" required enctype="multipart/form-data">
	<input type="hidden" name="area" value='<c:out value="${rArea}"></c:out>'>
<sec:authorize access="isAuthenticated()">
    
	<input type="hidden" class="form-control" id="rId" placeholder="" name="rId" value="<sec:authentication property="principal.user.id"/>">

</sec:authorize> 


	<div class="form-group">
    <label for="rCategory">분류:</label>
    
     <select id="rCategory" name="rCategory">
    	<option value="1">관광지</option>
    	<option value="2">행사</option>
    	<option value="3">맛집</option>
    	<option value="4">기타</option>
	</select>
	
	
	<label for="rArea">지역 :</label>
     <!--  <input type="" class="form-control" id="rCategory" placeholder="" name="rCategory"> <p> -->
     <select id="rArea" name="rArea">
    	<option value="서울·경기·인천">서울·경기·인천</option>
    	<option value="강원도">강원도</option>
    	<option value="충청북도">충청북도</option>
    	<option value="충청남도">충청남도</option>
    	<option value="경상북도">경상북도</option>
    	<option value="경상남도">경상남도</option>
    	<option value="전라북도">전라북도</option>
    	<option value="전라남도">전라남도</option>
    	<option value="제주도">제주도</option>
	</select>
	
	</div>
	
	
	<div class="form-group">
    <label for="rTitle">제목:</label>
      <input type="text" class="form-control" id="rTitle" placeholder="" name="rTitle"> <p>
	</div>
	
	<div class="form-group">
    <label for="rOpenTime">운영시간:</label>
      <input type="text" class="form-control" id="rOpenTime" placeholder="" name="rOpenTime"> <p>
	</div>
	
	<div class="form-group">
    <label for="rAdress">위치정보:</label>
      <input type="text" class="form-control" id="rAdress" placeholder="" name="rAdress"> <p>
	</div>
	
	<div class="form-group">
    <label for="rTitle">피셜:</label>
      <input type="text" class="form-control" id="rInShort" placeholder="" name="rInShort"> <p>
	</div>
	
	<div class="form-group">
    <label for="Thumbnail">썸네일용 이미지:</label>
      <input type="file" class="form-control" name="uploadImg" accept="image/*" onchange="setThumbnail(event);"> <p>
	</div>
	
	<div class="form-group" id="image_container">
    <label for="fileImage">썸네일용 이미지 미리보기:</label><br>
	</div>
	
    <div class="form-group" >
      <label for="rContent">내용:</label>
      <textarea class="form-control" rows="10" id="rContent" name="rContent"></textarea>
      	 <script>
			CKEDITOR.replace('rContent',{filebrowserUploadUrl:'${pageContext.request.contextPath}/img/imageUpload.do'});
		</script> 
    </div>
  
	<p align="center"><button type="submit" id="regBtn" class="btn btn-dark">등록</button> 
<!-- 	<a href="boardList" class="btn btn-dark" role="button" onclick="removeCheck()">취소</a></p> -->
	<a href="review_boardList" class="btn btn-dark" role="button" onclick="return confirm('목록으로 돌아가겠습니까?');">취소</a></p>




	<br>
	
</form>

</div>









<div class="jumbotron text-center" style="margin-bottom:0">
<p>Copyright © 2020 Wemade Korea All rights reserved</p>
</div>  


</body>
</html>