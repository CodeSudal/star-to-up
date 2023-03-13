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
<title>회원가입</title>
<style type="text/css">



/* select {
	width: 200px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	background: url('img/arrow.png') no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

select::-ms-expand {
	display: none;
} */
#star {
	color: red;
}
.doubleChk {
background: #D9D9D9;
}

.doubleChk:hover {
background: black;
} 

.site-btn {
background: #D9D9D9;
}

.site-btn:hover {
background: black;
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



 	/* 알럿창 테스트 */
	/* function alertTest() {
		alert('alert 무한반복?')
	} */
	var idFlag = false;
	var pwFlag = false;
	var nameFlag = false;
	var emaFlag = false;
	var phoFlag = false;
	var pho2Flag = false;
	
	$(document).ready( function() {
						// input 요소에서 keyup 이벤트 발생 시 실시간으로 유효성 검사 수행
						$('input').on('keyup',
										function() {
											var idCheck = /^(?=.*[a-zA-Z])[-a-zA-Z0-9_.]{2,10}$/;
											var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
											var getName = RegExp(/^(?:[가-힣]{2,})+$/);
											/* 		  var getName= RegExp(/^[가-힣]+$/); */
											var emaCheck = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{5,15}$/;
											var phoCheck = /01[016789][^0][0-9]{3,4}[0-9]{4}/;

											var id = $('#id').val();
											var password = $('#password').val();
											var username = $('#username').val();
											var email = $('#email').val();
											const emailSel = $("#email_sel").val();
											var phone = $('#phone').val();
											var phone2 = $('#phone2').val();
											
											

											$('#id').on('input',
															function() {
																var id = $(this).val();
																var data = {
																		mId : id
																};
																console.log(id);
																$.ajax({
																	url : 'checkId.do',
																	type : 'POST',
																	contentType : 'application/json; charset=utf-8',
														              data :JSON.stringify(data),
																	success : function(response) {
																				if (id == '') {
																					$('#id_result').text('');
																					 idFlag = false;
																				} else if (id != ''&& !idCheck.test(id)) {
																					$('#id_result').text('아이디는 2-10자의 영문과 숫자와 일부 특수문자(._-)만 사용해야 합니다.');
																					$('#id_result').css('color','red');
																					 idFlag = false;
																				} else {
																					$('#id_result').text('사용하실 수 있는 아이디입니다.');
																					$('#id_result').css('color','green');
																					idFlag=true;
																					

																				}
																		if (response == 'duplicate') {
																			$('#id_result').text('중복된 아이디입니다. 다시 입력해주세요');
																					$('#id_result').css('color','red');
																					 idFlag = false;
																				}
																			},

																		});
															});

											if (password == '') {
												$('#pw_result').text('');
													pwFlag = false;

											} else if (password != ''&& !pwdCheck.test(password)) {
												$('#pw_result').text('비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.');
												$('#pw_result').css('color','red');
												pwFlag = false;

											} else {
												$('#pw_result').text('사용하실 수 있는 비밀번호입니다.');
												$('#pw_result').css('color','green');
												pwFlag=true;
												console.log('비번'+pwFlag);
											}
											if (username == '') {	
												$('#name_result').text('');
												nameFlag = false;

											} else if (username != ''&& !getName.test(username)) {
												$('#name_result').text('이름은 한글 2글자 이상 입력해야합니다.');
												$('#name_result').css('color','red');
												nameFlag = false;
											} else {
												$('#name_result').text('올바른 이름입니다.');
												$('#name_result').css('color','green');
												nameFlag=true;
											}

											// email input change event handler
											$('#email').on('input', function() {
												checkEmailDuplicate();
											});

											// email_sel change event handler
											$('#email_sel').on('change',function() { checkEmailDuplicate();});

											function checkEmailDuplicate() {
												var useremail1 = $('#email').val();
												console.log('zhsthfhdaskfadsn')
														
											var useremail2 = $('#email_sel').val();
														$.ajax({
															url : 'checkEmail.do',
															type : 'POST',
															data : {
															mEmail1 : useremail1,
															mEmail2 : useremail2
															},
															success : function(
																	response) {
																console.log(response);
																if(email==''){
																	$('#email_result').text('');
																	emaFlag = false;
																} else if (email != ''&& !emaCheck.test(email)) {
																	$('#email_result').text('이메일은 5-15자의 영문과 숫자만 사용해야 합니다.');
																	$('#email_result').css('color','red');
																	emaFlag = false;

																}
																else {
																	if (response == 'duplicate') {
																		$('#email_result').text('중복된 이메일입니다. 다시 작성해주세요.');
																		$('#email_result').css('color','red');
																		emaFlag = false;

																	}else{
																	$('#email_result').text('사용하실 수 있는 이메일입니다.');
																	$('#email_result').css('color','green');
																	emaFlag=true;
																	}

																}
															
															}
														});
											};

											

										 });
					});
	
	
	
	
	//전화번호 유효성 검사
	
	
	
	var code2 = '';
	
	function phoneCheck1 () {
		
	/* 	var phoCheck = /01[016789][^0][0-9]{3,4}[0-9]{4}/; */
	/*  var phoCheck = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g; */
		var phoCheck = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/; //하이픈(-)도 사용 가능한 정규식
		
		
		console.log('phoneCheck() 실')
		console.log('phone : ' + phone)
		console.log(phone.value)
		if (phone.value == '') {
			alert("번호를 입력해주세요.");
			phoFlag = false;

			
			
		} else if (!phoCheck.test(phone.value)) {
			alert('올바른 전화번호를 입력하세요.');
			phoFlag = false;

				
		} else {
			
			phoFlag=true;
			alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
			$("#phoneChk2").attr('disabled',false);
			$("#phoneChk").css('background','black');
			$("#phoneChk").attr('value','발송완료');
			$("#phoneChk").attr('disabled',true);
			var sendedPhone = $("#phone").val();
		
			$.ajax({
				type : "GET",	
				url : "phoneCheck.do?phone="+ sendedPhone,
				cache : false,
				success : function(data) { 
					console.log("인증번호:"+data)
					$("#phone2").attr('disabled',false);
					$("#phoneChk2").attr('disabled',false);
					$("#phoneChk2").css('display','inline-block');
					
					
						$('.doubleChk2').hover(function(){

							    $(this).css('background', 'black');   

							}, function(){
							   $(this).css('background','#D9D9D9'); 


							})
							
						
					$("#phone").attr('readonly',true);
					code2 = data;
					
				}
			});
			
		}
	};
	
	function phoneAuth () {
		event.preventDefault();
		console.log($("#phone2").val())
		if ($("#phone2").val() == code2) {
		/* 아침에 확인할 것
		1. 문자 잘 오는 지 확인 > 잘됨
		2. 문자와 인증번호와 일치하는 지/ 정규식 통과하는지 > 잘됨
		3. 서브밋..최종가입 > 민경확인! /확인완료시 해당 주석 삭제바람*/
			alert("인증번호가 일치합니다.");
		$('.doubleChk2').unbind('mouseenter mouseleave');
		pho2Flag=true;
			$("#phoneChk2").css('background','black');
			$("#phoneChk2").attr('value','인증완료');
			$("#phoneDoubleChk").val("true");
			$("#phone2").attr('disabled',true);
			$("#phoneChk2").attr('disabled',true);

			
		} else {
			pho2Flag = false;

			alert("인증번호가 일치하지 않습니다.")
			$("#phoneDoubleChk").val("false");
			$(this).attr("autofocus",true);
		}
		
		
	}
	function submitBtn () {
		
		if(!idFlag || !pwFlag || !nameFlag || !emaFlag || !phoFlag || !pho2Flag){
			console.log('ㄴㄴ 아직 값 다 안들어옴')
			alert('정확한 값을 입력해주세요.');
			
			
		}else{
			console.log('값 다들어옴~~')
			$('#btn-save').submit();
			
		
			
		}
	
	// 입력 값 전송
	
	
}
	

</script>





<%@ include file="header.jsp"%>
<body>


	<form action="join.do" method="POST" class="checkout__form">
		<div class="col-lg-8">
			<h5
				style="font-weight: 700; font-size: 32px; font-family: 'Noto Sans'; margin-top: 50px; margin-left: 50px; border-bottom: white;">회원가입</h5>

			<div class="col-lg-12"
				style="font-family: 'Noto Sans'; margin-left: 120px; width: 100%; font-size: 20px;">
				<div class="checkout__form__input">
					<p>
						아이디 <span id=star> *</span>
					</p>
					<input type="text"
						style="width: 400px; display: block; margin-bottom: 0;" id="id"
						name="mId" required> <span id="id_result"
						style="color: rgb(0, 128, 0); font-size: small;"></span>
				</div>
				<div class="checkout__form__input" style="margin-top: 10px;">
					<p>
						비밀번호 <span id=star> *</span>
					</p>
					<input type="password"
						style="width: 400px; display: block; margin-bottom: 0;"
						id="password" name="mPw" required> <span id="pw_result"
						style="color: rgb(255, 0, 0); font-size: small;"></span>
				</div>
				<div class="checkout__form__input" style="margin-top: 10px;">
					<p>
						이름 <span id=star> *</span>
					</p>
					<input type="text"
						style="width: 400px; display: block; margin-bottom: 0;"
						id="username" name="mName" required> <span
						id="name_result" style="color: rgb(255, 0, 0); font-size: small;"></span>
				</div>
				<div class="checkout__form__input" style="margin-top: 10px;">
					<p>
						이메일 <span id=star> *</span>
					</p>
					<input type="text"
						style="float: left; width: 400px; margin-right: 10px; display: inline-block; margin-bottom: 10px;"
						id="email" name="mEmail1" required> <span
						style="display: inline-block; float: left; margin-top: 10px;">
						@ </span> <select id="email_sel" name="mEmail2" required
						style="width: 400px; height: 50px;
	/* width: 100%; */ border: 1px solid #e1e1e1; border-radius: 2px; margin-bottom: 10px; font-size: 14px; padding-left: 10px; color: #666666; margin-left: 10px; float: left; display: block; margin-bottom: 10px;">
						<option selected disabled>이메일 선택</option>
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
				<span id="email_result"
					style="font-size: small; display: block; float: left; width: 100%;"></span>




				<div class="checkout__form__input" style="display: block;">



					<p id="pho"
						style="width: 100%; display: block; float: left; margin-top: 20px;">
						전화번호 <span id=star> *</span>
					</p>
					<input id="phone" name="mNum" type="text"
						style="float: left; width: 400px;" required>
				</div>
				<input type="button" id="phoneChk" class="doubleChk"
					onclick="phoneCheck1()"
					style="border-radius: 3px; font-size: 14px; color: #ffffff; font-weight: 500; border: none; text-transform: uppercase; display: inline-block; padding: 12px 30px; margin-left: 20px; float: left; width: 200px;"
					value="인증번호 발송">

				<div class="checkout__form__input" style="width: 50%;">
					<input id="phone2" type="text" name="phone2"
						style="float: left; width: 400px;" required disabled>
				</div>
				<input type="button" id="phoneChk2" class="doubleChk2"
					onclick="phoneAuth()" disabled
					style="background: #D9D9D9; border-radius: 3px; font-size: 14px; color: #ffffff; font-weight: 500; border: none; text-transform: uppercase; display: inline-block; padding: 12px 30px; margin-left: 20px; float: left; width: 200px;"
					value="본인인증"> 


				<button   id="btn-save" class="site-btn" onclick="submitBtn(); return false;"
					
					style="height: 50px; width: 200px;  border-radius: 42px; margin-left: 900px; margin-bottom: 50px; margin-right: 50px;">가입하기
				</button>
				<!-- <button onclick="alertTest()">alertTest</button> -->

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