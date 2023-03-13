<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="description" content="Ashion Template" />
        <meta name="keywords" content="Ashion, unica, creative, html" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>STU LOGIN</title>

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
        <link rel="stylesheet" href="css/font.css" type="text/css">
    </head>

    <body>
             <%@ include file="header.jsp"%>
      
        <!-- Header Section End -->
       <div class="breadcrumb__links">
                            <span style="margin-left: 10%; margin-top: 5%; font-weight: bold; font-size: 35px; color: black">로그인</span>
                        </div>
        <!-- Login Section Begin -->
        <section class="contact spad" style="padding-top:35px !important">
                        <div class="contact__content" >
                            <div class="contact__form">
                                <div style="margin-left: 35%; margin-right: 35%;">
                                    <form  method="post" action="login.do" >
                                        아이디<input type="text" placeholder="ID" name="mId" id="idInput" style="margin-top:1px; margin-bottom:7%;"required />
                                        비밀번호<input type="text" placeholder="PASSWARD" name="mPw" id="pwInput"  style="margin-top:1px" required />
                                        <input type="submit" class="cart-btn" id="loginBtn"  style="background-color:#D9D9D9; color: white; width: 50%; text-align: center; margin-left:23%; border-radius:30px; padding-right:5%; font-size:18px;" value="로그인" />
                                    </form>
                                    <button type="button" class="cart-btn" onclick="javascript:kakaoLogin();"
										style="width: 50%; height: 50px; margin-left:23%; padding-right:5%; margin-top:-1%; margin-bottom: 5px; display: inline-flex; justify-content : center; background-color: #FEE500; border: none; border-radius: 30px; font-size: 15px;">
									<div style="margin-top: 2%">
											<img src="./img/kakao.png" style="border-radius: 30px;"/>카카오로그인
									</div>
									</button>
                                </div>
                </div>
            </div>
		<!-- 카카오 로그인 js 연결 및 버튼 생성 -->
		
		<!-- 카카오 연결끊기-->
      	<a href="javascript:kakaoDelete()" style="text-decoration: none;"> 
            		<center><span style="color: white;">카카오회원탈퇴</span></center>
        </a>
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script>
				  // SDK를 초기화 합니다. 사용할 앱 키(javascript 키) 입력합니다.
            	  window.Kakao.init('3d08dd963da5d6d0d9d5aed059ea3d21');
                  // SDK 초기화 여부를 판단합니다. true가 나온다면 정상 작동
                  console.log(Kakao.isInitialized());
                 
                   // 카카오 로그인 함수 생성
                    function kakaoLogin() {
                      window.Kakao.Auth.loginForm({
                        scope: 'profile_nickname, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                        success: function (authObj) {
                          // console.log(authObj); // 로그인 성공하면 받아오는 데이터
                          
                          
                          window.Kakao.API.request({
                            // 사용자 정보 가져오기
                      		url: '/v2/user/me',
                         	
                            success: (response) => {
                              
                         	// var accessToken = Kakao.Auth.getAccessToken(); // 엑세스 토큰 할당
                         	// Kakao.Auth.setAccessToken(accessToken);	// 엑세스 토큰 사용하게 등록
							
                         	 //this.kakaoLogin.setToken(e.data['access_token']);
                         	 const id = response.id;  // 로그인 성공한 유저 고유 id 발급됨
                         	 const properties = response.properties;
                             const name = properties.nickname;
                             const email = response['kakao_account']['email'];
                             console.log('email:'+email);
                             console.log('id:'+id);
                             
                          	location.href="kakaoLogin.do?mName=" + name + "&mEmail1=" + email+"&mId="+id+"&kakao=kakao"; //리다이렉트 주소
                            },
                          });
                        },
                        fail: function (error) {
                          console.log(error);	// 실패하면 콘솔에 error 메세지
                        },
                      });
                    }
                   
                    /*카카오 연결끊기*/
                    function kakaoDelete() { //탈퇴 버튼 클릭시 실행될 함수
                       if (Kakao.Auth.getAccessToken()) {
                          console.log(Kakao.Auth.getAccessToken())
                          Kakao.API.request({
                             url : '/v1/user/unlink', // --> 탈퇴시 url
                             success : function(response) {
                                console.log(response)
                                alert("카카오 탈퇴 완료");
                             },
                             fail : function(error) {
                                console.log(error)
                             },
                          })
                          Kakao.Auth.setAccessToken(undefined)
                       }
                    }
                    /*  카카오연결끊기 end */

         </script>

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
        <script type="text/javascript">
     		// 로그인 인풋값에 값이 있을시 색상 변환
        	const idInput = document.getElementById('idInput');
    		const pwInput = document.getElementById('pwInput');
    		const loginBtn = document.getElementById('loginBtn');
    		
    		// id, pw 입력값에 따른 버튼 활성화 메서드
    	    function inputKeyboardEvent() {
    	        // id값과 pw값이 있으면 버튼 활성화
    	        if (idInput.value.length > 0 && pwInput.value.length > 0) {
    	            loginBtn.style.backgroundColor = "black";
    	        }
    	        // id값은 없지만, pw값이 있으면 버튼 비활성화
    	        if (idInput.value.length == 0 && pwInput.value.length > 0) {
    	            loginBtn.style.backgroundColor = "#D9D9D9";
    	        }
    	        // id값은 있지만, pw값이 없으면 버튼 비활성화
    	        if (idInput.value.length > 0 && pwInput.value.length == 0) {
    	            loginBtn.style.backgroundColor = "#D9D9D9";
    	        }
    	        
    	    }
    		
    	    idInput.addEventListener('keyup', inputKeyboardEvent);
    	    pwInput.addEventListener('keyup', inputKeyboardEvent);
        </script>
        
       
        
        
        
        
        
        
        
    </body>
</html>
    