package com.startoup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.startoup.biz.member.MemberServiceImpl;
import com.startoup.biz.member.MemberVO;

@Controller
public class AdminController {

	@Autowired
	private MemberServiceImpl memberSI;
	
	@RequestMapping(value="/adminMember.do")
	public String selectAllMember(MemberVO mvo, Model model) {
		
		model.addAttribute("datas", memberSI.selectAllMember(mvo));
		return "adminMemberManagement.jsp";
	}
}
