package com.startoup.biz.common;

import org.aspectj.lang.JoinPoint;

public class LogAdvice2 {
	public void printLog2(JoinPoint jp) {
		///// System.out.println("[향상된 로그] 비즈니스 메서드 수행 후에 호출되는 로그");
		
		String mn=jp.getSignature().getName();
		System.out.println("   "+mn+" 비즈니스 메서드 수행 후에 출력되는 로그");
		System.out.println("   "+mn+" 비즈니스 메서드에서 사용한 인자는 "+jp.getArgs()[0]);
	}
}
