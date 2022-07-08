<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 시큐리티 전용 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="en">

<head>

		

</head>

<body>
	


<p>
	<p align="center" class="display-3" id="login_f">My Order View</p>

	<div class="container">
	<img class="mx-auto d-block" src="goods/profile.png" width="150"><br>
	<h3 align="center"> <sec:authentication property="principal.user.nickname"/> 님의 주문상세내역입니다.</h3>
	
	</div>
	<br>
	
	<div class="container">
		
 
		<div class="row">
		
			<div class="col-sm-3">
	
			</div>
			
			<div class="col-sm-8">
			
			</div>
		
		
		
		</div>
	
	</div>

<div class="container">

<h5><strong>배송지 정보</strong></h5>
  <table class="table">
  	<tbody>
  	
  	<tr align="center">
  		<td>수령인</td>
  		<td>주소</td>
  		<td>연락처</td>
  		<td>총 결제금액</td>
  	
  	</tr>
  	
  	  <c:forEach items="${orderView}" var="orderView" varStatus="status">
  	 	 <c:if test="${status.first}">
  	 <tr align="center">
  		<td>${orderView.orderRec}</td>
  		<td>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}</td>
  		<td>${orderView.orderPhon}</td>
  		<td><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</td>
  	
  	</tr>
  		</c:if>
  	  </c:forEach>
  	
  	
  	</tbody>
  
  </table>

	
</div>

<div class="container">

			<h5><strong>주문상품 정보</strong></h5>
		  <table class="table">

		    <tbody>
		    
		      <tr align="center">
		        <td>상품 정보</td>
		        <td>상품 금액</td>
		        <td>할인 금액</td>
		        <td>배송비</td>
		        <td>주문 금액</td>
		        

		      </tr>		    
		    
			<c:set var="sum" value="0" />
			
			<c:forEach items="${orderView}" var="orderView">      
					      <tr>
					      	<td>
					      	
					      	<div class="container">
					      		<div class="row">
					      		
					      		<div class="col-sm-3">
					      		
					      		<img src="${orderView.gdsImg}" class="mx-auto d-block" width="100">
					      		</div>
					      		
								<div class="col-sm-7">
					      		<h5>${orderView.gdsName}</h5>
					      		색상: ${cartList.gdsColor}  / 사이즈: ${cartList.gdsSize} / 수량: ${orderView.cartStock}개 <br>
					      		     		
					      		
					      		</div>
					      	
					      		</div>
					      	</div>
					      	
					      	</td>
					      
					        <td><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}" /> 원</td>
					        <td>0 원</td>
					        <td>무료 배송</td>
					        <td><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}" /> 원</td> 
					      </tr>
			  
			  <c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
			  </c:forEach>
					    </tbody>
					    
					  </table>
					  
	</div>
	

</body>
</html>
