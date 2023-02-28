package com.startoup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {
	
	@RequestMapping(value="/main.do")
	public String mainView() {
		System.out.println("ddss");
		
		return "main.jsp";
	}

}
