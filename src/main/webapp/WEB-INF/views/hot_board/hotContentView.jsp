<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 시큐리티 전용 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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


<style>
 section.replyForm { padding:30px 0; }
 section.replyForm div.input_area { margin:10px 0; }
 section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px; }
 section.replyForm button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 
 section.replyList { padding:30px 0; }
 section.replyList ol { padding:0; margin:0; }
 section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
 section.replyList div.userInfo { }
 section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
 section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
 section.replyList div.replyContent { padding:10px; margin:20px 0; }
 
 section.replyList div.replyFooter button { font-size:14px; border: 1px solid #999; background:none; margin-right:10px; }
</style>



<script> 

function replyList() {
	

 var rBoardNum = ${rContentView.rBoardNum};
 $.getJSON("${pageContext.request.contextPath}/review_contentView/replyList" + "?n=" + rBoardNum, function(data){
  var str = "";
  
  $(data).each(function(){
   
   console.log(data);
   
   var repDate = new Date(this.repDate);
   repDate = repDate.toLocaleDateString("ko-US")
   
   str += "<div>"
	     + "<div class='userInfo'>"
	     + "<span class='id'>" + this.id + "</span>"
	     + "<span class='date'>" + repDate + "</span>"
	     + "</div>"
	     + "<div class='replyContent'>" + this.repCon + "</div>"
	     + "</div>"   
	     
	     
	     + "<div class='replyFooter'>"
	     + "<button type='button' class='delete' data-repNum='" + this.repNum + "'>삭제</button>"
	     + "</div>"
	     
	     + "<hr>"
  });
  
  $("section.replyList ol").html(str);
 });
}

</script>



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
        	<a class="dropdown-item" href="areaIndex">여행지 게시판</a>
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
	<p style="font-size:60px" class="display-3">${area} <!-- 서울 (Seoul) --></p>
	<p>We Make Our World</p>
  </div>
</div>
<p><br>

<!-- 게시글 내용 부분 -->
<div class="container">
<table class="table">
    <thead>
	<tr>
		<th align="center"><h3 align="center">${rContentView.rTitle} ${rContentView.rInShort}</h3></th>
	</tr>
    </thead>

    <tbody>
      <tr>
        <td>
        <p><span class="badge badge-pill badge-secondary">No</span> ${rContentView.rBoardNum}
        <span class="badge badge-pill badge-secondary">조회수</span> ${rContentView.rHit}
        <span class="badge badge-pill badge-secondary">좋아요</span> ${rContentView.like_Cnt}
                <span class="badge badge-pill badge-secondary">등록일 </span><%-- ${rContentView.rDate} --%> <fmt:formatDate value="${rContentView.rDate}" pattern="yyyy-MM-dd"/>  
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
        	     		<strong>작성자</strong> ${rContentView.rId}<br>
        	     		<strong>분류</strong> 
        	     		<c:if test="${rContentView.rCategory eq '1'}">관광지</c:if>
        	     		<c:if test="${rContentView.rCategory eq '2'}">행사</c:if>
        	     		<c:if test="${rContentView.rCategory eq '3'}">맛집</c:if>
        	     		<c:if test="${rContentView.rCategory eq '4'}">기타</c:if>
        	     		<br>
        	     		
						<strong>개장 시간</strong> ${rContentView.rOpenTime} <!-- 09:00~21:00(연중 무휴) --></br>
						<strong>위치 정보</strong> ${rContentView.rAdress} <!-- 서울특별시 종로구 세종로 사직로 161 -->
						<hr class="new3">
						<strong>피셜</strong><br>${rContentView.rInShort}									
			
					</div>
	       	 	</div>	
			</div>	
		</div>
        
        </td>
      </tr>
    </tbody>
</table>

</div>

<div class="container">
	<div align="center">
		<br>${rContentView.rContent}
	</div>
	<hr> <br>
</div>

<!-- Like -->
<div class="container">
<div align="center">
<sec:authorize access="isAuthenticated()">
	        <div class="col-sm-2">
	            <div class="btn-group mx-auto my-2" role="group" aria-label="Basic example">
	                <button type="button" id="likeBtn" class="btn btn-info">&nbsp;
	                    <span id="like"> &nbsp;</span>
	                    <c:out value="${rContentView.like_Cnt}"/>
	                </button>
	            </div>
	        </div>
        </sec:authorize>
</div>

<hr> <br>
</div>

 
<!--  board buttons --> 
<div class="container">
<p align="right">
<a href="review_modifyView?rBoardNum=${rContentView.rBoardNum}" class="btn btn-dark" role="button">수정</a>
<a href="review_delete?rBoardNum=${rContentView.rBoardNum}" class="btn btn-dark" role="button">삭제</a>
<a href="review_boardList" class="btn btn-dark" role="button">목록</a>
</p>
<br>
</div>

<div class="container" id="reply">

 <section class="replyForm">
  <form role="form" method="post" autocomplete="off">
  
  <input type="hidden" name="rBoardNum" id="rBoardNum" value="${rContentView.rBoardNum}">
  
   <div class="input_area">
    <label for="Content">댓글 내용:</label>
      <textarea class="form-control" rows="5" id="repCon" name="repCon"></textarea>
   </div>
   
   <div class="input_area">
    <p align="right"><button type="button" class="btn btn-outline-dark btn-sm" id="reply_btn">댓글 작성</button></p>
    
    <script>
		 $("#reply_btn").click(function(){
		  
		  var formObj = $(".replyForm form[role='form']");
		  var rBoardNum = $("#rBoardNum").val();
		  var repCon = $("#repCon").val()
		  
		  var data = {
			rBoardNum : rBoardNum,
		    repCon : repCon
		    };
		  
		  $.ajax({
		   url : "${pageContext.request.contextPath}/review_contentView/registReply",
		   type : "post",
		   data : data,
		   success : function(){
		    replyList();
		    $("#repCon").val("");
		   }
		  });
		 });
	</script>
 
    
   </div>
   
  </form>
 </section>

 
<section class="replyList">
 <ol>
 	<c:forEach items="${reply}" var="reply">

 	<li>
      <div class="userInfo">
       <span class="id">${reply.id}</span>
       <span class="date"><fmt:formatDate value="${reply.repDate}" pattern="yyyy-MM-dd" /></span>
      </div>
      <div class="replyContent">${reply.repCon}</div>
    </li>

   </c:forEach>
  </ol>    
</section>


<script> 
	replyList(); 	
</script>


<script>
$(document).on("click", ".delete", function(){
	  
	  var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
		 
	  if(deleteConfirm){
	  
	  var data = {repNum : $(this).attr("data-repNum")};
	  
	  $.ajax({
		  url : "${pageContext.request.contextPath}/review_contentView/deleteReply",
		  type : "post",
		  data : data,
		  success : function(result){
		   
		   console.log(result);
			  
		   if(result == 1) {
		    replyList();
		   }
		   
		   if(result == 0) {
		    alert("작성자 본인만 할 수 있습니다.");    
		   }
		  },
		  error : function(){
		   alert("로그인하셔야합니다.")
		  }
		});
	}
});
</script>


<script type="text/javascript">
// 서버로 부터 초기값 세팅
var boardNo = '${rContentView.rBoardNum}';

console.log('${isSelectLike}');
console.log("boardNo"+boardNo);
// 처음에 유저가 좋아요 눌렀는지 판단 유무
var isSelectLike = '${isSelectLike}';
isSelectLike = isSelectLike === 'true';
console.log("aaa"+isSelectLike);
    $(document).ready(function () {
    	var likeMessage = isSelectLike ? 'UnLike' : 'Like';
    	$("#like").text(likeMessage);
		
        $("#likeBtn").on("click", function () {
			// 좋아요 유무에 따른 좋아요, 좋아요 해제 호출 변경 처리
        	var apiUrl = isSelectLike ? '/ex/commons/board/unlike/' : '/ex/commons/board/like/';
           	console.log("api:"+apiUrl);
        	$.ajax({
                url : apiUrl + boardNo,
                async: true,
                type : "POST",
                dataType : "text",
                contentType: "application/json",
                success: function(isSuccess) {
                	$("#like").text();isSelectLike? "Like" : "UnLike" 
                	isSelectLike = !isSelectLike;

                	if(isSuccess){
                     /*   alert("성공"); */
                       location.reload(true);
                    }else{
                      /*  alert("실패"); */
                       location.reload(true);
                    }
                },
                error: function(err) {
                	console.log(JSON.stringify(err));
                     console.log("제발ㅡㅡ"+err); 
                    alert("알수 없는 에러 발생 아 제발 ");
                }
            })
        });
    }) 
                	
                	
                	
                	
</script>


</div>

<p>

<div class="jumbotron text-center" style="margin-bottom:0">
<p>Copyright © 2020 Wemade Korea All rights reserved</p>
</div>  


</body>
</html>