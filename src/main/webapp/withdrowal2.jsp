<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>STU SIGNOUT</title>

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
<link rel="stylesheet" href="css/font.css" type="text/css">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>
<link rel="stylesheet" href="css/font.css" type="text/css">
<link
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
   rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/header.css" type="text/css">
</head>

<!-- Css Styles -->

   <link rel="stylesheet" href="css/font.css" type="text/css">
   <link
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
      rel="stylesheet">
   <!-- Css Styles -->

   <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
   <link rel="stylesheet" href="css/style.css" type="text/css">
   <link rel="stylesheet" href="css/header.css" type="text/css">

<%@ include file="header.jsp"%>


<body>

   <div class="breadcrumb__links">
      <span
         style="margin-left: 5%; margin-top: 5%; font-weight: 800; font-size: 35px; color: black; ont-weight: 700; font-size: 32px; font-family: 'Noto Sans'; margin-top: 50px; margin-left: 50px;">회원탈퇴</span>
   </div>
   
   
   <!-- SIGNOUT Section Begin -->
   <section class="contact spad" style="padding-top: 30px;">
      <div class="contact__content">
         <div class="contact__form">
            <div style="">
                  <span
                     style="margin-left: 33%; font-size: 15px; display: block; margin-bottom: 10px; font-family: 'Noto Sans'; margin-top: 120px; font-weight: 500;">이름</span><input
                     type="text" name="mName" id="idInput" value="${member.mName}"
                     style="margin-top: 1px; border-radius: 5px; width: 41%;  display: block; margin-left: 33%; border: 1px solid #D9D9D9; border-radius: 3px; margin-bottom: 40px; height: 50px; width: 34%; padding-left: 20px; font-size: 14px; color: #444444;"
                     readonly> <span
                     style="margin-left: 33%; font-size: 15px; display: block; margin-bottom: 10px; font-family: 'Noto Sans'; font-weight: 500;">이메일
                     </span><input type="text" name="mEmail" id="pwChk" value="${member.mEmail1}@${member.mEmail2}"
                     style="margin-top: 1px; border-radius: 5px; width: 41%;  display: block; margin-left: 33%; font-weight: 600; margin-bottom: 10px; font-family: 'Noto Sans'; height: 50px; width: 34%; padding-left: 20px; font-size: 14px; color: #444444; border: 1px solid #e1e1e1; border-radius: 10px; border: 1px solid #D9D9D9; border-radius: 3px;"
                     readonly> <span
                     style="font-size: 15px; display: block; margin-bottom: 40px; font-family: 'Noto Sans'; color: #FF5858; text-align: center; font-weight: 500;">회원
                     탈퇴 시 모든 펀딩 데이터가 삭제됩니다.</span>
                     <input type="button" class="cart-btn" 
                     style="height:50px; border: 1px solid #D9D9D9; background-color: black; color: white; width: 16%; text-align: center; margin-left: 33%; border-radius: 8px; /* padding-right: 5%; */ font-size: 15px; font-weight: 600; font-family: 'Noto Sans'; padding-left: 0; padding-right: 0;"
                     value="탈퇴하기" onclick="javascript:kakaoDelete()"> <input type="submit" class="cart-btn"
                     id="no" onclick="location.href='store.do'"
                     style="height:50px; border: 1px solid #D9D9D9; background-color: black; color: white; width: 16%; text-align: center; margin-left: 2%; border-radius: 8px; /* padding-right: 5%; */ font-family: 'Noto Sans'; font-size: 15px; font-weight: 600; padding-left: 0; padding-right: 0;"
                     value="메인으로">


            </div>
         </div>
      </div>


   </section>
   <!-- SIGNOUT Section End -->






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
   <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

   <!-- 카카오 연결끊기 -->
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <script type="text/javascript">
		
   		// SDK를 초기화 합니다. 사용할 앱 키(javascript 키) 입력합니다.
	 	 window.Kakao.init('3d08dd963da5d6d0d9d5aed059ea3d21');
   		// SDK 초기화 여부를 판단합니다. true가 나온다면 정상 작동
   		console.log(Kakao.isInitialized());
   		
   	 /*카카오 연결끊기*/
        function kakaoDelete() { //탈퇴 버튼 클릭시 실행될 함수
           if (Kakao.Auth.getAccessToken()) {
              console.log(Kakao.Auth.getAccessToken())
              Kakao.API.request({
                 url : '/v1/user/unlink', // --> 탈퇴시 url
                 success : function(response) {
                    console.log(response)
                    console.log('카카오 연결끊기 성공');
                    location.href = '${pageContext.request.contextPath}/deleteMember.do';
                    
                 },
                 fail : function(error) {
                	 console.log('카카오 연결끊기 실패'); 
                    console.log(error)
                 },
              })
              Kakao.Auth.setAccessToken(undefined)
           }
        }
        /*  카카오연결끊기 end */


   
   </script>   
   
   
















</body>
</html>