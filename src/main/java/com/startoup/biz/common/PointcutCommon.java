package com.startoup.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {
	@Pointcut("execution(* com.spring.biz..*Impl.*(..))")
	public void aPointcut() {} // 포인트컷 선언
	@Pointcut("execution(* com.spring.biz..*Impl.select*(..))")
	public void bPointcut() {}
}
