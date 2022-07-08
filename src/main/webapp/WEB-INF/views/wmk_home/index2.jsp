<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<style>
header {
  position: relative;
  background-color: black;
  height:40vh;
  min-height: 20rem;
  width: 100%;
  overflow: hidden;
}

header video {
  position: absolute;
  top: 50%;
  left: 50%;
  min-width: 100%;
  min-height: 100%;
  width: auto;
  height: auto;
  z-index: 0;
  -ms-transform: translateX(-50%) translateY(-50%);
  -moz-transform: translateX(-50%) translateY(-50%);
  -webkit-transform: translateX(-50%) translateY(-50%);
  transform: translateX(-50%) translateY(-50%);
}

header .container {
  position: relative;
  z-index: 2;
}

header .overlay {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  background-color: black;
  opacity: 0.2;
  z-index: 1;
}

@media (pointer: coarse) and (hover: none) {
  header {
    background: url('img/main_carousel_2.jpg') black no-repeat center center scroll;
  }
  header video {
    display: none;
  }
}

</style>	
	
	

  
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
	
	.img-container{
	position:relative;

	/*  display:table; */
	}
	.img-container img{
	/* display:block; */
	isplay: table-cell;
	text-align: center;
 	}
	.img-container .overlay{
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgb(0,0,0);
	  opacity:0;
	  transition:opacity 500ms ease-in-out;
	}
	.img-container:hover .overlay{
	  opacity:60%;
	}
	.overlay span{
	  position:absolute;
	  top:50%;
	  left:50%;
	  transform:translate(-50%,-50%);
	  color:#fff;
	}
		
	</style>
	
	<style>

		#px {
			font-size: 20px;
		}

	</style>



<header>
	<div class="overlay"></div>
	<video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
		<!--     <source src="https://storage.googleapis.com/coverr-main/mp4/Mt_Baker.mp4" type="video/mp4"> -->

		<source src="img/M2.mp4" type="video/mp4">

	</video>
	<div class="container h-100">
		<div class="d-flex h-100 text-center align-items-center">
			<div class="w-100 text-white">
				<h1 class="display-3">Wemade Korea</h1>
				<p class="lead mb-0">Wherever you go, go with all your heart.</p>
			</div>
		</div>
	</div>
</header>


<p>
<div class="container">
	<p align="center" class="display-3" id="disf">City Display</p>
</div>
<br>

<p align="center"> <span id="px">(Seoul·Gyeonggi·Incheon)</span>
<br>love

</p>




<div class="container" id="district">
	<div class="row">

		<div class="col-sm-4">

			<div class="img-container"
				onclick="location.href='review_boardList?rArea=서울·경기·인천'">
				<p align="center">
					<a href="review_boardList?rArea='서울·경기·인천'"><img
						src="img/seoul1.jpg"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
				<div class="overlay">
					<span><h5>자세히 보기</h5></span>
				</div>
			</div>


 			<p align="center">
 								<a href="review_boardList?rArea='서울·경기·인천'"><img
						src="img/seoul_intro.png"
						class="img-fluid mx-auto d-block" width="250px"
						height="300px"></a> <br>
				서울특별시를 중심으로 하는 대한민국의 대표 수도권 도시
			</p>

		</div>


		<div class="col-sm-4">
			<div class="img-container"
				onclick="location.href='review_boardList?rArea=강원도'">
				<p align="center">
					<a href="review_boardList?rArea='강원도'"><img src="img/gang1.jpg"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
				<div class="overlay">
					<span><h5>자세히 보기</h5></span>
				</div>
			</div>


			<h4 align="center">
				<a href="review_boardList?rArea='강원도'" style="color: black">강원도 (Gangwon)</a>
			</h4>
			<p align="center"><!-- (Gangwon) <br> -->
			새밝의 예나라 정든 내 고장<br>아침 해 먼저 받은 우리 강원도</p>
			
			
			</p>
			<br>
		</div>


		<div class="col-sm-4">

			<div class="img-container"
				onclick="location.href='review_boardList?rArea=충청북도'">
				<p align="center">
					<a href="review_boardList?rArea='충청북도 '"><img src="img/cb.png"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
				<div class="overlay">
					<span><h5>자세히 보기</h5></span>
				</div>
			</div>

			<h4 align="center">
				<a href="review_boardList?rArea='충청북도'" style="color: black">충청북도</a>
			</h4>
			<p align="center">(Chung-cheong bukdo)</p>
			<br>
		</div>


		<div class="col-sm-4">
			<div class="img-container"
				onclick="location.href='review_boardList?rArea=충청남도'">
				<p align="center">
					<a href="review_boardList?rArea='충청남도'"><img src="img/ss1.png"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
					<!-- img-fluid -->
				<div class="overlay">
					<span><h5>자세히 보기</h5></span>
				</div>
			</div>


			<h4 align="center">
				<a href="review_boardList?rArea='충청남도'" style="color: black">충청남도</a>
			</h4>
			<p align="center">(Chungcheongnam-do)</p>
			<br>
		</div>

		<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Second Line >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->

		<div class="col-sm-4">
			<div class="img-container"
				onclick="location.href='review_boardList?rArea=경상북도'">
				<p align="center">
					<a href="review_boardList?rArea='경상북도 '"><img src="img/GJ.jpg"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
				<div class="overlay">
					<span><h5>자세히 보기</h5></span>
				</div>

			</div>

			<h4 align="center">
				<a href="review_boardList?rArea='경상북도'" style="color: black">경상북도</a>
			</h4>
			<p align="center">(Gyeongsangbuk-do)</p>
			<br>
		</div>





		<div class="col-sm-4">
			<div class="img-container"
				onclick="location.href='review_boardList?rArea=경상남도'">
				<p align="center">
					<a href="review_boardList?rArea='경상남도 '"><img
						src="img/tongyoun.jpg"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
					<!-- img-fluid -->
				<div class="overlay">
					<span><h5>자세히 보기</h5></span>
				</div>

			</div>
			<h4 align="center">
				<a href="review_boardList?rArea='서울 ·경기·인천'" style="color: black">경상남도</a>
			</h4>
			<p align="center">(Gyeongsangnam-do)</p>
			<br>
		</div>

		<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Third Line >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->

		<div class="col-sm-4">
			<div class="img-container"
				onclick="location.href='review_boardList?rArea=전라북도'">
				<p align="center">
					<a href="review_boardList?rArea='전라북도'"><img
						src="img/gunsan.jpg"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
				<div class="overlay">
					<span><h5>자세히 보기</h5></span>
				</div>
			</div>
			<h4 align="center">
				<a href="review_boardList?rArea='전라북도'" style="color: black">전라북도</a>
			</h4>
			<p align="center">(Jeollabuk do)</p>
			<br>
		</div>


		<div class="col-sm-4">
			<div class="img-container"
				onclick="location.href='review_boardList?rArea=전라남도'">
				<p align="center">
					<a href="review_boardList?rArea='전라남도'"><img src="img/JN.jpg"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
				<div class="overlay">
					<span><h5>자세히 보기</h5></span>
				</div>
			</div>
			<h4 align="center">
				<a href="review_boardList?rArea='전라남도'" style="color: black">전라남도</a>
			</h4>
			<p align="center">(Jeollanam do)</p>
			<br>
		</div>


		<div class="col-sm-4">
			<div class="img-container"
				onclick="location.href='review_boardList?rArea=제주도'">
				<p align="center">
					<a href="review_boardList?rArea='제주도'"><img src="img/jeju.png"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
					<!-- img-fluid -->
				<div class="overlay">
					<span><h5>자세히 보기</h5></span>
				</div>
			</div>
			<h4 align="center">
				<a href="review_boardList?rArea='제주도'" style="color: black">제주도</a>
			</h4>
			<p align="center">(Jeju do)</p>
			<br>
		</div>


	</div>
</div>

