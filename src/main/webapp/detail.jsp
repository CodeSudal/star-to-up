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
        <title>Ashion | Template</title>

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
                            <span style="font-weight: bold; font-size: 50px; color: black">Jupiter${data.pName}</span>
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
                    
                    <!-- 
                    <div class="col-lg-6">
                        <div class="product__details__text" style="margin-left: 5%">
                            <h3><span style="font-size: 24px">펀딩 가격</span>${data.fAmount}</h3>
                            원 <br /><br />
                            <h3><span style="font-size: 24px">모인 금액</span>${data.fCrnAmount}</h3>
                            <span style="font-size: 24px">원</span> &nbsp
                            <div style="display: inline; font-weight: bold; font-size: 36px">${data.percent}</div>
                            <br /><br />
                            <div class="progress2 progress-moved" style="width: 80%">
                                <div class="progress-bar2" style="width:${data.percent}%"></div>
                            </div>
                            <br /><br />
                            <h3><span style="font-size: 24px">후원자</span>${data.cnt}</h3>
                            명 <br /><br /><br />
                            <div class="product__details__button">
                                <a
                                    href="payment.do?fNum=${data.fNum}"
                                    class="cart-btn"
                                    style="background-color: black; width: 40%; text-align: center; font-size: 30px"
                                >
                                    펀딩하기</a
                                >
                                <ul>
                                    <li style="margin-top: 25%">
                                        <a href="#"><span class="icon_heart_alt"></span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                     -->
                     
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
                                <a
                                    href="payment.do?fNum=${data.fNum}"
                                    class="cart-btn"
                                    style="background-color: black; width: 40%; text-align: center; font-size: 30px"
                                >
                                    펀딩하기</a
                                >
                                <ul>
                                    <li style="margin-top: 25%">
                                        <a href="#"><span class="icon_heart_alt"></span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                     
                     
                     
                    
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
                                        ${data.cInfo}
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

        <!-- Footer Section Begin -->
        <!-- 
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                      -->
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <!-- 
                        <div class="footer__copyright__text">
                            <p>
                                Copyright &copy;
                                <script>
                                    document.write(new Date().getFullYear());
                                </script>
                                All rights reserved | This template is made with
                                <i class="fa fa-heart" aria-hidden="true"></i> by
                                <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            </p>
                        </div>
                        -->
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    <!--  
                    </div>
                </div>
            </div>
        </footer>
       -->
        <!-- Footer Section End -->

        <!-- Search Begin -->
        <!--
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here....." />
                </form>
            </div>
        </div>
          -->
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

