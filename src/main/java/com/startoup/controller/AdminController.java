package com.startoup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.startoup.biz.member.MemberServiceImpl;
import com.startoup.biz.member.MemberVO;
import com.startoup.biz.product.ProductServiceImpl;
import com.startoup.biz.product.ProductVO;

@Controller
public class AdminController {

	@Autowired
	private MemberServiceImpl memberSI;
	@Autowired
	private ProductServiceImpl ProductSI;
	
	@RequestMapping(value="/adminFunding.do")
	public String selectAllFund(ProductVO pvo, Model model) {
		
		model.addAttribute("fundingList", ProductSI.selectAll(pvo));
		return "adminFundingManagement.jsp";
	}
	
	@RequestMapping(value="/adminProduct.do")
	public String selectAllProduct(ProductVO pvo, Model model) {
		
		model.addAttribute("datas", ProductSI.selectAll(pvo));
		return "adminProductManagement.jsp";
	}
	
	@RequestMapping(value="/adminProductInsert.do")
	public String selectAllProductDelete(ProductVO pvo, Model model) {
		
		System.out.println("adminProductInsert 들어옴");
		model.addAttribute("datas", ProductSI.insertProduct(pvo));
		System.out.println("adminProductInsert 나감");
		return "adminProduct.do";
	}
	
	@RequestMapping(value="/adminMember.do")
	public String selectAllMember(MemberVO mvo, Model model) {
		
		model.addAttribute("memberList", memberSI.selectAllMember(mvo));
		return "adminMemberManagement.jsp";
	}
	
	@RequestMapping(value="/adminMemberDelete.do")
	public String deleteMember(MemberVO mvo, Model model) {
		
		model.addAttribute("memberList", memberSI.deleteMember(mvo));
		return "redirect:adminMember.do";
	}
	
	
	
	
}