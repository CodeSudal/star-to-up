<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="STU" tagdir="/WEB-INF/tags"%>  
  
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


	
<script type="text/javascript">
function deleteMem(mId){
	console.log('여기로 들어와줬으면해..');
	if(confirm("해당 회원 정보를 삭제하시겠습니까?")){
		location.href="adminMemberDelete.do?mId="+mId+"";
	}else{
        history.back();
	}
	
}



</script>


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
		<STU:sideBar />
		<!-- Sidebar End -->

		<!-- Content Start -->
		<div class="content">
			<!-- Navbar Start -->
			<STU:navBar />
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
									<c:forEach var="v" items="${memberList}">
										<tr>

											<!-- <th scope="row">1</th> -->
											<td id="${v.mId}">${v.mId}</td>

											<td>${v.mName}</td>
											<td>${v.mEmail1}@ ${v.mEmail2}</td>
											<td>${v.mNum}</td>
											<td>${v.mRegdate}</td>


											<td>
											<button class="btn btn-primary rounded-pill m-2" type="button" onclick = "deleteMem('${v.mId}')"
													>
													Delete</button></td>
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
	
	<!-- 회원삭제실행여부확인 JS -->

	
	
	

</body>
</html>
    