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
 
  <script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
	




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




<p>
<div class="container">
<p align="center" class="display-3" id="disf">Travel Info</p>
</div>




<div class="container" id="review_write_view">
  <h2>여행지 게시판</h2> <br>
 

<form id ="boardForm" name="boardForm" action="review_write" method="post" required enctype="multipart/form-data">
	<input type="hidden" name="area" value='<c:out value="${rArea}"></c:out>'>
<sec:authorize access="isAuthenticated()">
    
	<input type="hidden" class="form-control" id="rId" placeholder="" name="rId" value="<sec:authentication property="principal.user.id"/>">

</sec:authorize> 

	<div class="row">
	
		<div class="col">
		
			<label for="rArea">지역 :</label>
		     <!--  <input type="" class="form-control" id="rCategory" placeholder="" name="rCategory"> <p> -->
		     <select class="form-control" id="rArea" name="rArea">
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
		
		
		<div class="col">
		
		    <label for="rCategory">분류:</label>
		    
		     <select class="form-control" id="rCategory" name="rCategory">
		    	<option value="1">관광지</option>
		    	<option value="2">행사</option>
		    	<option value="3">맛집</option>
		    	<option value="4">기타</option>
			</select>
		
		
		</div>		
		

	</div>
	
	
	<div class="row">
	
		<div class="col">
		
			<label for="rTitle">여행지명:</label>
			<input type="text" class="form-control" id="rTitle" placeholder="예: 남산 서울타워" name="rTitle" value="남산 서울타워">
      
      	</div>
      	
      	<div class="col">
		
			<label for="rInShort">개요:</label>
			<input type="text" class="form-control" id="rInShort" placeholder="예: 도시의 전경을 조망할 수 있는 타워 & 레스토랑" name="rInShort" value="도시의 전경을 조망할 수 있는 타워 & 레스토랑"> <p>
      
      	</div>
      	
	</div>
	
	
	<div class="row">
	
		<div class="col">
		
			<label for="rOpenTime">운영시간:</label>
			<input type="text" class="form-control" id="rOpenTime" placeholder="예: 09:00~21:00" name="rOpenTime" value="09:00~21:00"> <p>
      
      	</div>
      	
      	<div class="col">
		
			<label for="rAdress">위치정보:</label>
			<input type="text" class="form-control" id="rAdress" placeholder="예: 서울특별시 용산구 남산공원길 105(용산동2가)" name="rAdress" value="서울특별시 용산구 남산공원길 105"> <p>
      
      	</div>
      	
	</div>
	
	
	<div class="form-group">
    <label for="Thumbnail">대표 이미지:</label>
      <input type="file" class="form-control" name="uploadImg" accept="image/*" onchange="setThumbnail(event);"> <p>
	</div>
	
	<div class="form-group" id="image_container">
<!--      <label for="fileImage">이미지 미리보기:</label><br> -->
	</div>
	
    <div class="form-group" >
      <label for="rContent">상세 내용:</label>
      <textarea class="form-control" rows="10" id="rContent" name="rContent" placeholder=""></textarea>
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


</body>
</html>