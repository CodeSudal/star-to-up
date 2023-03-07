package com.startoup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.startoup.biz.product.ProductServiceImpl;
import com.startoup.biz.product.ProductVO;

@Controller
public class ViewController {
	
	
	@RequestMapping(value="/main.do")
	public String mainView() {
		
		return "main.jsp";
	}
	
	@RequestMapping(value="/info.do")
	public String infoView() {
		
		return "info.jsp";
	}
	
	@RequestMapping(value="/about.do")
	public String aboutView() {
		
		return "about.jsp";
	}

}