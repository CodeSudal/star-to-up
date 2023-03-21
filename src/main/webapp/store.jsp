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
<title>STU STORE</title>
<!-- 파비콘 삽입 -->
<link rel="icon" href="img/StarToUp_Logo.png">

<!-- Google Font -->
<!--<link rel="stylesheet" href="css/font.css" type="text/css">-->
<link
   href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
   rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/swipe.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
 
 <!-- jQuery 라이브러리 참조 -->
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--쿠키 plugin 참조 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

 <style>
     .modalheader {
   padding-top: 20px;
   text-align: center;
   font-size:20px;
   background: transparent;
   cursor: default;
   margin-bottom:20px;
}

.modalheader:hover {
   cursor: move;
}

.modalheader img {
   max-width: 300px;
   max-height: 300px;
  
  

 }

.modalwrap {
   position: absolute;
   top: 15%;
   left: 60%;
   width: 380px;
   height:515px;
   /*transform: translate(-50%, -50%);*/
   box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.5);
   overflow: hidden;
   z-index: 1000;
   background-color: black;
   /*border-radius: 1rem;*/
   /*box-shadow: 10px 10px 30px 0px black;*/
   padding: 5px;
}

.modalImg img {
    
   max-height: 150px;
}

/*.modalwrap div {
   color: black;
   line-height: unset;
}
*/

.modalwrap button {
   outline: 0;
   font-size: 15px !important;
   border: 0px;
   background-color: transparent;
   line-height: unset;
   font-size: 12px;
   margin: 0;
   border-radius: 10px;
   padding: 0 10px;
}
        
  
  </style>
  
  



</head>

<body style="background: #F5F5F7;">
   <!-- Header Section Start -->
   <%@ include file="header.jsp"%>
   <!-- Header Section End -->

   <!-- 팝업창 띄울지 여부 파악 -->
   <c:if test="${!bool}">
         <script type="text/javascript">
       $(document).ready(function() {
               var con = document.getElementById("popup");    
                   con.style.display = 'block';    
       });
       
       
      
       
       
       
      </script>
   </c:if>
 
   <!-- 팝업창 -->
    <div class="modalwrap" id="popup" style="display:none;">
      <div class="modalheader">
         <img src="img/new.png" />
      </div>
     <div class="modalImg" style="text-align: center; ">
         <a id="popup-link" href="detail.do?pNum=${last.pNum}" target="_blank"> 
         <img src="img/${last.pImage1}" />
         </a>
      </div> 
      <div class="modalName" style="text-align: center; padding-top: 20px; ">
         <h1 style="color:white; font-weight: bold; font-size:50px;">${last.pEN}</h1>
         <h5 style="color:#FFFFFF; opacity: 0.5;">STAR TO UP</h5>
      </div>
     
      <div
         style="display: flex; justify-content: space-between; padding-top: 20px; margin-top:5%; ">
         <label style="display: flex; padding-left: 20px; color:white;">오늘 하루 이 창 보지 않기
            <input type="checkbox" id="nopopup" style="margin-left: 5px" />
         </label>
         <button class="modal-close" onClick="popClose()" style="color:white; padding-right: 20px; ">닫기</button>
      </div>
   </div>
   
   
    <!-- 팝업창 샘플 -->
    <!-- 
    <div class="modalwrap" id="popup">
      <div class="modalheader">
         <img src="img/new.png" />
      </div>
      <div class="modalImg" style="text-align: center; ">
         <a id="popup-link" href="" target="_blank"> 
         <img src="img/jupiter1.png" />
         </a>
      </div> 
      <div class="modalName" style="text-align: center; padding-top: 20px; ">
         <h1 style="color:white; font-weight: bold; font-size:50px;">Jupiter</h1>
      </div>
      <div
         style="display: flex; justify-content: space-between; padding-top: 10px; margin-top:5%; ">
         <label style="display: flex; padding-left: 20px; color:white;">오늘 하루 이 창 보지 않기
            <input type="checkbox" id="nopopup" style="margin-left: 5px" />
         </label>
         <button class="modal-close" onClick="popClose()" style="color:white; padding-right: 20px; ">닫기</button>
      </div>
   </div>
    -->
    
   <div class="breadcrumb__links"
      style="padding-top: 50px; padding-left: 5%;">
      <span
         style="font-size: 30px; font-weight: 700; color: #000; margin-bottom: 5px;">STORE</span>
   </div>

   <!-- Swipe Begin -->
   <swiper-container class="mySwiper" pagination="true"
      pagination-clickable="true" space-between="20" slides-per-view="4" pagination-type="fration" >
      <c:forEach var="product" items="${productList}">
         <swiper-slide>
            <div id="${product.pNum}">
               <div class="swiper-top" style="margin-right: 100px;">${product. pEN}</div>
               <div>
                  <a href="detail.do?pNum=${product.pNum}"><img class="swiper-image" src="img/${product.pImage1}" alt="${product. pEN}이미지"></a>
               </div>
              
                 <c:choose>
                                 <c:when test="${product.pFinish ==0}">
                                    <div class="swiper-bottom">
                  ￦ <fmt:formatNumber value="${product.pPrice}" />
                  <button id="funding"class="swiper-button" onclick="location.href='detail.do?pNum=${product.pNum}'">펀딩하기</button>
               </div>
                                 </c:when>   
                                 <c:otherwise>
                                     
                                
                                <div class="swiper-bottom">
                  ￦ <fmt:formatNumber value="${product.pPrice}" />
                  <button id="funding"class="swiper-button" onclick="location.href='detail.do?pNum=${product.pNum}'" style="background:#D9D9D9; border:none;">펀딩 완료</button>
               </div>
                                 </c:otherwise>
                                 </c:choose>
            </div>
         </swiper-slide>
      </c:forEach>
      
      <!-- 샘플 데이터 -->
      <!-- <swiper-slide>
      <div>
         <div class="swiper-top" style="margin-right: 100px;">Sun</div>
         <div>
            <img class="swiper-image" src="./img/sun.png" alt="태양">
         </div>
         <div class="swiper-bottom">
            ￦ 9.000.000.000
            <button class="swiper-button">펀딩하기</button>
         </div>
      </div>
      </swiper-slide>
      <swiper-slide>
      <div>
         <div class="swiper-top">Mercury</div>
         <div>
            <img class="swiper-image" src="./img/mercury.png" alt="수성">
         </div>
         <div class="swiper-bottom">
            ￦ 8.000.000.000
            <button class="swiper-button">펀딩하기</button>
         </div>
      </div>
      </swiper-slide>
      <swiper-slide>
      <div>
         <div class="swiper-top">Venus</div>
         <div>
            <img class="swiper-image" src="./img/venus.png" alt="금성">
         </div>
         <div class="swiper-bottom">
            ￦ 7.000.000.000
            <button class="swiper-button">펀딩하기</button>
         </div>
      </div>
      </swiper-slide>
      <swiper-slide>
      <div>
         <div class="swiper-top">Earth</div>
         <div>
            <img class="swiper-image" src="./img/earth.png" alt="지구">
         </div>
         <div class="swiper-bottom">
            ￦ 6.000.000.000
            <button class="swiper-button">펀딩하기</button>
         </div>
      </div>
      </swiper-slide>
      <swiper-slide>
      <div>
         <div class="swiper-top">Mars</div>
         <div>
            <img class="swiper-image" src="./img/mars.png" alt="화성">
         </div>
         <div class="swiper-bottom">
            ￦ 5.000.000.000
            <button class="swiper-button">펀딩하기</button>
         </div>
      </div>
      </swiper-slide>
      <swiper-slide>
      <div>
         <div class="swiper-top">Jupiter</div>
         <div>
            <img class="swiper-image" src="./img/jupiter.png" alt="목성">
         </div>
         <div class="swiper-bottom">
            ￦ 4.000.000.000
            <button class="swiper-button">펀딩하기</button>
         </div>
      </div>
      </swiper-slide>
      <swiper-slide>
      <div>
         <div class="swiper-top">Saturn</div>
         <div>
            <img class="swiper-image" src="./img/saturn.png" alt="토성">
         </div>
         <div class="swiper-bottom">
            ￦ 3.000.000.000
            <button class="swiper-button">펀딩하기</button>
         </div>
      </div>
      </swiper-slide>
      <swiper-slide>
      <div>
         <div class="swiper-top">Uranus</div>
         <div>
            <img class="swiper-image" src="./img/uranus.png" alt="천왕성">
         </div>
         <div class="swiper-bottom">
            ￦ 2.000.000.000
            <button class="swiper-button">펀딩하기</button>
         </div>
      </div>
      </swiper-slide>
      <swiper-slide>
      <div>
         <div class="swiper-top">Neptune</div>
         <div>
            <img class="swiper-image" src="./img/neptune.png" alt="해왕성">
         </div>
         <div class="swiper-bottom">
            ￦ 1.000.000.000
            <button class="swiper-button">펀딩하기</button>
         </div>
      </div>
      </swiper-slide> -->
   </swiper-container>
   <!-- Swipe End -->

   <footer class="footer">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="footer__copyright__text">
                  <p>Copyright &copy; 2023 All rights reserved | Refact by CTRL</p>
               </div>
            </div>
         </div>
      </div>
   </footer>
   <!-- Footer Section End -->

   <!-- Js Plugins -->
   <script
      src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
   <script src="js/package.json"></script>
   <script src="js/sandbox.config.json"></script>
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
   <script
      src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>

<!-- 팝업창 이동 JS -->      
<script>   
const wrap = document.querySelector(".modalwrap");
const header = document.querySelector(".modalheader");

let lastX = 0;
let lastY = 0;
let startX = 0;
let startY = 0;

header.addEventListener("mousedown", function (e) {
    e.preventDefault();
    startX = e.clientX;
    startY = e.clientY;

    document.addEventListener("mouseup", onRemoveEvent);

    document.addEventListener("mousemove", onMove);
});

function onRemoveEvent() {
    document.removeEventListener("mouseup", onRemoveEvent);
    document.removeEventListener("mousemove", onMove);
}

function onMove(e) {
    e.preventDefault();
    lastX = startX - e.clientX;
    lastY = startY - e.clientY;

    startX = e.clientX;
    startY = e.clientY;

    wrap.style.top = wrap.offsetTop - lastY + "px";
    wrap.style.left = wrap.offsetLeft - lastX + "px";
}

//팝업창 닫기 JS
function popClose() { 
    wrap.style.display = "none";
    
  //체크박스에 체크를 했다면 "nopopup"쿠키 생성됨.
    if ($('#nopopup').is(":checked")){
         console.log('들어왔니');
        // 쿠키값을 "Y"로 하여 하루동안 저장시킴
       // $.cookie("nopopup", "Y", {
       //     expires : 1
       // });
       setCookie( "nopopup", "Y" , 1 ); //쿠키를 생성함
      
}
  
}

//팝업 생성 JS
function setCookie( name, value, expiredays ){
var todayDate = new Date();
todayDate.setDate( todayDate.getDate() + expiredays );
document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}


</script>
      
      
      
</body>
</html>