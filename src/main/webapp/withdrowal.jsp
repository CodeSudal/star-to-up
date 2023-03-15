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
<title>STU LOGIN</title>

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

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>
   var pwFlag = false;
   
$(document).ready( function() {
      
   
   $('input').on('keyup',
         function() {
   
   if($('#pwChk').val()==''){
      
      $("#ok").attr('disabled',true);
      
   
      
   }else{
      $("#ok").attr('disabled',false);
      
      $('#ok').hover(function(){

          $(this).css('background', 'black');   

      }, function(){
         $(this).css('background','#D9D9D9'); 


      })
   
   }
   });
      
      
   $("#ok").on("click", function(){
      var password = $('#pwChk').val();
      console.log(password);
      $("#ok").css('background','black');
      $.ajax({
         url : "pwChk.do",
         type : "POST",
         dataType : "json",
         data : {mPw:password},
         success: function(data){
            console.log(data);
            
            if(data == "0"){
               alert('비밀번호가 틀렸습니다.');
               $("#pwChk").focus();
               return;
            }else{
               if(confirm("회원탈퇴하시겠습니까?")){
                  location.href="deleteMember.do";
                  $("#ok").submit();
               }else{
                  $("#pwChk").attr('value','');
                  location.href="#";
               }
               
            }
         }
      })
   });
      
   

   
   })

   

</script>

<%@ include file="header.jsp"%>


<body>


















   <div class="breadcrumb__links">
      <span
         style="margin-left: 5%; margin-top: 5%; font-weight: 800; font-size: 35px; color: black; ont-weight: 700; font-size: 32px; font-family: 'Noto Sans'; margin-top: 50px; margin-left: 50px;">회원탈퇴</span>
   </div>
   <!-- Login Section Begin -->


   <section class="contact spad" style="padding-top: 30px;">
      <div class="contact__content">
         <div class="contact__form">
            <div style="">
                  <span
                     style="margin-left: 33%; font-size: 15px; display: block; margin-bottom: 10px; font-family: 'Noto Sans'; margin-top: 120px; font-weight: 500;">아이디</span><input
                     type="text" name="mId" id="idInput" value="${member.mId}"
                     style="margin-top: 1px; border-radius: 5px; width: 41%;  display: block; margin-left: 33%; border: 1px solid #D9D9D9; border-radius: 3px; margin-bottom: 40px; height: 50px; width: 34%; padding-left: 20px; font-size: 14px; color: #444444;"
                     readonly> <span
                     style="margin-left: 33%; font-size: 15px; display: block; margin-bottom: 10px; font-family: 'Noto Sans'; font-weight: 500;">비밀번호를
                     입력해 주세요.</span><input type="password" name="mPw" id="pwChk"
                     style="margin-top: 1px; border-radius: 5px; width: 41%;  display: block; margin-left: 33%; font-weight: 600; margin-bottom: 10px; font-family: 'Noto Sans'; height: 50px; width: 34%; padding-left: 20px; font-size: 14px; color: #444444; border: 1px solid #e1e1e1; border-radius: 10px; border: 1px solid #D9D9D9; border-radius: 3px;"
                     required> <span
                     style="font-size: 15px; display: block; margin-bottom: 40px; font-family: 'Noto Sans'; color: #FF5858; text-align: center; font-weight: 500;">회원
                     탈퇴 시 모든 펀딩 데이터가 삭제됩니다.</span><input type="submit" class="cart-btn"
                     id="ok" 
                     style="height:50px; border: 1px solid #D9D9D9; background-color: #D9D9D9; color: white; width: 16%; text-align: center; margin-left: 33%; border-radius: 8px; /* padding-right: 5%; */ font-size: 15px; font-weight: 600; font-family: 'Noto Sans'; padding-left: 0; padding-right: 0;"
                     value="탈퇴하기" disabled> <input type="submit" class="cart-btn"
                     id="no" onclick="location.href='store.do'"
                     style="height:50px; border: 1px solid #D9D9D9; background-color: black; color: white; width: 16%; text-align: center; margin-left: 2%; border-radius: 8px; /* padding-right: 5%; */ font-family: 'Noto Sans'; font-size: 15px; font-weight: 600; padding-left: 0; padding-right: 0;"
                     value="메인으로">


            </div>
         </div>
      </div>


   </section>
   <!-- Login Section End -->






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

   <!-- 로그인 버튼 활성화 JS -->
















</body>
</html>