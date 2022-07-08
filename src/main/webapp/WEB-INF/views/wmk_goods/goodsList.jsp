<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 시큐리티 전용 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




	<style>
 	#s1 {
	/* background: blue; */
	line-height:55px;
	}

 	#s1 img {
 	vertical-align:middle;
	}
	
	</style>
	
<style>

	body, html {
  height: 100%;
  margin: 0;
/*    font-family: Arial, Helvetica, sans-serif; */
}

.hero-image {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("img/banner2.jpg");
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
	

  

<body>
	


<!-- This is banner -->
<div class="hero-image">
  <div class="hero-text">
	<p style="font-size:60px" class="display-3">Goods</p>
	<p>We Make Our World</p>
<!-- 	<p style="font-size:20px" class="display-3">나의 캐릭터로 만드는 내 손 안의 프린팅 아이템</p> -->
<!-- 	<p>나의 캐릭터로 만드는 내 손 안의 프린팅 아이템!</p> -->
  </div>
</div>

<br><br>


	<h2 align="center"><strong>나의 캐릭터로 만드는 내 손 안의 프린팅 아이템</strong></h2>

	<br><br>


	<!-- Select Goods -->
	<div class="container">
	
		<div class="row">
		
		
		<c:forEach items="${list}" var="list">
		<div class="col-sm-4">
		

		
		<a href="${pageContext.request.contextPath}/goodsView?n=${list.gdsNum}"><img src="${pageContext.request.contextPath}/${list.gdsImg}" class="img-fluid mx-auto d-block rounded" width="275"></a>
		
		
		<h1 align="center">${list.gdsName}</h1>
<%-- 		<h1 align="center">(&#8361;${list.gdsPrice}~)</h1> --%>
		<h1 align="center">&#8361;<fmt:formatNumber pattern="###,###,###" value="${list.gdsPrice}" />~</h1>
		<p align="center" style="font-size:20px">${list.gdsDes}</p>
		

		
		
		
		
		</div>
		</c:forEach>
		
		</div> <!-- row end  -->
		
<sec:authorize access="isAuthenticated()">
	<p align="right"><a href="admin/goods_register" class="btn btn-dark" role="button">제품 등록</a></p>
</sec:authorize>
	
	</div> <!--  container end -->
	
	<br><br>



</body>

