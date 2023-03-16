package com.startoup.controller;

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
	@RequestMapping(value="/store.do")
	public String storeView(@ModelAttribute("product")ProductVO vo, Model model) {
		model.addAttribute("productList", productSI.selectAll(vo));
		return "store.jsp";
	}
	
	// 결제 화면 입장
	@RequestMapping(value="/payment.do")
	public String selectOne(ProductVO pvo, MemberVO mvo, Model model) {
		model.addAttribute("product", productSI.selectOne(pvo));
		model.addAttribute("member", memberSI.selectOneMember(mvo));
		return "payment.jsp";
	}
	
	// 결제 완료
	@RequestMapping(value="/paymentsuccess.do")
	public String insertList(ProductVO pvo, ListVO lvo, MyFundingVO myvo, String msg, String lo, Model model,HttpSession session) {
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
	
	
	
//	@RequestMapping(value="/detail.do")
//	public String selectAllProductList(@ModelAttribute("product")ProductVO vo, Model model) {
//		
//		System.out.println("ㅓㅏㅣㅏㅓㅣㅏㅏㅓㅣㅏㅓㅣㅏㅓ");
//		model.addAttribute("productList", ProductSI.selectOne(vo));
//		return "detail.jsp";
//	}

}