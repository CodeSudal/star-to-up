package com.startoup.biz.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.util.StopWatch;

public class AroundAdvice {
	public Object printLogAA(ProceedingJoinPoint pjp) throws Throwable {
		// System.out.println("[AA 로그] 비즈니스 메서드 수행을 가로챔(탈취)");

		StopWatch sw=new StopWatch();
		sw.start();
		
		///// System.out.println("[BEFORE] 비즈니스 메서드 수행 전");
		Object obj=pjp.proceed();
		///// System.out.println("[AFTER] 비즈니스 메서드 수행 후");
		
		sw.stop();
		String mn=pjp.getSignature().getName();
		System.out.println("   "+mn+"메서드를 수행하는데에 걸린시간 "+sw.getTotalTimeMillis()+"(ms)초");
		
		return obj;
	}
}
