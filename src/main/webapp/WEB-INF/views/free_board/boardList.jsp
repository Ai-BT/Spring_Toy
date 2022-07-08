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
<title></title>
<meta charset="utf-8">

	
	
	
	<style>
		body, html {
			height: 100%;
			margin: 0;
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

<body>



<!-- This is banner -->
<div class="hero-image">
  <div class="hero-text">
	<p style="font-size:60px" class="display-3">Community</p>
	<p>We Make Our World</p>
  </div>
</div>


<p><br>



<div class="container" id="free_board">
  <h2>자유게시판</h2> 
  <hr>
  <br>
          
  <table class="table table-hover">
    <thead class="thead-light" align="center">
      <tr>
        <th>No</th>
        <th>작성자</th>
        <th>제목</th>
        <th>조회수</th>
        <th>등록일</th>
      </tr>
    </thead>
    <tbody>
    	<!-- 검색어의 값이 null일 경우  -->
   		<c:if test="${boardByTitle eq null}">
   			<c:forEach items="${list}" var="list"> 
      		<tr>
        		<td align="center">${list.fBoard_Num}</td>
        		<td align="center">${list.fId}</td>
        		<td align="center"><a class="text-dark" href="contentView?fBoard_Num=${list.fBoard_Num}">${list.fTitle}</a></td>
        		<td align="center">${list.fHit}</td>
        		<td align="center"><fmt:formatDate value="${list.fDate}" pattern="yyyy-MM-dd"/></td>
      		</tr>
			</c:forEach>
		</c:if>
		 <!-- 검색어가 null값이 아닐 경우 -->
      	<c:if test="${boardByTitle ne null}">
	      <c:forEach items="${boardByTitle}" var="boardByTitle">
      		<tr>
        		<td align="center">${boardByTitle.fBoard_Num}</td>
        		<td align="center">${boardByTitle.fId}</td>
        		<td align="center"><a class="text-dark" href="contentView?fBoard_Num=${boardByTitle.fBoard_Num}">${boardByTitle.fTitle}</a></td>
        		<td align="center">${boardByTitle.fHit}</td>
        		<td align="center"><fmt:formatDate value="${boardByTitle.fDate}" pattern="yyyy-MM-dd"/></td>
      		</tr>
			</c:forEach>
      	</c:if>
    </tbody>
  </table>

<sec:authorize access="isAnonymous()">
	<p align="right"><a class="btn btn-dark" role="button" onclick="return confirm('로그인시 작성 가능합니다.');">글 작성</a></p>
</sec:authorize>

<sec:authorize access="isAuthenticated()">	
	<p align="right"><a href="writeView" class="btn btn-dark" role="button">글 작성</a></p>
</sec:authorize>

</div>



<div class="container" id="board_pagination">

	<ul class="pagination justify-content-center">
    	
    	<c:if test="${pageMaker.prev}">
    		<li class="page-item"><a class="page-link text-dark" href="boardList${pageMaker.makeQuery(pageMaker.startPage - 1) }">Previous</a></li>
    	</c:if>
    	
    	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
    		<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
    		<li class="page-item"><a class="page-link text-dark" href="boardList${pageMaker.makeQuery(idx)}">${idx}</a></li>
    	</c:forEach>
    	
    	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    		<li class="page-item"><a class="page-link text-dark" href="boardList${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li> <br>
    	</c:if> 
	</ul> 
</div>


<div class="container">

	<div class="row">
		
		<div class="col-sm-4">
		</div>

		<div class="col-sm-4">
<!-- Board Search Bar -->
		<form name="boardByTitle" action="boardByTitle" method="get">
 			<div class="input-group mb-3">
  				<input type="text" name="fTitle" id="fTitle" class="form-control" placeholder="">
  				<div class="input-group-append">
    				<button id="findBtn" class="btn btn-danger btn-dark " type="button">검색</button>
  				</div>
			</div>
		</form>	
<!-- Board Search Bar End -->
		</div>
	
		<div class="col-sm-4">
		</div>
		
	</div>
<br>
</div>


	<script type="text/javascript">
	 	$(document).ready(function(){
	 		$("#findBtn").on("click", function(){  
	 			var form = document.boardByTitle;
	 			var empty = "";
	 			if( $("#fTitle").val().trim() == null || $("#fTitle").val().trim() == empty || $("#fTitle").val().trim() == undefined ) {
	 				alert("검색어를 입력해주세요");
	 				$("#fTitle").val("");
	 			}else{
	 				form.submit();
	 			}
	 			
	 		});
 		});
	 		 
	</script> 



</body>
</html>