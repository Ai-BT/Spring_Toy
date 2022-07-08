<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 시큐리티 전용 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	
	
<body>


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
			<a href="javascript:history.back();" class="btn btn-dark btn-lg" role="button">취소</a>
			
		</p>
		 </div>
		</div>

	
</div>


<br><br>
	

</body>



