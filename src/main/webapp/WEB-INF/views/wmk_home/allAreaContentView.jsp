<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- 시큐리티 전용 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Wemade Korea</title>
<meta charset="utf-8">


<style>
#s1 {
	/* background: blue; */
	line-height: 55px;
}

#s1 img {
	vertical-align: middle;
}
</style>

<style>
body, html {
	height: 100%;
	margin: 0;
	/*    font-family: Arial, Helvetica, sans-serif; */
}

.hero-image {
	background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("img/banner2.jpg");
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

<style>

/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 230px;
}

.list_picture img {
	width: 100%;
	height: 230px;
}
</style>


</head>
<body>

	<!-- This is banner -->
	<div class="hero-image">
		<div class="hero-text">
			<p style="font-size: 60px" class="display-3">검색 결과</p>
			<p>We Make Our World</p>
		</div>
	</div>

	<div class="container">
		<br>
		<p style="text-align: center">'${title}' 을 입력한 결과입니다.</p>
	</div>

	<div class="album py-5">
		<div class="container" id="review_boardByTitle">

			<div class="row">
				<c:forEach items="${reviewBoardByTitle}" var="userSearchList">
					<div class="col-md-4">
						<div class="card shadow-sm">
							<div class="list_picture">
								<a
									href="review_contentView?rBoardNum=${userSearchList.rBoardNum}&area=${userSearchList.rArea}"><img
									src="/filePath/${userSearchList.storedFileName ne ' '? userSearchList.storedFileName : 'null.jpg'}"
									class="img-fluid mx-auto d-block rounded"></a>
							</div>
							<div class="card-body">
								<p class="card-text">
									<strong>${userSearchList.rTitle}</strong><br>${userSearchList.rInShort}</p>

								<span class="badge  badge-pill badge-danger ">Like</span>
								${userSearchList.like_Cnt} <span
									class="badge  badge-pill badge-success">분류</span>
								<c:if test="${userSearchList.rCategory eq '1'}">관광지</c:if>
								<c:if test="${userSearchList.rCategory eq '2'}">행사</c:if>
								<c:if test="${userSearchList.rCategory eq '3'}">맛집</c:if>
								<c:if test="${userSearchList.rCategory eq '4'}">기타</c:if>
								<br>
							</div>
						</div>
						<br>
					</div>
				</c:forEach>

			</div>

		</div>
	</div>

</body>
</html>