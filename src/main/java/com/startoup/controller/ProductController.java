package com.startoup.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.startoup.biz.list.ListServiceImpl;
import com.startoup.biz.list.ListVO;
import com.startoup.biz.member.MemberServiceImpl;
import com.startoup.biz.member.MemberVO;
import com.startoup.biz.member.MyFundingVO;
import com.startoup.biz.product.ProductServiceImpl;
import com.startoup.biz.product.ProductVO;

@Controller
public class ProductController {

   @Autowired
   private ProductServiceImpl productSI;
   @Autowired
   private MemberServiceImpl memberSI;
   @Autowired
   private ListServiceImpl listSI;

   // 스토어 메인 화면
   @RequestMapping(value = "/store.do")
   public String storeView(@ModelAttribute("product") ProductVO vo, Model model, HttpServletRequest request,
         HttpServletResponse response) throws IOException {
      System.out.println("store.do 들어옴");
      boolean bool = false;

      Cookie[] cookieArr = request.getCookies();
      
      
      if (cookieArr != null) {
         for (Cookie c : cookieArr) { // 쿠키목록확인
            if (c.getName().equals("nopopup")) { // "nopopup"쿠키가 있다면 '오늘 하루 팝업창 열지 않기' 와 같은 의미임.
               bool = true; // bool == true 이면 팝업창 안뜸
            }
         }
      } else { // 쿠키 목록이 비었다면
         Cookie cookie = new Cookie("testCookie", "myCookie"); // 쿠키 지정 name,value
         cookie.setMaxAge(60 * 60 * 24); // 쿠키 유효시간 설정 (하루)
         response.addCookie(cookie); // 사용자 브라우저에 쿠키 추가
      }

      model.addAttribute("bool", bool); // bool 값 뷰로 넘겨주기 : bool == true면 팝업창 안뜸
      model.addAttribute("last", productSI.selectLastProduct(vo)); // 최신상품 selectone한 값 뷰로 넘겨주기
      model.addAttribute("productList", productSI.selectAll(vo));
      return "store.jsp";
   }

   // 결제 화면 입장
   @RequestMapping(value = "/payment.do")
   public String selectOne(ProductVO pvo, MemberVO mvo, Model model) {
      model.addAttribute("product", productSI.selectOne(pvo));
      model.addAttribute("member", memberSI.selectOneMember(mvo));
      return "payment.jsp";
   }

   // 결제 완료
   @RequestMapping(value = "/paymentsuccess.do")
   public String insertList(ProductVO pvo, ListVO lvo, MyFundingVO myvo, String msg, String lo, Model model,
         HttpSession session) {
      MemberVO mvo = (MemberVO) session.getAttribute("member"); // 세션 정보 가져와 mvo에 저장
      // mvo의 Id, PW 값을 lvo와 myvo에 저장
      lvo.setlMid(mvo.getmId());
      myvo.setMfMid(mvo.getmId());
      lvo.setlPid(pvo.getpNum());
      myvo.setMfPid(pvo.getpNum());

      // db 변경
      model.addAttribute("list", listSI.insertList(lvo)); // 펀딩 내역 추가
      model.addAttribute("product", productSI.checkProduct(pvo));
      model.addAttribute("member", memberSI.insertFunding(myvo));
      /* model.addAttribute("list", productSI.update) */

      msg = "paymentSuccess";
      lo = "myFundingList.do";
      model.addAttribute("msg", msg);
      model.addAttribute("lo", lo);
      return "alert.jsp";
   }

//   @RequestMapping(value="/detail.do")
//   public String selectAllProductList(@ModelAttribute("product")ProductVO vo, Model model) {
//      
//      System.out.println("ㅓㅏㅣㅏㅓㅣㅏㅏㅓㅣㅏㅓㅣㅏㅓ");
//      model.addAttribute("productList", ProductSI.selectOne(vo));
//      return "detail.jsp";
//   }

}