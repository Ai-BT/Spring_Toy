<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 시큐리티 전용 태그 -->



<!DOCTYPE html>
<html lang="en">
<head>


</head>
<body>

<p>
<div class="container">
<p align="center" class="display-3" id="disf">Godds Register</p>
</div>


<div class="container">
  <h2>제품 등록(관리자 페이지)</h2> <br>

	<form role="form" method="post" autocomplete="off">
	
	<div class="row">
	
		
		<div class="col-sm-6">
		
		<label for="category1">1차 분류:</label>
		<select class="form-control category1" id="sel1" name="selDistrict">
		<option>전체</option>
		</select>
		
		</div>
		
		<div class="col-sm-6">
		
		<label for="category1">2차 분류:</label>
		<select class="form-control category2" id="sel1" name="cateCode">
		<option value="101">전체</option>
		</select>
		
		</div>
			 
		<div class="col-sm-6">

    	<div class="form-group">
    	<label for="gdsImg">상품 이미지 (목록 노출):</label>
    	<input type="text" class="form-control" id="gdsImg" placeholder="" value="goods/t-shirts.png" name="gdsImg">
    	</div>
    	
    	</div>

		<div class="col-sm-6">
		
    	<div class="form-group">
		<label for="gdsName">상품명 (목록 노출):</label>
      	<input type="text" class="form-control" id="gdsName" placeholder="" value="T-shirts" name="gdsName">
    	</div>
    	
    	
    	</div>
    	
    	
    	<div class="col-sm-6">
    	
    	<div class="form-group">
    	<label for="gdsPrice">가격:</label>
    	<input type="text" class="form-control" id="gdsPrice" placeholder="" value="15000" name="gdsPrice">
    	</div>
    	
    	
    	</div>
    	
    	<div class="col-sm-6">
	    	<div class="form-group">
	    	<label for="gdsStock">상품 수량:</label>
	    	<input type="text" class="form-control" id="gdsStock" placeholder="" value="50" name="gdsStock">
	    	</div>
    	</div>
    	
    	<div class="col-sm-12">
    	
    	<div class="form-group">
	      <label for="gdsDes">상품 소개 (목록 노출):</label>
	      <textarea class="form-control" rows="10" id="gdsDes" name="gdsDes" placeholder="스타일과 편안함을 모두 갖춘 프리미엄 원단 100% 티셔츠">스타일과 편안함을 모두 갖춘 프리미엄 원단 100% 티셔츠</textarea>
    	</div>
    	
    	<p align="center"><button type="submit" id="register_Btn" class="btn btn-dark">등록</button> 
		<a href="${pageContext.request.contextPath}/goodsList" class="btn btn-dark" role="button" onclick="return confirm('목록으로 돌아가겠습니까?');">취소</a></p>
	
    	</div>
    	

	

	</div> <!-- row end -->
	
	</form>
	
</div>
	
	<!-- Json 으로 컨트롤러 호출하여 카테고리 불러오기  -->
    	
	<script>
		// 컨트롤러에서 데이터 받기
		var jsonData = JSON.parse('${category}');
	
		// 필요한 배열과 오브젝트 변수 생성
		var cate1Arr = new Array();
		var cate1Obj = new Object();
	
		// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < jsonData.length; i++) {
			
			if(jsonData[i].level == "1") {  // 레벨이 1인 데이터가 있다면 
				cate1Obj = new Object();  // 초기화
				
				// cate1Obj에 cateCode와 cateName를 저장
				cate1Obj.cateCode = jsonData[i].cateCode; 
				cate1Obj.cateName = jsonData[i].cateName;
				
				// cate1Obj에 저장된 값을 cate1Arr 배열에 저장
				cate1Arr.push(cate1Obj);
			}
		}
		
		// 1차 분류 셀렉트 박스에 데이터 삽입
		var cate1Select = $("select.category1")

		for(var i = 0; i < cate1Arr.length; i++) {

			// cate1Arr에 저장된 값을 cate1Select에 추가
			cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
								+ cate1Arr[i].cateName + "</option>");	
		}
		
		
		$(document).on("change", "select.category1", function(){

			 var cate2Arr = new Array();
			 var cate2Obj = new Object();
			 
			 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
			 for(var i = 0; i < jsonData.length; i++) {
			  
			  if(jsonData[i].level == "2") {
			   cate2Obj = new Object();  //초기화
			   cate2Obj.cateCode = jsonData[i].cateCode;
			   cate2Obj.cateName = jsonData[i].cateName;
			   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
			   
			   cate2Arr.push(cate2Obj);
			  }
			 }
			 
			 var cate2Select = $("select.category2");
			 
			 /*
			 for(var i = 0; i < cate2Arr.length; i++) {
			   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
			        + cate2Arr[i].cateName + "</option>");
			 }
			 */
			 
			 cate2Select.children().remove();

			 $("option:selected", this).each(function(){
			  
			  var selectVal = $(this).val();  
			  cate2Select.append("<option value='" + selectVal + "'>전체</option>");
			  
			  for(var i = 0; i < cate2Arr.length; i++) {
			   if(selectVal == cate2Arr[i].cateCodeRef) {
			    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
			         + cate2Arr[i].cateName + "</option>");
			   }
			  }
			  
			 });
			 
			});
		
		
		
	</script>



</body>
</html>