package com.startoup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.startoup.biz.product.ProductServiceImpl;
import com.startoup.biz.product.ProductVO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductServiceImpl ProductSI;
	
	@RequestMapping(value="/store.do")
	public String storeView(@ModelAttribute("product")ProductVO vo, Model model) {
		System.out.println("store.do 입장");
		System.out.println("[로그]  "+ProductSI.selectAll(vo));
		model.addAttribute("productList", ProductSI.selectAll(vo));
		return "store.jsp";
	}

}