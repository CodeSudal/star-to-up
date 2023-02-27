package com.startoup.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class LogAdvice { // Advice : 횡단관심(공통로직)	
	@Before("PointcutCommon.aPointcut()")
	public void printLog(JoinPoint jp) {
		System.out.println("[로그] 비즈니스 메서드 수행 전에 호출되는 로그");
		
		String methodName=jp.getSignature().getName();
		Object[] args=jp.getArgs();
		System.out.println("   "+methodName+" 메서드 처리중");
		System.out.println("   "+args[0]+"을 인자로 사용중");
	}
}
