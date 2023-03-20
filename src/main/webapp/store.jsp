<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>STU STORE</title>
<!-- 파비콘 삽입 -->
<link rel="icon" href="img/StarToUp_Logo.png">

<!-- Google Font -->
<!--<link rel="stylesheet" href="css/font.css" type="text/css">-->
<link
	href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/swipe.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body style="background: #F5F5F7;">
	<%@ include file="header.jsp"%>

	<!-- Header Section End -->

	<div class="breadcrumb__links"
		style="padding-top: 50px; padding-left: 5%;">
		<span
			style="font-size: 30px; font-weight: 700; color: #000; margin-bottom: 5px;">STORE</span>
	</div>

	<!-- Swipe Begin -->
	<swiper-container class="mySwiper" pagination="true"
		pagination-clickable="true" space-between="20" slides-per-view="4">
		<c:forEach var="product" items="${productList}">
			<swiper-slide>
				<div id="${product.pNum}">
					<div class="swiper-top" style="margin-right: 100px;">${product. pEN}</div>
					<div>
						<a href="detail.do?pNum=${product.pNum}"><img class="swiper-image" src="img/${product.pImage1}" alt="${product. pEN}이미지"></a>
					</div>
					<div class="swiper-bottom">
						￦ <fmt:formatNumber value="${product.pPrice}" />
						<button class="swiper-button" onclick="location.href='detail.do?pNum=${product.pNum}'">펀딩하기</button>
					</div>
				</div>
			</swiper-slide>
		</c:forEach>
		
		<!-- 샘플 데이터 -->
		<!-- <swiper-slide>
		<div>
			<div class="swiper-top" style="margin-right: 100px;">Sun</div>
			<div>
				<img class="swiper-image" src="./img/sun.png" alt="태양">
			</div>
			<div class="swiper-bottom">
				￦ 9.000.000.000
				<button class="swiper-button">펀딩하기</button>
			</div>
		</div>
		</swiper-slide>
		<swiper-slide>
		<div>
			<div class="swiper-top">Mercury</div>
			<div>
				<img class="swiper-image" src="./img/mercury.png" alt="수성">
			</div>
			<div class="swiper-bottom">
				￦ 8.000.000.000
				<button class="swiper-button">펀딩하기</button>
			</div>
		</div>
		</swiper-slide>
		<swiper-slide>
		<div>
			<div class="swiper-top">Venus</div>
			<div>
				<img class="swiper-image" src="./img/venus.png" alt="금성">
			</div>
			<div class="swiper-bottom">
				￦ 7.000.000.000
				<button class="swiper-button">펀딩하기</button>
			</div>
		</div>
		</swiper-slide>
		<swiper-slide>
		<div>
			<div class="swiper-top">Earth</div>
			<div>
				<img class="swiper-image" src="./img/earth.png" alt="지구">
			</div>
			<div class="swiper-bottom">
				￦ 6.000.000.000
				<button class="swiper-button">펀딩하기</button>
			</div>
		</div>
		</swiper-slide>
		<swiper-slide>
		<div>
			<div class="swiper-top">Mars</div>
			<div>
				<img class="swiper-image" src="./img/mars.png" alt="화성">
			</div>
			<div class="swiper-bottom">
				￦ 5.000.000.000
				<button class="swiper-button">펀딩하기</button>
			</div>
		</div>
		</swiper-slide>
		<swiper-slide>
		<div>
			<div class="swiper-top">Jupiter</div>
			<div>
				<img class="swiper-image" src="./img/jupiter.png" alt="목성">
			</div>
			<div class="swiper-bottom">
				￦ 4.000.000.000
				<button class="swiper-button">펀딩하기</button>
			</div>
		</div>
		</swiper-slide>
		<swiper-slide>
		<div>
			<div class="swiper-top">Saturn</div>
			<div>
				<img class="swiper-image" src="./img/saturn.png" alt="토성">
			</div>
			<div class="swiper-bottom">
				￦ 3.000.000.000
				<button class="swiper-button">펀딩하기</button>
			</div>
		</div>
		</swiper-slide>
		<swiper-slide>
		<div>
			<div class="swiper-top">Uranus</div>
			<div>
				<img class="swiper-image" src="./img/uranus.png" alt="천왕성">
			</div>
			<div class="swiper-bottom">
				￦ 2.000.000.000
				<button class="swiper-button">펀딩하기</button>
			</div>
		</div>
		</swiper-slide>
		<swiper-slide>
		<div>
			<div class="swiper-top">Neptune</div>
			<div>
				<img class="swiper-image" src="./img/neptune.png" alt="해왕성">
			</div>
			<div class="swiper-bottom">
				￦ 1.000.000.000
				<button class="swiper-button">펀딩하기</button>
			</div>
		</div>
		</swiper-slide> -->
	</swiper-container>
	<!-- Swipe End -->

	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright__text">
						<p>Copyright &copy; 2023 All rights reserved | Refact by CTRL</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
	<script src="js/package.json"></script>
	<script src="js/sandbox.config.json"></script>
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
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
</body>
</html>