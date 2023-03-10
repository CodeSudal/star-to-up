package com.startoup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.startoup.biz.crawling.CrawlingServiceImpl;
import com.startoup.biz.list.ListServiceImpl;

@Controller
public class CrawlingController {
	
	@Autowired
	private CrawlingServiceImpl CrawlingSI;

	@RequestMapping(value = "/crawling.do")
	public String selectOneMember() {
		
		if (CrawlingSI.crawling(null)) {
			return "main.do";
		} else {
			System.out.println("실패야 바부야");
			return "duplicate";
		}

	}
	
	

}