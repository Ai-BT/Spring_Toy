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

	function validateForm() {
		
		var name = document.forms["boardForm"]["bName"].value;
		if (name == "" || name == null){
	    alert("이름을 입력해주세요.");
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

<body>




<p>
<div class="container">
<p align="center" class="display-3" id="disf">Community</p>
</div>




<div class="container" id="write_view">
  <h2>자유게시판</h2> <br>
 


<form name="boardForm" action="free_write" onsubmit="return validateForm(), validateForm3(), validateForm4()" method="post" required>


<sec:authorize access="isAuthenticated()">
    
<!--<label for="bName"></label> -->
	<input type="hidden" class="form-control" id="fId" placeholder="" name="fId" value="<sec:authentication property="principal.user.id"/>">

</sec:authorize> 


	
	<div class="form-group">
    <label for="bTitle">제목:</label>
      <input type="text" class="form-control" id="fTitle" placeholder="" name="fTitle"> <p>
	</div>

  	
    <div class="form-group">
      <label for="content">내용:</label>
      <textarea class="form-control" rows="10" id="fContent" name="fContent"></textarea>
    </div>
  
	<p align="center"><button type="submit" class="btn btn-dark">등록</button> 
	<a href="boardList" class="btn btn-dark" role="button" onclick="return confirm('목록으로 돌아가겠습니까?');">취소</a></p>




	<br>
	
</form>

</div>



</body>
</html>