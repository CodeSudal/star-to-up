package com.startoup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.startoup.biz.mylike.MyLikeServiceImpl;

@Controller
public class MyLikeController {
	
	@Autowired
	private MyLikeServiceImpl mylikeSI;

}
