<%@ tag language="java" pageEncoding="UTF-8"%>

<div class="sidebar pe-4 pb-3">
			<nav  class="navbar bg-secondary navbar-dark">
				<a href="main.do"><img class="rounded-circle" src="img/logo.png" alt="로고이미지"
					style="height: 70px; margin-left: 8px" /></a>

				<div class="navbar-nav w-100">
					<a href="adminFunding.do" class="nav-item nav-link"  ><i
						class="fa fa-chart-bar me-2"></i>Funding Chart</a> 
					<a href="adminProduct.do" class="nav-item nav-link" ><i
						class="fa fa-tachometer-alt me-2"></i>Add Product</a> 
					<a href="adminMember.do" class="nav-item nav-link" ><i
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

$(window).on('load', function(){
	 //다른 active가 있으면 지워준다.
	//menuLinks.classList.remove('active');
	 
	var menuLinks = document.querySelectorAll('.nav-item');
	 	
	 if (pageUrl.includes('Funding')) {
		 menuLinks[0].classList.add('active');
	 }
	 else if(pageUrl.includes('Product')){
		 menuLinks[1].classList.add('active');
	 }
	 else if(pageUrl.includes('Member')){
		 menuLinks[2].classList.add('active');
	 }

});	
	
	

</script>		
		

		