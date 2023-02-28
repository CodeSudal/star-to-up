package com.startoup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.startoup.biz.funding.FundingServiceImpl;

@Controller
public class MyFundingController {
	
	@Autowired
	private FundingServiceImpl myfundingSI;

}
