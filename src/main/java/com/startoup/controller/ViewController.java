package com.startoup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
