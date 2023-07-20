package com.startoup.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterReturningAdvice {
	@AfterReturning(pointcut="PointcutCommon.bPointcut()", returning="obj")
	public void printLogARA(JoinPoint jp, Object obj) {
		// System.out.println("[ARA 로그] 비즈니스 메서드 수행 이후에 호출되는 로그");
		
		System.out.println(jp.getSignature().getName()+"()");
		System.out.println(jp.getArgs()[0]);
		
		System.out.println("결과값은 "+obj);
	}
}
