<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>STU ABOUT</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/font.css" type="text/css">
</head>

<style>
	
    .about{
       position:relative;
        background-image: url("img/about1.jpg");
        background-repeat: no repeat;
       
        border:none;
        height:1900px;
        margin-top:10%;
       
    }
    
    .content{
    	position:absolute;
        font-family: 'Montserrat', sans-serif;
        font-size: 50px;
        font-weight: bold;  
        z-index:2;
    }
    
    .aboutImg{
    	position:absolute;
    	z-index:2;
    }
    .about-cover{
    	position:absolute;
    	height:100%;
    	width:100%;
    	
    	background: linear-gradient(to top, rgba(255,255,255,1)  ,transparent, rgba(255,255,255,1) );
    	background-repeat: no repeat;
    	border:none;
    	
    	z-index:1;
    }
    
</style>

<body>
    <%@ include file="header.jsp" %>

    

    <!-- About Section Begin -->
    <section class="blog spad" >
      
            
            	 <div style="margin-top:5%; margin-left:5%;" >
            	 	 <div class="blog__item" style="text-align:center">
            	 	 <div class="blog__item__text">
            	 	 	<h1 style="font-weight: bold; font-size: 50px; ">About</h1>
            	 	 </div>
            	 	 </div>
            	 
            	</div>
            	<div style="margin-top:10%; margin-left:5%;" >
            	 	 <div class="blog__item" style="text-align:center">
            	 	 <div class="blog__item__text">
            	 	 	<h1 style="font-weight: bold; font-size: 60px; ">Star To Up !</h1>
            	 	 </div>
            	 	 </div>
            	 
            	</div>
            	<div style="margin-top:5%; margin-left:5%;" >
            	 	 <div class="blog__item" style="text-align:center">
            	 	 <div class="blog__item__text">
            	 	 	<h1 style="font-weight: bold; font-size: 60px; ">무엇을 상상하던 그 이상.</h1>
            	 	 </div>
            	 	 </div>
            	</div>
            	<div style="margin-top:5%; margin-left:5%;" >
            	 	 <div class="blog__item" style="text-align:center">
            	 	 <div class="blog__item__text">
            	 	 	<h1 style="font-weight: bold; font-size: 60px; display:inline;">별</h1>
            	 	 	<h1 style="font-weight: bold; font-size: 60px; color:#787878; display:inline;">을</h1>
            	 	 	<h1 style="font-weight: bold; font-size: 60px; display:inline; margin-left:20px;"> 소유</h1>
            	 	 	<h1 style="font-weight: bold; font-size: 60px; color:#787878; display:inline;">하세요.</h1>
            	 	 </div>
            	 	 </div>
            	</div>
            	<!-- margin-left:50%; margin-top:100%; -->
            	<div class="about">
            		<div class="content" style="margin-left:15%; margin-top:40%; text-align:right;">
            			<h1 style="color:white; font-weight:bold; ">지금,</h1>
            			<h1 style="color:black; font-weight:bold; ">Star to up</h1>
            			<h1 style="color:white; font-weight:bold; ">에서.</h1>
            		</div>
            		<div class="aboutImg" style="transform: translate(80%, 40%);">
            		    <img alt="행성이미지1" src="img/about2.png"> 
            		</div>
            		<div class="aboutImg" style="transform: translate(10%, 220%);">
            		    <img alt="행성이미지2" src="img/about3.png"> 
            		</div>
            		<div class="content" style="transform: translate(160%, 725%); text-align:left;">
            			<h1 style="color:white; font-weight:bold;">당신의 별에,</h1>
            			<h1 style="color:black; font-weight:bold; display:inline; ">펀딩</h1>
            			<h1 style="color:white; font-weight:bold; display:inline; ">하세요!</h1>
            		</div>
            		<div class="about-cover"></div>
            	</div>
            	<div style="margin-top:10%; margin-left:5%;" >
            	 	 <div class="blog__item" style="text-align:center">
            	 	 <div class="blog__item__text">
            	 	 	<h1 style="font-weight: bold; font-size: 70px; ">About Us</h1>
            	 	 </div>
            	 	 </div>
            	</div>
            	<div style="margin-top:5%; margin-left:5%;" >
            	 	 <div class="blog__item" style="text-align:center">
            	 	 <div class="blog__item__text">
            	 	 	<h1 style=" font-size: 45px; ">함께 협동하고, 맞춰가고,</h1>
            	 	 	<h1 style="font-size: 45px; ">발전하는 팀원들을 소개합니다.</h1>
            	 	 </div>
            	 	 </div>
            	</div>
		<div class="row" style="margin-left: 15%; margin-right: 15%;">
			<div class="col-lg-6 col-md-4 col-sm-6">
				<div style="display: flex; justify-content: center;">
					<img alt="재환" src="img/jae-hwan.png"
						style="width: 280px; height: 280px;">
				</div>
				<h3 style="text-align: center; font-weight: bold; margin-top: 5%;">이재환</h3>
				<h5 style="text-align: center; margin-top: 3%;">취미:음악,영화감상,게임</h5>
				<h5 style="text-align: center; margin-top: 3%;">성격:탐구하기를 즐김</h5>
			</div>
			<div class="col-lg-6 col-md-4 col-sm-6">
				<div style="display: flex; justify-content: center;">
					<img alt="소진" src="img/so-jin.png"
						style="width: 280px; height: 280px;">
				</div>
				<h3 style="text-align: center; font-weight: bold; margin-top: 5%;">남소진</h3>
				<h5 style="text-align: center; margin-top: 3%;">취미:퍼즐,산책,영화보기</h5>
				<h5 style="text-align: center; margin-top: 3%;">성격:친철하며 꼼꼼함</h5>
			</div>
			<div class="col-lg-6 col-md-4 col-sm-6" style="margin-top: 5%;">
				<div style="display: flex; justify-content: center;">
					<img alt="정연" src="img/jeong-yeon.png"
						style="width: 280px; height: 280px;">
				</div>
				<h3 style="text-align: center; font-weight: bold; margin-top: 5%;">허정연</h3>
				<h5 style="text-align: center; margin-top: 3%;">취미:노래,사진찍기,전시회</h5>
				<h5 style="text-align: center; margin-top: 3%;">성격:끼와 웃음이 많음</h5>

			</div>
			<div class="col-lg-6 col-md-4 col-sm-6" style="margin-top: 5%;">
				<div style="display: flex; justify-content: center;">
					<img alt="민경" src="img/min-gyeong.png"
						style="width: 280px; height: 280px;">
				</div>
				<h3 style="text-align: center; font-weight: bold; margin-top: 5%;">이민경</h3>
				<h5 style="text-align: center; margin-top: 3%;">취미:큐브,게임,퍼즐</h5>
				<h5 style="text-align: center; margin-top: 3%;">성격:장난끼가 많음</h5>
			</div>
			<div class="col-lg-6 col-md-4 col-sm-6" style="margin-top: 5%;">
				<div style="display: flex; justify-content: center;">
					<img alt="지원" src="img/ji-won.png"
						style="width: 280px; height: 280px;">
				</div>
				<h3 style="text-align: center; font-weight: bold; margin-top: 5%;">강지원</h3>
				<h5 style="text-align: center; margin-top: 3%;">취미:큐브,골프,음악감상</h5>
				<h5 style="text-align: center; margin-top: 3%;">성격:웃음이 많으며 계획적</h5>
			</div>
			<div class="col-lg-6 col-md-4 col-sm-6" style="margin-top: 5%;">
				<div style="display: flex; justify-content: center;">
					<img alt="재호" src="img/jae-ho.png"
						style="width: 280px; height: 280px;">
				</div>
				<h3 style="text-align: center; font-weight: bold; margin-top: 5%;">이재호</h3>
				<h5 style="text-align: center; margin-top: 3%;">취미:게임,소설,노래듣기</h5>
				<h5 style="text-align: center; margin-top: 3%;">성격:유연하며 때론 신중</h5>
			</div>

		</div>
		</section>
		
		<div>
		 <h1 style="font-size:21vw; font-weight:bold; margin-left:-6%;margin-top:10%; white-space:nowrap;  ">Star To Up</h1>
		</div>
		 <!-- About Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>    
    