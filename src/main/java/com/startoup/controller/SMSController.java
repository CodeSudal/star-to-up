package com.startoup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.startoup.biz.sms.SMSServiceImpl;

@Controller
public class SMSController {
	
	@Autowired
	private SMSServiceImpl smsSI;

}
