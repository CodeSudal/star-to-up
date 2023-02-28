<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Store</title>

<!-- Google Font -->
<!--<link rel="stylesheet" href="css/font.css" type="text/css">-->
<link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

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
<!-- Page Preloder -->
<div id="preloder">
  <div class="loader"></div>
</div>

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
  <div class="offcanvas__close">+</div>
  <ul class="offcanvas__widget">
    <li><span class="icon_search search-switch"></span></li>
    <li><a href="#"><span class="icon_heart_alt"></span>
      <div class="tip">2</div>
      </a></li>
    <li><a href="#"><span class="icon_bag_alt"></span>
      <div class="tip">2</div>
      </a></li>
  </ul>
  <div class="offcanvas__logo"> <a href="./index.html"><img src="img/logo.png" alt=""></a> </div>
  <div id="mobile-menu-wrap"></div>
  <div class="offcanvas__auth"> <a href="#">Login</a> <a href="#">Register</a> </div>
</div>
<!-- Offcanvas Menu End --> 

<!-- Header Section Begin -->
<header class="header">
  <div class="container-fluid">
    <div class="row">
      <div class="col-xl-3 col-lg-2">
        <div class="header__logo"> <a href="./index.html"><img src="img/logo.png" alt=""></a> </div>
      </div>
      <div class="col-xl-6 col-lg-7">
        <nav class="header__menu">
          <ul>
            <li><a href="./index.html">Home</a></li>
            <li><a href="#">Women’s</a></li>
            <li><a href="#">Men’s</a></li>
            <li class="active"><a href="./shop.html">Shop</a></li>
            <li><a href="#">Pages</a>
              <ul class="dropdown">
                <li><a href="./product-details.html">Product Details</a></li>
                <li><a href="./shop-cart.html">Shop Cart</a></li>
                <li><a href="./checkout.html">Checkout</a></li>
                <li><a href="./blog-details.html">Blog Details</a></li>
              </ul>
            </li>
            <li><a href="./blog.html">Blog</a></li>
            <li><a href="./contact.html">Contact</a></li>
          </ul>
        </nav>
      </div>
      <div class="col-lg-3">
        <div class="header__right">
          <div class="header__right__auth"> <a href="#">Login</a> <a href="#">Register</a> </div>
          <ul class="header__right__widget">
            <li><span class="icon_search search-switch"></span></li>
            <li><a href="#"><span class="icon_heart_alt"></span>
              <div class="tip">2</div>
              </a></li>
            <li><a href="#"><span class="icon_bag_alt"></span>
              <div class="tip">2</div>
              </a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="canvas__open"> <i class="fa fa-bars"></i> </div>
  </div>
</header>
<!-- Header Section End -->

<div class="breadcrumb__links" style="padding-top: 50px; padding-left: 5%;"> <span style="font-size: 30px; font-weight: 700; color: #000; margin-bottom: 5px;">STORE</span> </div>

<!-- Swipe Begin -->
<swiper-container class="mySwiper" pagination="true" pagination-clickable="true" space-between="20" slides-per-view="4">
  <swiper-slide>
    <div>
      <div class="swiper-top" style="margin-right: 100px;" > Sun </div>
      <div> <img class="swiper-image" src="./img/sun.png" alt="태양"> </div>
      <div class="swiper-bottom"> ￦ 9.000.000.000
        <button class="swiper-button">펀딩하기</button>
      </div>
    </div>
  </swiper-slide>
  <swiper-slide>
    <div>
      <div class="swiper-top"> Mercury </div>
      <div> <img class="swiper-image" src="./img/mercury.png" alt="수성"> </div>
      <div class="swiper-bottom"> ￦ 8.000.000.000
        <button class="swiper-button">펀딩하기</button>
      </div>
    </div>
  </swiper-slide>
  <swiper-slide>
    <div>
      <div class="swiper-top"> Venus </div>
      <div> <img class="swiper-image" src="./img/venus.png" alt="금성"> </div>
      <div class="swiper-bottom"> ￦ 7.000.000.000
        <button class="swiper-button">펀딩하기</button>
      </div>
    </div>
  </swiper-slide>
  <swiper-slide>
    <div>
      <div class="swiper-top"> Earth </div>
      <div> <img class="swiper-image" src="./img/earth.png" alt="지구"> </div>
      <div class="swiper-bottom"> ￦ 6.000.000.000
        <button class="swiper-button">펀딩하기</button>
      </div>
    </div>
  </swiper-slide>
  <swiper-slide>
    <div>
      <div class="swiper-top"> Mars </div>
      <div> <img class="swiper-image" src="./img/mars.png" alt="화성"> </div>
      <div class="swiper-bottom"> ￦ 5.000.000.000
        <button class="swiper-button">펀딩하기</button>
      </div>
    </div>
  </swiper-slide>
  <swiper-slide>
    <div>
      <div class="swiper-top"> Jupiter </div>
      <div> <img class="swiper-image" src="./img/jupiter.png" alt="목성"> </div>
      <div class="swiper-bottom"> ￦ 4.000.000.000
        <button class="swiper-button">펀딩하기</button>
      </div>
    </div>
  </swiper-slide>
  <swiper-slide>
    <div>
      <div class="swiper-top"> Saturn </div>
      <div> <img class="swiper-image" src="./img/saturn.png" alt="토성"> </div>
      <div class="swiper-bottom"> ￦ 3.000.000.000
        <button class="swiper-button">펀딩하기</button>
      </div>
    </div>
  </swiper-slide>
  <swiper-slide>
    <div>
      <div class="swiper-top"> Uranus </div>
      <div> <img class="swiper-image" src="./img/uranus.png" alt="천왕성"> </div>
      <div class="swiper-bottom"> ￦ 2.000.000.000
        <button class="swiper-button">펀딩하기</button>
      </div>
    </div>
  </swiper-slide>
  <swiper-slide>
    <div>
      <div class="swiper-top"> Neptune </div>
      <div> <img class="swiper-image" src="./img/neptune.png" alt="해왕성"> </div>
      <div class="swiper-bottom"> ￦ 1.000.000.000
        <button class="swiper-button">펀딩하기</button>
      </div>
    </div>
  </swiper-slide>
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
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script> 
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
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
</body>
</html>