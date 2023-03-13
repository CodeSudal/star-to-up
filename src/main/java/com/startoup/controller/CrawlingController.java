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
	public String crawling() {
		if (CrawlingSI.crawling()) {
			return "main.do";
		} else {
			return "duplicate";
		}

	}
	
	

}