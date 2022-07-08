<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- form 태그에 적용하는 JSTL -->
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<body onload="document.f.id.focus();">


	<p>
	<p align="center" class="display-3" id="login_f">My Page</p>

	<div class="container">

		<div class="container" id="menu">

			<div class="row">

				<div class="col-sm-1"></div>


				<div class="col-sm-10" align="center">
					<!-- Group button details-->
					<div class="btn-group btn-group btn-block">
						<a href="userModify" class="btn btn-secondary" role="button">회원정보 수정</a>
<!-- 						<a href="uploadProfile" class="btn btn-secondary" role="button">프로필 사진 등록</a> -->
						<a href="userPwModify" class="btn btn-secondary" role="button">비밀번호 수정</a> 
						<a href="cartList" class="btn btn-secondary" role="button">장바구니 보기</a> 
						<a href="orderList" class="btn btn-secondary" role="button">주문내역 보기</a> 
						<a href="userDeleteView" class="btn btn-secondary" role="button">회원 탈퇴</a>
					</div>
				</div>

				<div class="col-sm-1"></div>

			</div>

			<br>
		</div>
		<!-- <img class="mx-auto d-block" src="goods/profile.png" width="150"><br> -->
		<!-- <img class="mx-auto d-block" src="img/avatar2.jpg" width="150"> -->
			
		<c:if test="${userDetail.imgName eq null || userDetail.imgName eq '' }">
			<img class="mx-auto d-block" src="img/avatar2.jpg" id="introimg" width="150" />
		</c:if>
		<c:if test="${userDetail.imgName ne null && userDetail.imgName ne '' }">
			<img class="mx-auto d-block" src="/filePath/${userDetail.imgName}" id="introimg" width="150" />
		</c:if>
		<br>
		<p align="center">
			<a href="uploadProfile"> <button type="button" class="btn btn-danger btn-sm">프로필 사진
				등록</button> </a>
		</p>
		<h3 align="center">
			<sec:authentication property="principal.user.nickname" />
			님의 마이페이지 입니다.
		</h3>
		<p align="center">원하시는 정보를 조회 및 수정해주세요.</p>
	</div>

	<div class="container">

		<table class="table">
			<thead align="center">
				<tr>
					<th>ID</th>
					<th>Membership</th>
					<th>Email</th>
					<th>Nationallity</th>
				</tr>
			</thead>
			<tbody align="center">
				<tr>
					<td><sec:authentication property="principal.user.id" /></td>
					<td>일반 회원</td>
					<td><sec:authentication property="principal.user.email" /></td>
					<td><sec:authentication property="principal.user.nationality" /></td>
				</tr>
				<tr>

				</tr>
			</tbody>
		</table>
	</div>

</body>



