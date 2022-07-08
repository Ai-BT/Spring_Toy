<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 시큐리티 전용 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html lang="en">
<head>

   
   <!-- Banner style tag -->
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
   
   <style>
    section.replyForm { padding:30px 0; }
    section.replyForm div.input_area { margin:10px 0; }
    section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px; }
    section.replyForm button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
    
    section.replyList { padding:30px 0; }
    section.replyList ol { padding:0; margin:0; }
    section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
    section.replyList div.userInfo { }
    section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
    section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
    section.replyList div.replyContent { padding:10px; margin:20px 0; }
    
    section.replyList div#replyFooter button { font-size:14px; border: 1px solid #999; background:none; margin-right:10px; }
   </style>



  <script> 
  //댓글 리스트, 삭제
  function replyList() {
    var fBoard_Num = ${contentView.fBoard_Num};
    $.getJSON("${pageContext.request.contextPath}/free_board/replyList" + "?n=" + fBoard_Num, function(data){
     var str = "";
     
     $(data).each(function(){
      
      console.log(data);
      
      var repDate = new Date(this.repDate);
      repDate = repDate.toLocaleDateString("ko-US")
      
      
      str += "<div class='container' id='comment_view'>"
         + "<div class='row'>"
         + "<div class='col-md-1' align='right'>"
         + "<img src='/filePath/${profileImg.imgName}' width='60'/>"
         + "</div>" 
         + "<div class='col-md-11'>"
        + "<div class='userInfo' id='replyFooter'>"
        + "<span class='id'>" + "<strong>" + this.id + "</strong>" + "</span>"
        + "<span class='date'>" + repDate + "</span>"
        +  "&nbsp;" + "<button type='button' class='delete' data-repNum='" + this.repNum + "'>삭제</button>"
        + "</div>" //userInfro End
        + this.repCon
        + "</div>"
         + "</div>"
         + "</div>" + "<hr>"
         + "</div>" //row end 
        
     });
     
     $("section.replyList ol").html(str);
    });
  }
   </script>
   


</head>

   <script type="text/javascript">
      $(document).ready(function(){
         
         //댓글작성
         $(".replyWriteBtn").on("click", function(){
              var formObj = $("form[name='replyForm']");
              formObj.attr("action", "replyWrite");
              formObj.submit();
         });      
      })
   </script>



<body>


<p>
<div class="container">

   <p align="center" class="display-3" id="disf">Community</p>
   
</div>

<div class="container" id="free_board">

     <h2>자유게시판</h2> <br>
     
</div>  


<div class="container" >    
    <!-- 게시글 내용 부분 -->
   <table class="table">
       <thead>
      <tr>
         <th>제목: ${contentView.fTitle}</th>
      </tr>
       </thead>
   
       <tbody>
         <tr>
           <td>
           <p><span class="badge badge-pill badge-secondary">No</span> ${contentView.fBoard_Num}
           <span class="badge badge-pill badge-secondary">조회수</span> ${contentView.fHit}
           </p>
           
         <div class="card">
            <div class="card-body">
                 <div class="row">
                    <div class="col-md-2">
                    	<c:if test="${profileImg.imgName eq null || profileImg.imgName eq '' }">
							<img class="mx-auto d-block" src="img/avatar2.jpg" width="150" />
						</c:if>
						<c:if test="${profileImg.imgName ne null && profileImg.imgName ne '' }">
							<img class="mx-auto d-block" src="/filePath/${profileImg.imgName}" width="150" />
						</c:if>
                     </div>
                  
                      <div class="col-md-10">
                         <span class="badge badge-pill badge-secondary">작성자</span> ${contentView.fId} <br>
                     <span class="badge badge-pill badge-secondary">내용</span><br>
                     <p>${contentView.fContent}</p>
                     <br><p align="right">
                     <p class="text-dark" align="right"><fmt:formatDate value="${contentView.fDate}" pattern="yyyy-MM-dd"/></p>   
                  </div>
                    </div>   
            </div>   
         </div>
           
           </td>
         </tr>
       </tbody>
   </table>
     
     <!-- <hr> -->
    
   <p align="right">
    
    
    <sec:authorize access="isAuthenticated()">
	        <button type="button" class="modifyCheck btn btn-outline-dark btn-sm" data-modify_Num="${contentView.fBoard_Num}">수정</button> 
    </sec:authorize>
 		<button type="button" class="boardDelete btn btn-outline-dark btn-sm" data-fBoard_Num="${contentView.fBoard_Num}">삭제</button>
  	
   </p>
   
   <hr> 
</div>



<!-- 댓글 작성 -->

<div class="container" id="reply">



  <form:form role="form" method="post">
     <input type="hidden" name="fBoard_Num" id="fBoard_Num" value="${contentView.fBoard_Num}">
     
   <div class="input_area">
   <label for="Content">댓글:</label>
      <textarea class="form-control" rows="5" id="repCon" name="repCon"></textarea>
   </div>
   
   <div class="input_area">
   <sec:authorize access="isAnonymous()">
         <br>
         <p align="right"><button type="button" class="btn btn-outline-dark btn-sm" id="reply_btn" onclick="return confirm('로그인시 작성 가능합니다.');">등록</button></p>
   </sec:authorize>
   
   <sec:authorize access="isAuthenticated()">
         <br>   
      <p align="right"><button type="button" class="btn btn-outline-dark btn-sm" id="reply_btn">등록</button></p>
   </sec:authorize>
   
   
         
       <script>
       $("#reply_btn").click(function(){
        
        var formObj = $(".replyForm form[role='form']");
        var fBoard_Num = $("#fBoard_Num").val();
        var repCon = $("#repCon").val()
        
        var data = {
         fBoard_Num : fBoard_Num,
          repCon : repCon
          };
        
        $.ajax({
         url : "${pageContext.request.contextPath}/free_board/registReply",
         type : "post",
         data : data,
         success : function(){
            console.log(data);
          replyList();
          $("#repCon").val("");
         }
        });
       });
      </script>
    
   </div>
   
  </form:form>


<section class="replyList">
 <ol>
  <!--댓글 리스트  -->
   
 </ol>    
  
  
   <script> 
      replyList() 
   </script>
   
   <script>
   //댓글 삭제
        $(document).on("click", ".delete", function(){
        
        var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
          
        if(deleteConfirm){
        
        var data = {repNum : $(this).attr("data-repNum")};
        
        $.ajax({
           url : "${pageContext.request.contextPath}/free_board/deleteReply",
           type : "delete",
           data : data,
           success : function(result){
            
            console.log(result);
              
            if(result == 1) {
             replyList();
            }
            
            if(result == 0) {
             alert("작성자 본인만 할 수 있습니다.");    
            }
           },
           error : function(){
        	 alert("로그인이 필요합니다.")
             window.location.href = "${pageContext.request.contextPath}/loginForm";
           }
         });
      }
   });
   </script>
   
   
   <script>
      //게시판 삭제
      
      $(document).on("click", ".boardDelete", function(){
        
        var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
      
        if(deleteConfirm){
           
           var data = {fBoard_Num : $(this).attr("data-fBoard_Num")};
           
           
           $.ajax({
              url : "${pageContext.request.contextPath}/free_board/delete",
              type : "delete",
              data : data,
              success : function(result){
               
               console.log("result: " + result);
               
               console.log("data: " + data);
               
               if(result == 1) {
                 window.location.href = "${pageContext.request.contextPath}/free_board/boardList";
               }
               
               if(result == 0) {
                alert("작성자 본인만 삭제 할 수 있습니다.");    
               }
              },
              error : function(){
            	alert("로그인이 필요합니다.")
                window.location.href = "${pageContext.request.contextPath}/loginForm";
              }
            });
           }
      });
      
      </script>
      
      
 <script>
      //게시판 수정
      
      $(document).on("click", ".modifyCheck", function(){
        
        var modifyConfirm = confirm("정말로 수정하시겠습니까?");
      
        if(modifyConfirm){
           
           var data = {fBoard_Num : $(this).attr("data-modify_Num")};
           //modifyView?fBoard_Num=${contentView.fBoard_Num}
           
           $.ajax({
              url : "${pageContext.request.contextPath}/free_board/modifyIdCheck",
              type : "get",
              data : data,
              success : function(result){
               
               console.log("result: " + result);
               
               console.log("data: " + data);
               
               if(result == 1) {
                 window.location.href = "${pageContext.request.contextPath}/free_board/modifyView?fBoard_Num=${contentView.fBoard_Num}";
               }
               
               if(result == 0) {
                alert("작성자 본인만 수정 할 수 있습니다.");    
               }
              },
              error : function(){
            	alert("로그인이 필요합니다.")
                window.location.href = "${pageContext.request.contextPath}/loginForm";
              }
            });
           }
      });
      
  </script>

      
      
      
               
   
</section>

<p align="right">
<a href="writeView" class="btn btn-dark" role="button">글 작성</a>
<a href="boardList" class="btn btn-dark" role="button">목록</a>
</p>
<br>
</div>



</body>
</html>