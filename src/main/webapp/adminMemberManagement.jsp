<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>Member Management</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="keywords" />
<meta content="" name="description" />

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon" />

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com"/>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
	rel="stylesheet" />

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet" />
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrapAdmin.min.css" rel="stylesheet" />

<!-- Template Stylesheet -->
<link href="css/styleAdmin.css" rel="stylesheet" />
</head>

<body>
	<div class="container-fluid position-relative d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->

		<!-- Sidebar Start -->
		<div class="sidebar pe-4 pb-3">
			<nav class="navbar bg-secondary navbar-dark">
				<a href="main.do"><img class="rounded-circle" src="img/logo.png" alt="로고이미지"
					style="height: 70px; margin-left: 8px" /></a>

				<div class="navbar-nav w-100">
					<a href="adminFundingManagement.do" class="nav-item nav-link"><i
						class="fa fa-chart-bar me-2"></i>Funding Chart</a> 
				    <a href="adminProductManagement.do" class="nav-item nav-link"><i
						class="fa fa-tachometer-alt me-2"></i>Add Product</a> 
				    <a href="adminMemberManagement.do" class="nav-item nav-link active"><i
						class="fa fa-table me-2"></i>Member</a>
				</div>
				
			</nav>
		</div>
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
									style="width: 40px; height: 40px;" />
							</div>
							<div style="float: right; margin:8px">
								<h5><a href="logout.do">&nbsp;LOGOUT</a></h5>
								<!-- <span
								class="d-none d-lg-inline-flex" style="color: white">LOGOUT</span> -->
							</div>

						</div>
					</div>
				</div>

			</nav>
			<!-- Navbar End -->

			<!-- Table Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">

					<div class="col-sm-12 col-xl-6" style="width: 100%">

						<div class="bg-secondary rounded h-100 p-4" style="width: max">
							<h3 class="mb-4">Member Management</h3>
							<table class="table table-hover"
								style="vertical-align: middle !important">
								<thead>
									<tr>
										<!-- <th scope="col">#</th> -->
										<th scope="col">아이디</th>
										<th scope="col">이름</th>
										<th scope="col">이메일</th>
										<th scope="col">전화번호</th>
										<th scope="col">가입일자</th>
										<th scope="col"></th>

									</tr>
								</thead>
								
								<tbody>
									<c:forEach var="v" items="${memberList}" >
									<tr>
									
										<!-- <th scope="row">1</th> -->
										<td>${v.mId}</td>
										<td>${v.mName}</td>
										<td>${v.mEmail}</td>
										<td>${v.mNum}</td>
										<td>${v.mDate}</td>
										<td><a href="adminMemberDelete.do?mId=${v.mId}"><button type="button"
												class="btn btn-primary rounded-pill m-2" >Delete</button></a></td>
									</tr>
									</c:forEach>
				
								</tbody>
								
							</table>
						</div>
					</div>

				</div>
			</div>
			<!-- Table End -->
		</div>
		<!-- Content End -->

		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>

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

	<!-- Template Javascript -->
	<script src="js/mainAdmin.js"></script>
</body>
</html>
    