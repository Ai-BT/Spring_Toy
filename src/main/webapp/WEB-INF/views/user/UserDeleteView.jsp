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


<script type="text/javascript">

	$(document).ready(function(){
		// 취소
		$(".cancel").on("click", function(){

			location.href = "/ex/index";

		})

		$("#deleteMember").on("click", function(){
			if($("#pw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#pw").focus();
				return false;
			}
			
			$.ajax({
				url : "/ex/user/userDelete",
				async: true,
				type : "POST",
				dataType : "text json",
				contentType: "application/json",
				data : JSON.stringify({pw: $('#pw').val()}),
				success: function(data) {
					console.log(data);
					const isSuccess = data.statusCode === 200;
					if(isSuccess){
						alert("회원 탈퇴 성공");
						location.href = "/ex/index";
					}else{
						alert("비밀번호를 다시 입력해 주세요");
					}
				},
				error: function(err) {
					alert("알수 없는 에러 발생");
				}
			})

		});


	})
</script>


</head>
<body onload="document.f.id.focus();">



<p>
<p align="center" class="display-3" id="login_f">My Page</p> 
<p align="center">회원탈퇴</p>

<div class="container">
	

	<section id="container">
	<p align="center">
	<sec:authentication property="principal.user.nickname"/> 님의 현재 비밀번호를 입력하시면 삭제가 진행됩니다.
	<br>한번 삭제가 된 계정은 복구가 불가능합니다.
	</p>

	
	<div class="form-group">

		<label>비밀번호 (Password):</label>
		<input type="password" class="form-control" id="pw" placeholder="비밀번호를 입력해주세요" name="pw">
	</div>
	<br><p align="center">
	<button class="btn btn-danger" id="deleteMember">회원탈퇴</button>
<!-- 	<button class="cancel btn btn-danger" type="button">취소</button></p> -->
    <a href="javascript:history.back();" id="home"><button type="button" class="button3 btn btn-danger">취소</button></a>
	<div>
		<c:if test="${msg == false}">
			비밀번호가 맞지 않습니다.12
		</c:if>
	</div>
</section>

	

</div>




<br>




</body>
</html>