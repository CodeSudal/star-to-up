<html lang="zxx"><head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ashion | Template</title>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@page import="java.util.*"%>
<%

	request.setCharacterEncoding("UTF-8");

%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
         $("#cbx_chkAll").click(function() {
            if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
            else $("input[name=chk]").prop("checked", false);
         });
         
         $("input[name=chk]").click(function() {
            var total = $("input[name=chk]").length;
            var checked = $("input[name=chk]:checked").length;
            
            if(total != checked) $("#cbx_chkAll").prop("checked", false);
            else $("#cbx_chkAll").prop("checked", true); 
	</script>
<style type="text/css">
.btn_submit:hover {
	background-color: black !important;
}
</style>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cookie&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&amp;display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<style>.osSwitch{position:relative;display:inline-block;width:34px;height:15.3px}.osSwitch input{opacity:0;width:0;height:0}.osSlider{position:absolute;top:0;left:0;right:0;bottom:0;border-radius:34px;background-color:#93a0b5;transition:0.4s}.osSlider:before{position:absolute;content:'';height:13px;width:13px;left:2px;bottom:1px;border-radius:50%;background-color:white;transition:0.4s}input:checked+.sliderGreen{background-color:#04d289}input:checked+.sliderRed{background-color:#ff3b30}input:not(:checked)+.defaultGreen{background-color:#04d289}input:checked+.osSlider:before{transform:translateX(17px)}
</style><style>
    @font-face {
      font-family: 'SegoeUI_online_security'; 
      src: url(chrome-extension://llbcnfanfmjhpedaedhbcnpgeepdnnok/segoe-ui.woff);
    }

    @font-face {
      font-family: 'SegoeUI_bold_online_security'; 
      src: url(chrome-extension://llbcnfanfmjhpedaedhbcnpgeepdnnok/segoe-ui-bold.woff);
    }
</style></head>

<body>
	<!-- Page Preloder -->
	<div id="preloder" style="display: none;">
		<div class="loader" style="display: none;"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__close">+</div>
		<ul class="offcanvas__widget">
			<li><span class="icon_search search-switch"></span></li>
			<li><a href="#"><span class="icon_heart_alt"></span>
					<div class="tip">2</div> </a></li>
			<li><a href="#"><span class="icon_bag_alt"></span>
					<div class="tip">2</div> </a></li>
		</ul>
		<div class="offcanvas__logo">
			<a href="./index.html"><img src="img/logo.png" alt=""></a>
		</div>
		<div id="mobile-menu-wrap"><div class="slicknav_menu"><a href="#" aria-haspopup="true" role="button" tabindex="0" class="slicknav_btn slicknav_collapsed" style="outline: none;"><span class="slicknav_menutxt">MENU</span><span class="slicknav_icon"><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span></span></a><nav class="slicknav_nav slicknav_hidden" aria-hidden="true" role="menu" style="display: none;">
						<ul>
							<li><a href="./index.html" role="menuitem">Home</a></li>
							<li><a href="#" role="menuitem">Women’s</a></li>
							<li><a href="#" role="menuitem">Men’s</a></li>
							<li class="active"><a href="./shop.html" role="menuitem">Shop</a></li>
							<li class="slicknav_collapsed slicknav_parent"><a href="#" role="menuitem" aria-haspopup="true" tabindex="-1" class="slicknav_item slicknav_row" style="outline: none;"><a href="#">Pages</a>
								<span class="slicknav_arrow">►</span></a><ul class="dropdown slicknav_hidden" role="menu" aria-hidden="true" style="display: none;">
									<li><a href="./product-details.html" role="menuitem" tabindex="-1">Product Details</a></li>
									<li><a href="./shop-cart.html" role="menuitem" tabindex="-1">Shop Cart</a></li>
									<li><a href="./checkout.html" role="menuitem" tabindex="-1">Checkout</a></li>
									<li><a href="./blog-details.html" role="menuitem" tabindex="-1">Blog Details</a></li>
								</ul></li>
							<li><a href="./blog.html" role="menuitem">Blog</a></li>
							<li><a href="./contact.html" role="menuitem">Contact</a></li>
						</ul>
					</nav></div>
			<div class="slicknav_menu">
				<a href="#" aria-haspopup="true" role="button" tabindex="0" class="slicknav_btn slicknav_collapsed" style="outline: none;"><span class="slicknav_menutxt">MENU</span><span class="slicknav_icon"><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span></span></a>
				<nav class="slicknav_nav slicknav_hidden" aria-hidden="true" role="menu" style="display: none;">
					<ul>
						<li><a href="./index.html" role="menuitem">Home</a></li>
						<li><a href="#" role="menuitem">Women’s</a></li>
						<li><a href="#" role="menuitem">Men’s</a></li>
						<li class="active"><a href="./shop.html" role="menuitem">Shop</a></li>
						<li class="slicknav_collapsed slicknav_parent"><a href="#" role="menuitem" aria-haspopup="true" tabindex="-1" class="slicknav_item slicknav_row" style="outline: none;"></a><a href="#">Pages</a>
								<span class="slicknav_arrow">►</span>
							<ul class="dropdown slicknav_hidden" role="menu" aria-hidden="true" style="display: none;">
								<li><a href="./product-details.html" role="menuitem" tabindex="-1">Product Details</a></li>
								<li><a href="./shop-cart.html" role="menuitem" tabindex="-1">Shop Cart</a></li>
								<li><a href="./checkout.html" role="menuitem" tabindex="-1">Checkout</a></li>
								<li><a href="./blog-details.html" role="menuitem" tabindex="-1">Blog Details</a></li>
							</ul></li>
						<li><a href="./blog.html" role="menuitem">Blog</a></li>
						<li><a href="./contact.html" role="menuitem">Contact</a></li>
					</ul>
				</nav>
			</div>
			<div class="slicknav_menu">
				<a href="#" aria-haspopup="true" role="button" tabindex="0" class="slicknav_btn slicknav_collapsed" style="outline: none;"><span class="slicknav_menutxt">MENU</span><span class="slicknav_icon"><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span></span></a>
				<nav class="slicknav_nav slicknav_hidden" aria-hidden="true" role="menu" style="display: none;">
					<ul>
						<li><a href="./index.html" role="menuitem">Home</a></li>
						<li><a href="#" role="menuitem">Women’s</a></li>
						<li><a href="#" role="menuitem">Men’s</a></li>
						<li class="active"><a href="./shop.html" role="menuitem">Shop</a></li>
						<li class="slicknav_collapsed slicknav_parent"><a href="#" role="menuitem" aria-haspopup="true" tabindex="-1" class="slicknav_item slicknav_row" style="outline: none;"></a><a href="#">Pages</a>
							<span class="slicknav_arrow">►</span>
							<ul class="dropdown slicknav_hidden" role="menu" aria-hidden="true" style="display: none;">
								<li><a href="./product-details.html" role="menuitem" tabindex="-1">Product Details</a></li>
								<li><a href="./shop-cart.html" role="menuitem" tabindex="-1">Shop Cart</a></li>
								<li><a href="./checkout.html" role="menuitem" tabindex="-1">Checkout</a></li>
								<li><a href="./blog-details.html" role="menuitem" tabindex="-1">Blog Details</a></li>
							</ul></li>
						<li><a href="./blog.html" role="menuitem">Blog</a></li>
						<li><a href="./contact.html" role="menuitem">Contact</a></li>
					</ul>
				</nav>
			</div>
			<div class="slicknav_menu">
				<a href="#" aria-haspopup="true" role="button" tabindex="0" class="slicknav_btn slicknav_collapsed" style="outline: none;"><span class="slicknav_menutxt">MENU</span><span class="slicknav_icon"><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span></span></a>
				<nav class="slicknav_nav slicknav_hidden" aria-hidden="true" role="menu" style="display: none;">
					<ul>
						<li><a href="./index.html" role="menuitem">Home</a></li>
						<li><a href="#" role="menuitem">Women’s</a></li>
						<li><a href="#" role="menuitem">Men’s</a></li>
						<li class="active"><a href="./shop.html" role="menuitem">Shop</a></li>
						<li class="slicknav_collapsed slicknav_parent"><a href="#" role="menuitem" aria-haspopup="true" tabindex="-1" class="slicknav_item slicknav_row" style="outline: none;"></a><a href="#">Pages</a>
							<span class="slicknav_arrow">►</span>
							<ul class="dropdown slicknav_hidden" role="menu" aria-hidden="true" style="display: none;">
								<li><a href="./product-details.html" role="menuitem" tabindex="-1">Product Details</a></li>
								<li><a href="./shop-cart.html" role="menuitem" tabindex="-1">Shop Cart</a></li>
								<li><a href="./checkout.html" role="menuitem" tabindex="-1">Checkout</a></li>
								<li><a href="./blog-details.html" role="menuitem" tabindex="-1">Blog Details</a></li>
							</ul></li>
						<li><a href="./blog.html" role="menuitem">Blog</a></li>
						<li><a href="./contact.html" role="menuitem">Contact</a></li>
					</ul>
				</nav>
			</div>
			<div class="slicknav_menu">
				<a href="#" aria-haspopup="true" role="button" tabindex="0" class="slicknav_btn slicknav_collapsed" style="outline: none;"><span class="slicknav_menutxt">MENU</span><span class="slicknav_icon"><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span></span></a>
				<nav class="slicknav_nav slicknav_hidden" aria-hidden="true" role="menu" style="display: none;">
					<ul>
						<li><a href="./index.html" role="menuitem">Home</a></li>
						<li><a href="#" role="menuitem">Women’s</a></li>
						<li><a href="#" role="menuitem">Men’s</a></li>
						<li class="active"><a href="./shop.html" role="menuitem">Shop</a></li>
						<li class="slicknav_collapsed slicknav_parent"><a href="#" role="menuitem" aria-haspopup="true" tabindex="-1" class="slicknav_item slicknav_row" style="outline: none;"></a><a href="#">Pages</a>
							<span class="slicknav_arrow">►</span>
							<ul class="dropdown slicknav_hidden" role="menu" aria-hidden="true" style="display: none;">
								<li><a href="./product-details.html" role="menuitem" tabindex="-1">Product Details</a></li>
								<li><a href="./shop-cart.html" role="menuitem" tabindex="-1">Shop Cart</a></li>
								<li><a href="./checkout.html" role="menuitem" tabindex="-1">Checkout</a></li>
								<li><a href="./blog-details.html" role="menuitem" tabindex="-1">Blog Details</a></li>
							</ul></li>
						<li><a href="./blog.html" role="menuitem">Blog</a></li>
						<li><a href="./contact.html" role="menuitem">Contact</a></li>
					</ul>
				</nav>
			</div>
			<div class="slicknav_menu">
				<a href="#" aria-haspopup="true" role="button" tabindex="0" class="slicknav_btn slicknav_collapsed" style="outline: none;"><span class="slicknav_menutxt">MENU</span><span class="slicknav_icon"><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span></span></a>
				<nav class="slicknav_nav slicknav_hidden" aria-hidden="true" role="menu" style="display: none;">
					<ul>
						<li><a href="./index.html" role="menuitem">Home</a></li>
						<li><a href="#" role="menuitem">Women’s</a></li>
						<li><a href="#" role="menuitem">Men’s</a></li>
						<li class="active"><a href="./shop.html" role="menuitem">Shop</a></li>
						<li class="slicknav_collapsed slicknav_parent"><a href="#" role="menuitem" aria-haspopup="true" tabindex="-1" class="slicknav_item slicknav_row" style="outline: none;"></a><a href="#">Pages</a>
							<span class="slicknav_arrow">►</span>
							<ul class="dropdown slicknav_hidden" role="menu" aria-hidden="true" style="display: none;">
								<li><a href="./product-details.html" role="menuitem" tabindex="-1">Product Details</a></li>
								<li><a href="./shop-cart.html" role="menuitem" tabindex="-1">Shop Cart</a></li>
								<li><a href="./checkout.html" role="menuitem" tabindex="-1">Checkout</a></li>
								<li><a href="./blog-details.html" role="menuitem" tabindex="-1">Blog Details</a></li>
							</ul></li>
						<li><a href="./blog.html" role="menuitem">Blog</a></li>
						<li><a href="./contact.html" role="menuitem">Contact</a></li>
					</ul>
				</nav>
			</div>
			<div class="slicknav_menu">
				<a href="#" aria-haspopup="true" role="button" tabindex="0" class="slicknav_btn slicknav_collapsed" style="outline: none;"><span class="slicknav_menutxt">MENU</span><span class="slicknav_icon"><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span></span></a>
				<nav class="slicknav_nav slicknav_hidden" aria-hidden="true" role="menu" style="display: none;">
					<ul>
						<li><a href="./index.html" role="menuitem">Home</a></li>
						<li><a href="#" role="menuitem">Women’s</a></li>
						<li><a href="#" role="menuitem">Men’s</a></li>
						<li class="active"><a href="./shop.html" role="menuitem">Shop</a></li>
						<li class="slicknav_collapsed slicknav_parent"><a href="#" role="menuitem" aria-haspopup="true" tabindex="-1" class="slicknav_item slicknav_row" style="outline: none;"></a><a href="#">Pages</a>
							<span class="slicknav_arrow">►</span>
							<ul class="dropdown slicknav_hidden" role="menu" aria-hidden="true" style="display: none;">
								<li><a href="./product-details.html" role="menuitem" tabindex="-1">Product Details</a></li>
								<li><a href="./shop-cart.html" role="menuitem" tabindex="-1">Shop Cart</a></li>
								<li><a href="./checkout.html" role="menuitem" tabindex="-1">Checkout</a></li>
								<li><a href="./blog-details.html" role="menuitem" tabindex="-1">Blog Details</a></li>
							</ul></li>
						<li><a href="./blog.html" role="menuitem">Blog</a></li>
						<li><a href="./contact.html" role="menuitem">Contact</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<div class="offcanvas__auth">
			<a href="#">Login</a> <a href="#">Register</a>
		</div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xl-3 col-lg-2">
					<div class="header__logo">
						<a href="./index.html"><img src="img/logo.png" alt=""></a>
					</div>
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
								</ul></li>
							<li><a href="./blog.html">Blog</a></li>
							<li><a href="./contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__right">
						<div class="header__right__auth">
							<a href="#">Login</a> <a href="#">Register</a>
						</div>
						<ul class="header__right__widget">
							<li><span class="icon_search search-switch"></span></li>
							<li><a href="#"><span class="icon_heart_alt"></span>
									<div class="tip">2</div> </a></li>
							<li><a href="#"><span class="icon_bag_alt"></span>
									<div class="tip">2</div> </a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->

	<!-- Breadcrumb End -->

	<!-- Checkout Section Begin -->

	<div class="regi_wrap">
	<form name="fregister" id="fregister" action="#" onsubmit="fregister_submit(this);" autocomplete="off" style="font-family: 'Noto Sans';">


		<h5 style="font-weight: 700; font-size: 32px; font-family: 'Noto Sans'; margin-top: 50px; margin-left: 5%; border-bottom: white;">회원가입</h5>
		<h5 style="font-weight: 700;font-size: 25px;font-family: 'Noto Sans';margin-top: 50px;margin-left: 5%;margin-bottom: 0px;border-bottom: white;contain: size;display;/* display: unset; */">약관동의</h5>
			<div id="fregister_chkall" style="
    float: right;
    margin-right: 5%;
">
				<label for="chk_all" style="font-weight: 400; margin-bottom: 0px; margin-top: 10px;">
					위 항목에 모두 동의합니다.</label> <input type="checkbox" id="cbx_chkAll" value="1" style="width: 16px; height: 16px;">
			</div>

		<section id="fregister_term">

			<textarea readonly="" style="width: 90%; display: inline-block; margin-left: 5%; border-radius: 15px; border: 1px solid rgb(217, 217, 217); overflow-y: scroll; height: 199px; margin-top: 30px; resize: none;">제 1 장 총칙
제1조(목적)
1. 이 약관은 한국생산성본부가 제공하는 한국생산성본부 사업 관련 서비스(이하 서비스라 합니다)를 이용함에 있어 이용조건 및 절차와 기타 필요한 사항을 규정하는 것을 목적으로 합니다.
제2조(약관의 효력과 변경)
1. 본 약관은 그 내용을 서비스 화면에 게시하고 이용자가 서비스화면에서 동의 의사표시를 함으로써 효력을 발생합니다.
2. 한국생산성본부는 사정상 혹은 영업상 중요한 사유가 발생될 경우에는 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진 등에 관한 법률, 방문판매 등에 관한 법률, 소비자보호법 등 관련법을 위배 하지 않은 범위에서 이 약관을 개정할 수 있습니다.
</textarea>
			<fieldset class="fregister_agree" style="float: right; margin-right: 5%; margin-top: 10px;">
				<label for="agree11" style="margin-top: 10px; font-weight: 400;">
					위 항목에 동의합니다. </label> <input type="checkbox" name="chk" value="1" id="agree11" style="width: 16px; height: 16px;">
			</fieldset>
		</section>
		<section id="fregister_private">

			<textarea readonly="" style="width: 90%; display: inline-block; margin-left: 5%; border-radius: 15px; border: 1px solid #D9D9D9; overflow-y: scroll; height: 220px; margin-top: 20px; resize: none;">제 1 장 총칙
제1조(목적)
1. 이 약관은 한국생산성본부가 제공하는 한국생산성본부 사업 관련 서비스(이하 서비스라 합니다)를 이용함에 있어 이용조건 및 절차와 기타 필요한 사항을 규정하는 것을 목적으로 합니다.
제2조(약관의 효력과 변경)
1. 본 약관은 그 내용을 서비스 화면에 게시하고 이용자가 서비스화면에서 동의 의사표시를 함으로써 효력을 발생합니다.
2. 한국생산성본부는 사정상 혹은 영업상 중요한 사유가 발생될 경우에는 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진 등에 관한 법률, 방문판매 등에 관한 법률, 소비자보호법 등 관련법을 위배 하지 않은 범위에서 이 약관을 개정할 수 있습니다.
</textarea>

			<fieldset class="fregister_agree" style="float: right; margin-right: 5%;">
				<label for="agree21" style="margin-top: 20px; font-weight: 400;">

					위 항목에 동의합니다.</label> <input type="checkbox" name="chk" value="1" id="agree21" style="width: 16px; height: 16px;">
			</fieldset>
		</section>
		<div class="btn_submitdd">
			<input type="submit" class="btn_submit" value="다음으로" style="font-family: 'Noto Sans'; font-style: normal; font-weight: 500; font-size: 24px; line-height: 33px; color: #FFFFFF; background: #D9D9D9; width: 200px; height: 60px; border-radius: 30.5px; border: none; margin-top: 60px; margin-left: 83%; margin-bottom: 60px;">
		</div>
	</form>
	<!--
        <button type="submit" class="btn_submit facebook_btn write_btn" value="페이스북 회원가입">
            <i class="fab fa-facebook"></i>
            페이스북 회원가입
        </button>
        -->

	<!-- 회원가입 약관 동의 끝 -->

	<script>
                  function fregister_submit(f) {
                    if (!f.agree11.checked) {
                      alert(
                        '회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.',
                      );
                      f.agree11.focus();
                      event.preventDefault();
                      return false;
                      
                    }

                    if (!f.agree21.checked) {
                      alert(
                        '개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.',
                      );
                      f.agree21.focus();
                      event.preventDefault();
                      return false;
                    }

                    return true;
                  }

                </script>

		</div>
		



	<!-- Footer Section End -->

	<!-- Search Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search End -->

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




</body></html>