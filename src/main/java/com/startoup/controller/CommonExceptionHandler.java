package com.startoup.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice("com.startoup.controller")
public class CommonExceptionHandler {
	
	@ExceptionHandler(ArithmeticException.class)
	public ModelAndView handleArithmeticException(Exception e) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("exception",e);
		mav.setViewName("/error/error01.jsp");
		return mav;
	}
	
	@ExceptionHandler(NullPointerException.class)
	public ModelAndView handleNullPointerException(Exception e) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("exception",e);
		mav.setViewName("/error/error02.jsp");
		return mav;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Exception e) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("exception",e);
		mav.setViewName("/error/error03.jsp");
		return mav;
	}
	
}
