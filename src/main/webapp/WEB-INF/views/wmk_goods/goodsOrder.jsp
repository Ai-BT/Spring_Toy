<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 시큐리티 전용 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title></title>


</head>

<body>



<p>
<div class="container">
<p align="center" class="display-3" id="disf">Goods Order</p>
</div>


	
	<div class="container">
		<c:if test="${profileImg eq null || profileImg eq '' }">
			<img class="mx-auto d-block" src="goods/avatar_null.png" width="150" /><br>
		</c:if>
		<c:if test="${profileImg ne null && profileImg ne '' }">
			<img class="mx-auto d-block" src="/filePath/${profileImg.imgName}" width="150" /><br>
		</c:if>
		
		<h3 align="center"> <sec:authentication property="principal.user.nickname"/> 님의 상품주문을 진행합니다.</h3>
		<p align="center">배송지 정보를 빠짐없이 입력해주세요.</p>
		
		<hr>
		
		<br>

	</div>
	



<div class="container" style="display:none">
			<h5><strong>주문상품 정보</strong></h5>
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
			 
		</div>
		

 </div>
 
 <div class="container">
		
		<br>
		
		<h5><strong>배송지 정보</strong></h5>
		
		<form role="form" method="post" autocomplete="off">
		
		  <table class="table">

		    <tbody>
		    
		      <tr>
		        <td>회원 ID</td>
		        <td><sec:authentication property="principal.user.id"/></td>

		      </tr>		    
		    
		    
		      <tr>
		        <td>주문자 (입금자명)</td>
		        <td><input class="form-control" type="text" name="orderRec" id="orderRec" required="required"></td>

		      </tr>
		      <tr>
		        <td>연락처</td>
		        <td><input class="form-control" type="text" name="orderPhon" id="orderPhon" required="required"></td>

		      </tr>
		      <tr>
		        <td>주소</td>
		        <td><input class="form-control" type="text" name="userAddr1" id="userAddr1" required="required"></td>

		      </tr>
		      
				<tr>
		        <td>배송메모</td>
		        <td><input type="text" class="form-control" id="adress" name="adress" placeholder="예: 부재시 경비실에 맡겨주세요."></td>

		      </tr>
		      
		    </tbody>
		  </table>
		  <input type="hidden" name="amount" value="${sum}" />
		  <input type="hidden" name="userAddr2" value="2차 주소" />
		  <input type="hidden" name="userAddr3" value="3차 주소" />
		  
			<br>
			 
<%-- 		<div class="inputArea">
			   <button type="submit" class="order_btn">주문</button>
			   <button type="button" class="cancel_btn">취소</button> 
  		</div>
			
			</form> --%>
<!-- </div>  -->




<!-- <div class="container"> -->
			<h5><strong>주문상품 정보</strong></h5>
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
		      		
		      		<div class="col-sm-3">
		      		
		      		<img src="${pageContext.request.contextPath}/${cartList.gdsImg}" class="mx-auto d-block" width="100">
		      		</div>
		      		
					<div class="col-sm-7">
		      		<h5>${cartList.gdsName}</h5>
		      		색상: ${cartList.gdsColor}  / 사이즈: ${cartList.gdsSize} / 수량: ${cartList.cartStock}개 <br>
		      		     		
		      		
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
		  
		  
<%-- 		<div class="listResult">
		
			 <div class="sum">
			  <h3 align="right">총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원</h3>
			 </div>
			 
		</div> --%>
		
		<br>
		<h5><strong>결제방법 선택</strong></h5>
		  <table class="table">

		    <tbody>
		    
		      <tr>
		        <td>결제수단 선택</td>
		        
		        <td>
			    <div class="form-check-inline">
			      <label class="form-check-label" for="radio1">
			        <input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>계좌이체
			      </label>
			    </div>
			    <div class="form-check-inline">
			      <label class="form-check-label" for="radio2">
			        <input type="radio" class="form-check-input" id="radio2" name="optradio" value="option2" disabled>무통장 입금
			      </label>
			    </div>
			    <div class="form-check-inline">
			      <label class="form-check-label">
			        <input type="radio" class="form-check-input" disabled>핸드폰 결제
			      </label>
			    </div>
		        </td>
		        
		      </tr>
		      
		      <tr>
		      	<td>계좌 정보</td>
		      	<td>1002 - 939 - 864616 (우리은행, 정경채)</td>
		      
		      </tr>		    
		      
		    </tbody>
		    
		  </table>
		
		
		<div class="inputArea">
			<p align="center">
			   <button type="submit" class="btn btn-dark btn-lg">확인</button>
			   <a href="goodsList" class="btn btn-dark btn-lg" role="button">취소</a>
			</p>
  		</div>  		
			
			</form> <!-- goodsOrder post form end -->
				 <div class="sum">
			<h3 align="right" class="text-info"><strong>할인금액 : 0 원</strong></h3>
			  <h3 align="right"><strong>총 결제금액 : <fmt:formatNumber pattern="###,###,###" value="${sum}" /> 원</strong></h3>
			 </div>
</div> <!--  container end  -->


<br><br>



</body>
</html>


