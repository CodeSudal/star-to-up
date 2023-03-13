package com.startoup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.startoup.biz.list.ListServiceImpl;
import com.startoup.biz.list.ListVO;
import com.startoup.biz.member.MemberServiceImpl;
import com.startoup.biz.member.MemberVO;
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
	
	@RequestMapping(value="/store.do")
	public String storeView(@ModelAttribute("product")ProductVO vo, Model model) {
		/*
		 * System.out.println("store.do 입장");
		 * System.out.println("[로그]  "+ProductSI.selectAll(vo));
		 */
		model.addAttribute("productList", productSI.selectAll(vo));
		return "store.jsp";
	}
	
	@RequestMapping(value="/payment.do")
	public String selectOne(ProductVO pvo, MemberVO mvo, Model model) {
		model.addAttribute("product", productSI.selectOne(pvo));
		model.addAttribute("member", memberSI.selectOneMember(mvo));
		return "payment.jsp";
	}
	
	@RequestMapping(value="/paymentsuccess.do")
	public String insertList(ProductVO pvo, ListVO lvo, Model model) {
		
		model.addAttribute("list", listSI.insertList(lvo));
		model.addAttribute("product", productSI.updateProduct(pvo));
		/* model.addAttribute("list", productSI.update) */
		
		return "redirect:myFundingList.do";
	}
	
	
	
//	@RequestMapping(value="/detail.do")
//	public String selectAllProductList(@ModelAttribute("product")ProductVO vo, Model model) {
//		
//		System.out.println("ㅓㅏㅣㅏㅓㅣㅏㅏㅓㅣㅏㅓㅣㅏㅓ");
//		model.addAttribute("productList", ProductSI.selectOne(vo));
//		return "detail.jsp";
//	}

}