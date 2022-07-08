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

   
  <script type="text/javascript">
  
	$(document).ready(function(){
   	 $("#cate").on('click', 'li', function() {
   		 
 		var formData= {                 
 			rCategory: $(this).val(),
 			rArea : "${rArea}"
        };
   		  
   		$.ajax({
            type: "POST"
            , dataType: "json"
            , async : false
            , contentType : "application/json; charset=UTF-8"
            , url : "<c:url value="review_boardList_ajax" />"
            , data : JSON.stringify(formData)
            , success : function(objList) {
               //값을 제이슨형태로 변환
               //var responseData = JSON.stringify(objList);
               //제이슨타입을 맵형식으로 변환
               //var data = JSON.parse(responseData);
               
               //console.log( responseData );
               //console.log( data );

               var sTxt = '';
               var _storedFileName = "null.jpg";
               $(objList).each(function (index, order){
            	   sTxt += '<div class="col-md-4">';
            	   sTxt += 		'<div class="card shadow-sm">';
            	   sTxt += 			'<div class="list_picture">';
            	   if(order.storedFileName == null || order.storedFileName == ''){
            	   	sTxt += 				'<a href="review_contentView?rBoardNum='+ order.rBoardNum + '&area='+ order.rArea + '"><img src="/filePath/null.jpg" class="img-fluid mx-auto d-block rounded"></a>';
            	   }else{
            	   	sTxt += 				'<a href="review_contentView?rBoardNum='+ order.rBoardNum + '&area='+ order.rArea + '"><img src="/filePath/' + order.storedFileName + '" class="img-fluid mx-auto d-block rounded"></a>';
            	   }
            	   sTxt += 			'</div>';
            	   sTxt += 			'<div class="card-body">';
            	   sTxt += 				'<p class="card-text"><strong>' + order.rTitle + '</strong><br>'+ order.rInShort + '</p>';
            	   sTxt += 					'<span class="badge  badge-pill badge-danger">좋아요</span>'+order.like_Cnt;
            	   if(order.rCategory == 0){
            	   	sTxt += 				'<span class="badge  badge-pill badge-success">분류</span> 전체';
            	   }else if(order.rCategory == 1){
            	   	sTxt += 				'<span class="badge  badge-pill badge-success">분류</span> 관광지';
            	   }else if(order.rCategory == 2){
            	   	sTxt += 				'<span class="badge  badge-pill badge-success">분류</span> 행사';
            	   }else if(order.rCategory == 3){
            	   	sTxt += 				'<span class="badge  badge-pill badge-success">분류</span> 맛집';
            	   }else if(order.rCategory == 4){
            	   	sTxt += 				'<span class="badge  badge-pill badge-success">분류</span> 기타';
            	   }
            	   sTxt += 					'<span class="badge  badge-pill badge-primary">지역</span>'+order.rArea;
            	   sTxt += 			'</div>';
            	   sTxt += 		'</div>';
            	   sTxt += 		'<br>';
            	   sTxt +=  '</div>';
               });
               
               $('#review_contentView .row').html(sTxt); //success 종료
               
            }, error : function(response){
               alert("카테고리를 다시 눌러주십시오.");
            }
         });
   		 
   	 
   	 });
	})
  </script>


	
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
	
  
  	<style>
	
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
	height: 230px;
  }
  
  .list_picture img {
    width: 100%;
	height: 230px;
  
  }
  
  </style>	


</head>
<body>



<!-- This is banner -->
<div class="hero-image">
  <div class="hero-text">
	<p style="font-size:60px" class="display-3">${rArea}</p>
	<p>We Make Our World</p>
  </div>
</div>

<!-- Group button -->
<p><br>
<div class="container" id="district">

  <div class="row">
  
  	<div class="col-sm-2">
  	</div>
  	
  	
  	<div class="col-sm-8" align="center">
  	
		<!-- Group button details-->
		<div class="btn-group btn-group btn-block" id="cate">
		
<!--   			<ul id="cate">

				<li id="cate2" class="btn btn-secondary cate2" value="0">전체</li> 
				<li id="cate2" class="btn btn-secondary cate2" value="1">관광지</li> 
				<li id="cate2" class="btn btn-secondary cate2" value="2">행사</li> 
				<li id="cate2" class="btn btn-secondary cate2" value="3">맛집</li> 
				<li id="cate2" class="btn btn-secondary cate2" value="4">기타</li>
	 
		    </ul>	   	 -->	        
		
			<button id="cate2" type="button" class="btn btn-secondary cate2" value="0">전체</button>
			<button id="cate2" type="button" class="btn btn-secondary cate2" value="1">관광지</button>
		    <button id="cate2" type="button" class="btn btn-secondary cate2" value="2">행사</button>
		    <button id="cate2" type="button" class="btn btn-secondary cate2" value="3">맛집</button>
		    <button id="cate2" type="button" class="btn btn-secondary cate2" value="4">기타</button>
	    
		    
		</div>  	
  	</div>
  	
  	
  	<div class="col-sm-2">
  	</div>
  
  </div>
  
  
</div>


  <div class="album py-5">
    <div class="container" id="review_contentView">
		<div class="row">
		<c:forEach items="${rList}" var="userList">
		<div class="col-md-4"> 
	  <div class="card shadow-sm">
	  	<div class="list_picture">
	  	<c:if test="${area eq null || area eq '' }">
			<a href="review_contentView?rBoardNum=${userList.rBoardNum}&area=${userList.rArea}"><img src="/filePath/${userList.storedFileName ne ' '? userList.storedFileName : 'null.jpg'}" class="img-fluid mx-auto d-block rounded"></a>
	  	</c:if>
	  	<c:if test="${area ne null && area ne '' }"> <!-- 빈값이 아니면서 null이 아니면  -->
			<a href="review_contentView?rBoardNum=${userList.rBoardNum}&area=${area}"><img src="/filePath/${userList.storedFileName ne ' '? userList.storedFileName : 'null.jpg'}" class="img-fluid mx-auto d-block rounded"></a>
	  	</c:if>
	    </div>
	    <div class="card-body">
	      <p class="card-text"><strong>${userList.rTitle}</strong><br>${userList.rInShort}</p>

	      <span class="badge  badge-pill badge-danger">좋아요</span>${userList.like_Cnt}
	     <span class="badge  badge-pill badge-success">분류</span>
	      				<c:if test="${userList.rCategory eq '1'}">관광지</c:if>
        	     		<c:if test="${userList.rCategory eq '2'}">행사</c:if>
        	     		<c:if test="${userList.rCategory eq '3'}">맛집</c:if>
        	     		<c:if test="${userList.rCategory eq '4'}">기타</c:if>
        	     		<br>
        <span class="badge  badge-pill badge-primary">지역</span>${userList.rArea}
       </div>
	  </div>
	  <br>
        </div>
     	</c:forEach>
	
      </div> 

  </div>
 
	<!--  board buttons --> 
	<sec:authorize access="isAuthenticated()">
 	<div class="container">
	<p align="right">
	<a href="review_writeView?rArea=${rArea}" class="btn btn-dark" role="button">글 작성</a>
	</p>
	</div>
	</sec:authorize>

<br><br>

</body>
</html>