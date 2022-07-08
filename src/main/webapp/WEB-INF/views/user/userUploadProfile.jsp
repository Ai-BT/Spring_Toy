<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!-- form 태그에 적용하는 JSTL -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Wemade Korea</title>
  <meta charset="utf-8">

 


</head>

<body>

<p>
<p align="center" class="display-3" id="login_f">My Page</p> 
<p align="center">프로필 사진 등록</p>

<div class="container">
	
<form id ="fileForm" name="fileForm" action="uploadProfileImg" method="post" required enctype="multipart/form-data">
 
 <table border="1" >

  	<div class="form-group">
  	<br>
  		<!-- <label for="profileImg">프로필 등록</label> -->
  		<label for="Thumbnail">프로필 사진:</label>
  		      <input type="file" class="form-control" name="uploadImg" accept="image/*" onchange="setThumbnail(event);"> <p>
 	</div>
 	<div class="form-group" id="image_container">
<!--      <label for="fileImage">이미지 미리보기:</label><br> -->
	</div>
	
     </table>


	<p align="center">
    <a href="/ex/mypage" id="home"><button type="button" class="button3 btn btn-danger">돌아가기</button></a>
    <button type="submit" class="button3 btn btn-danger" >업로드</button>

	</p>
 </form>

 <br><br><br>
</div>

</body>

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


</html>