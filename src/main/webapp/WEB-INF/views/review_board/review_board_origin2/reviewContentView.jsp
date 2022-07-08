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
		<th align="center"><h3 align="center">${rContentView.rTitle}</h3></th>
	</tr>
    </thead>

    <tbody>
      <tr>
        <td>
        <p><span class="badge badge-pill badge-secondary">No</span> ${rContentView.rBoardNum}
        <span class="badge badge-pill badge-secondary">조회수</span> ${rContentView.rHit}
        <span class="badge badge-pill badge-secondary">좋아요</span> ${rContentView.like_Cnt}
                <span class="badge badge-pill badge-secondary">등록일 </span><fmt:formatDate value="${rContentView.rDate}" pattern="yyyy-MM-dd"/>  
        </p>
        
		<div class="card">
			<div class="card-body">
	        	<div class="row">
        			<div class="col-md-5">
        				<div class="content_picture">
        	       		<c:forEach var="files" items="${file}" >
        	       			<c:if test="${files.STORED_FILE_NAME eq null || files.STORED_FILE_NAME eq ' '}" >
        	       				<img src="/filePath/null.jpg" class="rounded img-fluid"/>
        	       			</c:if>	
        	       			<c:if test="${files.STORED_FILE_NAME ne null && files.STORED_FILE_NAME ne ' ' }" >
        	       				<img src="/filePath/${files.STORED_FILE_NAME}" class="rounded img-fluid"/>
        	       			</c:if>
        	       		</c:forEach>
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
<!-- <img src="img/travel_board_img/like_1.png" class="img-rounded img-fluid" id="like"> -->
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


<!--  Comment view -->
<%-- <div class="container" id="comment_view">

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
	
</div> --%>



 
<!--  board buttons --> 
<div class="container">
<p align="right">

<%-- <a href="review_modifyView?rBoardNum=${rContentView.rBoardNum}&area=${rContentView.rArea}" class="btn btn-dark" role="button">수정</a> --%>

<sec:authorize access="isAuthenticated()">
	<button type="button" class="modifyCheck btn btn-dark" data-modify_Num="${rContentView.rBoardNum}">수정</button> 
</sec:authorize>

 <button type="button" class="boardDelete btn btn-dark" data-rBoardNum="${rContentView.rBoardNum}">삭제</button>
 
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
		   alert("로그인이 필요합니다.")
		   window.location.href = "${pageContext.request.contextPath}/loginForm";
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


   <script>
      //리뷰 게시판 삭제
      
      $(document).on("click", ".boardDelete", function(){
        
        var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
      
        if(deleteConfirm){
           
           var data = {rBoardNum : $(this).attr("data-rBoardNum")};
           
           
           $.ajax({
              url : "${pageContext.request.contextPath}/review_delete",
              type : "get",
              data : data,
              success : function(result){
               
               console.log("result: " + result);
               
               console.log("data: " + data);
               
               if(result == 1) {
                 window.location.href = "${pageContext.request.contextPath}/review_boardList?rArea=${rContentView.rArea}";
               }
               
               if(result == 0) {
                alert("작성자 본인만 삭제 할 수 있습니다.");    
               }
              },
              error : function(){
               alert("로그인이 필요합니다.")
               window.location.href = "${pageContext.request.contextPath}/loginForm";
              }
            });
           }
      });
      
      </script>


 <script>
      //리뷰 게시판 수정
      /* <a href="review_modifyView?rBoardNum=${rContentView.rBoardNum}&area=${rContentView.rArea}" class="btn btn-dark" role="button">수정</a> */
      
      $(document).on("click", ".modifyCheck", function(){
        
        var modifyConfirm = confirm("정말로 수정하시겠습니까?");
      
        if(modifyConfirm){
           
           var data = {rBoardNum : $(this).attr("data-modify_Num")};
           //modifyView?fBoard_Num=${contentView.fBoard_Num}
           
           $.ajax({
              url : "${pageContext.request.contextPath}/ReviewModifyIdCheck",
              type : "get",
              data : data,
              success : function(result){
               
               console.log("result: " + result);
               
               console.log("data: " + data);
               
               if(result == 1) {
                 window.location.href = "${pageContext.request.contextPath}/review_modifyView?rBoardNum=${rContentView.rBoardNum}&area=${rContentView.rArea}";
               }
               
               if(result == 0) {
                alert("작성자 본인만 수정 할 수 있습니다.");    
               }
              },
              error : function(){
               alert("로그인이 필요합니다.")
               window.location.href = "${pageContext.request.contextPath}/loginForm";
              }
            });
           }
      });
      
  </script>



</div>

<p>


</body>
</html>