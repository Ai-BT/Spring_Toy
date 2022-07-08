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

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>






<style>
.checked {
  color: orange;
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
	<p style="font-size:80px" class="display-3">Hot Place</p>
	<p> We made Korea </p>
  </div>
</div>


<br>


  <div class="album py-5">
    <div class="container" id="hot_reviewList">
		<div class="row">
		<c:forEach items="${hotReivewList}" var="hotList">
		<div class="col-md-4"> <!-- <div class="card mb-4 shadow-sm"> -->
	  <div class="card shadow-sm">
	  	<div class="list_picture">
		<a href="review_contentView?rBoardNum=${hotList.rBoardNum}&area=${area}"><img src="/filePath/${hotList.storedFileName ne ' '? hotList.storedFileName : 'null.jpg'}" class="img-fluid mx-auto d-block rounded"></a>
	    </div>
	    <div class="card-body">
	      <p class="card-text"><strong>${hotList.rTitle}</strong><br>${hotList.rInShort}</p>


		<span class="badge  badge-pill badge-danger">Like</span> ${hotList.like_Cnt}
	     <span class="badge  badge-pill badge-success">분류</span>
	     				${hotList.rArea} &#187;
	      				<c:if test="${hotList.rCategory eq '1'}">관광지</c:if>
        	     		<c:if test="${hotList.rCategory eq '2'}">행사</c:if>
        	     		<c:if test="${hotList.rCategory eq '3'}">맛집</c:if>
        	     		<c:if test="${hotList.rCategory eq '4'}">기타</c:if>
        	     		<br>
<%--           <span class="badge  badge-pill badge-primary">지역</span>${hotList.rArea} --%>
	    </div>
	  </div>
	  <br>
        </div>
     	</c:forEach>        
      </div> 
  	</div>
  </div>
  



</body>
</html>