<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>

<link rel="stylesheet" href="css/font.css" type="text/css">
<link
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
   rel="stylesheet" />
<!-- Css Styles -->

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/header.css" type="text/css">
</head>
<body>

   <div class="header_box">
      <div class="top_left_box">
         <div class="logo_box"><a href="main.do">LOGO</a></div>
         <div class="menu_item1"><a href="store.do">STORE</a></div>
         <div class="menu_item1"><a href="info.do">INFO</a></div>
         <div class="menu_item1"><a href="about.do">ABOUT</a></div>
      </div>
      <div class="top_right_box">
        <c:if test="${member.mId == 'admin' || member.mId == 'ADMIN' }">
            <div style="margin-right:10%; margin-top:5%;">
               <p style="font-weight: bold; color:black;"> <a href="adminFunding.do">ADMIN</a></p>
            </div>
         </c:if>
         <div class="icon_box1">
            <div class="header__right1">
               <ul class="header__right__widget">
                  <li><a href="shopcart.do"><span class="material-symbols-outlined">&#xE87D;</span>
                        <c:if test="${member.mId != null}">
                            <div class="tip"><%-- ${member.countLike} --%></div> 
                        </c:if>
                      </a>
                  </li>

               </ul>
            </div>
            <div class="icon_box1">
               <nav class="header__menu">
                  <ul>
                     <li style="position: relative;"><a href="#"><span
                           class="material-symbols-outlined">&#xF0D3;</span></a>
                        <ul class="dropdown"
                           style="text-align: right; width: 110px; border-radius: 5px; background-color: rgba(0, 0, 0, 0.3); position: absolute; left: -80px; top: 38px">
                           <c:choose>
                               <c:when test="${member.mId == 'admin' || member.mId == 'ADMIN' }">
                                   <li><a href="myFundingList.do">펀딩 내역</a></li>
                                    <li><a href="myList.do">찜내역</a></li>
                                    <li><a href="logout.do">로그아웃</a></li>
                               </c:when>
                              <c:when test="${member.mId != null}">
                                 <li><a href="myFundingList.do">펀딩 내역</a></li>
                                 <li><a href="shopcart.do">찜내역</a></li>
                                <li><a href="withdrowal.do">회원 탈퇴</a></li>
                                 <li><a href="logout.do">로그아웃</a></li>
                              </c:when>
                               <c:otherwise>
                                  <li><a href="login.do">로그인</a></li>
                                 <li><a href="agreement.do">회원가입</a></li>
                     </c:otherwise>
                    </c:choose>      
                        </ul></li>
                  </ul>
               </nav>

            </div>
         </div>
      </div>
   </div>
   <div class="header_box_space"></div>

   
</body>
</html>