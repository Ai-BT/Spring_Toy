<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>



<p>
<p align="center" class="display-3" id="login_f">Join</p>


<div class="container">
	<div class="row">
		<div class="col-sm-2"></div>


		<div class="col-sm-8">


			<form:form name="join_member" action="addUser" method="POST"
				onsubmit="return checkJoinform();">

				<div class="form-group">
					<label for="id">아이디 (ID):</label> <input type="text"
						class="form-control" id="id" name="id">
					<button class="btn btn-danger" id="duplicate_check" type="button"
						onclick="check();">중복체크</button>
				</div>
				<div class="form-group">
					<label for="pw">비밀번호 (Password):</label> <input type="password"
						class="form-control" id="pw" name="pw"> <label for="pw">비밀번호
						확인 (CheckPassword):</label> <input type="password" class="form-control"
						id="pw2" name="pw2">
				</div>

				<div class="form-group">
					<label for="nickname">닉네임 (Signature Name):</label> <input
						type="text" class="form-control" id="nickname" name="nickname">
				</div>


				<div class="form-group">
					<label for="email">이메일 (Email):</label> <input type="email"
						class="form-control" id="email" placeholder="" name="email">
				</div>

				<div class="form-group">
					<label for="nationality">국적 (Nationality):</label> <select
						class="form-control" id="nationality" name="nationality">
						<option>한국 (Republic of Korea)</option>
						<option>일본 (Japan)</option>
						<option>중국 (China)</option>
						<option>미국 (United States)</option>
						<option>기타 (Others)</option>
					</select>


				</div>
				<button type="submit" class="btn btn-danger">Submit</button>

			</form:form>

		</div>
	</div>
</div>

<div class="col-sm-2"></div>

<br>
<br>


<script>
//중복 체크 검사 유무 검사하는 값 12
var isCheckIdCheck = false;

function isValidJoinForm() {
	
	var id = $("#id").val() || '';
	var pw = $("#pw").val() || '';
	var checkPw = $("#pw2").val() || '';
	var email = $("#email").val() || '';
	var nickname = $("#nickname").val() || '';
	var spe = /^.*(?=^.{5,10}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	console.log("id:	"+id);
	console.log("pw:	"+pw);
	console.log("checkPw:	"+checkPw);
	
	
	if(id.trim() === '') {
		console.log("id:	"+id);
		alert('아이디를 입력해 주세요');
		return false;
	}
	
	if(pw.trim() === '') {
		console.log("Pw:	"+pw);
		alert('비밀번호를 입력해 주세요');
		return false;
	}else if($("#pw").val().length < 6) {
		alert("비밀번호는 6자 이상으로 설정해야 합니다.");
		$("#pw").val("").focus();
		return false;
	}	
	if(nickname.trim() === '') {
		console.log("nickname:	"+nickname);
		alert('닉네임을 입력해 주세요');
		return false;
	}
	if(email.trim() === '') {
		console.log("email:	"+email);
		alert('이메일을 입력해 주세요');
		return false;
	}
	if(pw == checkPw){
	
	return true;
	}else{
		console.log("pw:	"+pw);
		console.log("checkpw:	"+checkPw);
		alert('비밀번호가 일치하지않습니다.');
		return false;
	}
	
}
 	// 회원가입 하기 전 중복 로그인 체크 검사
	function checkJoinform(){
		if(isCheckIdCheck === false) {
			alert('아이디 중복체크를 해주세요.');
			console.log("CheckID  :"+isCheckIdCheck);
			return false;
		}
		var isValidJoin = isValidJoinForm();
		console.log(" isValidJoin   :"+isValidJoin);
		return isValidJoin;
	}
 	
 	
 	
	
	function check(){
		var id = $("#id").val();
		
		$.ajax({
		    url: 'user/check',
		    type: 'GET',
		    dataType: 'text', //서버로부터 내가 받는 데이터의 타입
		    contentType : 'text/plain; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
		    data: { id },
		    success: function(data){
		    	var res = JSON.parse(data);
		    	console.log("12  :"+res);
		    	var isCheckSuccess = res.statusCode === 200 ;
		    	console.log("isCheckSuccess :	"+isCheckSuccess);
		    	var isEnteryourID = res.statusCode === 401; // 바꾸기 
		    	console.log("isEnteryourID :	"+isEnteryourID);
		    	var isCheckfalse = res.statusCode === 400; // 바꾸기 
		    	console.log("isCheckfalse :	"+isEnteryourID);
		    	
		         if(isCheckSuccess ){
		        	 isCheckIdCheck = true;
			    	alert("아이디 사용이 가능합니다.");
		         }
		         if(isCheckfalse){
		        	 isCheckfalse = false;
		         	alert("중복된 아이디가 존재합니다.");
		         }
		         if(isEnteryourID){
	                  isEnteryourID = false;
	                  alert("아이디를 입력해주세요");
	             }
		    },
		    error: function (){        
		                      
		    }
	  });


}
</script>



</html>