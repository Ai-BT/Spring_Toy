<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- form 태그에 적용하는 JSTL -->



<p>
<p align="center" class="display-3" id="login_f">Login</p>


<div class="container">
	<div class="row">

		<div class="col-sm-2"></div>

		<div class="col-sm-8">



			<c:url value="/login" var="loginUrl" />
			<!-- "/login" : 이 경로는 내가 만든 매핑이 아닌 스프링 시큐리티필터가 처리하는 전용매핑이다. -->

			<form:form name="f" action="${loginUrl}" method="POST">
				<!-- action 은 http://localhost:8282/ex/login 라는 절대경로를 의미.-->
				<c:if test="${param.error != null}">
					<p>아이디와 비밀번호가 잘못되었습니다.</p>
				</c:if>
				<c:if test="${param.logout != null}">
					<p>로그아웃 하였습니다.</p>
				</c:if>

				<div class="form-group">
					<label for="id">아이디 (ID):</label> <input type="id"
						class="form-control" id="id" placeholder="아이디를 입력해주세요" name="id">
				</div>
				<div class="form-group">
					<label for="pwd">비밀번호 (Password):</label> <input type="password"
						class="form-control" id="pw" placeholder="비밀번호를 입력해주세요" name="pw">
				</div>
				<div class="form-group form-check">
					<label class="form-check-label"> <input
						class="form-check-input" type="checkbox" name="remember">
						Remember me
					</label>
				</div>

				<button type="submit" class="btn btn-danger">Submit</button>

				<br>
				<br>
				<label for="email">간편 로그인 (Login with SNS):</label>
				<a
					href="https://kauth.kakao.com/oauth/authorize?client_id=af9546b83fbd65051801d2e327f8c259&redirect_uri=http://localhost:8282/ex/auth/kakao/callback&response_type=code"
					class="btn btn-warning btn-user btn-block"> <i
					class="fab fa-google fa-fw"></i> <img src="img/kakao_icon.jpg"
					width="25"><strong> 카카오톡 로그인 </strong>
				</a>
				
				<a class="btn btn-success btn-user btn-block" onclick="return confirm('서비스 지원 예정입니다.');">
					<i class="fab fa-facebook-f fa-fw"></i> <img src="img/naver_icon.png" width="25"><strong> 네이버 로그인 </strong>
				</a>
				
				
<!-- 	<p align="right"><a class="btn btn-dark" role="button" onclick="return confirm('로그인시 작성 가능합니다.');">글 작성</a></p>	 -->
	
				
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

			</form:form>

		</div>

		<div class="col-sm-2"></div>
	</div>
</div>

<br>
<br>


