<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>이용약관</title>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>




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

	<div class="regi_wrap">

		<form name="fregister" id="fregister" action="#"
			onsubmit="fregister_submit(this);" autocomplete="off"
			style="font-family: 'Noto Sans';">


			<h5
				style="font-weight: 700; font-size: 25px; font-family: 'Noto Sans'; margin-top: 50px; margin-left: 5%; margin-bottom: 0px; border-bottom: white; contain: size;">이용약관</h5>
			<div id="fregister_chkall" style="float: right; margin-right: 5%;">
				<label for="chk_all"
					style="font-weight: 400; margin-bottom: 0px; margin-top: 10px;">
					위 항목에 모두 동의합니다.</label> <input type="checkbox" id="cbx_chkAll" value="1"
					id="chk_all" class="input_chks" style="width: 16px; height: 16px;">
			</div>

			<section id="fregister_term">

				<textarea readonly
					style="width: 90%; display: inline-block; margin-left: 5%; border-radius: 15px; border: 1px solid rgb(217, 217, 217); height: 199px; margin-top: 30px; resize: none;">제 1 장 총칙
제1조(목적)
1. 이 약관은 (주)StarToUp가 제공하는 (주)StarToUp 사업 관련 서비스(이하 서비스라 합니다)를 이용함에 있어 이용조건 및 절차와 기타 필요한 사항을 규정하는 것을 목적으로 합니다.
제2조(약관의 효력과 변경)
1. 본 약관은 그 내용을 서비스 화면에 게시하고 이용자가 서비스화면에서 동의 의사표시를 함으로써 효력을 발생합니다.
2. (주)StarToUp는 사정상 혹은 영업상 중요한 사유가 발생될 경우에는 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진 등에 관한 법률, 방문판매 등에 관한 법률, 소비자보호법 등 관련법을 위배 하지 않은 범위에서 이 약관을 개정할 수 있습니다.
</textarea>
				<fieldset class="fregister_agree"
					style="float: right; margin-right: 5%; margin-top: 10px;">
					<label for="agree11" style="margin-top: 10px; font-weight: 400;">
						위 항목에 동의합니다. </label> <input type="checkbox" class="input_chks" name="chk"
						value="1" id="agree11" style="width: 16px; height: 16px;">
				</fieldset>
			</section>
			<section id="fregister_private">

				<textarea readonly
					style="width: 90%; display: inline-block; margin-left: 5%; border-radius: 15px; border: 1px solid #D9D9D9;  height: 220px; margin-top: 20px; resize: none;">제 1 장 총칙
제1조(목적)
1. 이 약관은 (주)StarToUp가 제공하는 (주)StarToUp 사업 관련 서비스(이하 서비스라 합니다)를 이용함에 있어 이용조건 및 절차와 기타 필요한 사항을 규정하는 것을 목적으로 합니다.
제2조(약관의 효력과 변경)
1. 본 약관은 그 내용을 서비스 화면에 게시하고 이용자가 서비스화면에서 동의 의사표시를 함으로써 효력을 발생합니다.
2. (주)StarToUp는 사정상 혹은 영업상 중요한 사유가 발생될 경우에는 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진 등에 관한 법률, 방문판매 등에 관한 법률, 소비자보호법 등 관련법을 위배 하지 않은 범위에서 이 약관을 개정할 수 있습니다.
</textarea>

				<fieldset class="fregister_agree"
					style="float: right; margin-right: 5%;">
					<label for="agree21" style="margin-top: 20px; font-weight: 400;">위
						항목에 동의합니다.</label> <input type="checkbox" class="input_chks" name="chk"
						value="1" id="agree21" style="width: 16px; height: 16px;">
				</fieldset>
			</section>
			<div class="btn_submitdd">
				<input type="button" disabled="disabled" class="btn_submit"
					value="다음으로" onclick="location.href='join.do'"
					style="font-family: 'Noto Sans'; font-style: normal; font-weight: 500; font-size: 24px; line-height: 33px; color: #FFFFFF; background: #D9D9D9; width: 200px; height: 60px; border-radius: 30.5px; border: none; margin-top: 60px; margin-left: 83%; margin-bottom: 60px;">
			</div>
		</form>
	

		<!-- 회원가입 약관 동의 끝 -->


	</div>
 



	<!-- Footer Section End -->


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


	<script type="text/javascript">
    $(document).ready(function() {
        $("#cbx_chkAll").click(function() {
           if($("#cbx_chkAll").is(":checked")) {
        	 $("input[name=chk]").prop("checked", true);
      		 $(".btn_submit").css({"backgroundColor":"#000000","cursor":"pointer"});
      		 $(".btn_submit").prop("disabled",false);
      
           }
           else {
        	   $("input[name=chk]").prop("checked", false);
        	   $(".btn_submit").css({"backgroundColor":"#D9D9D9","cursor":"auto"}).prop("disabled",true);
           }
        });
        
        $("input[name=chk]").click(function() {
           var total = $("input[name=chk]").length; // 인풋태그가 몇개니?(총 개수)
           var checked = $("input[name=chk]:checked").length;//몇개 체크되었니?
       
           if(total != checked) $("#cbx_chkAll").prop("checked", false);
           else $("#cbx_chkAll").prop("checked", true); 
        
       
    	 	if(checked >= 2){
    		 $(".btn_submit").css({"backgroundColor":"#000000","cursor":"pointer"});
     		 $(".btn_submit").prop("disabled",false);
     
    		 }
    		 else{
    		 $(".btn_submit").css({"backgroundColor":"#D9D9D9","cursor":"auto"}).prop("disabled",true);
    		 }
        });
      
     });
    
    
    
	</script>


</body>
</html>