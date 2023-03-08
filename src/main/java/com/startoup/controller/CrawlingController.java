package com.startoup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.startoup.biz.crawling.CrawlingServiceImpl;

@Controller
public class CrawlingController {
	
	@Autowired
	private CrawlingServiceImpl CrawlingSI;

}