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
                background: rgba(0, 0, 0, 0.25);
                box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.08);
            }

            .progress-bar2 {
                height: 18px;
                border-radius: 30px;
                background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0.05));
                transition: 0.4s linear;
                transition-property: width, background-color;
            }

            .progress-moved .progress-bar2 {
                background-color: black;
                animation: progressAnimation 6s;
            }

            @keyframes progressAnimation {
                0% {
                    width: 5%;
                    background-color: rgb(24, 55, 208);
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
        <!-- Page Preloder -->
       <%@ include file="header.jsp" %>
        <!-- Offcanvas Menu End -->

        <!-- Header Section Begin -->
      
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <span style="font-weight: bold; font-size: 50px; color: black">${data.pName}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Product Details Section Begin -->
        <section class="product-details spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                    
                        <div class="product__details__pic">
                            <!-- 
                            <div class="product__details__pic__left product__thumb nice-scroll">
                                <a class="pt active" href="#product-1">
                                    <img src="img/product/details/thumb-1.jpg" alt="" />
                                </a>
                                <a class="pt" href="#product-2">
                                    <img src="img/product/details/thumb-2.jpg" alt="" />
                                </a>
                                <a class="pt" href="#product-3">
                                    <img src="img/product/details/thumb-3.jpg" alt="" />
                                </a>
                                <a class="pt" href="#product-4">
                                    <img src="img/product/details/thumb-4.jpg" alt="" />
                                </a>
                            </div>
                             -->
                             
                            <div class="product__details__slider__content">
                               
                                    <img
                                        data-hash="product-1"
                                        class="product__big__img"
                                        src="img/product/details/${data.pImage}"
                                        alt=""
                                        style="margin-left:10%; width: 100vw; height: 70vh;"
                                    />
                                   
                               
                            </div>
                            
                            
                        </div>
                        
                    </div>
                  <!--  <div class="product__details__pic__slider owl-carousel"></div> -->

              
                    <div class="col-lg-6">
                        <div class="product__details__text" style="margin-left: 5%">
                            <h3><span style="font-size: 24px">펀딩 가격</span>${data.pPrice}</h3>
                            원 <br /><br />
                            <h3><span style="font-size: 24px">모인 금액</span>${data.pCRNAmount}</h3>
                            <span style="font-size: 24px">원</span> &nbsp
                            <div style="display: inline; font-weight: bold; font-size: 36px">${data.percent}%</div>
                            <br /><br />
                            <div class="progress2 progress-moved" style="width: 80%">
                                <div class="progress-bar2" style="width:${data.percent}%"></div>
                            </div>
                            <br /><br /> <!-- !!참여자 수 계산해주세요!! -->
                            <h3><span style="font-size: 24px">참여자</span>${data.people}</h3>
                            명 <br /><br /><br />
                            <div class="product__details__button">
                              <c:choose>
                                 <c:when test="${pFinish ==0}">
                                      <a
                                        href="payment.do?pNum=${data.pNum}"
                                        class="cart-btn"
                                        style="background-color: black; width: 40%; text-align: center; font-size: 28px"
                                       >
                                      펀딩하기</a>
                                      <c:choose>
                                   <c:when test="${not empty isMylike }">
                                   <img id="heartIng" alt="좋아요상태"
                                    src="img/icon-heart2.png"
                                    style="width: 50px; height: 50px; cursor: pointer; margin-left:2%;margin-top:2%;">
                                </c:when>
                                <c:otherwise>
                                   <img id="heartNot" alt="좋아요안한상태"
                                        src="img/icon-heart1.png"
                                        style="width: 50px; height: 50px; cursor: pointer; margin-left:2%;margin-top:2%;">
                                </c:otherwise>
                            </c:choose>
                                 </c:when>
                                <c:otherwise>
                                     <button
                                    id="finish"
                                    class="cart-btn"
                                    style="background-color: rgb(202, 202, 202); border:none; width: 40%; text-align: center; font-size: 28px"
                                >
                                    펀딩완료</button>
                                </c:otherwise>
                              </c:choose>
                            </div>
                        </div>
                    </div>
                  
                <!-- 
                      <div class="col-lg-6">
                        <div class="product__details__text" style="margin-left: 5%">
                            <h3><span style="font-size: 24px">펀딩 가격</span>200,000</h3>
                            원 <br /><br />
                            <h3><span style="font-size: 24px">모인 금액</span>50,000</h3>
                            <span style="font-size: 24px">원</span> &nbsp
                            <div style="display: inline; font-weight: bold; font-size: 36px">50%</div>
                            <br /><br />
                            <div class="progress2 progress-moved" style="width: 80%">
                                <div class="progress-bar2" style="width:50%"></div>
                            </div>
                            <br /><br />
                            <h3><span style="font-size: 24px">후원자</span>1,000</h3>
                            명 <br /><br /><br />
                            <div class="product__details__button">
                                <button
                                    id="finish"
                                    class="cart-btn"
                                    style="background-color: rgb(202, 202, 202); border:none; width: 40%; text-align: center; font-size: 28px"
                                >
                                    펀딩완료</button>
                                 <ul>
                                    <li style="margin-top: 25%">
                                        <a href="#"><span class="icon_heart_alt"></span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                   -->
                     
                     
                    
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Detail</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <h6>Detail</h6>
                                    <p>
                                        ${data.pInfo}
                                    </p>
                                    
                                </div>
                               <!-- 
                                <div class="tab-pane" id="tabs-2" role="tabpanel">
                                    <h6>Specification</h6>
                                    <p>
                                        Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut loret
                                        fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi
                                        nesciunt loret. Neque porro lorem quisquam est, qui dolorem ipsum quia dolor si.
                                        Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut loret
                                        fugit, sed quia ipsu consequuntur magni dolores eos qui ratione voluptatem sequi
                                        nesciunt. Nulla consequat massa quis enim.
                                    </p>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula
                                        eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient
                                        montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque
                                        eu, pretium quis, sem.
                                    </p>
                                </div>
                                 -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="related__title">
                            <h5>RELATED PRODUCTS</h5>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="img/product/related/rp-1.jpg">
                                <div class="label new">New</div>
                                <ul class="product__hover">
                                    <li>
                                        <a href="img/product/related/rp-1.jpg" class="image-popup"
                                            ><span class="arrow_expand"></span
                                        ></a>
                                    </li>
                                    <li>
                                        <a href="#"><span class="icon_heart_alt"></span></a>
                                    </li>
                                    <li>
                                        <a href="#"><span class="icon_bag_alt"></span></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Buttons tweed blazer</a></h6>
                                <div class="product__price">$ 59.0</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="img/product/related/rp-2.jpg">
                                <ul class="product__hover">
                                    <li>
                                        <a href="img/product/related/rp-2.jpg" class="image-popup"
                                            ><span class="arrow_expand"></span
                                        ></a>
                                    </li>
                                    <li>
                                        <a href="#"><span class="icon_heart_alt"></span></a>
                                    </li>
                                    <li>
                                        <a href="#"><span class="icon_bag_alt"></span></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Flowy striped skirt</a></h6>
                                <div class="product__price">$ 49.0</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="img/product/related/rp-3.jpg">
                                <div class="label stockout">funding closed</div>
                                <ul class="product__hover">
                                    <li>
                                        <a href="img/product/related/rp-3.jpg" class="image-popup"
                                            ><span class="arrow_expand"></span
                                        ></a>
                                    </li>
                                    <li>
                                        <a href="#"><span class="icon_heart_alt"></span></a>
                                    </li>
                                    <li>
                                        <a href="#"><span class="icon_bag_alt"></span></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Cotton T-Shirt</a></h6>
                                <div class="product__price">$ 59.0</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="img/product/related/rp-4.jpg">
                                <ul class="product__hover">
                                    <li>
                                        <a href="img/product/related/rp-4.jpg" class="image-popup"
                                            ><span class="arrow_expand"></span
                                        ></a>
                                    </li>
                                    <li>
                                        <a href="#"><span class="icon_heart_alt"></span></a>
                                    </li>
                                    <li>
                                        <a href="#"><span class="icon_bag_alt"></span></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Slim striped pocket shirt</a></h6>
                                <div class="product__price">$ 59.0</div>
                            </div>
                        </div>
                    </div>
                </div>
                --> 
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
   
   <!-- 찜 버튼 JS -->
   <script type="text/javascript">
   $(document).ready(function(){
      
      //찜 추가 JS
      $("#heartNot").on("click",function(){
         
         //로그인을 안 한 상태였을 시
         if ("${member.mid}" == "") {
                if (confirm("로그인 한 회원만 이용가능합니다. 로그인 하시겠습니까?")) {
                    // 승낙하면 로그인 페이지로 이동
                    location.href = '${pageContext.request.contextPath}/login.do';
                } else {
                    // 거부하면 해당 페이지 새로고침
                    location.reload();
                }
            // 로그인 상태시 찜하기 버튼을 누르면    
            } else {
         
         var mlPid = '${data.pNum}';
         var mlMid = '${member.mid}';
         console.log('mlPid:'+mlPid+"/mlMid:"+mlMid);
         
         var data = {
            mlPid : mlPid,   
            mlMid : mlMid   
         };
   
         $.ajax({
            
            url: '${pageContext.request.contextPath}/insertMylist.do',
            type:'POST',
            contentType : 'application/json; charset=utf-8',
              data :JSON.stringify(data),
              success : function(resp) {
                   if (resp == 'success') {
                       console.log("찜하기 성공!");
                       if (confirm("해당 상품을 찜하셨습니다. 찜목록 페이지로 이동하시겠습니까?")) {
                            // 승낙하면 마이페이지의 찜목록페이지로 이동
                            location.href = '${pageContext.request.contextPath}/myList.do';
                        } else {
                            // 거부하면 해당 페이지 새로고침하여 찜한거 반영되게하기(HTTP의 속성 때문)
                            location.reload();
                        }
                   }
                   else{
                      console.log('찜하기 실패!');
                      alert('찜하기를 할 수 없습니다.관리자에게 문의 해주세요.');
                      location.reload();
                   }
              
             },
             error : function(e) {
               console.log('오류발생')
                   console.log(e);
                   alert('찜하기를 할 수 없습니다.관리자에게 문의 해주세요.');
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
            
            url: '${pageContext.request.contextPath}/myListDelete.do',
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
                      alert('찜 취소를 할 수 없습니다.관리자에게 문의 해주세요.');
                      location.reload();
                   }
              
             },
             error : function(e) {
               console.log('오류발생')
                   console.log(e);
               alert('찜 취소를 할 수 없습니다.관리자에게 문의 해주세요.');
                   location.reload(); // 실패시 새로고침하기   
             }
         });
         
      });

   });
   
   </script>
   
   <!-- 펀딩 완료된 상품일 경우 JS -->
   <script type="text/javascript">
      $("#finish").on("click",function(){
         alert('펀딩 완료된 상품입니다.');
      });   
   </script>
   
   
    </body>
</html>
