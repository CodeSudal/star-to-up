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
<title>STU PAYMENT</title>
<!-- 파비콘 삽입 -->
<link rel="icon" href="img/StarToUp_Logo.png">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- iamport -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
	//문서가 준비되면 제일 먼저 실행
	$(document).ready(function() {
		$(".site-btn").click(function() {
			payment(); //버튼 클릭하면 호출 
		});
	})

	//버튼 클릭하면 실행
	function payment(data) {
		IMP.init('imp63770834');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
		IMP.request_pay({// param
			pg : "html5_inicis", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
			pay_method : "card", //지불 방법
			merchant_uid : "INIpayTest-0000022", //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
			name : "${product.pEN}", //결제창에 노출될 상품명
			amount : "${product.pPrice}", //금액
			buyer_email : "${member.mEmail1} @ ${member.mEmail2}",
			buyer_name : "${member.mName}",
			buyer_tel : "${member.mNum}"
		}, function(rsp) { // callback
			if (rsp.success) {
				alert("결제가 완료되었습니다.");
				var link = 'paymentsuccess.do?pNum=${product.pNum}';

				location.href = link;
			} else {
				alert("실패 : 코드(" + rsp.error_code + ") / 메세지(" + rsp.error_msg
						+ ")");
			}
		});
	}
</script>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cookie&amp;display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&amp;display=swap"
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
<style>
.osSwitch {
	position: relative;
	display: inline-block;
	width: 34px;
	height: 15.3px
}

.osSwitch input {
	opacity: 0;
	width: 0;
	height: 0
}

.osSlider {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	border-radius: 34px;
	background-color: #93a0b5;
	transition: 0.4s
}

.osSlider:before {
	position: absolute;
	content: '';
	height: 13px;
	width: 13px;
	left: 2px;
	bottom: 1px;
	border-radius: 50%;
	background-color: white;
	transition: 0.4s
}

input:checked+.sliderGreen {
	background-color: #04d289
}

input:checked+.sliderRed {
	background-color: #ff3b30
}

input:not(:checked)+.defaultGreen {
	background-color: #04d289
}

input:checked+.osSlider:before {
	transform: translateX(17px)
}
</style>
<style>
@font-face {
	font-family: 'SegoeUI_online_security';
	src:
		url(chrome-extension://llbcnfanfmjhpedaedhbcnpgeepdnnok/segoe-ui.woff);
}

@font-face {
	font-family: 'SegoeUI_bold_online_security';
	src:
		url(chrome-extension://llbcnfanfmjhpedaedhbcnpgeepdnnok/segoe-ui-bold.woff);
}
</style>
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->

	<!-- Breadcrumb End -->


	<!-- Checkout Section Begin -->

	<section class="checkout spad">
		<div class="container">

			<form action="#" class="checkout__form">
				<h5
					style="border-bottom: white; font-size: 30px; font-weight: 700; font-family: 'Noto Sans';">제품
					정보</h5>


				<table>
					<tbody>
						<tr>
							<td
								style="width: 147px; height: 47px; font-family: 'Noto Sans'; font-style: normal; font-weight: 500; font-size: 30px; line-height: 44px; color: #000000;"><img
								src="img/${product.pImage1}" style="width:60px; height:60px;"></td>
							<td
								style="width: 10%; height: 47px; font-family: 'Noto Sans'; font-style: normal; font-weight: 500; font-size: 30px; line-height: 44px; color: #000000;">${product.pEN}
							</td>
							<td
								style="width: 40%; height: 29px; font-family: 'Noto Sans'; font-style: normal; font-weight: 400; font-size: 25px; line-height: 44px; color: #000000; text-align: right;">₩
								<fmt:formatNumber value="${product.pAmount}" />
							</td>
							<td
								style="width: 40%; height: 29px; font-family: 'Noto Sans'; font-style: normal; font-weight: 700; font-size: 28px; line-height: 44px; text-align: right; color: #000000;">₩
								<fmt:formatNumber value="${product.pPrice}" />
							</td>
						</tr>
					</tbody>
				</table>
				<hr style="border-width: 2px;">
				<div class="row">
					<div class="col-lg-8" style="width: 100%;">
						<h5
							style="width: 156px; height: 44px; font-family: 'Noto Sans'; font-style: normal; font-weight: 700; font-size: 28px; line-height: 44px;
	/* identical to box height */ color: #000000; border-bottom: white; margin-top: 50px;">후원자
							정보</h5>

						<div class="checkout__form__input">
							<p
								style="width: 48px; height: 27px; font-family: 'Noto Sans'; font-style: normal; font-weight: 700; font-size: 16px; line-height: 27px; color: #000000;">
								이 름</p>
							<input type="text" style="width: 95%; margin-bottom: 10px;"
								value="${member.mName }" readonly>
						</div>
						<div class="checkout__form__input">
							<p
								style="width: 70px; height: 27px; font-family: 'Noto Sans'; font-style: normal; font-weight: 700; font-size: 16px; line-height: 27px; color: #000000;">
								연락처</p>
							<input type="text" style="width: 95%; margin-bottom: 10px;"
								value="${member.mNum}" readonly>
						</div>

						<div class="checkout__form__input">
							<p
								style="width: 70px; height: 27px; font-family: 'Noto Sans'; font-style: normal; font-weight: 700; font-size: 16px; line-height: 27px; color: #000000;">
								이메일</p>
							<input type="text" style="width: 95%; margin-bottom: 10px;"
								value="${member.mEmail1} @ ${member.mEmail2}" readonly>
						</div>
						<p>* 위 연락처와 이메일로 펀딩소식이 전달됩니다.</p>



					</div>


					<div class="col-lg-4">
						<div class="checkout__order"
							style="margin-top: 70px; border-radius: 16px;">
							<h5
								style="font-size: 20px; margin-bottom: 30px; font-weight: 500;">YOUR
								FUNDING</h5>
							<div class="checkout__order__product"
								style="margin-bottom: 20px; border-bottom: white;">
								<ul>
									<li style="margin-bottom: 40px;"><span class="top__text"
										style="font-size: 20px;">Product</span> <span
										class="top__text__right" style="font-size: 20px;">Total</span>
									</li>
									<li style="font-size: 18px; margin-bottom: 30px;">${product.pName }
										<span style="font-size: 16px;">₩<fmt:formatNumber
												value="${product.pPrice}" />
									</span>
									</li>
								</ul>
							</div>


							<button type="button" class="site-btn"
								style="background: #000000; font-size: 18px;">펀딩하기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<!-- Checkout Section End -->

	<!-- Instagram Begin -->

	<!-- Instagram End -->

	<!-- Footer Section Begin -->
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



</body>
</html>