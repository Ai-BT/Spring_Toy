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

	<style type="text/css">
	
	 #no-drag {
 
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none; 
	user-select:none;
	} 
	   
	</style>



<header>
	<div class="overlay"></div>
	<video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
		<!--     <source src="https://storage.googleapis.com/coverr-main/mp4/Mt_Baker.mp4" type="video/mp4"> -->

		<source src="img/M2.mp4" type="video/mp4">

	</video>
	<div class="container h-100" id="no-drag">
		<div class="d-flex h-100 text-center align-items-center">
			<div class="w-100 text-white">
				<h1 class="display-3">Wemade Korea</h1>
				<p class="lead mb-0">Wherever you go, go with all your heart.</p>
			</div>
		</div>
	</div>
</header>


<p>
<div class="container" id="no-drag">
	<p align="center" class="display-3" id="disf">City Display</p>
</div>
<br>

<div class="container" id="no-drag">
	<div class="row">

		<div class="col-sm-4">

			<div class="img-container"
				onclick="location.href='review_boardList?rArea=??????????????????????'">
				<p align="center">
					<a href="review_boardList?rArea='??????????????????????'"><img
						src="img/seoul1.jpg"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
				<div class="overlay">
					<span><h5>????????? ??????</h5></span>
				</div>
			</div>


 			<p align="center">
 			
			<a href="review_boardList?rArea='??????????????????????'"><img
			src="img/seoul_intro.png"
			class="img-fluid mx-auto d-block" width="280px" height="300px"></a>
			
			</p>
		</div>


		<div class="col-sm-4">
			<div class="img-container"
				onclick="location.href='review_boardList?rArea=?????????'">
				<p align="center">
					<a href="review_boardList?rArea='?????????'"><img src="img/gang1.jpg"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
				<div class="overlay">
					<span><h5>????????? ??????</h5></span>
				</div>
			</div>


			<p align="center">
			
			<a href="review_boardList?rArea='?????????'"><img
			src="img/gangwon_intro.png"
			class="img-fluid mx-auto d-block" width="280px" height="300px"></a>

			</p>
			
		</div>


		<div class="col-sm-4">

			<div class="img-container"
				onclick="location.href='review_boardList?rArea=????????????'">
				<p align="center">
					<a href="review_boardList?rArea='???????????? '"><img src="img/cb.png"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
				<div class="overlay">
					<span><h5>????????? ??????</h5></span>
				</div>
			</div>
			
			<p align="center">
			
			<a href="review_boardList?rArea='????????????'"><img
			src="img/chung-cheong_bukdo_intro.png"
			class="img-fluid mx-auto d-block" width="280px" height="300px"></a>

			</p>
			
		</div>


		<div class="col-sm-4">
			<div class="img-container"
				onclick="location.href='review_boardList?rArea=????????????'">
				<p align="center">
					<a href="review_boardList?rArea='????????????'"><img src="img/ss1.png"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
					<!-- img-fluid -->
				<div class="overlay">
					<span><h5>????????? ??????</h5></span>
				</div>
			</div>


			<p align="center">
			
			<a href="review_boardList?rArea='????????????'"><img
			src="img/chung-cheong_namdo_intro.png"
			class="img-fluid mx-auto d-block" width="280px" height="300px"></a>

			</p>
		</div>

		<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Second Line >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->

		<div class="col-sm-4">
			<div class="img-container"
				onclick="location.href='review_boardList?rArea=????????????'">
				<p align="center">
					<a href="review_boardList?rArea='???????????? '"><img src="img/GJ.jpg"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
				<div class="overlay">
					<span><h5>????????? ??????</h5></span>
				</div>

			</div>

			<p align="center">
			
			<a href="review_boardList?rArea='????????????'"><img
			src="img/gyeongsangbuk-do_intro.png"
			class="img-fluid mx-auto d-block" width="280px" height="300px"></a>

			</p>
		</div>





		<div class="col-sm-4">
			<div class="img-container"
				onclick="location.href='review_boardList?rArea=????????????'">
				<p align="center">
					<a href="review_boardList?rArea='???????????? '"><img
						src="img/tongyoun.jpg"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
					<!-- img-fluid -->
				<div class="overlay">
					<span><h5>????????? ??????</h5></span>
				</div>



			</div>

			<p align="center">
			
			<a href="review_boardList?rArea='????????????'"><img
			src="img/gyeongsangnam-do_intro.png"
			class="img-fluid mx-auto d-block" width="280px" height="300px"></a>

			</p>


		</div>

		<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Third Line >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->

		<div class="col-sm-4">
			<div class="img-container"
				onclick="location.href='review_boardList?rArea=????????????'">
				<p align="center">
					<a href="review_boardList?rArea='????????????'"><img
						src="img/gunsan.jpg"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
				<div class="overlay">
					<span><h5>????????? ??????</h5></span>
				</div>
			</div>
			
			
			
			<p align="center">
			
			<a href="review_boardList?rArea='????????????'"><img
			src="img/Jeollabuk do_intro.png"
			class="img-fluid mx-auto d-block" width="280px" height="300px"></a>

			</p>
		</div>


		<div class="col-sm-4">
			<div class="img-container"
				onclick="location.href='review_boardList?rArea=????????????'">
				<p align="center">
					<a href="review_boardList?rArea='????????????'"><img src="img/JN.jpg"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
				<div class="overlay">
					<span><h5>????????? ??????</h5></span>
				</div>
			</div>
			
			
			
			
			<p align="center">
			
			<a href="review_boardList?rArea='????????????'"><img
			src="img/Jeollanam_do_intro.png"
			class="img-fluid mx-auto d-block" width="280px" height="300px"></a>

			</p>
			
			
		</div>


		<div class="col-sm-4">
			<div class="img-container"
				onclick="location.href='review_boardList?rArea=?????????'">
				<p align="center">
					<a href="review_boardList?rArea='?????????'"><img src="img/jeju.png"
						class="img-fluid mx-auto d-block img-thumbnail" width="400px"
						height="300px"></a>
				</p>
				<p>
					<!-- img-fluid -->
				<div class="overlay">
					<span><h5>????????? ??????</h5></span>
				</div>
			</div>
			
			
			<p align="center">
			
			<a href="review_boardList?rArea='?????????'"><img
			src="img/jeju_intro.png"
			class="img-fluid mx-auto d-block" width="280px" height="300px"></a>

			</p>
		</div>


	</div>
</div>
<br><br>
