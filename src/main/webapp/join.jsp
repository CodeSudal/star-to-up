<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ashion | Template</title>
<style type="text/css">
#phoneChk:hover {
	background-color: black !important;
}

#phoneChk2:hover {
	background-color: black !important;
}

#star {
	color: red;
}
</style>

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
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>
/* 	$(document).ready(function(){
		//휴대폰 번호 인증
		  var code2 = "";
		var phone = document.getElementById('phone');
		 $("#phoneChk").click(function(){
			if(!phone){
		 	alert("인증번호 발송 실패.. 전화번호를 입력해주세요.");
				
				
			}else{
		 	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
		 	var phone = $("#phone").val();
			}
		 	$.ajax({
		         type:"GET",
		         url:"phoneCheck.do?phone=" + phone,
		         cache : false,
		         success:function(data){
		         	if(data == "error"){
		         		alert("휴대폰 번호가 올바르지 않습니다.")
		 				$("#phone").attr("autofocus",true);
		         	}else if(data == null){
		         		alert("휴대폰 번호를 입력해주세요!")
		 				$("#phone").attr("autofocus",true);
		         	}else{	        		
		         		
		         		$("#phone2").attr("disabled",false);
		         		$("#phoneChk2").css("display","inline-block");
		         		$("#phoneChk").css("backgroundColor","black");
		         		$("#phoneChk").text("발송완료");
		         		$("#phone").attr("readonly",true);
		         		code2 = data;
		         	}
		         }
		     });
		 }); 
		 
		//휴대폰 인증번호 대조
		 $("#phoneChk2").click(function(){
		 	if($("#phone2").val() == code2){
		 		("#phoneChk2").css("backgroundColor","black");
		 		("#phoneChk2").text("인증완료");
		 		$("#phoneDoubleChk").val("true");
		 		$("#phone2").attr("disabled",true);
		 	}else{
		 		alert("인증번호가 일치하지 않습니다.")
		 		$("#phoneDoubleChk").val("false");
		 		$(this).attr("autofocus",true);
		 	}
		 });
	}); */
 
	
	$(document).ready(function(){
		
/* 	
	 //joinform_check 함수로 유효성 검사
    function joinform_check() {
      //console.log("log");
      //변수에 담아주기
      var id = document.getElementById('id');
      var password = document.getElementById('password');
      var username = document.getElementById('username');
      var email = document.getElementById('email');
      var email_sel = document.getElementById('email_sel');
      var phone = document.getElementById('phone');
      
      if (!id.value) {
        //해당 입력값이 없을 경우 같은말: if(!id.value)
        alert('아이디를 입력하세요.');
        id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
        return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
      }
      var idCheck = /^(?=.*[a-zA-Z])[-a-zA-Z0-9_.]{2,10}$/;
      if (!idCheck.test(id.value)) {
        alert(
          '아이디는 2-10자의 영문과 숫자와 일부 특수문자(._-)만 사용해야 합니다.',
        );

        id.focus();
        return false;
      }
      var id=$('#id').val(); // $('id 속성이 id인 요소')의 값을 불러올래!
		$.ajax({
			type: 'POST',
			url: 'check',
			data: {id:id},
			success: function(result){
				
				if(result==1){
					$('#checkmsg').html('사용가능한 아이디'); // $('id 속성이 checkmsg인 요소')에 텍스트 추가
					var checkSave=$('#id').val();
				}	
				else{
					$('#checkmsg').html('중복된 아이디');
				}
			}
		})
      if (!password.value) {
        alert('비밀번호를 입력하세요.');
        password.focus();
        return false;
      }
      //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
      var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
      if (!pwdCheck.test(password.value)) {
        alert(
          '비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.',
        );
        password.focus();
        return false;
      }
     
      if (!username.value) {
        alert('이름을 입력하세요.');
        username.focus();
        return false;
      }
      var reg = /^[0-9]+/g; //숫자만 입력하는 정규식
      
      if (!email.value) {
        alert('이메일 앞자리를 입력하세요.');
        email.focus();
        return false;
      }
      
      
      if (!email_sel.value) {
          alert('이메일 뒷자리를 선택하세요.');
          email_sel.focus();
          return false;
        }
     
	
	
      //입력 값 전송
      document.join_form.submit(); //유효성 검사의 포인트
    }
    */
    //이메일 옵션 선택후 주소 자동 완성
    function change_email() {
      var email_sel = document.getElementById('email_sel');
      //지금 골라진 옵션의 순서와 값 구하기
      var idx = email_sel.options.selectedIndex;
      var val = email_sel.options[idx].value;
      email_sel.value = val;
    } 
    
  
	});
	
	$(document).ready(function(){
 let index = {
     init: function () {
         $("#btn-save").on("click", ()=>{ // function(){} 대신 ()=>{} 를 쓴 이유 : this를 바인딩하기 위해서
             this.save();
         });
     },

     save: function () {
         // alert('user의 save함수 호출됨');
         let data = {
             id: $("#id").val(),
             password: $("#password").val(),
             username: $("#username").val(),
             email: $("#email").val(),
             email_sel: $("#email_sel").val(),
             phone: $("#phone").val(), 
             
         };

         console.log(data);

         // ajax 호출시 default가 비동기 호출 -> 순서 상관없음
         // ajax 통신을 이용해서 3개의 데이터를 json으로 변경하여 insert 요청
         // ajax가 통신을 성공하고 서버가 json을 리턴해주면 자동으로 자바 오브젝트로 변환
         $.ajax({
             // 회원가입 수행 요청
             type: "POST",
             url: "Join.do",
             data: JSON.stringify(data), // http body 데이터
             contentType: "application/json; charset=utf-8", // body 데이터가 어떤 타입인지 (MIME)
             dataType: "json" // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 String(문자열), 만약 생긴게 json이라면 javascript 오브젝트로 변경
         }).done(function (resp) {
             // 결과가 정상이면 done 실행
             alert("회원가입이 완료되었습니다.");
             console.log(resp);
             location.href = "Join.do";
         }).fail(function (error) {
             // 실패하면 fail 실행
             alert("회원가입이 실패하였습니다.");
         });
     }
 }


 index.init();
	}); 
  </script>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet" href="css/font.css" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet">
<!-- Css Styles -->
<link rel="stylesheet" href="css/shopcart.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>




<%@ include file="header.jsp"%>
<body>

	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->

	<!-- Breadcrumb End -->



	<form action="#" class="checkout__form">
		<div class="col-lg-8">
			<h5
				style="font-weight: 700; font-size: 32px; font-family: 'Noto Sans'; margin-top: 50px; margin-left: 50px; border-bottom: white;">회원가입</h5>

			<div class="col-lg-12"
				style="font-family: 'Noto Sans'; margin-left: 120px; width: 100%; font-size: 20px;">
				<div class="checkout__form__input">
					<p>
						아이디 <span id="star">*</span>
					</p>
					<input type="text" style="width: 400px;" id="id" required>
				</div>
				<div class="checkout__form__input" style="width: 50%;">
					<p>
						비밀번호 <span id="star">*</span>
					</p>
					<input type="password" style="width: 400px;" id="password" required>
				</div>
				<div class="checkout__form__input">
					<p>
						이름 <span id="star">*</span>
					</p>
					<input type="text" style="width: 400px;" id="username" required>
				</div>
				<div class="checkout__form__input" style="width: 50%;">
					<p>
						이메일 <span id="star">*</span>
					</p>
					<input type="text"
						style="float: left; width: 400px; margin-right: 10px;" id="email"
						required>
				</div>
				<span style="display: inline; float: left; margin-top: 10px;">
					@ </span>

				<div class="checkout__form__input2">
					<select id="email_sel" name="email_sel"
						style="width: 400px; height: 50px;
	/* width: 100%; */ border: 1px solid #e1e1e1; border-radius: 2px; margin-bottom: 25px; font-size: 14px; padding-left: 10px; color: #666666; margin-left: 10px; float: left; display: inline;">
						<option>이메일 선택</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="nate.com">nate.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="empas.com">empas.com</option>
						<option value="freechal.com">freechal.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="korea.com">korea.com</option>
						<option value="hanmir.com">hanmir.com</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="paran.com">paran.com</option>
					</select>


				</div>

				<div class="checkout__form__input" style="width: 50%;">



					<p id="userphone">
						전화번호 <span id="star">*</span>
					</p>
					<input id="phone" name="phone" type="text"
						style="float: left; width: 400px;" required>
				</div>
				<button id="phoneChk" class="doubleChk"
					style="background: #D9D9D9; border-radius: 3px; font-size: 14px; color: #ffffff; font-weight: 500; border: none; text-transform: uppercase; display: inline-block; padding: 12px 30px; margin-left: 20px; float: left; width: 200px;">
					인증번호 발송</button>
				<div class="checkout__form__input" style="width: 50%;">
					<input id="phone2" type="text" name="phone2"
						style="float: left; width: 400px;" >
				</div>
				<button id="phoneChk2" class="doubleChk"
					style="background: #D9D9D9; border-radius: 3px; font-size: 14px; color: #ffffff; font-weight: 500; border: none; text-transform: uppercase; display: inline-block; padding: 12px 30px; margin-left: 20px; float: left; width: 200px;">
					본인인증</button>



				<button id="btn-save" class="site-btn"
					style="height: 50px; width: 200px; background: #D9D9D9; border-radius: 42px; margin-left: 900px; margin-bottom: 50px; margin-right: 50px;">가입하기
				</button>


			</div>
		</div>
	</form>


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
