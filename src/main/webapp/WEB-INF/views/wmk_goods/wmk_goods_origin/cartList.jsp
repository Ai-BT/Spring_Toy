<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 시큐리티 전용 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Wemade Korea</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형에 반드시 필요한태그 -->
      
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
	
 
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
<body>

<div class="container"> <!-- table -->
	<div class="row"> <!-- td -->
	
		<div class="col-sm-6" id="s1">
			<a href="index"><img src="img/main_logo2.png"></a>
		</div> <!-- tr -->
		
		<div class="col-sm-6" id="s2">
			<!-- Search Bar -->
<!-- 			<p>Search Bar</p> -->
		<p>
 		<div class="input-group mb-3">
  			<input type="text" class="form-control" placeholder="Search">
  			<div class="input-group-append">
    			<button class="btn btn-danger" type="submit">Go</button>
  			</div>
		</div>
			<!-- Search Bar End -->
		</div>
	</div>
</div>

<!-- <nav class="navbar navbar-expand-md bg-light navbar-light sticky-top"> -->
<nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">
	
	<!-- Brand Logo -->
	<a class="navbar-brand" href="#">MENU</a>
	
	<!-- Toggler -->
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<!-- Content -->
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
	<ul class="navbar-nav">

		<li class="nav-item">
			<a class="nav-link" href="index">메인</a>
		</li>
				
		<li class="nav-item">
			<a class="nav-link" href="#">핫플레이스</a>
		</li>
				
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			내 캐릭터 만들기
			</a>
			<div class="dropdown-menu">
        	<a class="dropdown-item" href="characterMaking">내 캐릭터 만들기</a>
        	<a class="dropdown-item" href="goodsIndex">굿즈</a>
        	<a class="dropdown-item" href="goodsList">굿즈(정경채)</a>
      		</div>
		</li>
		
		<!-- Dropdown -->				
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			커뮤니티
			</a>
			<div class="dropdown-menu">
        	<a class="dropdown-item" href="boardList">자유 게시판</a>
        	<a class="dropdown-item" href="#">여행지 게시판</a>
        	<a class="dropdown-item" href="${pageContext.request.contextPath}/list">테스트용 게시판</a>
      		</div>
		</li>
		
	</ul>
	
	</div>

<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
 	<ul class="navbar-nav"> 
	<div class="btn-group btn-group-sm">
	
<sec:authorize access="isAnonymous()"> <!-- isAnonumous: 누구나 다 access 할 수있다 -->
   		<a href="loginForm" class="btn btn-secondary" type="button">Login</a>
		<a href="joinForm" class="btn btn-secondary" type="button">Join</a> 
		<a href="http://google.com" class="btn btn-secondary" type="button">My Page</a>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
		<a class="btn btn-dark">환영합니다, <sec:authentication property="principal.user.nickname"/> 님!</a>
   		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
   			<input type="submit" class="btn btn-secondary btn-sm" value="Logout">
   		</form:form> 
		<a href="mypage" class="btn btn-secondary" type="button">My Page</a>
</sec:authorize>

	</div>

 	</ul>
</div>

</nav>

<p>
<div class="container">
<p align="center" class="display-3" id="disf">My Cart</p>
</div>

 	<!--  장바구니 전체체크 -->
	 <div class="container">
	  <div class="allCheck">
	   <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck"> 모두 선택</label> 
	  </div>
	  
	  <!--  장바구니에서 상품 선택 후 삭제 -->
	  <div class="delBtn">
	  <a href="goodsList" class="btn btn-dark" role="button">쇼핑 계속하기</a>
	   <button type="button" class="btn btn-dark selectDelete_btn" align="right">선택 삭제</button> 
	   
		<script>
			 $(".selectDelete_btn").click(function(){
			  var confirm_val = confirm("정말 삭제하시겠습니까?");
			  
			  if(confirm_val) {
			   var checkArr = new Array();
			   
			   $("input[class='chBox']:checked").each(function(){
			    checkArr.push($(this).attr("data-cartNum"));
			   });
			    
			   $.ajax({
			    url : "${pageContext.request.contextPath}/shop/cartList/deleteCart",
			    type : "post",
			    data : { chbox : checkArr },
			    success : function(result){
			    	
			    if(result == 1 ){	
			     location.href = "${pageContext.request.contextPath}/cartList";
			    } else {
			    	/* alert("삭제 실패"); */
			    	location.href = "${pageContext.request.contextPath}/cartList";
			    }

			     
			    }
			   });
			  } 
			 });
		</script>
	   
	  </div>
	  
	<script>
	$("#allCheck").click(function(){
	 var chk = $("#allCheck").prop("checked");
	 if(chk) {
	  $(".chBox").prop("checked", true);
	 } else {
	  $(".chBox").prop("checked", false);
	 }
	});
	</script>
	  
	</div> <br>

<div class="container">

		  <table class="table">

		    <tbody>
		    
		      <tr>
		        <td align="center">상품 정보</td>
		        <td>상품 금액</td>
		        <td>할인 금액</td>
		        <td>배송비</td>
		        <td>주문 금액</td>
		        

		      </tr>		    
		    
<c:set var="sum" value="0" />

<c:forEach items="${cartList}" var="cartList">	    
		      <tr>
		      	<td>
		      	
		      	<div class="container">
		      		<div class="row">
		      		

	<div class="checkBox">
   <input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" />
   
   <script>
	 $(".chBox").click(function(){
	  $("#allCheck").prop("checked", false);
	 });
	</script>
  </div>
  

		      		<div class="col-sm-3">
		      		
		      		<img src="${pageContext.request.contextPath}/${cartList.gdsImg}" class="mx-auto d-block" width="100">
		      		</div>
		      		
					<div class="col-sm-7">
		      		<h5>${cartList.gdsName}</h5>
		      		색상: ${cartList.gdsColor}  / 사이즈: ${cartList.gdsSize} / 수량: ${cartList.cartStock}개 <br>
		      		
					<div class="delete">
				     <button type="button" class="btn btn-secondary btn-sm delete_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}">삭제</button> <br>
						
						<script>
						  $(".delete_${cartList.cartNum}_btn").click(function(){
						   var confirm_val = confirm("정말 삭제하시겠습니까?");
						   
						   if(confirm_val) {
						    var checkArr = new Array();
						    
						    checkArr.push($(this).attr("data-cartNum"));
						               
						    $.ajax({
						     url : "${pageContext.request.contextPath}/shop/cartList/deleteCart",
						     type : "post",
						     data : { chbox : checkArr },
						     success : function(result){
						    	 
							    if(result == 1 ){	
								     location.href = "${pageContext.request.contextPath}/cartList";
								    } else {
								    	/* alert("삭제 실패"); */
								    	location.href = "${pageContext.request.contextPath}/cartList";
								    }
						      
						     }
						    });
						   } 
						  });
						 </script>
				     
				    </div>
		      		
		      		
		      		
		      		</div>
		      	
		      		</div>
		      	</div>
		      	
		      	</td>
		      
		        <td><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /> 원</td>
		        <td>0 원</td>
		        <td>무료 배송</td>
		        <td><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" /> 원</td> 
		      </tr>
  
  <c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
  </c:forEach>
		    </tbody>
		    
		  </table>
		  
		  
		<div class="listResult">
		 <div class="sum">
		  <h3 align="right">총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원</h3>
		 </div>
		 <div class="orderOpne">
<!-- 		  <button type="button" class="btn btn-dark orderOpne_bnt">주문하기</button> -->
		  
		<p align="center">
			<a href="goodsOrder" class="btn btn-dark btn-lg" role="button">주문하기</a>
			<a href="goodsList" class="btn btn-dark btn-lg" role="button">취소</a>
		</p>
		 </div>
		</div>
	
<%-- <div class="orderInfo">
	 <form role="form" method="post" autocomplete="off">
	    
	  <input type="hidden" name="amount" value="${sum}" />
	    
	  <div class="inputArea">
	   <label for="">수령인</label>
	   <input type="text" name="orderRec" id="orderRec" required="required" />
	  </div>
	  
	  <div class="inputArea">
	   <label for="orderPhon">수령인 연락처</label>
	   <input type="text" name="orderPhon" id="orderPhon" required="required" />
	  </div>
	  
	  <div class="inputArea">
	   <label for="userAddr1">우편번호</label>
	   <input type="text" name="userAddr1" id="userAddr1" required="required" />
	  </div>
	  
	  <div class="inputArea">
	   <label for="userAddr2">1차 주소</label>
	   <input type="text" name="userAddr2" id="userAddr2" required="required" />
	  </div>
	  
	  <div class="inputArea">
	   <label for="userAddr3">2차 주소</label>
	   <input type="text" name="userAddr3" id="userAddr3" required="required" />
	  </div>
	  
	  <div class="inputArea">
	   <button type="submit" class="order_btn">주문</button>
	   <button type="button" class="cancel_btn">취소</button> 
	  </div>
	  
	 </form> 
</div> --%>
	
	
</div>


<br><br>








	
	

</body>
</html>


