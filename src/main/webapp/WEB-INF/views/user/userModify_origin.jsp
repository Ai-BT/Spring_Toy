<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>사용자 홈</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>

<h1>사용자 페이지 입니다.</h1>

<h3>[<a href="<c:url value="/ex/index" />">홈으로 돌아가기.</a>]</h3>

<sec:authentication var="principal" property="principal"/>

<p>principal: <sec:authentication property="principal"/></p>
<p>UserVO: <sec:authentication property="principal.user"/></p> <!-- principal 에 emp 다는게 목적이었다. -->
<p>유저 아이디: <sec:authentication property="principal.user.id"/></p>
<p>유저 비밀번호: <sec:authentication property="principal.user.pw"/></p>
<p>유저 이메일: <sec:authentication property="principal.user.email"/></p>
<p>유저 국적: <sec:authentication property="principal.user.nationality"/></p>


 <fieldset>
 
<form:form id="modifyForm" action="update" method="POST">
 <table border="1" id="modifyTable">

  	<div class="form-group">
  		<label for="id">아이디 (ID):</label>
  		<input type="text" class="form-control" id="id" name="id" value="<sec:authentication property="principal.user.id"/>" readOnly/>
 	 </div>
	<div class="form-group">
  		<label for="pw">비밀번호 (Password):</label>
  		<input type="password" class="form-control" id="pw" name="pw">
  		<label for="pw">비밀번호 확인 (CheckPassword):</label>
  		<input type="password" class="form-control" id="pw2" name="pw2">
	</div>
	<div class="form-group">
  		<label for="nickname">닉네임 (Signature Name):</label>
  		<input type="text" class="form-control" id="nickname" name="nickname" value="<sec:authentication property="principal.user.nickname"/>"readOnly/>
	</div>


 	<div class="form-group">
      <label for="email">이메일 (Email):</label>
      <input type="email" class="form-control" id="email" placeholder="" name="email"  value="<sec:authentication property="principal.user.email"/>">
    </div>

   <div class="form-group">
      <label for="nationality">국적 (Nationality):</label>
      <select class="form-control" id="nationality" name="nationality">
        <option>한국 (Republic of Korea)</option>
        <option>일본 (Japan)</option>
        <option>중국 (China)</option>
        <option>미국 (United States)</option>
        <option>기타 (Others)</option>
      </select>
    </div>


  <tr>
   <td colspan="2">
    <a href="/ex/loginForm" id="home"><button type="button" class="button3">돌아가기</button></a>
    <button type="submit" class="button3" >수정완료</button>
    <button class="cencle btn btn-danger" type="button" id="cancel">취소</button>
   </td>
  </tr>

 </table>
 </form:form>

 </fieldset>

</body>

 <script>
    $(function() {
    	$("#cancel").on("click", function(){

			location.href = "/ex/index";

		});
		if($("#modifyForm").submit(function() {
			alert("수정하시겠습니까?");
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 6) {
				alert("비밀번호는 6자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val()) {
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
			else if($("#id").val()==""){
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			}
			else if($("#pw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#pw").focus();
				return false;
			}
			else if($("#nickName").val()==""){
				alert("성명을 입력해주세요.");
				$("#nickName").focus();
				return false;
			}
			else if($("#email").val()==""){
				alert("이메일을 입력해주세요.");
				$("#name").focus();
				return false;
			}
			
			
		}));
		
	});
    </script>
    <script>
    function onlyNumber(){

        if((event.keyCode<48)||(event.keyCode>57))

           event.returnValue=false;

	}

    </script>
</html>