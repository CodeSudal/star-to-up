<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="description" content="Ashion Template" />
        <meta name="keywords" content="Ashion, unica, creative, html" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>STU DETAILS</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet" />
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
            rel="stylesheet"
        />

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css" />
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css" />
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css" />
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        
        <style>
           
           
            h3 {
                display: inline;
                font-size: 44px;
            }
            
            #heartNot {
                background-color: rgb(215,215,215);
            }
            
            #heartNot:hover {
               background-color:black;
               cursor: pointer;
            }
            
            #heartIng {
                background-color:black;
            }
            
            #heartIng:hover {
               background-color:rgb(215,215,215);
               cursor: pointer;
            }

            @keyframes progressAnimationStrike {
                from {
                    width: 0;
                }
                to {
                    width: 100%;
                }
            }
            .progress2 {
                border-radius: 30px;
                background: rgb(215,215,215);
                box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(225, 225, 225, 0.08);
            }

            .progress-bar2 {
                height: 25px;
                border-radius: 30px;
                background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0.05));
                transition: 0.4s linear;
                transition-property: width, background-color;
            }

            .progress-moved .progress-bar2 {
                background-color: black;
                animation: progressAnimation 3s;
            }

            @keyframes progressAnimation {
                0% {
                    width: 5%;
                    background-color: black;  
                }
                100% {
                    background-color: black;
                }
            }
          
            @keyframes colorAnimation {
                0% {
                    background-image: linear-gradient(to right, #4cd964, #5ac8fa, #007aff, #7dc8e8, #5856d6, #ff2d55);
                }
                20% {
                    background-image: linear-gradient(to right, #5ac8fa, #007aff, #7dc8e8, #5856d6, #ff2d55, #4cd964);
                }
                40% {
                    background-image: linear-gradient(to right, #007aff, #7dc8e8, #5856d6, #ff2d55, #4cd964, #5ac8fa);
                }
                60% {
                    background-image: linear-gradient(to right, #7dc8e8, #5856d6, #ff2d55, #4cd964, #5ac8fa, #007aff);
                }
                100% {
                    background-image: linear-gradient(to right, #5856d6, #ff2d55, #4cd964, #5ac8fa, #007aff, #7dc8e8);
                }
            }
        </style>
    </head>

    <body>
        <!-- Header Section Begin -->
        <%@ include file="header.jsp" %>
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <span style="font-weight: bold; font-size: 50px; color: black">${data. pEN}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->
      
        <!-- Product Details Section Begin -->
        <section class="product-details spad" style="margin-left:5%; padding-top:20px; !important" >
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                       
                       
                        <div class="product__details__pic">
                        
                           <!-- 상품이미지 샘플 -->
                            <!-- 
                            <div class="product__details__pic__left product__thumb " style="width:15%; margin-top:5%; " >
                                    <img  class="small_img"  src="img/shop-cart/venus1.png" alt="이미지1" style="cursor:pointer;"/>
                                     <br/><br/><br/>
                                    <img class="small_img"  src="img/shop-cart/venus2.png" alt="이미지2" onerror="this.style.display='none'" style="cursor:pointer;" />
                                    <br/><br/><br/>
                                    <img  class="small_img" src="img/shop-cart/venus3.png" alt="이미지3" onerror="this.style.display='none'" style="cursor:pointer;" />
                            </div>
                            <div class="product__details__slider__content" style="margin-left:10%;">
                                    <img
                                       data-hash=""
                                       id="big_img"
                                        class="product__big__img"
                                        src="img/shop-cart/Jupiter.png"
                                        alt="선택이미지"
                                        style="width: 80vw; height:80hw; "
                                    />
                            </div>
                            -->
                             
                            <!-- 상품이미지 -->
                           
                            <div class="product__details__pic__left product__thumb " style="width:15%; margin-top:5%; " >
                                    <img  class="small_img"  src="img/${data.pImage1}" alt="이미지1" style="cursor:pointer;"/>
                                     <br/><br/><br/>
                                    <img class="small_img"  src="img/${data.pImage2}" alt="이미지2" onerror="this.style.display='none'" style="cursor:pointer;" />
                                    <br/><br/><br/>
                                    <img  class="small_img" src="img/${data.pImage3}" alt="이미지3" onerror="this.style.display='none'" style="cursor:pointer;" />
                            </div>
                            <div class="product__details__slider__content" style="margin-left:10%;">
                                    <img
                                       data-hash=""
                                       id="big_img"
                                        class="product__big__img"
                                        src="img/${data.pImage1}"
                                        alt="선택이미지"
                                        style="width: 80vw; height:80hw; "
                                    />
                            </div>
                          
                          
                        </div>
                    </div>
                   
                    <!-- 상품데이터 --> 
                      <div class="col-lg-6">
                        <div class="product__details__text" style="margin-left: 5%">
                            <h3 style="font-weight: bold; font-size:40px;"><span style="font-size: 17px">개인금액</span>${data.pPrice}</h3>
                            <span style="font-size: 20px">원</span> 
                            <br />
                             <h3 style="font-weight: bold; font-size:40px;"><span style="font-size: 17px; margin-top:3%;">전체금액</span>${data.pAmount}</h3>
                            <span style="font-size: 20px">원 </span> 
                            <br />
                             <h3 style="font-weight: bold; font-size:40px;"><span style="font-size: 17px; margin-top:3%;">모인금액</span>${data.pCRNAmount}</h3>
                            <span style="font-size: 20px">원</span> &nbsp
                            <div style="display: inline; font-weight: bold; font-size: 32px">${data.pPercent}%</div>
                            <br />
                            <div class="progress2 progress-moved" style="width: 80%">
                                <div class="progress-bar2" style="width:${data.pPercent}%"></div>
                            </div>
                             <br />
                            <h3 style="font-weight: bold; font-size:40px;"><span style="font-size: 17px; margin-top:-1%;  ">후원자</span>${list.lNum}</h3>
                            <span style="font-size: 20px">명</span> 
                            <br /><br />
                            <div class="product__details__button" style="display: flex; flex-direction:row; justify-content: left;">
                              <c:choose>
                                 <c:when test="${data.pFinish ==0}">
                                    <div style="width:40%;">
                                    <button  
                                        id="buying" 
                                        class="cart-btn"
                                        style="width:100%; height:80%; background-color: black; border:none;  display: inline-flex; justify-content : center; font-size: 28px;"
                                       >
                                      펀딩하기</button>
                                     </div>
                                 </c:when>   
                                 <c:otherwise>
                                    <div style="width:40%;">
                                   <button
                                       id="finish"
                                       class="cart-btn"
                                       style=" width:100%; height:80%; background-color: rgb(215,215,215); border:none;  display: inline-flex; justify-content : center; font-size: 28px;"
                                      >
                                    펀딩완료</button>
                                </div>  
                                 </c:otherwise>
                              </c:choose>
                               <c:choose>
                                  <c:when test="${data.pFinish ==0 && not empty isMylike}">
                                         <div id="heartIng" style=" margin-left:2%; margin-top:1%; width:50px; height:50px; border-radius:50%; display:flex; justify-content: center; ">
                                                <img  alt="찜했음" src="img/heart.png"
                                                  style="width: 20px; height: 20px; margin-left:2%;margin-top:30%; z-index:1;  ">
                                       </div>
                                  </c:when>
                                  <c:when test="${data.pFinish ==0 && empty isMylike}">
                                          <div id="heartNot" style=" margin-left:2%; margin-top:1%; width:50px; height:50px; border-radius:50%; display:flex; justify-content: center; ">
                                                <img  alt="찜안했음"  src="img/heart.png"
                                                   style="width: 20px; height: 20px; margin-left:2%;margin-top:30%; z-index:1;  ">
                                       </div>
                                   </c:when>
                                   <c:otherwise>
                                   </c:otherwise>         
                                 </c:choose>
                                 <c:choose>
                                   <c:when test="${data.pFinish ==0}">
                                       <div class="kakaosharing" style="cursor: pointer; background-color: black; margin-left:2%; margin-top:1%; width:50px; height:50px; border-radius:50%; display: flex; justify-content: center;">
                                       <a href="javascript:kakaoShare()"> <img  alt="카카오공유"  src="img/sharing.png"
                                             style="width: 25px; height: 25px; margin-top:43%;margin-right:6%; z-index:1;  "> </a>
                                       </div>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>   
                                 </c:choose>
                                 
                             
                            </div>
                        </div>
                    </div>
                 
                    
               
                   <!--   샘플로 해놓은 것  -->
                   <!--                      
                   <div class="col-lg-6">
                        <div class="product__details__text" style="margin-left: 5%; margin-top:-5%;">
                            <h3 style="font-weight: bold; font-size:40px;"><span style="font-size: 17px">개인금액</span>200,000</h3>
                            <span style="font-size: 20px">원</span> 
                            <br />
                            <h3 style="font-weight: bold; font-size:40px;"><span style="font-size: 17px; margin-top:3%;">전체금액 </span>2,500,000</h3>
                            <span style="font-size: 20px">원 </span> 
                            <br />
                            <h3 style="font-weight: bold; font-size:40px;"><span style="font-size: 17px; margin-top:3%;">모인금액</span>50,000</h3>
                            <span style="font-size: 20px">원</span> &nbsp
                            <div style="display: inline; font-weight: bold; font-size: 35px">50%</div>
                            <br />
                            <div class="progress2 progress-moved" style="width: 80%">
                                <div class="progress-bar2" style="width:50%"></div>
                            </div>
                             <br />
                            <h3 style="font-weight: bold; font-size:40px;"><span style="font-size: 17px; margin-top:-1%;  ">후원자</span>1,000</h3>
                            <span style="font-size: 20px">명</span> 
                            <br /><br />
                            <div class="product__details__button" style="display: flex; flex-direction:row; justify-content: left;">
                         <div style="width:40%;">
                                    <button  
                                        id="buying" 
                                        class="cart-btn"
                                        style="width:100%; height:80%; background-color: black; border:none;  display: inline-flex; justify-content : center; font-size: 28px;"
                                       >
                                      펀딩하기</button>
                                     </div>
                                <div id="heartNot" style="background-color: rgb(215,215,215); margin-left:2%; margin-top:1%; width:50px; height:50px; border-radius:50%; display:flex; justify-content: center; ">
                                       <img  alt="찜"
                                    src="img/heart.png"
                                    style="width: 20px; height: 20px; cursor: pointer; margin-left:2%;margin-top:30%; z-index:1;  ">
                                 </div>
                               
                                  <div style="background-color: black; margin-left:2%; margin-top:1%; width:50px; height:50px; border-radius:50%; display: flex; justify-content: center;">
                                     <a href="javascript:kakaoShare()"> <img  alt="카카오공유"
                                    src="img/sharing.png"
                                    style="width: 25px; height: 25px; cursor: pointer;margin-top:43%;margin-right:6%; z-index:1;  "> </a>
                                 </div>
                                 
                            </div>
                        </div>
                    </div>
                    -->
                  
                    <!-- 상품상세정보(글) -->
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Detail</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <p>
                                        ${data.pInfo}
                                    </p>
                                    
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
               
            </div>
        </section>
        <!-- Product Details Section End -->

        
       

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
        
        <script src="https://code.jquery.com/jquery-3.6.3.min.js"
      integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
      crossorigin="anonymous">
   </script>
   
   <!-- 사진이미지 변경 JS -->
   <script type="text/javascript">
   
    var bImg = document.querySelector('#big_img'); //큰 이미지 가져오기
     var sImg = document.querySelectorAll('.small_img'); //작은 이미지들 노드 리스트로 가져옴
      
     for(var i = 0; i < sImg.length; i++) {
         sImg[i].onclick = showImg;  //노드를 클릭하면 showImg 함수 실행
     }

     function showImg() {
        console.log('showImg들어욤')
       
         var newImg = this.src; //클릭 이벤트가 발생한 대상의 src 속성 값을 가져옴
         console.log('newImg:'+newImg);
         bImg.setAttribute('src', newImg);  //newImg 값을 큰 이미지의 src 속성 값에 할당
         
     }

   </script>
   
   <!-- 찜 버튼 JS -->
   <script type="text/javascript">
   $(document).ready(function(){
      
      //찜 추가 JS
      $("#heartNot").on("click",function(){
         
         //로그인을 안 한 상태였을 시
         if ("${member.mId}" == "") {
                if (confirm("로그인 한 회원만 이용 가능합니다. 로그인하시겠습니까?")) {
                    // 승낙하면 로그인 페이지로 이동
                    location.href = '${pageContext.request.contextPath}/login.do';
                } else {
                    // 거부하면 해당 페이지 그대로
                   history.back();
                }
            // 로그인 상태시 찜하기 버튼을 누르면    
            } else {
         
         var mlPid = '${data.pNum}';
         var mlMid = '${member.mId}';
         console.log('mlPid:'+mlPid+"/mlMid:"+mlMid);
         
         var data = {
            mlPid : mlPid,   
            mlMid : mlMid   
         };
   
         $.ajax({
            
            url: '${pageContext.request.contextPath}/heart.do',
            type:'POST',
            contentType : 'application/json; charset=utf-8',
              data :JSON.stringify(data),
              success : function(resp) {
                   if (resp == 'success') {
                       console.log("찜하기 성공!");
                       if (confirm("해당 상품을 찜하셨습니다. 찜목록 페이지로 이동하시겠습니까?")) {
                            // 승낙하면 찜목록페이지로 이동
                            location.href = '${pageContext.request.contextPath}/shopcart.do';
                        } else {
                            // 거부하면 해당 페이지 새로고침하여 찜한거 반영되게하기(HTTP의 속성 때문)
                            location.reload();
                        }
                   }
                   else{
                      console.log('찜하기 실패!');
                      alert('찜하기를 할 수 없습니다. 관리자에게 문의해주세요.');
                      location.reload();
                   }
              
             },
             error : function(e) {
               console.log('오류발생')
                   console.log(e);
                   alert('찜하기를 할 수 없습니다. 관리자에게 문의해주세요.');
                   location.reload(); // 실패시 새로고침하기   
             }
         });
        
            }   
      });
      
      //찜하기 취소 JS
      $("#heartIng").on("click",function(){
         console.log('취소할거니');
         
         var mlNum='${isMylike.mlNum}';
         console.log('isMylike.mlNum:'+mlNum);
         
         var data = {
            mlNum : mlNum
         };
   
         $.ajax({
            
            url: '${pageContext.request.contextPath}/heartNo.do',
            type:'POST',
            contentType : 'application/json; charset=utf-8',
              data :JSON.stringify(data),
              success : function(resp) {
                   if (resp == 'success') {
                       console.log("찜취소 성공!");
                      // alert('찜하기 취소 하셨습니다.');
                       location.reload();
                   }
                   else{
                      console.log('찜취소 실패!');
                      alert('찜 취소를 할 수 없습니다. 관리자에게 문의해주세요.');
                      location.reload();
                   }
              
             },
             error : function(e) {
               console.log('오류발생')
                   console.log(e);
               alert('찜 취소를 할 수 없습니다. 관리자에게 문의해주세요.');
                   location.reload(); // 실패시 새로고침하기   
             }
         });
         
      });

   });
   
   </script>
   
   <!-- 카카오 공유하기 -->
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <script type="text/javascript">
    
      // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해줌.
      Kakao.init('3d08dd963da5d6d0d9d5aed059ea3d21');

      // SDK 초기화 여부를 판단함.(연결되었으면 true 반환)
      console.log("카카오:"+Kakao.isInitialized());
      //카카오톡 공유하기 메서드
      function kakaoShare() {
         Kakao.Link.sendDefault({
            objectType : 'feed',
            content : {
               title : '[START TO UP]${data. pEN}',
               description : '나만의 별을 펀딩해보세요!',
               imageUrl : 'https://ifh.cc/g/YjnLWC.png',
               link : {
                  mobileWebUrl :    
                     'http://localhost:8088/app/detail.do?pNum=${data.pNum}',
                  
                  webUrl : 'http://localhost:8088/app/detail.do?pNum=${data.pNum}',
               },
            },
            buttons : [ {
               title : '스타투업 가기',
               link : {
                  mobileWebUrl : 'http://localhost:8088/app/detail.do?pNum=${data.pNum}',
                  webUrl : 'http://localhost:8088/app/detail.do?pNum=${data.pNum}',
               },
            }, ],
            // 카카오톡 미설치 시 카카오톡 설치 경로이동 //  /app/main.do
            installTalk : true,
         })
      
      }
    
   </script>
   
   <!-- 펀딩 버튼 클릭 JS -->
   <script type="text/javascript">
        
      //펀딩하기 버튼 클릭시
       $("#buying").on("click",function(){
          
          //로그인을 안 한 상태였을 시
           if ("${member.mId}" == "") {
                  if (confirm("로그인 후 이용 가능합니다. 로그인하시겠습니까?")) {
                      // 승낙하면 로그인 페이지로 이동
                      location.href = '${pageContext.request.contextPath}/login.do';
                  } else {
                      //거부하면 해당 페이지에 그대로 있음
                     history.back();
                  }
            // 로그인 상태시 결제 페이지로 이동  
           } else {
                 
                 location.href = '${pageContext.request.contextPath}/payment.do?pNum=${data.pNum}&mId=${member.mId}';  
                 
           }

       }); 
   
      //펀딩완료일 경우
      $("#finish").on("click",function(){
         alert('펀딩 완료된 상품입니다.');
      });   
   </script>
   
   
    </body>
</html>