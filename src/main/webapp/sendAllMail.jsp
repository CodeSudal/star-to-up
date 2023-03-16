<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="STU" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Funding Management</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&amp;family=Roboto:wght@500;700&amp;display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrapAdmin.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/styleAdmin.css" rel="stylesheet">
<style>
@
keyframes progressAnimationStrike {from { width:0;
	
}

to {
	width: 100%;
}

}
.progress2 {
	border-radius: 30px;
	background: rgba(0, 0, 0, 0.25);
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px
		rgba(255, 255, 255, 0.08);
}

.progress-bar2 {
	height: 18px;
	border-radius: 30px;
	background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0.3),
		rgba(255, 255, 255, 0.05));
	transition: 0.4s linear;
	transition-property: width, background-color;
}

.progress-moved .progress-bar2 {
	background-color: white;
	/* animation: progressAnimation 6s; */
}

@
keyframes progressAnimation { 0% {
	width: 5%;
	background-color: rgb(39, 22, 94);
}

100








%
{
background-color








:








black






;
}
}
keyframes colorAnimation {
	background-image: linear-gradient(to right, #4cd964, #5ac8fa, #007aff, #7dc8e8, #5856d6,
		#ff2d55);
}

20








%
{
background-image








:








linear-gradient






(








to








right
,
#5ac8fa
,
#007aff
,
#7dc8e8
,
#5856d6
,
#ff2d55
,
#4cd964








)






;
}
40








%
{
background-image








:








linear-gradient






(








to








right
,
#007aff
,
#7dc8e8
,
#5856d6
,
#ff2d55
,
#4cd964
,
#5ac8fa








)






;
}
60








%
{
background-image








:








linear-gradient






(








to








right
,
#7dc8e8
,
#5856d6
,
#ff2d55
,
#4cd964
,
#5ac8fa
,
#007aff








)






;
}
100








%
{
background-image








:








linear-gradient






(








to








right
,
#5856d6
,
#ff2d55
,
#4cd964
,
#5ac8fa
,
#007aff
,
#7dc8e8








)






;
}
}
p[data-value] {
	position: relative;
}

/* The percentage will automatically fall in place as soon as we make the width fluid. Now making widths fluid. */
p[data-value]:after {
	content: attr(data-value) '%';
	position: absolute;
	right: 0;
}

.funding::-webkit-progress-value {
	/* Gradient background with Stripes */
	background-image: -webkit-linear-gradient(135deg, transparent, transparent 33%, rgba(0, 0,
		0, .1) 33%, rgba(0, 0, 0, .1) 66%, transparent 66%),
		-webkit-linear-gradient(top, rgba(255, 255, 255, .25),
		rgba(0, 0, 0, .2)), -webkit-linear-gradient(left, #09c, #f44); .
	btn-primary: disabled, .btn-primary .disabled{
    color:#6c7293 !important;
	background-color: #fff !important;
	border-color: #fff !important;
}
}
}
</style>
</head>









<body>
	<div class="container-fluid position-relative d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->

		<!-- Sidebar Start -->


		<div class="sidebar pe-4 pb-3">
			<nav class="navbar bg-secondary navbar-dark">
				<a href="main.do"><img class="rounded-circle" src="img/logo.png"
					alt="로고이미지" style="height: 70px; margin-left: 8px"></a>

				<div class="navbar-nav w-100">
					<a href="adminFunding.do" class="nav-item nav-link"><i
						class="fa fa-chart-bar me-2"></i>Funding Chart</a> <a
						href="adminProduct.do" class="nav-item nav-link"><i
						class="fa fa-tachometer-alt me-2"></i>Add Product</a> <a
						href="adminMember.do" class="nav-item nav-link"><i
						class="fa fa-table me-2"></i>Member</a>
				</div>

			</nav>
		</div>

		<script src="https://code.jquery.com/jquery-3.6.3.min.js"
			integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
			crossorigin="anonymous">
			
		</script>
		<!--메뉴 active 유지 JS -->
		<script type="text/javascript">
			var pageUrl = window.location.href; //창의 url을 가져온다.http~~ 부터 전체 url을 가져온다.

			$(window).on('load', function() {
				//다른 active가 있으면 지워준다.
				//menuLinks.classList.remove('active');

				var menuLinks = document.querySelectorAll('.nav-item');

				if (pageUrl.includes('Funding')) {
					menuLinks[0].classList.add('active');
				} else if (pageUrl.includes('Product')) {
					menuLinks[1].classList.add('active');
				} else if (pageUrl.includes('Member')) {
					menuLinks[2].classList.add('active');
				}

			});
		</script>



		<!-- Sidebar End -->

		<!-- Content Start -->
		<div class="content">
			<!-- Navbar Start -->


			<nav
				class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0"
				style="height: 80px">
				<!-- <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
					<h2 class="text-primary mb-0">
						<i class="fa fa-user-edit"></i>
					</h2>
				</a>  -->
				<a href="#" class="sidebar-toggler flex-shrink-0"> <i
					class="fa fa-bars"></i>
				</a>


				<div class="navbar-nav align-items-center ms-auto">
					<div class="nav-item dropdown">
						<div class="position-relative">
							<div style="float: left">

								<img class="rounded-circle" src="img/admin.png" alt="관리자이미지"
									style="width: 40px; height: 40px;">
							</div>
							<div style="float: right; margin: 8px">
								<h5>
									<a href="logout.do">&nbsp;LOGOUT</a>
								</h5>
								<!-- <span
								class="d-none d-lg-inline-flex" style="color: white">LOGOUT</span> -->
							</div>

						</div>
					</div>
				</div>

			</nav>

			<!-- Navbar End -->

			<span style="    font-family: 'Noto Sans';
    font-style: normal;
    font-weight: 500;
    font-size: 30px;
    margin-left: 5%;
    margin-top: 3%;
    display: block;
    color: #FFFFFF;">SAND MAIL</span>

			<!-- Table Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">

					<div class="col-sm-12 col-xl-6" style="width: 100%">

						<div class="bg-secondary rounded h-100 p-4"
							style="width: 50%; background: #1A1C23; border-radius: 30px !important; margin-left: 25%; margin-top: 8%; height: 90% !important;">
							<h3 class="mb-4"
								style="text-align: center; margin-top: 5% !important; margin-bottom: 10% !important;">${product.pName}</h3>









								<button type="button" id="my-button"
									class="btn btn-primary rounded-pill m-2"
									style="padding: 10px 30px; display: block; margin-left: 15% !important; margin-bottom: 6% !important; width: 70%; background: #FFFFFF; opacity: 0.5;"
									onclick="onClickUpload();">LiNK ADD</button>

								<button type="button" class="btn btn-primary rounded-pill m-2"
									style="padding: 10px 30px; float: left; display: block; margin-left: 15% !important; margin-bottom: 10% !important; width: 70%; background: #FFFFFF; opacity: 0.5; color: #6c7293;"
									id="sendQR" onclick="sendQR()" disabled>SAND MAIL</button>
								<input id="my-input" type="file" onchange="readURL(this);"
									style="height: 1px; display: none;"> <span
									style="display: block; float: left; margin-bottom: 5% !important; margin-left: 10% !important; text-align: center;">해당
									펀딩 참여자에게 메일이 일괄 전송됩니다.</span>

					






						</div>
					</div>
				</div>
				<!-- Table End -->
			</div>
			<!-- Content End -->
		</div>

		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"
			style="display: none;"><i class="bi bi-arrow-up"></i></a>


		<!-- JavaScript Libraries -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		<script src="lib/chart/chart.min.js"></script>
		<script src="lib/easing/easing.min.js"></script>
		<script src="lib/waypoints/waypoints.min.js"></script>
		<script src="lib/owlcarousel/owl.carousel.min.js"></script>
		<script src="lib/tempusdominus/js/moment.min.js"></script>
		<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
		<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

		<script src="https://code.jquery.com/jquery-3.6.3.min.js"
			integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
			crossorigin="anonymous"></script>

		<!-- QR삽입 버튼 활성화 JS -->
		<script type="text/javascript">
			function onClickUpload() {
				let myInput = document.getElementById("my-input");
				myInput.click();
			}
		</script>


		<!-- QR추가 + QR전송 버튼 활성화  JS -->
		<script type="text/javascript">
			function readURL(input) {
				console.log('들어왔음');
				const qrBtn = document.getElementById('my-button');
				const sendBtn = document.getElementById('sendQR');

				//QR추가 했다면
				if (input.files && input.files[0]) {
					console.log('파일 있음');
					//QR삽입 버튼 스타일 
					qrBtn.style.backgroundColor = "#6c7293";
					qrBtn.style.color = "#fff";
					qrBtn.style.borderColor = "#6c7293";
					//QR전송 버튼 활성화됨
					$("#sendQR").prop("disabled", false);

				} else { //QR추가 안 했다면
					console.log('파일 없음');
					//QR삽입 버튼 스타일
					qrBtn.style.backgroundColor = "#fff";
					qrBtn.style.color = "#6c7293";
					qrBtn.style.borderColor = "#fff";
					//QR전송 버튼은 활성화 안 됨

				}

			}
		</script>


		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
			
		</script>
		<script type="text/javascript">
			(function() {
				emailjs.init("hgRoerm1aeWKedrNw");
			})();
		</script>

		<!-- Template Javascript -->
		<script src="js/mainAdmin.js"></script>




	</div>
</body>
</html>


