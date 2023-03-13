<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- core 태그 임포트 -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- formatting 태그 임포트 -->
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopcart</title>

<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="css/font.css" type="text/css">
<link rel="stylesheet" href="css/shopcart.css" type="text/css">

<link
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"   
   rel="stylesheet" />
</head>


<body>
   <%@ include file="header.jsp"%>

   <div class="content_box">
      <div class="container">
         <div class="top">
            <div class="pro_box lay">
               <div>Product</div>
            </div>
            <div class="total_box lay">
               <div>Total Amount</div>
            </div>
            <div class="amount_box lay">
               <div>One Amount</div>
            </div>
            <div class="check_box lay">
               <div>Check</div>
            </div>
         </div>

         <% 
            /* 임시 더미데이터 */
            ArrayList<HashMap<String, String>> productList = new ArrayList<HashMap<String, String>>();
            
            HashMap<String, String> p1 = new HashMap<String, String>();
            p1.put("pId", "1");
            p1.put("name", "Jupiter");
            p1.put("price", "32000");
            p1.put("total", "600000");
            p1.put("img", "img/jupiter.png");
            HashMap<String, String> p2 = new HashMap<String, String>();
            p2.put("pId", "2");
            p2.put("name", "Mars");
            p2.put("price", "21000");
            p2.put("total", "820000");
            p2.put("img", "img/mars.png");
            HashMap<String, String> p3 = new HashMap<String, String>();
            p3.put("pId", "3");
            p3.put("name", "Mercury");
            p3.put("price", "52000");
            p3.put("total", "1253000");
            p3.put("img", "img/mercury.png");
            HashMap<String, String> p4 = new HashMap<String, String>();
            p4.put("pId", "4");
            p4.put("name", "Venus");
            p4.put("price", "32000");
            p4.put("total", "6253000");
            p4.put("img", "img/venus.png");
            HashMap<String, String> p5 = new HashMap<String, String>();
            p5.put("pId", "5");
            p5.put("name", "Earth");
            p5.put("price", "15000");
            p5.put("total", "305100");
            p5.put("img", "img/earth.png");
            HashMap<String, String> p6 = new HashMap<String, String>();
            p6.put("pId", "6");
            p6.put("name", "Sun");
            p6.put("price", "22000");
            p6.put("total", "533000");
            p6.put("img", "img/sun.png");
            
            productList.add(p1);
            productList.add(p2);
            productList.add(p3);
            productList.add(p4);
            productList.add(p5);
            productList.add(p6);

            request.setAttribute("datas", productList);
         %>

         <c:forEach items="${datas}" var="i">
         <div class="mid">
            <div class="item_box">
               <div class="product_item bc">
                  <div class="img_box">
                     <img src="${i.img}" alt="img" width="100%"
                        height="100%">
                  </div>
                  <div class="title_box">${i.name}</div>
               </div>
               <div class="total_item bc">
                  <div class="text_box">${i.total}</div>
               </div>
               <div class="amount_item bc">
                  <div class="text_box">${i.price}</div>
               </div>
               <div class="check_item bc">
                  <label class="check_icon_box"> <input type="checkbox" data-pId="${i.pId}"
                     value="${i.pId}" name="selectedList">
                     <div class="circle">
                        <span class="material-symbols-outlined">&#xe876</span>
                     </div>
                  </label>
               </div>
         </div>
          </c:forEach>
          

         </div>


         <div class="bot">
            <input type="button" class="bot_left" disabled="disabled" onclick="deleteItems()"
               value="삭제하기">
            <div class="bot_right">
               <div class="right">Total:</div>
               <div class="text_box2">0 ₩</div>
            </div>
         </div>
      </div>
 

</body>

<script>

var deleteList = [];



function deleteItems() {
   console.log('삭제하기 실행()');
   var checkedItem2 = $("input[name=selectedList]:checked");
     
   
   for(let i=0; i < checkedItem2.length; i++) {
      console.log(checkedItem2[i].value);
      deleteList.push(Number(checkedItem2[i].value));
   }
   
   console.log('삭제 리스트 :')
   console.log(deleteList);
   

        $.ajax({
            url  : "shopcartDelete.do",
            type : "POST",
            data : deleteList,
            success : function(res) {
                alert('찜 목록 삭제 성공!');
                

            },
            error : function(data) {
                alert("댓글이 삭제되지 않았습니다.");
            }
        });
 

   
   
   deleteList = [];

   
   
}

   
$(document).ready(function() {
   console.log('페이지 렌더링시 실행되는 함수');
   
   
   
   
   let totalAmount = 0;
   /* 체크박스가 클릭될 때 실행되는 함수 */
    $(".check_icon_box").click(function() {
       
       /* 버튼 클릭시 색상 변환하는 함수 */
       
       let checkedItem = event.target;
       
      
       let oneAmount = checkedItem.parentElement.parentElement.parentElement.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.innerText;
       

       checkedItem.nextElementSibling.classList.toggle('checked');
       
       console.log('체크됨');
      
      

        if(checkedItem.checked==true){
         totalAmount += Number(oneAmount);
         
         
       }else{
         totalAmount -= Number(oneAmount);
       } 
       
       let totalResult = document.querySelector('.text_box2');
       totalResult.innerText = totalAmount + ' ₩';
       
       
       
       
       /* 삭제하기 버튼 활성화 함수 */
       let checkedLength = $("input[name=selectedList]:checked").length;//몇개 체크되었는지 변수

       /* console.log(checkedLength); */
      
       if(checkedLength > 0){
          /* console.log('삭제하기 버튼 활성화 될 예쩡') */
         
          $(".bot_left").css({"backgroundColor":"#000000","cursor":"pointer"});
             $(".bot_left").prop("disabled",false);
       }
       else{
            $(".bot_left").css({"backgroundColor":"#D9D9D9","cursor":"auto"});
            $(".bot_left").prop("disabled",true);
          
       }
       

    });
    
});


</script>

</html>