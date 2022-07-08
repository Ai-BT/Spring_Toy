<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Wemade Korea</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형에 반드시 필요한태그 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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




</head>
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
<body>

<section id="container">
	<a class="form">탈퇴할라고??, <sec:authentication property="principal.user.nickname"/> 님?</a>
	<div class="form-group">
		<label>비밀번호 (Password):</label>
		<input type="password" class="form-control" id="pw" placeholder="비밀번호를 입력해주세요" name="pw">
	</div>
	<button class="btn btn-danger" id="deleteMember">회원탈퇴</button>
	<button class="cancel btn btn-danger" type="button">취소</button>
	<div>
		<c:if test="${msg == false}">
			비밀번호가 맞지 않습니다.12
		</c:if>
	</div>
</section>
</body>
</html>